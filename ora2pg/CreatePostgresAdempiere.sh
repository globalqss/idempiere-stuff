:
#
# ADempiere contribution
# Author: Carlos Antonio Ruiz Gomez - globalqss
# Based on ora2pg - translates a database from Oracle to Postgres
#
# Tested on Linux Fedora Core 4
#
###########################################
# WARNING
# A postgresql adempiere database will be created or rewritten
# SQLJ must be properly installed previously
###########################################
#
# History:
# 2006-12-26 - CarlosRuiz - initial version
#
# Problems!!!
# - Attachments are lost
#
SCRIPTSDIR=scripts_312
export SQLJFILE=/home/adempiere/Adempiere/lib/sqlj.jar
export INSTALLSQLJ=/var/lib/pgsql/pljava/install.sql

if [ ! -s ${SQLJFILE} ]
then
    echo "Please configure the CreatePostgresAdempiere.sh to point to your SQLJ file"
    echo "from the Adempiere installation"
    exit 1
fi

if [ ! \( \
          \( -s output_tables.sql \) -a \
          \( -s output_sequences.sql \) -a \
          \( -s output_copy.sql \) -a \
          \( -s output_constraints.sql \) \
       \) ]
then
    echo "output files don't exist, you must run first Gen_Adempiere.sh"
    exit 1
fi

echo "Warning - and adempiere postgres database is going to be created"
echo -n "Press ENTER to continue "
read nothing

# Create adempiere database
createdb adempiere -E UNICODE -O adempiere -U adempiere

# Import schemas
psql -d adempiere -U adempiere < ${SCRIPTSDIR}/AdempiereSchemas.sql

# Import tables, sequences, data and constraints
psql -d adempiere -U adempiere << !
set client_encoding to 'LATIN1';
\i output_tables.sql
\i output_sequences.sql
\i output_copy.sql
\i output_constraints.sql
!

# Install SQLJ
psql -d adempiere -U adempiere < ${INSTALLSQLJ}

# Import sqlj
psql -d adempiere -U adempiere << !
SET search_path TO adempiere,sqlj;
select sqlj.install_jar('file://${SQLJFILE}','sqlj',true);
SELECT sqlj.set_classpath('adempiere', 'sqlj');
!

# Import functions, operators and views
psql -d adempiere -U adempiere < ${SCRIPTSDIR}/AdempiereFunctions.sql
psql -d adempiere -U adempiere < ${SCRIPTSDIR}/AdempiereOperators.sql
psql -d adempiere -U adempiere < ${SCRIPTSDIR}/AdempiereViews.sql
# Invoke AdempiereViews.sql twice to create views failed on first stage
psql -d adempiere -U adempiere < ${SCRIPTSDIR}/AdempiereViews.sql

exit 0
