#!/usr/bin/perl
#------------------------------------------------------------------------------
# Project  : Oracle to Postgresql converter
# Name     : ora2pg.pl
# Language : perl, v5.6.1
# OS       : linux RedHat 7.3 kernel 2.4.18-17.7.xsmp
# Author   : Gilles Darold, gilles@darold.net
# Copyright: Copyright (c) 2000-2004 : Gilles Darold - All rights reserved -
# Function : Script used to convert Oracle Database to PostgreSQL
# Usage    : ora2pg.pl conf_file
#------------------------------------------------------------------------------
# Version  : 2.1
#------------------------------------------------------------------------------
use strict;

use Ora2Pg;
use IO::File;

# Must have a configuration file as command line parameter
if ( ($#ARGV != 0) && !-f $ARGV[0]) {
	&usage();
}

my %Config = ();

# Read configuration file
&read_conf($ARGV[0]);

$ENV{ORACLE_HOME} = $Config{'ORACLE_HOME'} || '/usr/local/oracle/oracle816';

# Create an instance of the Ora2Pg perl module
my $schema = new Ora2Pg (
	datasource => $Config{'ORACLE_DSN'},
	user => $Config{'ORACLE_USER'},
	password => $Config{'ORACLE_PWD'},
	debug => $Config{'DEBUG'} || 0,
	export_schema => $Config{'EXPORT_SCHEMA'} || 0,
	schema => $Config{'SCHEMA'} || '',
	type => $Config{'TYPE'} || 'TABLE',
	#tables => \@{$Config{'TABLES'}},
	tables => $Config{'TABLES'},
	exclude => $Config{'EXCLUDE'},
	showtableid => $Config{'SHOWTABLEID'} || 0,
	min => $Config{'MIN'} || 0,
	max => $Config{'MAX'} || 0,
	data_limit => $Config{'DATA_LIMIT'} || 0,
	case_sensitive => $Config{'CASE_SENSITIVE'} || 0,
	skip_fkeys => $Config{'skip_fkeys'} || 0,
	skip_pkeys => $Config{'skip_pkeys'} || 0,
	skip_ukeys => $Config{'skip_ukeys'} || 0,
	skip_indices => $Config{'skip_indices'} || 0,
	skip_checks => $Config{'skip_checks'} || 0,
	bzip2 => $Config{'bzip2'} || '/usr/bin/bzip2',
	user_grants => $Config{'USER_GRANTS'} || 0,
	gen_user_pwd => $Config{'GEN_USER_PWD'} || 0,
	fkey_deferrable => $Config{'FKEY_DEFERRABLE'} || 0,
	defer_fkey => $Config{'DEFER_FKEY'} || 0,
	pg_numeric_type => $Config{'PG_NUMERIC_TYPE'} || 0,
	default_numeric => $Config{'DEFAULT_NUMERIC'} || 'float',
	keep_pkeys_name => $Config{'keep_pkeys_name'} || 0,
	pg_supports_inout => $Config{'PG_SUPPORTS_INOUT'} || 0,
	pg_supports_role => $Config{'PG_SUPPORTS_ROLE'} || 0,
        disable_triggers => $Config{'DISABLE_TABLE_TRIGGERS'} || 0,
);

exit 0 if ($Config{'SHOWTABLEID'});

# Mofify export structure if required
if ($Config{'TYPE'} =~ /^(DATA|COPY)$/) {
	for my $t (keys %{$Config{'MODIFY_STRUCT'}}) {
		$schema->modify_struct($t, @{$Config{'MODIFY_STRUCT'}{$t}});
	}
	$schema->replace_tables(%{$Config{'REPLACE_TABLES'}});
	$schema->replace_cols(%{$Config{'REPLACE_COLS'}});
	$schema->set_where_clause($Config{"GLOBAL_WHERE"}, %{$Config{'WHERE'}});
}

# Send exported data directly to a PostgreSQL database
if ($Config{'PG_DSN'}) {
	$schema->send_to_pgdb($Config{'PG_DSN'}, $Config{'PG_USER'}, $Config{'PG_PWD'});
}

# Output the data extracted from Oracle DB to a file or to STDOUT if no argument.
if ($Config{'TYPE'} =~ /^(DATA|COPY)$/) {
	$schema->export_data($Config{'OUTPUT'});
} else {
	# Function to use for extraction of other type
	$schema->export_schema($Config{'OUTPUT'});
}

exit(0);


sub usage
{
	print qq{
Usage: ora2pg.pl conf_file

};
	exit 0;

}

sub read_conf
{
	my ($file) = @_;

	my $fh = new IO::File;
	$fh->open($file) or die "Error: can't read configuration file $file, $!\n";
	while (my $l = <$fh>) {
		chomp($l);
		$l =~ s///gs;
		$l =~ s/\#.*$//g;
		next if (!$l || ($l =~ /^[\s\t]+$/));
		$l =~ s/^\s*//; $l =~ s/\s*$//;
		my ($var, $val) = split(/[\s\t]+/, $l, 2);
                if (uc($var) eq "IMPORT") {
			if ($val) {
				print STDERR "Importing $val...\n";
				&read_conf($val);
				print STDERR "Done importing $val.\n";
			}
		} elsif ($var =~ /^SKIP/i) {
			if ($val) {
				print STDERR "No extraction of \L$val\E\n";
				my @skip = split(/[\s\t,]+/, $val);
				foreach (@skip) {
					$Config{"skip_\L$_\E"} = 1;
				}
			}
		} elsif (!grep(/^$var$/i, 'TABLES', 'MODIFY_STRUCT', 'REPLACE_TABLES', 'REPLACE_COLS', 'WHERE', 'EXCLUDE')) {
			$Config{"\U$var\E"} = $val;
		} elsif ( (uc($var) eq 'TABLES') || (uc($var) eq 'EXCLUDE') ) {
			push(@{$Config{"\U$var\E"}}, split(/\s+/, $val) );
		} elsif (uc($var) eq 'MODIFY_STRUCT') {
			while ($val =~ s/([^\(\s\t]+)[\t\s]*\(([^\)]+)\)[\t\s]*//) {
				my $table = $1;
				my $fields = $2;
				$fields =~ s/^\s+//;
				$fields =~ s/\s+$//;
				push(@{$Config{"\U$var\E"}{$table}}, split(/[\s,]+/, $fields) );
			}
		} elsif (uc($var) eq 'REPLACE_COLS') {
			while ($val =~ s/([^\(\s\t]+)\s*\(([^\)]+)\)\s*//) {
				my $table = $1;
				my $fields = $2;
				$fields =~ s/^\s+//;
				$fields =~ s/\s+$//;
				my @rel = split(/[\t\s,]+/, $fields);
				foreach my $r (@rel) {
					my ($old, $new) = split(/:/, $r);
					$Config{"\U$var\E"}{$table}{$old} = $new;
				}
			}
		} elsif (uc($var) eq 'REPLACE_TABLES') {
			my @replace_tables = split(/[\s\t]+/, $val);
			foreach my $r (@replace_tables) { 
				my ($old, $new) = split(/:/, $r);
				$Config{"\U$var\E"}{$old} = $new;
			}
		} elsif (uc($var) eq 'WHERE') {
			while ($val =~ s/([^\[\s\t]+)[\t\s]*\[([^\]]+)\][\s\t]*//) {
				my $table = $1;
				my $where = $2;
				$where =~ s/^\s+//;
				$where =~ s/\s+$//;
				$Config{"\U$var\E"}{$table} = $where;
			}
			if ($val) {
				$Config{"GLOBAL_WHERE"} = $val;
			}
		}
	}
	$fh->close();
}
