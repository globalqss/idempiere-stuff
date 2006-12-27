Please read carefully the headers of Gen_Adempiere.sh and CreatePostgresAdempiere.sh files.

Quick process (for impatients):
- copy ora2pg.conf.template to ora2pg.conf
- configure ora2pg.conf properly according to your machine
- run Gen_Adempiere.sh
- edit CreatePostgresAdempiere.sh to point to your sqlj file
- run CreatePostgresAdempiere.sh (be careful, it creates or rewrite an adempiere database)
