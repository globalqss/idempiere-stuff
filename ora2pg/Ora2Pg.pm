package Ora2Pg;
#------------------------------------------------------------------------------
# Project  : Oracle to PostgreSQL database schema converter
# Name     : Ora2Pg.pm
# Language : 5.006 built for i686-linux
# OS       : linux RedHat 6.2 kernel 2.2.14-5
# Authors  : Gilles Darold, gilles@darold.net
# Copyright: Copyright (c) 2000-2004 : Gilles Darold - All rights reserved -
# Function : Main module used to export Oracle database schema to PostgreSQL
# Usage    : See documentation in this file with perldoc.
#------------------------------------------------------------------------------
# This program is free software; you can redistribute it and/or modify it under
# the same terms as Perl itself.
#------------------------------------------------------------------------------

use strict;
use vars qw($VERSION $PSQL);
use Carp qw(confess);
use DBI;
use POSIX qw(locale_h);
use IO::File;

#set locale to LC_NUMERIC C
setlocale(LC_NUMERIC,"C");


$VERSION = "4.1";
$PSQL = "psql";


=head1 NAME

Ora2Pg - Oracle to PostgreSQL database schema converter


=head1 SYNOPSIS

	Ora2pg as a companion script called ora2pg.pl when use in
	conjonction with a custom version of ora2pg.conf do what
	I'm trying to explain bellow :-) See content of the ora2pg.conf
	file for more explanation on configuration directives.

	BEGIN {
		$ENV{ORACLE_HOME} = '/usr/local/oracle/oracle816';
	}

	use strict;

	use Ora2Pg;

	# Init the database connection
	my $dbsrc = 'dbi:Oracle:host=testdb.mydom.fr;sid=TEST;port=1521';
	my $dbuser = 'system';
	my $dbpwd = 'manager';

	# Create an instance of the Ora2Pg perl module
	my $schema = new Ora2Pg (
		datasource => $dbsrc,           # Database DBD datasource
		user => $dbuser,                # Database user
		password => $dbpwd,             # Database password
	);

	# Create the PostgreSQL representation of all tables in the database
	$schema->export_schema("output.sql");

	exit(0);

or if you only want to extract some tables:

	# Create an instance of the Ora2Pg perl module
	my @tables = ('t1', 't2', 't3');
	my $schema = new Ora2Pg (
		datasource => $dbsrc,           # Database DBD datasource
		user => $dbuser,                # Database user
		password => $dbpwd,             # Database password
		tables => \@tables,
	or					# Tables to extract
		tables => [('tab1','tab2')],
		debug => 1			# Verbose running.
	);

or if you only want to extract the 10 first tables:

	# Create an instance of the Ora2Pg perl module
	my $schema = new Ora2Pg (
		datasource => $dbsrc,           # Database DBD datasource
		user => $dbuser,                # Database user
		password => $dbpwd,             # Database password
		max => 10			# 10 first tables to extract
	);

or if you only want to extract tables 10 to 20:

	# Create an instance of the Ora2Pg perl module
	my $schema = new Ora2Pg (
		datasource => $dbsrc,           # Database DBD datasource
		user => $dbuser,                # Database user
		password => $dbpwd,             # Database password
		min => 10,			# Begin extraction at indice 10
		max => 20			# End extraction at indice 20
	);

Setting showtableid to 1 will display a table and their indices without any
extraction. This will help you to set values of min/max options.

To choose a particular Oracle schema to export just set the following option
to your schema name:

	schema => 'APPS'

This schema definition can also be needed when you want to export data. If export
failed and complain that the table doesn't exists use this to prefix the table name
by the schema name.

If you want to use PostgreSQL 7.4 schema support activate the init option
'export_schema' set to 1. Default is no schema export.

To know at which indices tables can be found during extraction use the option:

	showtableid => 1

You can now process multiple types of extraction at the samse time
by setting the value to a space separated liste of the following keywords.

To extract all views set the type option as follow:

	type => 'VIEW'

To extract all grants set the type option as follow:

	type => 'GRANT'

To extract all sequences set the type option as follow:

	type => 'SEQUENCE'

To extract all triggers set the type option as follow:

	type => 'TRIGGER'

To extract all functions set the type option as follow:

	type => 'FUNCTION'

To extract all procedures set the type option as follow:

	type => 'PROCEDURE'

To extract all packages and body set the type option as follow:

	type => 'PACKAGE'

Default is table extraction

	type => 'TABLE'

To extract tablespace (PostgreSQL >= v8):

	type => 'TABLESPACE'

To extract all data from table extraction as INSERT statement use:

	type => 'DATA'

To extract all data from table extraction as COPY statement use:

	type => 'COPY'

and data_limit => n to specify the max tuples to return. If you set
this options to 0 or nothing, no limitation are used. Additional option
'table', 'min' and 'max' can also be used. This is usefull only when data
are send to Pg backend directly, not when when dumping to file.

When use of COPY or DATA you MUST export data by calling method:

$schema->export_data("output.sql");

Data are dumped to the given filename or to stdout with no argument.
You can also send these datas directly to a PostgreSQL backend using
the following method:

$schema->send_to_pgdb($destdatasrc,$destuser,$destpasswd);

In this case you must call export_data() without argument after the
call to method send_to_pgdb().

If you set type to COPY and you want to dump data directly to a PG database,
you must call method send_to_pgdb but data will not be sent via DBD::Pg but
they will be load to the database using the psql command. Calling this method
is still required to be able to extract database name, hostname and port
information. Edit the $PSQL variable to match the path of your psql
command (nothing to edit if psql is in your path).

When copying tables, Ora2Pg normally exports constraints as they are;
if they are non-deferrable they are exported as non-deferrable.
However, non-deferrable constraints will probably cause problems when
attempting to import data to PostgreSQL. The option

       fkey_deferrable => 1

will cause all foreign key constraints to be exported as deferrable,
even if they are non-deferrable. In addition,

       defer_fkey => 1

when exporting data will add a command to actually defer all
constraints before importing data.

To non perl gurus, you can use the configuration file and run ora2pg.pl.
You will find all information into the ora2pg.conf to be able to set it
correctly.


=head1 DESCRIPTION

Ora2Pg is a perl OO module used to export an Oracle database schema
to a PostgreSQL compatible schema.

It simply connect to your Oracle database, extract its structure and
generate a SQL script that you can load into your PostgreSQL database.

I'm not a Oracle DBA so I don't really know something about its internal
structure so you may find some incorrect things. Please tell me what is
wrong and what can be better.

It currently dump the database schema (tables, views, sequences, indexes, grants),
with primary, unique and foreign keys into PostgreSQL syntax without editing the
SQL code generated.

It now can dump Oracle data into PostgreSQL DB as online process. You can choose
what columns can be exported for each table.

Functions, procedures and triggers PL/SQL code generated must be reviewed to match
the PostgreSQL syntax. Some usefull recommandation on porting Oracle to PostgreSQL
can be found at http://techdocs.postgresql.org/ under the "Converting from other
Databases to PostgreSQL" Oracle part. I just notice one thing more is that the
trunc() function in Oracle is the same for number or date so be carefull when
porting to PostgreSQL to use trunc() for number and date_trunc() for date.


=head1 ABSTRACT

The goal of the Ora2Pg perl module is to cover all part needed to export
an Oracle database to a PostgreSQL database without other thing that provide
the connection parameters to the Oracle database.

Features include:

	- Database schema export (tables, views, sequences, indexes),
	  with unique, primary and foreign key, check constraint.
	- Grants/privileges export by user and group.
	- Table selection (by name and max table) export.
	- Export Oracle schema to PostgreSQL 7.3+ schema.
	- Predefined functions/triggers/procedures/packages export.
	- Data export.
	- Sql query converter (todo)

See ora2pg.conf for more information on use.

My knowledge regarding database is really poor especially for Oracle
so contribution is welcome.


=head1 REQUIREMENT

You just need the DBI, DBD::Pg and DBD::Oracle perl module to be installed


=head1 PUBLIC METHODS

=head2 new HASH_OPTIONS

Creates a new Ora2Pg object.

Supported options are:

	- datasource	: DBD datasource (required)
	- user		: DBD user (optional with public access)
	- password	: DBD password (optional with public access)
	- schema	: Oracle internal schema to extract
	- type		: Type of data to extract, can be TABLE,VIEW,GRANT,SEQUENCE,
			  TRIGGER,FUNCTION,PROCEDURE,DATA,COPY,PACKAGE,TABLESPACE
			  or a combinaison of these keywords.
	- debug		: Print the current state of the parsing
	- export_schema	: Export Oracle schema to PostgreSQL 7.3 schema
	- tables	: Extract only the given tables (arrayref) and set the extracting order
	- exclude	: Exclude the given tables from extract (arrayref)
	- showtableid	: Display only the table indice during extraction
	- min		: Indice to begin extraction. Default to 0
	- max		: Indice to end extraction. Default to 0 mean no limits
	- data_limit	: Number max of tuples to return during data extraction (default 0 no limit)
	- case_sensitive: Allow to preserve Oracle object name as they are written. Default is not.
	- skip_fkeys	: Skip foreign key constraints extraction. Default to 0 (extraction)
	- skip_pkeys	: Skip primary keys extraction. Default to 0 (extraction)
	- skip_ukeys	: Skip unique column constraints extraction. Default to 0 (extraction)
	- skip_indices	: Skip all other index types extraction. Default to 0 (extraction)
	- skip_checks	: Skip checks constraints extraction. Default to 0 (extraction)
        - keep_pkey_names: By default, primary key names in the source database are ignored, and default key names
                          are created in the target database. If this is set to true, primary key names are kept.
	- bzip2		: Path to the Bzip2 program to compress data export. Default /usr/bin/bzip2
	- gen_user_pwd	: When set to 1 replace default password 'change_my_secret' with a random string.
	- fkey_deferrable: Force foreign key constraints to be exported as deferrable. Default 0: asis.
	- defer_fkey	: Force all foreign key constraints to be deferred during data import. Default 0: asis.
	- pg_numeric_type: Convert Oracle NUMBER data type to internal PostgreSQL data type instead of use
			   of the slow numeric(p,s) data type 
	- default_numeric: NUMBER(x) without precision are by default converted to float.
			  You can overwrite this value by any PG type.
	- keep_pkey_names: preserve oracle primary keys name. Default ignored.
	- pg_supports_inout: Allow PG support of in/ou/inout function parameter
	  Must be used with PostgreSQL > 8.1. Default no support (backward compatibility).
	- pg_supports_role: Allow PG support of roles instead of user/group.
	  Default no support (backward compatibility).

Attempt that this list should grow a little more because all initialization is
done by this way.

=cut

sub new
{
	my ($class, %options) = @_;

	# This create an OO perl object
	my $self = {};
	bless ($self, $class);

	# Initialize this object
	$self->_init(%options);
	
	# Return the instance
	return($self);
}


=head2 export_data FILENAME

Print SQL data output to a filename or
to STDOUT if no file is given. 

Must be used only if type option is set to DATA or COPY
=cut

sub export_data
{
	my ($self, $outfile) = @_;

	$self->export_schema($outfile);
}


=head2 export_sql FILENAME

Print SQL conversion output to a filename or
simply return these data if no file is given. 

=cut

sub export_schema
{
	my ($self, $outfile) = @_;

	if ($outfile) {
		# Send output to the given file
		if ($outfile =~ /\.gz$/) {
			use Compress::Zlib;
			$self->{compress} = 'Zlib';
			$self->{zlib_hdl} = gzopen($outfile, "wb") or die "Can't create deflation file $outfile\n";
		} elsif ($outfile =~ /\.bz2$/) {
			die "Error: can't run bzip2\n" if (!-x $self->{bzip2});
			$self->{fhout} = new IO::File;
			$self->{fhout}->open("|$self->{bzip2} --stdout >$outfile") or die "Can't open pipe to $self->{bzip2} --stdout >$outfile: $!";
		} else {
			$self->{fhout} = new IO::File;
			$self->{fhout}->open(">$outfile") or die "Can't open $outfile: $!";
			binmode($self->{fhout},':raw');
		}
		foreach my $t (@{$self->{export_type}}) {
			$self->{type} = $t;
			# Return data as string
			$self->_get_sql_data();
		}
		if ($outfile =~ /\.gz$/) {
			$self->{zlib_hdl}->gzclose();
		} else {
			$self->{fhout}->close();
		}

	} else {

		foreach my $t (@{$self->{export_type}}) {
			$self->{type} = $t;
			# Return data as string
			$self->_get_sql_data();
		}

	}

}


=head2 send_to_pgdb DEST_DATASRC DEST_USER DEST_PASSWD

Open a DB handle to a PostgreSQL database

=cut

sub send_to_pgdb
{
	my ($self, $destsrc, $destuser, $destpasswd) = @_;

        # Connect the database
        $self->{dbhdest} = DBI->connect($destsrc, $destuser, $destpasswd);

	$destsrc =~ /dbname=([^;]*)/;
	$self->{dbname} = $1;
	$destsrc =~ /host=([^;]*)/;
	$self->{dbhost} = $1;
	$self->{dbhost} = 'localhost' if (!$self->{dbhost});
	$destsrc =~ /port=([^;]*)/;
	$self->{dbport} = $1;
	$self->{dbport} = 5432 if (!$self->{dbport});
	$self->{dbuser} = $destuser;

        # Check for connection failure
        if (!$self->{dbhdest}) {
		die "Error : $DBI::err ... $DBI::errstr\n";
	}

}


=head2 modify_struct TABLE_NAME ARRAYOF_FIELDNAME

Modify a table structure during export. Only given fieldname
will be exported. 

=cut

sub modify_struct
{
	my ($self, $table, @fields) = @_;

	if (!$self->{case_sensitive}) {
		map { $_ = lc($_) } @fields;
		$table = lc($table);
	}

	push(@{$self->{modify}{$table}}, @fields);

}

=head2 replace_tables HASH

Modify tables table names during export.

=cut

sub replace_tables
{
	my ($self, %tables) = @_;

	foreach my $t (keys %tables) {
		$tables{$t} = lc($tables{$t}) if (!$self->{case_sensitive});
		$self->{replaced_tables}{"\L$t\E"} = $tables{$t};
	}

}

=head2 replace_cols HASH

Modify column names during export.

=cut

sub replace_cols
{
	my ($self, %cols) = @_;

	foreach my $t (keys %cols) {
		foreach my $c (keys %{$cols{$t}}) {
			$cols{$t}{$c} = lc($cols{$t}{$c}) if (!$self->{case_sensitive});
			$self->{replaced_cols}{"\L$t\E"}{"\L$c\E"} = $cols{$t}{$c};
		}
	}

}

=head2 set_where_clause HASH

Add WHERE clause during data export on specifics table
and/or all table

=cut

sub set_where_clause
{
	my ($self, $global, %table_clause) = @_;

	$self->{global_where} = $global;
	foreach my $t (keys %table_clause) {
		$self->{where}{"\L$t\E"} = $table_clause{$t};
	}

}



#### Private subroutines ####

=head1 PRIVATE METHODS

=head2 _init HASH_OPTIONS

Initialize a Ora2Pg object instance with a connexion to the
Oracle database.

=cut

sub _init
{
	my ($self, %options) = @_;

        # Connect the database
        $self->{dbh} = DBI->connect($options{datasource}, $options{user}, $options{password});

        # Check for connection failure
        if (!$self->{dbh}) {
		die "Error : $DBI::err ... $DBI::errstr\n";
	}

	# Save the DB connection
	$self->{datasource} = $options{datasource} || '';
	$self->{user} = $options{user} || '';
	$self->{password} = $options{password} || '';

	$self->{debug} = $options{debug} || 0;

	$self->{limited} = ();
	$self->{limited} = $options{tables} if ($options{tables});

	$self->{excluded} = ();
	$self->{excluded} = $options{exclude} if ($options{exclude});

	$self->{export_schema} = $options{export_schema} || 0;

	$self->{schema} = $options{schema} || '';

	$self->{min} = $options{min} || 0;

	$self->{max} = $options{max} || 0;

	$self->{showtableid} = $options{showtableid} || 0;

	$self->{dbh}->{LongReadLen} = 0;
	#$self->{dbh}->{LongTruncOk} = 1;

	$self->{data_current} = 0;
	$self->{data_limit} = $options{data_limit} || 0;

	$self->{case_sensitive} = $options{case_sensitive} || 0;

	$self->{skip_fkeys} = $options{skip_fkeys} || 0;
	$self->{skip_pkeys} = $options{skip_pkeys} || 0;
	$self->{skip_ukeys} = $options{skip_ukeys} || 0;
	$self->{skip_indices} = $options{skip_indices} || 0;
	$self->{skip_checks} = $options{skip_checks} || 0;

	$self->{prefix} = 'DBA';
	if ($options{user_grants}) {
		$self->{prefix} = 'ALL';
	}

	$self->{modify} = ();
	$self->{replaced_tables} = ();
	$self->{replaced_cols} = ();
	$self->{global_where} = '';
	$self->{where} = ();
	$self->{bzip2} = $options{bzip2} || '/usr/bin/bzip2';
	$self->{gen_user_pwd} = $options{gen_user_pwd} || 0;
	$self->{fkey_deferrable} = $options{fkey_deferrable} || 0;
	$self->{defer_fkey} = $options{defer_fkey} || 0;
	$self->{pg_numeric_type} = $options{pg_numeric_type} || 0;
	$self->{default_numeric} = $options{default_numeric} || 'float';
        $self->{keep_pkey_names} = $options{keep_pkey_names} || 0;
	$self->{pg_supports_inout} = $options{pg_supports_inout} || 0;
	$self->{pg_supports_role} = $options{pg_supports_role} || 0;
	$self->{disable_triggers} = $options{disable_triggers} || 0;
	
	$self->{type} = '';

	# Multiple extraction export type
	$self->{export_type} = ();
	if ($options{type}) {
		@{$self->{export_type}} = split(/[\s\t]+/, $options{type});
	} else {
		push(@{$self->{export_type}}, 'TABLE');
	}

        # Use consistent reads for concurrent dumping...
        $self->{dbh}->begin_work ||  die $self->{dbh}->errstr . "\n";
        my $sth = $self->{dbh}->prepare("SET TRANSACTION READ ONLY") or die $self->{dbh}->errstr . "\n";
        $sth->execute or die $self->{dbh}->errstr . "\n";
        undef $sth;

	# Check validity of the requested schema/role
	if ($self->{schema}) {
		if (!$self->_get_schema()) {
			$self->{dbh}->disconnect() if ($self->{dbh});
			die "ERROR: Schema $self->{schema} not found !\n";
		}
	}

	$self->{fhout} = undef;
	$self->{compress} = '';
	$self->{zlib_hdl} = undef;

	# Retreive all table informations
        foreach my $t (@{$self->{export_type}}) {
                $self->{type} = $t;
		if (($self->{type} eq 'TABLE') || ($self->{type} eq 'DATA') || ($self->{type} eq 'COPY')) {
			$self->{dbh}->{LongReadLen} = 100000;
			$self->_tables();
		} elsif ($self->{type} eq 'VIEW') {
			$self->{dbh}->{LongReadLen} = 100000;
			$self->_views();
		} elsif ($self->{type} eq 'GRANT') {
			$self->_grants();
		} elsif ($self->{type} eq 'SEQUENCE') {
			$self->_sequences();
		} elsif ($self->{type} eq 'TRIGGER') {
			$self->{dbh}->{LongReadLen} = 100000;
			$self->_triggers();
		} elsif (($self->{type} eq 'FUNCTION') || ($self->{type} eq 'PROCEDURE')) {
			$self->{dbh}->{LongReadLen} = 100000;
			$self->_functions($self->{type});
		} elsif ($self->{type} eq 'PACKAGE') {
			$self->{dbh}->{LongReadLen} = 100000;
			$self->_packages();
		} elsif ($self->{type} eq 'TABLESPACE') {
			$self->_tablespaces();
		} else {
			warn "type option must be TABLE, VIEW, GRANT, SEQUENCE, TRIGGER, PACKAGE, FUNCTION, PROCEDURE, DATA, COPY or TABLESPACE\n";
		}
	}
	# Disconnect from the database
	$self->{dbh}->disconnect() if ($self->{dbh});

}


# We provide a DESTROY method so that the autoloader doesn't
# bother trying to find it. We also close the DB connexion
sub DESTROY { }


=head2 _grants

This function is used to retrieve all privilege information.

It extract all Oracle's ROLES to convert them as Postgres groups
and search all users associated to these roles.

Set the main hash $self->{groups}.
Set the main hash $self->{grants}.

=cut

sub _grants
{
	my ($self) = @_;

	if (!$self->{pg_supports_role}) {
		$self->log_msg("Retrieving users/roles/grants information...", 1);
		$self->{users} = $self->_get_users();
		$self->{groups} = $self->_get_roles();
		$self->{grants} = $self->_get_all_grants();
	} else {
		$self->{roles} = $self->_get_all_roles();
	}
}


=head2 _sequences

This function is used to retrieve all sequences information.

Set the main hash $self->{sequences}.

=cut

sub _sequences
{
	my ($self) = @_;

	$self->log_msg("Retrieving sequences information...", 1);
	$self->{sequences} = $self->_get_sequences();

}


=head2 _triggers

This function is used to retrieve all triggers information.

Set the main hash $self->{triggers}.

=cut

sub _triggers
{
	my ($self) = @_;

	$self->log_msg("Retrieving triggers information...", 1);
	$self->{triggers} = $self->_get_triggers();

}


=head2 _functions

This function is used to retrieve all functions information.

Set the main hash $self->{functions}.

=cut

sub _functions
{
	my ($self, $type) = @_;

	$self->log_msg("Retrieving functions information...", 1);
	$self->{functions} = $self->_get_functions($type);

}


=head2 _packages

This function is used to retrieve all packages information.

Set the main hash $self->{packages}.

=cut

sub _packages
{
	my ($self) = @_;

	$self->log_msg("Retrieving packages information...", 1);
	$self->{packages} = $self->_get_packages();

}


=head2 _tables

This function is used to retrieve all table information.

Set the main hash of the database structure $self->{tables}.
Keys are the names of all tables retrieved from the current
database. Each table information compose an array associated
to the table_info key as array reference. In other way:

    $self->{tables}{$class_name}{table_info} = [(OWNER,TYPE)];

DBI TYPE can be TABLE, VIEW, SYSTEM TABLE, GLOBAL TEMPORARY, LOCAL TEMPORARY,
ALIAS, SYNONYM or a data source specific type identifier. This only extract
TABLE type.

It also get the following informations in the DBI object to affect the
main hash of the database structure :

    $self->{tables}{$class_name}{field_name} = $sth->{NAME};
    $self->{tables}{$class_name}{field_type} = $sth->{TYPE};

It also call these other private subroutine to affect the main hash
of the database structure :

    @{$self->{tables}{$class_name}{column_info}} = $self->_column_info($class_name, $owner);
    %{$self->{tables}{$class_name}{unique_key}}  = $self->_unique_key($class_name, $owner);
    @{$self->{tables}{$class_name}{foreign_key}} = $self->_foreign_key($class_name, $owner);
    %{$self->{tables}{$class_name}{check_constraint}}  = $self->_check_constraint($class_name, $owner);

=cut

sub _tables
{
	my ($self) = @_;

	# Get all tables information given by the DBI method table_info
	$self->log_msg("Retrieving table information...", 1);

	my $sth = $self->_table_info or die $self->{dbh}->errstr;
	my @tables_infos = $sth->fetchall_arrayref();

	if ($self->{showtableid}) {
		foreach my $table (@tables_infos) {
			for (my $i=0; $i<=$#{$table};$i++) {
				$self->log_msg("[" . $i+1 . "] ${$table}[$i]->[2]", 0);
			}
		}
		return;
	}

	my @done = ();
	my $id = 0;
	foreach my $table (@tables_infos) {
		# Set the table information for each class found
		my $i = 1;
		$self->log_msg("Min table dump set to $self->{min}.", 1) if ($self->{min});
		$self->log_msg("Max table dump set to $self->{max}.", 1) if ($self->{max});
		foreach my $t (@$table) {
			# Jump to desired extraction
			if (grep(/^$t->[2]$/, @done)) {
				$self->log_msg("Duplicate entry found: $t->[0] - $t->[1] - $t->[2]", 0);
			} else {
				push(@done, $t->[2]);
			}
			$i++, next if ($self->{min} && ($i < $self->{min}));
			last if ($self->{max} && ($i > $self->{max}));
			next if (($#{$self->{limited}} >= 0) && !grep(/^$t->[2]$/i, @{$self->{limited}}));
			next if (($#{$self->{excluded}} >= 0) && grep(/^$t->[2]$/i, @{$self->{excluded}}));

			$self->log_msg("[$i] Scanning $t->[2] (@$t)...", 1);
			
			# Check of uniqueness of the table
			if (exists $self->{tables}{$t->[2]}{field_name}) {
				$self->log_msg("Warning duplicate table $t->[2], SYNONYME ? Skipped.", 0);
				next;
			}
			# Try to respect order given in the TABLES limited extraction array
			$self->{tables}{$t->[2]}{internal_id} = 0;
			if ($#{$self->{limited}} >= 0) {
				for (my $j = 0; $j <= $#{$self->{limited}}; $j++) {
					if (uc($self->{limited}->[$j]) eq uc($t->[2])) {
						$self->{tables}{$t->[2]}{internal_id} = $j;
						last;
					}
				}
			}
			# usually OWNER,TYPE. QUALIFIER is omitted until I know what to do with that
			$self->{tables}{$t->[2]}{table_info} = [($t->[1],$t->[3])];
			# Set the fields information
			my $sth = $self->{dbh}->prepare("SELECT * FROM $t->[1].$t->[2] WHERE 1=0");
			if (!defined($sth)) {
				warn "Can't prepare statement: $DBI::errstr";
				next;
			}
			$sth->execute;
			if ($sth->err) {
				warn "Can't execute statement: $DBI::errstr";
				next;
			}
			$self->{tables}{$t->[2]}{field_name} = $sth->{NAME};
			$self->{tables}{$t->[2]}{field_type} = $sth->{TYPE};

			@{$self->{tables}{$t->[2]}{column_info}} = $self->_column_info($t->[2],$t->[1]);
                        # We don't check for skip_ukeys/skip_pkeys here; this is taken care of inside _unique_key
			%{$self->{tables}{$t->[2]}{unique_key}} = $self->_unique_key($t->[2],$t->[1]);
			($self->{tables}{$t->[2]}{foreign_link}, $self->{tables}{$t->[2]}{foreign_key}) = $self->_foreign_key($t->[2],$t->[1]) if (!$self->{skip_fkeys});
			($self->{tables}{$t->[2]}{uniqueness}, $self->{tables}{$t->[2]}{indexes}) = $self->_get_indexes($t->[2],$t->[1]) if (!$self->{skip_indices});
			%{$self->{tables}{$t->[2]}{check_constraint}} = $self->_check_constraint($t->[2],$t->[1]) if (!$self->{skip_checks});
			$i++;
		}
	}

}


=head2 _views

This function is used to retrieve all views information.

Set the main hash of the views definition $self->{views}.
Keys are the names of all views retrieved from the current
database values are the text definition of the views.

It then set the main hash as follow:

    # Definition of the view
    $self->{views}{$table}{text} = $view_infos{$table};

=cut

sub _views
{
	my ($self) = @_;

	# Get all views information
	$self->log_msg("Retrieving views information...", 1);
	my %view_infos = $self->_get_views();

	if ($self->{showtableid}) {
		my $i = 1;
		foreach my $table (sort keys %view_infos) {
			$self->log_msg("[$i] $table", 0);
			$i++;
		}
		return;
	}

	$self->log_msg("Min view dump set to $self->{min}.", 1) if ($self->{min});
	$self->log_msg("Max view dump set to $self->{max}.", 1) if ($self->{max});
	my $i = 1;
	foreach my $table (sort keys %view_infos) {
		# Set the table information for each class found
		# Jump to desired extraction
		next if ($table =~ /\$/);
		$i++, next if ($self->{min} && ($i < $self->{min}));
		last if ($self->{max} && ($i > $self->{max}));
		next if (($#{$self->{limited}} >= 0) && !grep(/^$table$/i, @{$self->{limited}}));
		next if (($#{$self->{excluded}} >= 0) && grep(/^$table$/i, @{$self->{excluded}}));

		$self->log_msg("[$i] Scanning $table...", 1);

		$self->{views}{$table}{text} = $view_infos{$table};
                ## Added JFR : 3/3/02 : Retrieve also aliases from views
                $self->{views}{$table}{alias}= $view_infos{$table}{alias};
		$i++;
	}

}

=head2 _tablespaces

This function is used to retrieve all Oracle Tablespaces information.

Set the main hash $self->{tablespaces}.

=cut

sub _tablespaces
{
	my ($self) = @_;

	$self->log_msg("Retrieving tablespaces information...", 1);
	$self->{tablespaces} = $self->_get_tablespaces();

}



=head2 _get_sql_data

Returns a string containing the entire SQL Schema definition compatible with PostgreSQL

=cut

sub _get_sql_data
{
	my ($self, $outfile) = @_;

	my $sql_header = "-- Generated by Ora2Pg, the Oracle database Schema converter, version $VERSION\n";
	$sql_header .= "-- Copyright 2000-2004 Gilles DAROLD. All rights reserved.\n";
	$sql_header .= "--\n";
	$sql_header .= "-- This program is free software; you can redistribute it and/or modify it under\n";
	$sql_header .= "-- the same terms as Perl itself.\n\n";
	if ($self->{type} ne 'COPY' || $self->{defer_fkey}) {
		$sql_header .= "BEGIN TRANSACTION;\n\n";
	}

	my $sql_output = "";

	# Process view only
	if ($self->{type} eq 'VIEW') {
	$self->log_msg("Add views definition...", 1);
		if ($self->{export_schema}) {
			$sql_output .= "SET search_path = $self->{schema}, pg_catalog;\n\n" if ($self->{schema});
		}
		foreach my $view (sort keys %{$self->{views}}) {
			$self->{views}{$view}{text} =~ s/\s*\bWITH\b\s+.*$//s;
			if (!@{$self->{views}{$view}{alias}}) {
				if (!$self->{case_sensitive}) {
					$sql_output .= "CREATE VIEW \"\L$view\E\" AS \L$self->{views}{$view}{text};\n";
				} else {
					$sql_output .= "CREATE VIEW \"$view\" AS $self->{views}{$view}{text};\n";
				}
			} else {
				if (!$self->{case_sensitive}) {
					$sql_output .= "CREATE VIEW \"\L$view\E\" (";
				} else {
					$sql_output .= "CREATE VIEW \"$view\" (";
				}
				my $count = 0;
				foreach my $d (@{$self->{views}{$view}{alias}}) {
					if ($count == 0) {
						$count = 1;
					} else {
						$sql_output .= ", "
					}
					if (!$self->{case_sensitive}) {
						$sql_output .= "\"\L$d->[0]\E\"";
					} else {
						$sql_output .= "\"$d->[0]\"";
					}
				}
				if (!$self->{case_sensitive}) {
					$sql_output .= ") AS \L$self->{views}{$view}{text};\n";
				} else {
					$sql_output .= ") AS $self->{views}{$view}{text};\n";
				}
			}
		}

		if (!$sql_output) {
			$sql_output = "-- Nothing found of type $self->{type}\n";
		} else {
			$sql_output .= "\n";
		}

		$self->dump($sql_header . $sql_output . "\nEND TRANSACTION;\n");
		return;
	}

	# Process grant only
	if ($self->{type} eq 'GRANT') {
		$self->log_msg("Add users/roles/grants privileges...", 1);
		if ($self->{export_schema}) {
			$sql_output .= "SET search_path = $self->{schema}, pg_catalog;\n\n" if ($self->{schema});
		}
		my $grants = '';
		if (!$self->{pg_supports_role}) {
			# Add groups definition
			my $groups = '';
			my @users = ();
			my @grps = ();
			foreach my $u (@{$self->{users}}) {
				next if (exists $self->{groups}{"$u"});
				my $secret = 'change_my_secret';
				if ($self->{gen_user_pwd}) {
					use String::Random;
					my $pass = new String::Random;
					$secret = $pass->randpattern("CccnCccn");

				}
				$sql_header .= "CREATE USER $u WITH PASSWORD '$secret';\n";
			}
			foreach my $role (sort keys %{$self->{groups}}) {
				push(@grps, $role);
				$groups .= "CREATE GROUP $role WITH USER " . join(',', @{$self->{groups}{$role}}) . ";\n";
			}
			$sql_header .= "\n" . $groups . "\n";

			# Add privilege definition
			foreach my $table (sort keys %{$self->{grants}}) {
				$grants .= "REVOKE ALL ON $table FROM PUBLIC;\n";
				foreach my $priv (sort keys %{$self->{grants}{$table}}) {
					my $usr = '';
					my $grp = '';
					foreach my $user (@{$self->{grants}{$table}{$priv}}) {
						if (grep(/^$user$/, @grps)) {
							$grp .= "$user,";
						} else {
							$usr .= "$user,";
						}
					}
					$grp =~ s/,$//;
					$usr =~ s/,$//;
					if ($grp) {
						$grants .= "GRANT $priv ON $table TO GROUP $grp;\n";
					} else {
						$grants .= "GRANT $priv ON $table TO $usr;\n";
					}
				}
			}

		print qq{
WARNING: users, groups and grants are very difficult to apply directly
into PostgreSQL, so you MUST take a look and add/remove/modify want you
really need !!! Note: Oracles roles are translated to PostgreSQL groups.
If you have PostgreSQL 8.1 or more consider the use of ROLES and set the
configuration option PG_SUPPORTS_ROLE to 1.

};
		} else {
			foreach my $r (sort keys %{$self->{roles}}) {
				$self->log_msg("Extracting role $r\n");
				next if ($r eq 'CONNECT');
				$grants .= "CREATE ROLE $r WITH";
				if ($#{$self->{roles}{$r}{users}} >= 0) {
					$grants .= " USER " . join(',', @{$self->{roles}{$r}{users}});
				}
				if ($#{$self->{roles}{$r}{roles}} >= 0) {
					$grants .= " ROLE " . join(',', @{$self->{roles}{$r}{roles}});
				}
				# It's seems difficult to parse all kind of oracle privilege. So if one admin option is set we set all PG admin option.
				if (grep(/YES|1/, @{$self->{roles}{$r}{admin_option}})) {
					$grants .= " CREATEDB CREATEROLE CREATEUSER";
				}
				# if this role is found in the connect role allow login
				if (exists $self->{roles}{'CONNECT'} && grep(/^$r$/, @{$self->{roles}{'CONNECT'}{roles}})) {
					$grants .= " LOGIN";
				}
				$grants .= ";\n";
				# Now export all object granted to this role
				foreach my $t ( sort keys %{$self->{roles}{$r}{table}}) {
					if (grep(/EXECUTE/, @{$self->{roles}{$r}{table}{$t}})) {
						$grants .= "GRANT " . join(',', @{$self->{roles}{$r}{table}{$t}}) . " ON FUNCTION $t TO ROLE $r;\n";
					} else {
						$grants .= "GRANT " . join(',', @{$self->{roles}{$r}{table}{$t}}) . " ON $t TO ROLE $r;\n";
					}
				} 
			}
			# Now extract simple user allowed to connect
			if (exists $self->{roles}{'CONNECT'}) {
				foreach my $u (@{$self->{roles}{'CONNECT'}{users}}) {
					my $secret = 'change_my_secret';
					if ($self->{gen_user_pwd}) {
						use String::Random;
						my $pass = new String::Random;
						$secret = $pass->randpattern("CccnCccn");

					}
					$sql_header .= "CREATE USER $u WITH PASSWORD '$secret';\n";
				}
			}
		print qq{
WARNING: Roles are very difficult to apply directly into PostgreSQL,
so you MUST take a look and add/remove/modify want you really need !!! 

};
		}
		if (!$grants) {
			$grants = "-- Nothing found of type $self->{type}\n";
		}

		$sql_output .= "\n" . $grants . "\n";

		$self->dump($sql_header . $sql_output . "\nEND TRANSACTION;\n");

		return;
	}

	# Process sequences only
	if ($self->{type} eq 'SEQUENCE') {
		$self->log_msg("Add sequences definition...", 1);
		foreach my $seq (@{$self->{sequences}}) {
			my $cache = 1;
			$cache = $seq->[5] if ($seq->[5]);
			my $cycle = '';
			$cycle = ' CYCLE' if ($seq->[6] eq 'Y');
			if ($seq->[2] > 2147483646) {
				$seq->[2] = 2147483646;
			}
			if ($seq->[1] < -2147483647) {
				$seq->[1] = -2147483647;
			}
			if ($self->{export_schema}) {
				$sql_output .= "SET search_path = $self->{schema}, pg_catalog;\n\n" if ($self->{schema});
			}
			if (!$self->{case_sensitive}) {
				$sql_output .= "CREATE SEQUENCE \"\L$seq->[0]\E\" INCREMENT $seq->[3] MINVALUE $seq->[1] MAXVALUE $seq->[2] START $seq->[4] CACHE $cache$cycle;\n";
			} else {
				$sql_output .= "CREATE SEQUENCE \"$seq->[0]\" INCREMENT $seq->[3] MINVALUE $seq->[1] MAXVALUE $seq->[2] START $seq->[4] CACHE $cache$cycle;\n";
			}
		}

		if (!$sql_output) {
			$sql_output = "-- Nothing found of type $self->{type}\n";
		}

		$self->dump($sql_header . $sql_output . "\nEND TRANSACTION;\n");
		return;
	}

	# Process triggers only. PL/SQL code is pre-converted to PL/PGSQL following
	# the recommendation of Roberto Mello, see http://techdocs.postgresql.org/
	# Oracle's PL/SQL to PostgreSQL PL/pgSQL HOWTO  
	if ($self->{type} eq 'TRIGGER') {
		$self->log_msg("Add triggers definition...", 1);
		foreach my $trig (@{$self->{triggers}}) {
			$trig->[1] =~ s/ EACH ROW//;
			chop($trig->[4]);
			chomp($trig->[4]);
			# Change SYSDATE to 'now'
			$trig->[4] =~ s/SYSDATE/CURRENT_TIMESTAMP/igs;
			# Check if it's a pg rule
			if ($trig->[1] =~ /INSTEAD OF/) {
				if (!$self->{case_sensitive}) {
					$sql_output .= "CREATE RULE \"\L$trig->[0]\E\" AS\n\tON \L$trig->[3]\E\n\tDO INSTEAD\n(\n\t$trig->[4]\n);\n\n";
				} else {
					$sql_output .= "CREATE RULE \"$trig->[0]\" AS\n\tON $trig->[3]\n\tDO INSTEAD\n(\n\t$trig->[4]\n);\n\n";
				}
			} else {

				#--------------------------------------------
				# PL/SQL to PL/PGSQL code conversion
				#--------------------------------------------
				# Change NVL to COALESCE
				#$trig->[4] =~ s/NVL\(/coalesce(/igs;
				# Change trunc() to date_trunc('day', field)
				# Trunc is replaced with date_trunc if we find date in the name of the value
				# because Oracle have the same trunc function on number and date type :-(((
				#$trig->[4] =~ s/trunc\(([^\)]*date[^\)]*)\)/date_trunc('day', $1)/igs;
				# Change SYSDATE to 'now'
				#$trig->[4] =~ s/SYSDATE/CURRENT_TIMESTAMP/igs;
				# Change nextval on sequence
				# Oracle's sequence grammar is sequence_name.nextval.
				# Postgres's sequence grammar is nextval('sequence_name'). 
				#$trig->[4] =~ s/(\w+)\.nextval/nextval('$1')/isg;
				# Escaping Single Quotes
				#$trig->[4] =~ s/'/''/sg;

				if ($self->{export_schema}) {
					$sql_output .= "SET search_path = $self->{schema}, pg_catalog;\n\n" if ($self->{schema});
				}
				if (!$self->{case_sensitive}) {
					$sql_output .= "CREATE FUNCTION pg_fct_\L$trig->[0]\E () RETURNS OPAQUE AS '\n$trig->[4]\n' LANGUAGE 'plpgsql'\n\n";
					$sql_output .= "CREATE TRIGGER \L$trig->[0]\E\n\t$trig->[1] $trig->[2] ON \"\L$trig->[3]\E\" FOR EACH ROW\n\tEXECUTE PROCEDURE pg_fct_\L$trig->[0]\E();\n\n";
				} else {
					$sql_output .= "CREATE FUNCTION pg_fct_$trig->[0] () RETURNS OPAQUE AS '\n$trig->[4]\n' LANGUAGE 'plpgsql'\n\n";
					$sql_output .= "CREATE TRIGGER $trig->[0]\n\t$trig->[1] $trig->[2] ON \"$trig->[3]\" FOR EACH ROW\n\tEXECUTE PROCEDURE pg_fct_$trig->[0]();\n\n";
				}
			}
		}

		if (!$sql_output) {
			$sql_output = "-- Nothing found of type $self->{type}\n";
		}

		$self->dump($sql_header . $sql_output . "\nEND TRANSACTION;\n");
		return;
	}

	# Process functions only
	if (($self->{type} eq 'FUNCTION') || ($self->{type} eq 'PROCEDURE')) {
		use constant SQL_DATATYPE => 2;
		$self->log_msg("Add functions definition...", 1);
		foreach my $fct (sort keys %{$self->{functions}}) {
			my @tmp = ();
                        if ($self->{functions}{$fct} =~ /^[\s\t]*function/is) {
                                $self->{functions}{$fct} =~ /function[\s\n\t]*$fct[\s\n\t]*\(([^\)]*)\)[\s\n\t]*return.*is/is;
                                @tmp = split(/\n/, $1);
                        } else {
                                $self->{functions}{$fct} =~ /procedure[\s\n\t]*$fct[\s\n\t]*\(([^\)]*)\)[\s\n\t]*return.*is\W/is;
                                @tmp = split(/\n/, $1);
                        }
                        my @argu = split(/,/, join(' ', @tmp));

                        ## NOTE: for now we cannot handle constructs like parameters
                        ## with default values. The following code assumes, we
                        ## have a function signature with
                        ##
                        ## foo IN datatype
                        ##

                        if (!$self->{pg_supports_inout}) {
                          # don't use INOUT parameters directly if PostgreSQL < 8.1
                          for(my $i = 0; $i <= $#argu,;$i++) {
                            $argu[$i] =~ s/^.*[\t\s\W]*in //is;
                            $argu[$i] =~ s/^.*[\t\s\W]*out //is;

                            # determining the SQL datatype is trivial: only one parameter
                            # string is left...
                            $argu[$i] = $self->_sql_type(uc $argu[$i]);

                          }
                        } else {
                          for(my $i = 0; $i <= $#argu; $i++) {
                            my @pars = split / /, $argu[$i];
                            # translate SQL datatype
                            $pars[SQL_DATATYPE]  = $self->_sql_type(uc $pars[2]);
                            $argu[$i] = join ' ', @pars;
                          }

                        }

                        # we don't want any commas in the parameter list :)
                        map { s/,//is } @argu;

                        #map { s/^.* in //is } @argu;
                        #map { s/^.* out //is } @argu;
                        #map { $_ = $self->_sql_type(uc($_)) } @argu;
                        if (!$self->{pg_supports_inout}) {
				$self->{functions}{$fct} =~ /return ([^\s]*) is/is;
				$self->{functions}{$fct} = "-- Oracle function declaration, please edit to match PostgreSQL syntax.\n$self->{functions}{$fct}";
				if (!$self->{case_sensitive}) {
					$sql_output .= "CREATE FUNCTION \L$fct\E(" . join(',', @argu) . ") RETURNS " . $self->_sql_type(uc($1)) . " AS '\n$self->{functions}{$fct}\n' LANGUAGE 'sql'\n\n";
				} else {
					$sql_output .= "CREATE FUNCTION $fct(" . join(',', @argu) . ") RETURNS " . $self->_sql_type(uc($1)) . " AS '\n$self->{functions}{$fct}\n' LANGUAGE 'sql'\n\n";
				}
			} else {
			     $self->{functions}{$fct} =~ s/PROCEDURE/CREATE OR REPLACE FUNCTION/s;
			     $self->{functions}{$fct} =~ s/\) IS/\) AS \$\$/s;
				if (!$self->{case_sensitive}) {
					$sql_output .= "$self->{functions}{$fct}\n\$\$ LANGUAGE SQL;\n\n";
				} else {
					$sql_output .= "$self->{functions}{$fct}\n\$\$ LANGUAGE SQL;\n\n";
				}
			}

		}

		if (!$sql_output) {
			$sql_output = "-- Nothing found of type $self->{type}\n";
		} else {
			print STDERR qq{
WARNING: Please consider you MUST edit and modify function/procedure declaration
to match PostgreSQL syntax.

};
		}

		$self->dump($sql_header . $sql_output . "\nEND TRANSACTION;\n");
		return;
	}

	# Process functions only
	if ($self->{type} eq 'PACKAGE') {
		$self->log_msg("Add packages definition...", 1);
		foreach my $pkg (sort keys %{$self->{packages}}) {
			$sql_output .= "-- Oracle package '$pkg' declaration, please edit to match PostgreSQL syntax.\n";
			$sql_output .= "$self->{packages}{$pkg}\n";
			$sql_output .= "-- End of Oracle package '$pkg' declaration\n\n";
		}

		if (!$sql_output) {
			$sql_output = "-- Nothing found of type $self->{type}\n";
		}

		$self->dump($sql_header . $sql_output . "\nEND TRANSACTION;\n");
		return;
	}

	# Process TABLESPACE only
	if ($self->{type} eq 'TABLESPACE') {
		$self->log_msg("Add tablespaces definition...", 1);
		$sql_header .= "-- Oracle tablespaces export, please edit path to match your filesystem.\n";
		$sql_header .= "-- In PostgreSQl the path must be a directory and is expected to already exists\n";
		my $create_tb = '';
		foreach my $tb_type (sort keys %{$self->{tablespaces}}) {
			# TYPE - TABLESPACE_NAME - FILEPATH - OBJECT_NAME
			foreach my $tb_name (sort keys %{$self->{tablespaces}{$tb_type}}) {
				foreach my $tb_path (sort keys %{$self->{tablespaces}{$tb_type}{$tb_name}}) {
					$create_tb .= "CREATE TABLESPACE $tb_name LOCATION '$tb_path';\n" if ($create_tb !~ /CREATE TABLESPACE $tb_name LOCATION/s);
					foreach my $obj (@{$self->{tablespaces}{$tb_type}{$tb_name}{$tb_path}}) {
						$sql_output .= "ALTER $tb_type $obj SET TABLESPACE $tb_name;\n";
					}
				}
			}
		}

		if (!$sql_output) {
			$sql_output = "-- Nothing found of type $self->{type}\n";
		}
		
		$self->dump($sql_header . "$create_tb\n" . $sql_output . "\nEND TRANSACTION;\n");
		return;
	}

	# Extract data only
	if (($self->{type} eq 'DATA') || ($self->{type} eq 'COPY')) {
		# Connect the database
		$self->{dbh} = DBI->connect($self->{datasource}, $self->{user}, $self->{password});
		# Check for connection failure
		if (!$self->{dbh}) {
			die "Error : $DBI::err ... $DBI::errstr\n";
		}

		if (!$self->{dbhdest}) {
			$self->dump($sql_header);
		} else {
			if ($self->{type} eq 'COPY') {
				open(DBH, "| $PSQL -h $self->{dbhost} -p $self->{dbport} -d $self->{dbname}") or die "Can't open $PSQL command, $!\n";
			}
		}

		if ($self->{export_schema} &&  $self->{schema}) {
			if ($self->{dbhdest}) {
				if ($self->{type} ne 'COPY') {
					my $s = $self->{dbhdest}->prepare("SET search_path = $self->{schema}, pg_catalog") or die $self->{dbhdest}->errstr . "\n";
					$s->execute or die $s->errstr . "\n";
				} else {
					print DBH "SET search_path = $self->{schema}, pg_catalog;\n";
				}
			} else {
				$self->dump("SET search_path = $self->{schema}, pg_catalog;\n");
			}
		}
		if ($self->{defer_fkey}) {
			if ($self->{dbhdest}) {
				print DBH "SET CONSTRAINTS ALL DEFERRED;\n";
			} else {
				$self->dump("SET CONSTRAINTS ALL DEFERRED;\n");
			}
		}

		foreach my $table (sort { $self->{tables}{$a}{internal_id} <=> $self->{tables}{$b}{internal_id} } keys %{$self->{tables}}) {
			my $start_time = time();
			$self->log_msg("Dumping table $table...", 1);

			## disable triggers of current table if requested
			if ($self->{disable_triggers}) {

			    if ($self->{dbhdest}) {
				print DBH "ALTER TABLE $table DISABLE TRIGGER $self->{disable_triggers};\n";
			    } else {
				$self->dump("ALTER TABLE $table DISABLE TRIGGER $self->{disable_triggers};\n");
			    }

			}

			my @tt = ();
			my @nn = ();
			my $total_record = 0;
			my $s_out = "INSERT INTO \"\L$table\E\" (";
			$s_out = "INSERT INTO \"$table\" (" if ($self->{case_sensitive});
			if ($self->{type} eq 'COPY') {
				$s_out = "\nCOPY \"\L$table\E\" ";
				$s_out = "\nCOPY \"$table\" " if ($self->{case_sensitive});
			}
			my @fname = ();
			foreach my $i ( 0 .. $#{$self->{tables}{$table}{field_name}} ) {
				my $fieldname = ${$self->{tables}{$table}{field_name}}[$i];
				if (!$self->{case_sensitive}) {
					if (exists $self->{modify}{"\L$table\E"}) {
						next if (!grep(/$fieldname/i, @{$self->{modify}{"\L$table\E"}}));
					}
				} else {
					if (exists $self->{modify}{"$table"}) {
						next if (!grep(/$fieldname/i, @{$self->{modify}{"$table"}}));
					}
				}
				if (!$self->{case_sensitive}) {
					push(@fname, lc($fieldname));
				} else {
					push(@fname, $fieldname);
				}
				foreach my $f (@{$self->{tables}{$table}{column_info}}) {
					next if ($f->[0] ne "$fieldname");
					my $type = $self->_sql_type($f->[1], $f->[2], $f->[5], $f->[6]);
					$type = "$f->[1], $f->[2]" if (!$type);
					push(@tt, $type);
					push(@nn, $f->[0]);
					if ($self->{type} ne 'COPY') {
						if (!$self->{case_sensitive}) {
							$s_out .= "\"\L$f->[0]\E\",";
						} else {
							$s_out .= "\"$f->[0]\",";
						}
					}
					last;
				}
			}
			if ($self->{type} eq 'COPY') {
				map { $_ = '"' . $_ . '"' } @fname;
				$s_out .= '(' . join(',', @fname) . ") FROM stdin;\n";
			}

			if ($self->{type} ne 'COPY') {
				$s_out =~ s/,$//;
				$s_out .= ") VALUES (";
			}

			# Change table name
			if (exists $self->{replaced_tables}{"\L$table\E"} && $self->{replaced_tables}{"\L$table\E"}) {
				$self->log_msg("\tReplacing table $table as ", $self->{replaced_tables}{lc($table)}, "...", 1);
				$s_out =~ s/INSERT INTO "$table"/INSERT INTO "$self->{replaced_tables}{lc($table)}"/si;
				$s_out =~ s/COPY "$table"/COPY "$self->{replaced_tables}{lc($table)}"/si;
			}
			# Change column names
			if (exists $self->{replaced_cols}{"\L$table\E"} && $self->{replaced_cols}{"\L$table\E"}) {
				foreach my $c (keys %{$self->{replaced_cols}{"\L$table\E"}}) {
					$self->log_msg("\tReplacing column $c as ", $self->{replaced_cols}{lc($table)}{$c}, "...", 1);
					$s_out =~ s/"$c"/"$self->{replaced_cols}{lc($table)}{$c}"/si;
					$s_out =~ s/"$table"/"$self->{replaced_cols}{lc($table)}{$c}"/si;
				}
			}
			# Extract all data from the current table
			$self->{data_current} = 0;
			$self->{data_end} = 0;
			while ( !$self->{data_end} ) {
				my $inter_time = time();
				my $sth = $self->_get_data($table, \@nn, \@tt);
				$self->{data_end} = 1 if (!$self->{data_limit});
				my $sql = '';
				if ($self->{type} eq 'COPY') {
					if ($self->{dbhdest}) {
						$sql = $s_out;
					} else {
						$self->dump($s_out);
					}
				}
				my $count = 0;
				while (my $row = $sth->fetch) {
					if ($count % 1000 == 0) {
						print STDERR "." if ($self->{debug});
					}
					if ($self->{type} ne 'COPY') {
						if ($self->{dbhdest}) {
							$sql .= $s_out;
						} else {
							$self->dump($s_out);
						}
					}
					for (my $i = 0; $i <= $#{$row}; $i++) {
						$row->[$i] = &escape($row->[$i], $tt[$i], $self->{type});
						if ($self->{type} ne 'COPY') {
							if ($tt[$i] =~ /(char|date|time|text|bytea)/) {
								$row->[$i] =~ s/\\'/BACKSLASH_APOSTROPHE/gs; # 'emacs
								$row->[$i] =~ s/'/''/gs;
								if ($row->[$i] ne '') {
									$row->[$i] = "'$row->[$i]'";
								} else {
									$row->[$i] = 'NULL';
								}
								if ($self->{dbhdest}) {
									$sql .= $row->[$i];
								} else {
									$self->dump($row->[$i]);
								}
							} else {
								# Convert local decimal separator
								$row->[$i] =~ s/,/./;
								if ($row->[$i] eq '') {
									$row->[$i] = 'NULL';
								}
								if ($self->{dbhdest}) {
									$sql .= $row->[$i];
								} else {
									$self->dump($row->[$i]);
								}
							}
							if ($i < $#{$row}) {
								if ($self->{dbhdest}) {
									$sql .= ",";
								} else {
									$self->dump(",");
								}
							}
						} else {
							if ($tt[$i] eq 'bytea') {
								$row->[$i] =~ s/(.)/sprintf("\\\\%03o",ord($1))/ges;
							}
							if ($tt[$i] !~ /(char|date|time|text|bytea)/) {
								$row->[$i] =~ s/,/./;
							}
							if ($row->[$i] eq '') {
								$row->[$i] = '\N';
							}
							if ($self->{dbhdest}) {
								$sql .= $row->[$i];
							} else {
								$self->dump($row->[$i]);
							}
							if ($i < $#{$row}) {
								if ($self->{dbhdest}) {
									$sql .= "\t";
								} else {
									$self->dump("\t");
								}
							} else {
								if ($self->{dbhdest}) {
									$sql .= "\n";
								} else {
									$self->dump("\n");
								}
							}
						}
					}
					if ($self->{type} ne 'COPY') {
						if ($self->{dbhdest}) {
							$sql .= ");\n";
						} else {
							$self->dump(");\n");
						}
					}
					$count++;
				}
				$total_record += $count;
				if ($self->{type} eq 'COPY') {
					if ($self->{dbhdest}) {
						$sql .= "\\.\n";
					} else {
						$self->dump("\\.\n");
					}
				}
				if ($self->{data_limit}) {
					$self->{data_end} = 1 if ($count+1 < $self->{data_limit});
				}
				# Insert data if we are in online processing mode
				if ($self->{dbhdest}) {
					if ($self->{type} ne 'COPY') {
						my $s = $self->{dbhdest}->prepare($sql) or die $self->{dbhdest}->errstr . "\n";
						$s->execute or die $s->errstr . "\n";
					} else {
						print DBH "$sql";
					}
				}
				my $end_time = time();
				my $dt = $end_time - $inter_time;
				my $rps = sprintf("%2.1f", $count / ($dt+.0001));
				$self->log_msg("\n$count records in $dt secs = $rps recs/sec", 1);
			}

                        ## don't forget to enable all triggers if needed...
			if ($self->{disable_triggers}) {

			    if ($self->{dbhdest}) {
				print DBH "ALTER TABLE $table ENABLE TRIGGER $self->{disable_triggers};\n";
			    } else {
				$self->dump("ALTER TABLE $table ENABLE TRIGGER $self->{disable_triggers};\n");
			    }

			}

			$self->log_msg("Total extracted records from table $table: $total_record", 1);
			my $end_time = time();
			my $dt = $end_time - $start_time;
			my $rps = sprintf("%.1f", $total_record / ($dt+.0001));
			$self->log_msg("in $dt secs = $rps recs/sec", 1);
		}

		# Disconnect from the database
		$self->{dbh}->disconnect() if ($self->{dbh});

		if (($self->{defer_fkey} || $self->{type} ne 'COPY') && !$self->{dbhdest} ) {
			$self->dump("\nEND TRANSACTION;\n");
		}

		$self->{dbhdest}->disconnect() if ($self->{dbhdest});

		if ($self->{type} eq 'COPY') {
			close DBH;
		}
		return;
	}
	


	# Dump the database structure
	if ($self->{export_schema} &&  $self->{schema}) {
		if (!$self->{case_sensitive}) {
			$sql_output .= "CREATE SCHEMA \L$self->{schema}\E;\n\n";
			$sql_output .= "SET search_path = \L$self->{schema}\E, pg_catalog;\n\n";
		} else {
			$sql_output .= "CREATE SCHEMA $self->{schema};\n\n";
			$sql_output .= "SET search_path = $self->{schema}, pg_catalog;\n\n";
		}
	}
	foreach my $table (sort { $self->{tables}{$a}{internal_id} <=> $self->{tables}{$b}{internal_id} } keys %{$self->{tables}}) {
		$self->log_msg("Dumping table $table...", 1);
		if (!$self->{case_sensitive}) {
			$sql_output .= "CREATE ${$self->{tables}{$table}{table_info}}[1] \"\L$table\E\" (\n";
		} else {
			$sql_output .= "CREATE ${$self->{tables}{$table}{table_info}}[1] \"$table\" (\n";
		}
		foreach my $i ( 0 .. $#{$self->{tables}{$table}{field_name}} ) {
			foreach my $f (@{$self->{tables}{$table}{column_info}}) {
				next if ($f->[0] ne "${$self->{tables}{$table}{field_name}}[$i]");
				my $type = $self->_sql_type($f->[1], $f->[2], $f->[5], $f->[6]);
				$type = "$f->[1], $f->[2]" if (!$type);
				if (!$self->{case_sensitive}) {
					$sql_output .= "\t\"\L$f->[0]\E\" $type";
				} else {
					$sql_output .= "\t\"$f->[0]\" $type";
				}
				if ($f->[4] ne "") {
					$f->[4] =~  s/SYSDATE/CURRENT_TIMESTAMP/ig;
					$sql_output .= " DEFAULT $f->[4]";
				} elsif (!$f->[3] || ($f->[3] eq 'N')) {
					$sql_output .= " NOT NULL";
				}
				$sql_output .= ",\n";
				last;
			}
		}
		$sql_output =~ s/,$//;
		$sql_output .= ");\n";

		# Set the unique (and primary) key definition 
                my $newtabname = $self->{case_sensitive} ? $table : lc($table);
		foreach my $consname (keys %{$self->{tables}{$table}{unique_key}}) {
                        my $newconsname = $self->{case_sensitive} ? $consname : lc($consname);
                        my $constype =   $self->{tables}{$table}{unique_key}{$consname}{type};
                        my @conscols = @{$self->{tables}{$table}{unique_key}{$consname}{columns}};
                        my %constypenames = ('U' => 'UNIQUE', 'P' => 'PRIMARY KEY');
                        my $constypename = $constypenames{$constype};
                        my $columnlist = join(',', map(qq{"$_"}, @conscols));
                        $columnlist = lc($columnlist) unless ($self->{case_sensitive});
                        if(($constype ne 'P') || $self->{keep_pkey_names}) {
                            $sql_output .= qq{ALTER TABLE "$newtabname" ADD CONSTRAINT "$newconsname" $constypename ($columnlist);\n};
                        } else {
                            $sql_output .= qq{ALTER TABLE "$newtabname" ADD PRIMARY KEY ($columnlist);\n};
                        }
		}

		# Set the check constraint definition 
		foreach my $k (keys %{$self->{tables}{$table}{check_constraint}}) {
			if (!$self->{case_sensitive}) {
				my $first_letter = substr($self->{tables}{$table}{check_constraint}{$k},0,1);
				if($first_letter eq '"') {
					$sql_output .= "ALTER TABLE \"\L$table\E\" ADD CONSTRAINT \"\L$k\E\" CHECK (" . lc($self->{tables}{$table}{check_constraint}{$k}) . ");\n";
				} else {
					$sql_output .= "ALTER TABLE \"\L$table\E\" ADD CONSTRAINT \"\L$k\E\" CHECK (" . $self->{tables}{$table}{check_constraint}{$k} . ");\n";
				}
			} else {
				$sql_output .= "ALTER TABLE \"$table\" ADD CONSTRAINT \"$k\" CHECK (" . $self->{tables}{$table}{check_constraint}{$k} . ");\n";
			}
		}


		# Set the index definition
		foreach my $idx (keys %{$self->{tables}{$table}{indexes}}) {
			map { s/^/"/ } @{$self->{tables}{$table}{indexes}{$idx}};
			map { s/$/"/ } @{$self->{tables}{$table}{indexes}{$idx}};
			my $columns = join(',', @{$self->{tables}{$table}{indexes}{$idx}});
			my $unique = '';
			$unique = ' UNIQUE' if ($self->{tables}{$table}{uniqueness}{$idx} eq 'UNIQUE');
			if (!$self->{case_sensitive}) {
				$sql_output .= "CREATE$unique INDEX \L$idx\E ON \"\L$table\E\" (\L$columns\E);\n";
			} else {
				$sql_output .= "CREATE$unique INDEX $idx ON \"$table\" ($columns);\n";
			}
		}
		$sql_output .= "\n";
	}

	foreach my $table (keys %{$self->{tables}}) {
		next if ($#{$self->{tables}{$table}{foreign_key}} < 0);
		$self->log_msg("Dumping RI $table...", 1);

		# Add constraint definition
		my @done = ();
		foreach my $h (@{$self->{tables}{$table}{foreign_key}}) {
			next if (grep(/^$h->[0]$/, @done));
			my $desttable = '';
			foreach (keys %{$self->{tables}{$table}{foreign_link}{$h->[0]}{remote}}) {
				$desttable .= "$_";
			}
			push(@done, $h->[0]);
			map { $_ = '"' . $_ . '"' } @{$self->{tables}{$table}{foreign_link}{$h->[0]}{local}};
			map { $_ = '"' . $_ . '"' } @{$self->{tables}{$table}{foreign_link}{$h->[0]}{remote}{$desttable}};
			if (!$self->{case_sensitive}) {
				$sql_output .= "ALTER TABLE \"\L$table\E\" ADD CONSTRAINT \"\L$h->[0]\E\" FOREIGN KEY (" . lc(join(',', @{$self->{tables}{$table}{foreign_link}{$h->[0]}{local}})) . ") REFERENCES \"\L$desttable\E\" (" . lc(join(',', @{$self->{tables}{$table}{foreign_link}{$h->[0]}{remote}{$desttable}})) . ")";
			} else {
				$sql_output .= "ALTER TABLE \"$table\" ADD CONSTRAINT \"$h->[0]\" FOREIGN KEY (" . join(',', @{$self->{tables}{$table}{foreign_link}{$h->[0]}{local}}) . ") REFERENCES \"$desttable\" (" . join(',', @{$self->{tables}{$table}{foreign_link}{$h->[0]}{remote}{$desttable}}) . ")";
			}
			$sql_output .= " MATCH $h->[2]" if ($h->[2]);
			$sql_output .= " ON DELETE $h->[3]";
			$sql_output .= " $h->[4]";
			$sql_output .= " INITIALLY $h->[5];\n";
		}
	}

	if (!$sql_output) {
		$sql_output = "-- Nothing found of type TABLE\n";
	}

	$self->dump($sql_header . $sql_output . "\nEND TRANSACTION;\n");
}


=head2 _get_data TABLE

This function implements a Oracle-native data extraction.

Return a list of array reference containing the data

=cut

sub _get_data
{
	my ($self, $table, $name, $type) = @_;

	my $str = "SELECT ";
	my $tmp = "SELECT ";
	my $extraStr = "";
	for my $k (0 .. $#{$name}) {
		if ( $type->[$k] =~ /(date|time)/) {
			$str .= "to_char($name->[$k], 'YYYY-MM-DD HH24:MI:SS'),";
		} else {
			$str .= "$name->[$k],";
		}
		$tmp .= "$name->[$k],";
	}
	$str =~ s/,$//;
	$tmp =~ s/,$//;
	my $tmp2 = $tmp;
	$tmp2 =~ s/SELECT /SELECT ROWNUM as noline,/;

	# Fix a problem when the table need to be prefixed by the schema
	my $realtable = $table;
	if ($self->{schema}) {
		$realtable = "$self->{schema}.$table";
	}
	# Fix a problem when using data_limit AND where clause
	if (exists $self->{where}{"\L$table\E"} && $self->{where}{"\L$table\E"}) {
		$extraStr .= ' AND (' . $self->{where}{"\L$table\E"} . ')';
	} elsif ($self->{global_where}) {
		$extraStr .= ' AND (' . $self->{global_where} . ')';
	}
	if ($self->{data_limit}) {
		$str = $str . " FROM ( $tmp2 FROM ( $tmp FROM $realtable) ";
		$str .= " WHERE ROWNUM < ($self->{data_limit} + $self->{data_current}) $extraStr) ";
		$str .= " WHERE noline >= $self->{data_current}";
	} else {
		$str .= " FROM $realtable";
	}
	if (exists $self->{where}{"\L$table\E"} && $self->{where}{"\L$table\E"}) {
		if ($str =~ / WHERE /) {
			$str .= ' AND ';
		} else {
			$str .= ' WHERE ';
		}
		$str .= '(' . $self->{where}{"\L$table\E"} . ')';
		$self->log_msg("\tApplying WHERE clause: ", $self->{where}{"\L$table\E"}, "", 1);
	} elsif ($self->{global_where}) {
		if ($str =~ / WHERE /) {
			$str .= ' AND ';
		} else {
			$str .= ' WHERE ';
		}
		$str .= '(' . $self->{global_where} . ')';
		$self->log_msg("\tApplying WHERE clause: ", $self->{global_where}, "", 1);
	}

	$self->{data_current} += $self->{data_limit};

	# Fix a problem when exporting type LONG and LOB
	$self->{dbh}->{'LongReadLen'} = 1023*1024;
	$self->{dbh}->{'LongTruncOk'} = 1;

	my $sth = $self->{dbh}->prepare($str) or die $self->{dbh}->errstr . "\n";
	$sth->execute or die $self->{dbh}->errstr . "\n";

	return $sth;	

}


=head2 _sql_type INTERNAL_TYPE LENGTH PRECISION SCALE

This function return the PostgreSQL datatype corresponding to the
Oracle internal type.

=cut

sub _sql_type
{
        my ($self, $type, $len, $precision, $scale) = @_;

	my $data_type = '';

        my %TYPE = (
		# Oracle only has one flexible underlying numeric type, NUMBER.
		# Without precision and scale it is set to PG type float8 to match all needs
                'NUMBER' => 'numeric',
		# CHAR types limit of 2000 bytes with default to 1 if no length is given.
		# PG char type has max length set to 8104 so it should match all needs
                'CHAR' => 'char',
                'NCHAR' => 'char',
		# VARCHAR types the limit is 2000 bytes in Oracle 7 and 4000 in Oracle 8.
		# PG varchar type has max length iset to 8104 so it should match all needs
                'VARCHAR' => 'varchar',
                'NVARCHAR' => 'varchar',
                'VARCHAR2' => 'varchar',
                'NVARCHAR2' => 'varchar',
		# The DATE data type is used to store the date and time information.
		# Pg type timestamp should match all needs
                'DATE' => 'timestamp',
		# Type LONG is like VARCHAR2 but with up to 2Gb.
		# PG type text should match all needs or if you want you could use blob
                'LONG' => 'text', # Character data of variable length
                'LONG RAW' => 'text',
		# Types LOB and FILE are like LONG but with up to 4Gb.
		# PG type text should match all needs or if you want you could use blob (large object)
                'CLOB' => 'text', # A large object containing single-byte characters
                'NLOB' => 'text', # A large object containing national character set data
                'BLOB' => 'bytea', # Binary large object
                'BFILE' => 'text', # Locator for external large binary file
		# The RAW type is presented as hexadecimal characters. The contents are treated as binary data. Limit of 2000 bytes
		# Pg type text should match all needs or if you want you could use blob (large object)
                'RAW' => 'bytea',
                'ROWID' => 'oid',
                'FLOAT' => 'float8',
		'DEC' => 'decimal',
		'DECIMAL' => 'decimal',
		'DOUBLE PRECISION' => 'double precision',
		'INT' => 'integer',
		'INTEGER' => 'integer',
		'REAL' => 'real',
		'SMALLINT' => 'smallint',
        );

        # Overide the length
        $len = $precision if ( ($type eq 'NUMBER') && $precision );

        if (exists $TYPE{$type}) {
		if ($len) {
			if ( ($type eq "CHAR") || ($type =~ /VARCHAR/) ) {
				# Type CHAR have default length set to 1
				# Type VARCHAR(2) must have a given length
				$len = 1 if (!$len && ($type eq "CHAR"));
                		return "$TYPE{$type}($len)";
			} elsif ($type eq "NUMBER") {
				# This is an integer
				if (!$scale) {
					if ($precision) {
						if ($self->{pg_numeric_type}) {
							if ($precision < 5) {
								return 'smallint';
							} elsif ($precision <= 10) {
								return 'integer'; # The speediest in PG
							} else {
								return 'bigint';
							}
						}
						return "numeric($precision)";
					} elsif ($self->{pg_numeric_type}) {
						# Most of the time interger should be enought?
						return $self->{default_numeric} || 'float';
					}
				} else {
					if ($precision) {
						# globalqss - Se pone en comentario para evitar el uso de float y real
						# if ($self->{pg_numeric_type}) {
						# 		if ($precision < 6) {
						# 			return 'real';
						# 		} else {
						# 			return 'float';
						# 		}
						# }
						return "decimal($precision,$scale)";
					}
				}
                		return "$TYPE{$type}";
			} else {
                		return "$TYPE{$type}";
			}
		} else {
			
                	return $TYPE{$type};
		}
        }

        return;
}


=head2 _column_info TABLE OWNER

This function implements a Oracle-native column information.

Return a list of array reference containing the following informations
for each column the given a table

[(
  column name,
  column type,
  column length,
  nullable column,
  default value
)]

=cut

sub _column_info
{
	my ($self, $table, $owner) = @_;

	$owner = "AND OWNER='$owner' " if ($owner);
# SELECT COLUMN_NAME, DATA_TYPE, DATA_LENGTH, NULLABLE, DATA_DEFAULT, DATA_PRECISION, DATA_SCALE
	my $sth = $self->{dbh}->prepare(<<END) or die $self->{dbh}->errstr;
SELECT COLUMN_NAME, DATA_TYPE, DECODE(DATA_TYPE, 'NCHAR',CHAR_LENGTH,'NVARCHAR2',CHAR_LENGTH,DATA_LENGTH) DATA_LENGTH,
       NULLABLE, DATA_DEFAULT, DATA_PRECISION, DATA_SCALE
FROM $self->{prefix}_TAB_COLUMNS
WHERE TABLE_NAME='$table' $owner
ORDER BY COLUMN_ID
END
	$sth->execute or die $self->{dbh}->errstr;
	my $data = $sth->fetchall_arrayref();
if ($self->{debug}) {
	foreach my $d (@$data) {
	$self->log_msg("\t$d->[0] => type:$d->[1] , length:$d->[2], precision:$d->[5], scale:$d->[6], nullable:$d->[3] , default:$d->[4]");
	}
}

	return @$data;	

}


=head2 _unique_key TABLE OWNER

This function implements a Oracle-native unique (including primary)
key column information.

Returns a hash of hashes in the following form:
    ( constraintname => (type => 'PRIMARY',
                         columns => ('a', 'b', 'c')),
      constraintname => (type => 'UNIQUE',
                         columns => ('b', 'c', 'd')),
      etc.
    )

=cut

sub _unique_key
{
	my($self, $table, $owner) = @_;

	my %result = ();
        my @accepted_constraint_types = ();
        push @accepted_constraint_types, "'P'" unless($self->{skip_pkeys});
        push @accepted_constraint_types, "'U'" unless($self->{skip_ukeys});
        return %result unless(@accepted_constraint_types);
        my $cons_types = '('. join(',', @accepted_constraint_types) .')';
	$owner = "AND OWNER='$owner'" if ($owner);
	my $sth = $self->{dbh}->prepare(<<END) or die $self->{dbh}->errstr;
SELECT CONSTRAINT_NAME,R_CONSTRAINT_NAME,SEARCH_CONDITION,DELETE_RULE,DEFERRABLE,DEFERRED,R_OWNER,CONSTRAINT_TYPE
FROM $self->{prefix}_CONSTRAINTS
WHERE CONSTRAINT_TYPE IN $cons_types
AND STATUS='ENABLED'
AND TABLE_NAME='$table' $owner
END
	$sth->execute or die $self->{dbh}->errstr;

	while (my $row = $sth->fetch) {
		my %constraint = (type => $row->[7], columns => ());
		my $sql = "SELECT DISTINCT COLUMN_NAME,POSITION FROM $self->{prefix}_CONS_COLUMNS WHERE CONSTRAINT_NAME='$row->[0]' $owner ORDER BY POSITION";
		my $sth2 = $self->{dbh}->prepare($sql) or die $self->{dbh}->errstr;
		$sth2->execute or die $sth2->errstr;
		while (my $r = $sth2->fetch) {
			push @{$constraint{'columns'}}, $r->[0];
		}
		$result{$row->[0]} = \%constraint;
	}

	return %result;
}

=head2 _check_constraint TABLE OWNER

This function implements a Oracle-native check constraint
information.

Return a hash of list of all column name defined as check constraint
for the given table and constraint name.

=cut

sub _check_constraint
{
	my($self, $table, $owner) = @_;

	$owner = "AND OWNER='$owner'" if ($owner);
	my $sth = $self->{dbh}->prepare(<<END) or die $self->{dbh}->errstr;
SELECT CONSTRAINT_NAME,R_CONSTRAINT_NAME,SEARCH_CONDITION,DELETE_RULE,DEFERRABLE,DEFERRED,R_OWNER
FROM $self->{prefix}_CONSTRAINTS
WHERE CONSTRAINT_TYPE='C'
AND STATUS='ENABLED'
AND GENERATED != 'GENERATED NAME'
AND TABLE_NAME='$table' $owner
END
	$sth->execute or die $self->{dbh}->errstr;

	my %data = ();
	while (my $row = $sth->fetch) {
		$data{$row->[0]} = $row->[2];
	}

	return %data;
}



=head2 _foreign_key TABLE OWNER

This function implements a Oracle-native foreign key reference
information.

Return a list of hash of hash of array reference. Ouuf! Nothing very difficult.
The first hash is composed of all foreign key name. The second hash just have
two key known as 'local' and remote' corresponding to the local table where the
foreign key is defined and the remote table where the key refer.

The foreign key name is composed as follow:

    'local_table_name->remote_table_name'

Foreign key data consist in two array representing at the same indice the local
field and the remote field where the first one refer to the second.
Just like this:

    @{$link{$fkey_name}{local}} = @local_columns;
    @{$link{$fkey_name}{remote}} = @remote_columns;

=cut

sub _foreign_key
{
	my ($self, $table, $owner) = @_;

	$owner = "AND OWNER='$owner'" if ($owner);
	my $deferrable = $self->{fkey_deferrable} ? "'DEFERRABLE' AS DEFERRABLE" : "DEFERRABLE";
	my $sth = $self->{dbh}->prepare(<<END) or die $self->{dbh}->errstr;
SELECT CONSTRAINT_NAME,R_CONSTRAINT_NAME,SEARCH_CONDITION,DELETE_RULE,$deferrable,DEFERRED,R_OWNER
FROM $self->{prefix}_CONSTRAINTS
WHERE CONSTRAINT_TYPE='R'
AND STATUS='ENABLED'
AND TABLE_NAME='$table' $owner
END
	$sth->execute or die $self->{dbh}->errstr;

	my @data = ();
	my %link = ();
	my @tab_done = ();
	while (my $row = $sth->fetch) {
		next if (grep(/^$row->[0]$/, @tab_done));
		push(@data, [ @$row ]);
		push(@tab_done, $row->[0]);
		my $sql = "SELECT DISTINCT COLUMN_NAME,POSITION FROM $self->{prefix}_CONS_COLUMNS WHERE CONSTRAINT_NAME='$row->[0]' $owner ORDER BY POSITION";
		my $sth2 = $self->{dbh}->prepare($sql) or die $self->{dbh}->errstr;
		$sth2->execute or die $sth2->errstr;
		my @done = ();
		while (my $r = $sth2->fetch) {
			if (!grep(/^$r->[0]$/, @done)) {
				push(@{$link{$row->[0]}{local}}, $r->[0]);
				push(@done, $r->[0]);
			}
		}
		$owner = "AND OWNER = '$row->[6]'" if ($owner);
		$sql = "SELECT DISTINCT TABLE_NAME,COLUMN_NAME,POSITION FROM $self->{prefix}_CONS_COLUMNS WHERE CONSTRAINT_NAME='$row->[1]' $owner ORDER BY POSITION";
		$sth2 = $self->{dbh}->prepare($sql) or die $self->{dbh}->errstr;
		$sth2->execute or die $sth2->errstr;
		@done = ();
		while (my $r = $sth2->fetch) {
			if (!grep(/^$r->[1]$/, @done)) {
				push(@{$link{$row->[0]}{remote}{$r->[0]}}, $r->[1]);
				push(@done, $r->[1]);
			}

		}
	}

	return \%link, \@data;
}


=head2 _get_users

This function implements a Oracle-native users information.

Return a hash of all users as an array.

=cut

sub _get_users
{
	my($self) = @_;

	# Retrieve all USERS defined in this database
	my $str = "SELECT USERNAME FROM DBA_USERS";
#	$str .= " WHERE USERNAME NOT IN ('SYS','SYSTEM','DBSNMP','OUTLN','PERFSTAT')";
	$str .= " ORDER BY USERNAME";
	my $sth = $self->{dbh}->prepare($str) or die $self->{dbh}->errstr;

	$sth->execute or die $self->{dbh}->errstr;
	my @users = ();
	while (my $row = $sth->fetch) {
		push(@users, $row->[0]);
	}

	return \@users;
}


=head2 _get_roles

This function implements a Oracle-native roles
information.

Return a hash of all groups (roles) as an array of associated users.

=cut

sub _get_roles
{
	my($self) = @_;

	# Retrieve all ROLES defined in this database
	my $str = "SELECT GRANTED_ROLE,GRANTEE FROM DBA_ROLE_PRIVS WHERE GRANTEE NOT IN (SELECT DISTINCT role FROM DBA_ROLES)";
	#$str .= " AND GRANTEE NOT IN ('SYS','SYSTEM','DBSNMP','OUTLN','PERFSTAT')";
	my $sth = $self->{dbh}->prepare($str) or die $self->{dbh}->errstr;

	$sth->execute or die $self->{dbh}->errstr;
	my %roles = ();
	while (my $row = $sth->fetch) {
		push(@{$roles{"$row->[0]"}}, $row->[1]);
	}

	return \%roles;
}

=head2 _get_all_roles

This function retrieve all Oracle roles information.

Return a hash of all roles as an array of associated users.

=cut

sub _get_all_roles
{
	my($self) = @_;

	# Retrieve all ROLES defined in this database
	my $str = "SELECT ROLE FROM DBA_ROLES WHERE ";
	if ($self->{schema}) {
		$str .= " ROLE='$self->{schema}";
	} else {
		$str .= " ROLE NOT IN ('SYS','SYSTEM','DBSNMP','OUTLN','PERFSTAT')";
	}
	$str .= " ORDER BY ROLE";
	my $sth = $self->{dbh}->prepare($str) or die $self->{dbh}->errstr;

	$sth->execute or die $self->{dbh}->errstr;
	my @roles = ();
	while (my $row = $sth->fetch) {
		push(@roles, $row->[0]);
	}
	$sth->finish();

	my %ROLES = ();

	# Get all user + roles + privilege granted to a role
	foreach my $r (@roles) {
		$str = "SELECT GRANTEE FROM DBA_ROLE_PRIVS WHERE GRANTED_ROLE = '$r' AND GRANTEE IN (SELECT USERNAME FROM DBA_USERS) AND GRANTEE NOT IN ('SYS','SYSTEM','DBSNMP','OUTLN','PERFSTAT')";
		$sth = $self->{dbh}->prepare($str) or die $self->{dbh}->errstr;
		$sth->execute or die $self->{dbh}->errstr;
		while (my $row = $sth->fetch) {
			push(@{$ROLES{$r}{users}}, $row->[0]);
		}
		$sth->finish();
		$str = "SELECT GRANTEE FROM DBA_ROLE_PRIVS WHERE GRANTED_ROLE = '$r' AND GRANTEE IN (SELECT ROLE FROM DBA_ROLES)";
		$sth = $self->{dbh}->prepare($str) or die $self->{dbh}->errstr;
		$sth->execute or die $self->{dbh}->errstr;
		while (my $row = $sth->fetch) {
			push(@{$ROLES{$r}{roles}}, $row->[0]);
		}
		$sth->finish();
		$str = "SELECT PRIVILEGE,ADMIN_OPTION FROM DBA_SYS_PRIVS WHERE GRANTEE = '$r' ORDER BY PRIVILEGE";
		$sth = $self->{dbh}->prepare($str) or die $self->{dbh}->errstr;
		$sth->execute or die $self->{dbh}->errstr;
		while (my $row = $sth->fetch) {
			push(@{$ROLES{$r}{privilege}}, $row->[0]);
			push(@{$ROLES{$r}{admin_option}}, $row->[1]);
		}
		$sth->finish();
		# Object privileges granted to this role
		$str = "SELECT PRIVILEGE,TABLE_NAME FROM DBA_TAB_PRIVS WHERE GRANTEE = '$r' ORDER BY GRANTOR, TABLE_NAME";
		$sth = $self->{dbh}->prepare($str) or die $self->{dbh}->errstr;
		$sth->execute or die $self->{dbh}->errstr;
		while (my $row = $sth->fetch) {
			push(@{$ROLES{$r}{table}{$row->[1]}}, $row->[0]);
		}
		$sth->finish();

	}
	return \%ROLES;
}



=head2 _get_all_grants

This function implements a Oracle-native user privilege
information.

Return a hash of all tables grants as an array of associated users.

=cut

sub _get_all_grants
{
	my($self) = @_;

	# Retrieve all ROLES defined in this database
	#my $schema_clause = $self->{schema} ?  "GRANTOR = '$self->{schema}'" : "GRANTEE NOT IN ('SYS','SYSTEM','DBSNMP','OUTLN','PERFSTAT')";
	my $schema_clause = $self->{schema} ?  "AND GRANTOR = '$self->{schema}'" : '';
	my $str = "SELECT p.table_name, p.privilege, NVL(u.username, 'GROUP '||r.role) ".
		"FROM $self->{prefix}_TAB_PRIVS p, DBA_USERS u, DBA_ROLES r ".
		"WHERE p.PRIVILEGE IN ('DELETE', 'INSERT', 'SELECT', 'UPDATE') ".
		"      AND u.USERNAME (+)= p.GRANTEE ".
		"      AND r.ROLE (+)= p.GRANTEE ".
		"      $schema_clause ".
		"ORDER BY p.TABLE_NAME";

	my $sth = $self->{dbh}->prepare($str) or die $self->{dbh}->errstr;

	$sth->execute or die $self->{dbh}->errstr;
	my %grants = ();
	while (my $row = $sth->fetch) {
		if ($row->[2] && ($row->[2] ne 'GROUP ')) {
			push(@{$grants{"$row->[0]"}{"$row->[1]"}}, $row->[2]);
		}
	}

	return \%grants;
}


=head2 _get_indexes TABLE OWNER

This function implements a Oracle-native indexes information.

Return hash of array containing all unique index and a hash of
array of all indexes name which are not primary keys for the
given table.

=cut

sub _get_indexes
{
	my ($self, $table, $owner) = @_;

	my $sub_owner = '';
	if ($owner) {
		$owner = "AND $self->{prefix}_INDEXES.OWNER='$owner' AND $self->{prefix}_IND_COLUMNS.INDEX_OWNER=$self->{prefix}_INDEXES.OWNER";
		$sub_owner = "AND OWNER=$self->{prefix}_INDEXES.TABLE_OWNER";
	}
	# Retrieve all indexes 
	my $sth = $self->{dbh}->prepare(<<END) or die $self->{dbh}->errstr;
SELECT DISTINCT $self->{prefix}_IND_COLUMNS.INDEX_NAME, $self->{prefix}_IND_COLUMNS.COLUMN_NAME, $self->{prefix}_INDEXES.UNIQUENESS
FROM $self->{prefix}_IND_COLUMNS, $self->{prefix}_INDEXES
WHERE $self->{prefix}_IND_COLUMNS.TABLE_NAME='$table' $owner
AND $self->{prefix}_INDEXES.INDEX_NAME=$self->{prefix}_IND_COLUMNS.INDEX_NAME
AND $self->{prefix}_IND_COLUMNS.INDEX_NAME NOT IN (SELECT CONSTRAINT_NAME FROM $self->{prefix}_CONSTRAINTS WHERE TABLE_NAME='$table' $sub_owner)
END
	$sth->execute or die $self->{dbh}->errstr;

	my %data = ();
	my %unique = ();
	while (my $row = $sth->fetch) {
		$unique{$row->[0]} = $row->[2];
		push(@{$data{$row->[0]}}, $row->[1]);
	}

	return \%unique, \%data;
}


=head2 _get_sequences

This function implements a Oracle-native sequences
information.

Return a hash of array of sequence name with MIN_VALUE, MAX_VALUE,
INCREMENT and LAST_NUMBER for the given table.

=cut

sub _get_sequences
{
	my($self) = @_;

	# Retrieve all indexes 
	my $str = "SELECT DISTINCT SEQUENCE_NAME, MIN_VALUE, MAX_VALUE, INCREMENT_BY, LAST_NUMBER, CACHE_SIZE, CYCLE_FLAG FROM $self->{prefix}_SEQUENCES";
	if (!$self->{schema}) {
		$str .= " WHERE SEQUENCE_OWNER NOT IN ('SYS','SYSTEM','DBSNMP','OUTLN','PERFSTAT')";
	} else {
		$str .= " WHERE SEQUENCE_OWNER = '$self->{schema}'";
	}
	my $sth = $self->{dbh}->prepare($str) or die $self->{dbh}->errstr;
	$sth->execute or die $self->{dbh}->errstr;

	my @seqs = ();
	while (my $row = $sth->fetch) {
		push(@seqs, [ @$row ]);
	}

	return \@seqs;
}


=head2 _get_views

This function implements a Oracle-native views information.

Return a hash of view name with the SQL query it is based on.

=cut

sub _get_views
{
	my($self) = @_;

	# Retrieve all views
	my $str = "SELECT VIEW_NAME,TEXT FROM $self->{prefix}_VIEWS";
	if (!$self->{schema}) {
		$str .= " WHERE OWNER NOT IN ('SYS','SYSTEM','DBSNMP','OUTLN','PERFSTAT')";
	} else {
		$str .= " WHERE OWNER = '$self->{schema}'";
	}
	my $sth = $self->{dbh}->prepare($str) or die $self->{dbh}->errstr;
	$sth->execute or die $self->{dbh}->errstr;

	my %data = ();
	while (my $row = $sth->fetch) {
		$data{$row->[0]} = $row->[1];
		@{$data{$row->[0]}{alias}} = $self->_alias_info ($row->[0]);
	}

	return %data;
}

=head2 _alias_info

This function implements a Oracle-native column information.

Return a list of array reference containing the following informations
for each alias of the given view

[(
  column name,
  column id
)]

=cut

sub _alias_info
{
        my ($self, $view) = @_;

        my $sth = $self->{dbh}->prepare(<<END) or die $self->{dbh}->errstr;
SELECT COLUMN_NAME, COLUMN_ID
FROM $self->{prefix}_TAB_COLUMNS
WHERE TABLE_NAME='$view'
END
        $sth->execute or die $self->{dbh}->errstr;
        my $data = $sth->fetchall_arrayref();
	if ($self->{debug}) {
        	foreach my $d (@$data) {
			$self->log_msg("\t$d->[0] =>  column id:$d->[1]", 1);
        	}
	}

        return @$data; 

}

=head2 _get_triggers

This function implements a Oracle-native triggers information.

Return an array of refarray of all triggers informations

=cut

sub _get_triggers
{
	my($self) = @_;

	# Retrieve all indexes 
	my $str = "SELECT TRIGGER_NAME, TRIGGER_TYPE, TRIGGERING_EVENT, TABLE_NAME, TRIGGER_BODY FROM $self->{prefix}_TRIGGERS WHERE STATUS='ENABLED'";
	if (!$self->{schema}) {
		$str .= " AND OWNER NOT IN ('SYS','SYSTEM','DBSNMP','OUTLN','PERFSTAT')";
	} else {
		$str .= " AND OWNER = '$self->{schema}'";
	}
	my $sth = $self->{dbh}->prepare($str) or die $self->{dbh}->errstr;
	$sth->execute or die $self->{dbh}->errstr;

	my @triggers = ();
	while (my $row = $sth->fetch) {
		push(@triggers, [ @$row ]);
	}

	return \@triggers;
}


=head2 _get_functions

This function implements a Oracle-native functions information.

Return a hash of all function name with their PLSQL code

=cut

sub _get_functions
{
	my($self, $type) = @_;

	# Retrieve all indexes 
	my $str = "SELECT DISTINCT OBJECT_NAME,OWNER FROM $self->{prefix}_OBJECTS WHERE OBJECT_TYPE='$type' AND STATUS='VALID'";
	if (!$self->{schema}) {
		$str .= " AND OWNER NOT IN ('SYS','SYSTEM','DBSNMP','OUTLN','PERFSTAT')";
	} else {
		$str .= " AND OWNER = '$self->{schema}'";
	}
	my $sth = $self->{dbh}->prepare($str) or die $self->{dbh}->errstr;
	$sth->execute or die $self->{dbh}->errstr;

	my %functions = ();
	my @fct_done = ();
	while (my $row = $sth->fetch) {
		next if (grep(/^$row->[0]$/, @fct_done));
		push(@fct_done, $row->[0]);
		my $sql = "SELECT TEXT FROM $self->{prefix}_SOURCE WHERE OWNER='$row->[1]' AND NAME='$row->[0]' ORDER BY LINE";
		my $sth2 = $self->{dbh}->prepare($sql) or die $self->{dbh}->errstr;
		$sth2->execute or die $sth2->errstr;
		while (my $r = $sth2->fetch) {
			$functions{"$row->[0]"} .= $r->[0];
		}
	}

	return \%functions;
}


=head2 _get_packages

This function implements a Oracle-native packages information.

Return a hash of all function name with their PLSQL code

=cut

sub _get_packages
{
	my ($self) = @_;

	# Retrieve all indexes 
	my $str = "SELECT DISTINCT OBJECT_NAME,OWNER FROM $self->{prefix}_OBJECTS WHERE OBJECT_TYPE='PACKAGE' AND STATUS='VALID'";
	if (!$self->{schema}) {
		$str .= " AND OWNER NOT IN ('SYS','SYSTEM','DBSNMP','OUTLN','PERFSTAT')";
	} else {
		$str .= " AND OWNER = '$self->{schema}'";
	}

	my $sth = $self->{dbh}->prepare($str) or die $self->{dbh}->errstr;
	$sth->execute or die $self->{dbh}->errstr;

	my %packages = ();
	my @fct_done = ();
	while (my $row = $sth->fetch) {
		$self->log_msg("\tFound Package: $row->[0]", 1);
		next if (grep(/^$row->[0]$/, @fct_done));
		push(@fct_done, $row->[0]);
		my $sql = "SELECT TEXT FROM $self->{prefix}_SOURCE WHERE OWNER='$row->[1]' AND NAME='$row->[0]' AND (TYPE='PACKAGE' OR TYPE='PACKAGE BODY') ORDER BY TYPE, LINE";
		my $sth2 = $self->{dbh}->prepare($sql) or die $self->{dbh}->errstr;
		$sth2->execute or die $sth2->errstr;
		while (my $r = $sth2->fetch) {
			$packages{"$row->[0]"} .= $r->[0];
		}
	}

	return \%packages;
}



=head2 _table_info

This function retrieve all Oracle-native tables information.

Return a handle to a DB query statement

=cut


sub _table_info
{
	my $self = shift;

	my $sql = "SELECT
                NULL            TABLE_CAT,
                at.OWNER        TABLE_SCHEM,
                at.TABLE_NAME,
                tc.TABLE_TYPE,
                tc.COMMENTS     REMARKS
            from ALL_TABLES at, ALL_TAB_COMMENTS tc
            where at.OWNER = tc.OWNER
            and at.TABLE_NAME = tc.TABLE_NAME
	";

	if ($self->{schema}) {
		$sql .= " and at.OWNER='$self->{schema}'";
	} else {
            $sql .= "AND at.OWNER NOT IN ('SYS','SYSTEM','DBSNMP','OUTLN','PERFSTAT')";
	}
        $sql .= " order by tc.TABLE_TYPE, at.OWNER, at.TABLE_NAME";
        my $sth = $self->{dbh}->prepare( $sql ) or return undef;
        $sth->execute or return undef;
        $sth;
}

sub escape
{
	my ($str, $data_type, $action) = @_;

	return $str if ($data_type !~ /(char|date|time|text)/);

	$str =~ s/\\/\\\\/gs;
	$str =~ s//\\r/gs;
	my $CTRLM=chr(13);
	$str =~ s/$CTRLM//gs;
	$str =~ s/\n/\\n/gs;
	$str =~ s/\t/\\t/gs;
	$str =~ s/\f/\\f/gs;
	$str =~ s/\0/\\0/gs;
	$str =~ s/([\1-\10])/sprintf("\\%03o", ord($1))/egs;
	$str =~ s/([\13-\14])/sprintf("\\%03o", ord($1))/egs;
	$str =~ s/([\16-\37])/sprintf("\\%03o", ord($1))/egs;
	

	return $str;
}

sub dump
{
	my ($self, $data) = @_;

	if ($self->{compress} eq 'Zlib') {
		$self->{zlib_hdl}->gzwrite($data) or die "error writing compressed data\n" ;;
	} else {
		if (defined $self->{fhout}) {
			$self->{fhout}->print($data);
		} else {
			print $data;
		}
	}

}

sub log_msg
{
	my ($self, $msg, $level) = @_;

	print STDERR "$msg\n" if ($self->{debug} >= $level);
}

=head2 _get_tablespaces

This function implements a Oracle-native tablespaces
information.

Return a hash of array of tablespace name with system filepath
for the given table.

=cut

sub _get_tablespaces
{
	my($self) = @_;

	# Retrieve all object with tablespaces.
my $str = qq{
SELECT a.SEGMENT_NAME,a.TABLESPACE_NAME,a.SEGMENT_TYPE,c.FILE_NAME
FROM DBA_SEGMENTS a,DBA_OBJECTS b, DBA_DATA_FILES c
WHERE a.SEGMENT_TYPE IN ('INDEX', 'TABLE')
AND a.SEGMENT_NAME = b.OBJECT_NAME
AND a.SEGMENT_TYPE = b.OBJECT_TYPE
AND a.OWNER = b.OWNER
AND a.TABLESPACE_NAME = c.TABLESPACE_NAME
};
	if ($self->{schema}) {
		$str .= " AND a.OWNER='$self->{schema}'";
	} else {
		$str .= " AND a.TABLESPACE_NAME NOT IN ('SYSTEM','TOOLS')";
	}
	my $sth = $self->{dbh}->prepare($str) or die $self->{dbh}->errstr;
	$sth->execute or die $self->{dbh}->errstr;

	my %tbs = ();
	while (my $row = $sth->fetch) {
		# TYPE - TABLESPACE_NAME - FILEPATH - OBJECT_NAME
		push(@{$tbs{$row->[2]}{$row->[1]}{$row->[3]}}, $row->[0]);
		print STDERR "." if ($self->{debug});
	}
	$sth->finish;
	$self->log_msg("", 1);

	return \%tbs;
}

=head2 _get_schema

This function return 1 if the requested schema is found in the
database else return 0

=cut

sub _get_schema
{
	my($self) = @_;

	# Retrieve all USERS defined in this database
	my $str = "SELECT USERNAME FROM DBA_USERS";
	$str .= " WHERE upper(USERNAME) = '\U$self->{schema}\E'";
	my $sth = $self->{dbh}->prepare($str) or die $self->{dbh}->errstr;

	$sth->execute or die $self->{dbh}->errstr;
	while (my $row = $sth->fetch) {
		$sth->finish;
		return 1;
	}

	return 0;
}

1;

__END__


=head1 AUTHOR

Gilles Darold <gilles@darold.net>


=head1 COPYRIGHT

Copyright (c) 2001-2004 Gilles Darold - All rights reserved.

This program is free software; you can redistribute it and/or modify it under
the same terms as Perl itself.


=head1 BUGS

This perl module is in the same state as my knowledge regarding database,
it can move and not be compatible with older version so I will do my best
to give you official support for Ora2Pg. Your volontee to help construct
it and your contribution are welcome.


=head1 SEE ALSO

L<DBI>, L<DBD::Oracle>, L<DBD::Pg>


=head1 ACKNOWLEDGEMENTS

The following person help a lot with reports and help:

	Jason Servetar
	Jean-Francois Ripouteau
	Octavi Fors
	Adriano Bonat
	Thomas Reiss

The following person help a lot with code review and bug fix:

	Stephane Schildknecht
	Jean-Paul Argudo
	Jan Kester
	Paolo Mattioli
	Mike Wilhelm-hiltz
	Jefferson Medeiros
	Ian Boston
	Thomas Wegner
	Andreas Haumer
	Marco Lombardo
	Adam Sah and Zedo Inc
	Antonios Christofide and National Technical University of Athens
	Josian Larcheveque
	Stephane Silly
	David Cotter - Alatto Technologies Ltd
	Wojciech Szenajch
	Richard Chen
	Sergio Freire
	Matt Miller
	Rene Bentzen
	Bernd Helmle.

My best regards to all of them.

=cut


