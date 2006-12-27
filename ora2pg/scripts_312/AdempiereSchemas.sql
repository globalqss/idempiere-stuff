--
-- Name: adempiere; Type: SCHEMA; Schema: -; Owner: adempiere
--

CREATE SCHEMA adempiere;


ALTER SCHEMA adempiere OWNER TO adempiere;

--
-- Name: SCHEMA public; Type: COMMENT; Schema: -; Owner: postgres
--

COMMENT ON SCHEMA public IS 'Standard public schema';


--
-- Name: sqlj; Type: SCHEMA; Schema: -; Owner: adempiere
--

CREATE SCHEMA sqlj;


ALTER SCHEMA sqlj OWNER TO adempiere;

SET search_path = sqlj, pg_catalog;
