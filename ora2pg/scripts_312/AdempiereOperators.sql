--
-- Name: +; Type: OPERATOR; Schema: adempiere; Owner: postgres
--

CREATE OPERATOR + (
    PROCEDURE = adddays,
    LEFTARG = timestamp with time zone,
    RIGHTARG = integer,
    COMMUTATOR = OPERATOR(public.+)
);


ALTER OPERATOR adempiere.+ (timestamp with time zone, integer) OWNER TO postgres;

--
-- Name: -; Type: OPERATOR; Schema: adempiere; Owner: postgres
--

CREATE OPERATOR - (
    PROCEDURE = subtractdays,
    LEFTARG = timestamp with time zone,
    RIGHTARG = integer,
    COMMUTATOR = OPERATOR(public.-)
);


ALTER OPERATOR adempiere.- (timestamp with time zone, integer) OWNER TO postgres;
