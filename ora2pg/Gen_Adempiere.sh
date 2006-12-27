:
#
# ADempiere contribution
# Author: Carlos Antonio Ruiz Gomez - globalqss
# Based on ora2pg - translates a database from Oracle to Postgres
#
# Tested on Linux Fedora Core 4
#
###########################################
# Previous steps:
# you need to install postgresql-devel because of the 
# $ yum install postgresql-devel
# 
# you must install and configure some perl modules, when I played with this I had to install:
# $ cpan Module::Build
# $ cpan App::Info
# $ cpan DBD::Pg
# $ cpan DBD::Oracle
# 
# please read the READMES on every package about installation
#
# You need to configure the files ora2pg_copy.conf, ora2pg_sequences.conf, ora2pg_tables.conf
# for your installation, please review the keys:
# ORACLE_HOME	/usr/lib/oracle/xe/app/oracle/product/10.2.0/server  # on linux fc4
# ORACLE_DSN	dbi:Oracle:host=linuxqss;sid=xe
# ORACLE_USER	REFERENCE
# ORACLE_PWD	reference
# SCHEMA	REFERENCE
# and change them according to your machine and database
#
###########################################
#
# History:
# 2006-12-26 - CarlosRuiz - initial version
#
# Problems!!!
# - Attachments are lost
# - Probably foreign characters (i.e. japanese) can be lost
# This program migrates tables, sequences, data and constraints
# it doesn't migrate packages, functions, procedures, triggers, views
# it creates from the 312 seed operators, functions, views are created from the 312 seed
#   they are NOT MIGRATED from Oracle database
#

if [ ! -s ora2pg.conf ]
then
    echo "You need to configure the file ora2pg.conf"
    echo "for your installation, please review the keys:"
    echo "ORACLE_HOME, ORACLE_DSN, ORACLE_USER, ORACLE_PWD, SCHEMA"
    echo "Please copy and edit the template provided ora2pg.conf.template"
    exit 1
fi

# Launch the three processes
ora2pg.pl ora2pg_sequences.conf
ora2pg.pl ora2pg_copy.conf
ora2pg.pl ora2pg_tables.conf

# Leave on output_constraints just ALTER and CREATE ... INDEX
grep "ALTER TABLE
CREATE INDEX
CREATE UNIQUE INDEX" output_tables.sql > output_constraints.sql

grep -v "ALTER TABLE
CREATE INDEX
CREATE UNIQUE INDEX" output_tables.sql > /tmp/$$
mv /tmp/$$ output_tables.sql

# Cut all quotes from tables and constraints files
sed -e 's/"//g' output_tables.sql > /tmp/$$
mv /tmp/$$ output_tables.sql
sed -e 's/"//g' output_constraints.sql > /tmp/$$
mv /tmp/$$ output_constraints.sql
sed -e 's/"//g' output_sequences.sql > /tmp/$$
mv /tmp/$$ output_sequences.sql

# There are 2 limit columns and must be enclosed within quotes
sed -e 's/\blimit\b/"limit"/g' output_tables.sql > /tmp/$$
mv /tmp/$$ output_tables.sql

exit 0
