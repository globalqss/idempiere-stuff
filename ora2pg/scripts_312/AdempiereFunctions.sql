--
-- Name: java_call_handler(); Type: FUNCTION; Schema: sqlj; Owner: adempiere
--

CREATE FUNCTION java_call_handler() RETURNS language_handler
    AS 'pljava', 'java_call_handler'
    LANGUAGE c;


ALTER FUNCTION sqlj.java_call_handler() OWNER TO adempiere;

--
-- Name: java; Type: PROCEDURAL LANGUAGE; Schema: sqlj; Owner: postgres
--

CREATE TRUSTED PROCEDURAL LANGUAGE java HANDLER java_call_handler;


--
-- Name: javau_call_handler(); Type: FUNCTION; Schema: sqlj; Owner: adempiere
--

CREATE FUNCTION javau_call_handler() RETURNS language_handler
    AS 'pljava', 'javau_call_handler'
    LANGUAGE c;


ALTER FUNCTION sqlj.javau_call_handler() OWNER TO adempiere;

--
-- Name: javau; Type: PROCEDURAL LANGUAGE; Schema: sqlj; Owner: postgres
--

CREATE PROCEDURAL LANGUAGE javau HANDLER javau_call_handler;


--
-- Name: plpgsql; Type: PROCEDURAL LANGUAGE; Schema: -; Owner: postgres
--

CREATE PROCEDURAL LANGUAGE plpgsql;


SET search_path = adempiere, pg_catalog;

--
-- Name: acctbalance(integer, numeric, numeric); Type: FUNCTION; Schema: adempiere; Owner: adempiere
--

CREATE FUNCTION acctbalance(p_account_id integer, p_amtdr numeric, p_amtcr numeric) RETURNS numeric
    AS $$org.compiere.sqlj.Account.balance(int,java.math.BigDecimal,java.math.BigDecimal)$$
    LANGUAGE java;


ALTER FUNCTION adempiere.acctbalance(p_account_id integer, p_amtdr numeric, p_amtcr numeric) OWNER TO adempiere;

--
-- Name: adddays(timestamp with time zone, integer); Type: FUNCTION; Schema: adempiere; Owner: adempiere
--

CREATE FUNCTION adddays("day" timestamp with time zone, days integer) RETURNS timestamp with time zone
    AS $$
BEGIN
    RETURN adempiere.addDays(day,Idays);
END;
$$
    LANGUAGE plpgsql;


ALTER FUNCTION adempiere.adddays("day" timestamp with time zone, days integer) OWNER TO adempiere;

--
-- Name: adddays(timestamp with time zone, numeric); Type: FUNCTION; Schema: adempiere; Owner: postgres
--

CREATE FUNCTION adddays("day" timestamp with time zone, days numeric) RETURNS timestamp with time zone
    AS $$
BEGIN
    RETURN adempiere.addDays(day,adempiere.ID(days));
END;
$$
    LANGUAGE plpgsql;


ALTER FUNCTION adempiere.adddays("day" timestamp with time zone, days numeric) OWNER TO postgres;

--
-- Name: adempiereproperties(); Type: FUNCTION; Schema: adempiere; Owner: adempiere
--

CREATE FUNCTION adempiereproperties() RETURNS character varying
    AS $$org.compiere.sqlj.Adempiere.getProperties()$$
    LANGUAGE java;


ALTER FUNCTION adempiere.adempiereproperties() OWNER TO adempiere;

--
-- Name: adempiereproperty(character varying); Type: FUNCTION; Schema: adempiere; Owner: adempiere
--

CREATE FUNCTION adempiereproperty(p_key character varying) RETURNS character varying
    AS $$org.compiere.sqlj.Adempiere.getProperty(java.lang.String)$$
    LANGUAGE java;


ALTER FUNCTION adempiere.adempiereproperty(p_key character varying) OWNER TO adempiere;

--
-- Name: adempiereversion(); Type: FUNCTION; Schema: adempiere; Owner: adempiere
--

CREATE FUNCTION adempiereversion() RETURNS character varying
    AS $$org.compiere.sqlj.Adempiere.getVersion()$$
    LANGUAGE java;


ALTER FUNCTION adempiere.adempiereversion() OWNER TO adempiere;

--
-- Name: bompricelimit(integer, integer); Type: FUNCTION; Schema: adempiere; Owner: adempiere
--

CREATE FUNCTION bompricelimit(m_product_id integer, m_pricelist_version_id integer) RETURNS numeric
    AS $$org.compiere.sqlj.Product.bomPriceLimit(int,int)$$
    LANGUAGE java;


ALTER FUNCTION adempiere.bompricelimit(m_product_id integer, m_pricelist_version_id integer) OWNER TO adempiere;

--
-- Name: bompricelist(integer, integer); Type: FUNCTION; Schema: adempiere; Owner: adempiere
--

CREATE FUNCTION bompricelist(m_product_id integer, m_pricelist_version_id integer) RETURNS numeric
    AS $$org.compiere.sqlj.Product.bomPriceList(int,int)$$
    LANGUAGE java;


ALTER FUNCTION adempiere.bompricelist(m_product_id integer, m_pricelist_version_id integer) OWNER TO adempiere;

--
-- Name: bompricestd(integer, integer); Type: FUNCTION; Schema: adempiere; Owner: adempiere
--

CREATE FUNCTION bompricestd(m_product_id integer, m_pricelist_version_id integer) RETURNS numeric
    AS $$org.compiere.sqlj.Product.bomPriceStd(int,int)$$
    LANGUAGE java;


ALTER FUNCTION adempiere.bompricestd(m_product_id integer, m_pricelist_version_id integer) OWNER TO adempiere;

--
-- Name: bomqtyavailable(integer, integer, integer); Type: FUNCTION; Schema: adempiere; Owner: adempiere
--

CREATE FUNCTION bomqtyavailable(m_product_id integer, m_warehouse_id integer, m_locator_id integer) RETURNS numeric
    AS $$org.compiere.sqlj.Product.bomQtyAvailable(int,int,int)$$
    LANGUAGE java;


ALTER FUNCTION adempiere.bomqtyavailable(m_product_id integer, m_warehouse_id integer, m_locator_id integer) OWNER TO adempiere;

--
-- Name: bomqtyavailable(integer, integer, integer, integer); Type: FUNCTION; Schema: adempiere; Owner: adempiere
--

CREATE FUNCTION bomqtyavailable(m_product_id integer, m_attributesetinstance_id integer, m_warehouse_id integer, m_locator_id integer) RETURNS numeric
    AS $$org.compiere.sqlj.Product.bomQtyAvailable(int,int,int,int)$$
    LANGUAGE java;


ALTER FUNCTION adempiere.bomqtyavailable(m_product_id integer, m_attributesetinstance_id integer, m_warehouse_id integer, m_locator_id integer) OWNER TO adempiere;

--
-- Name: bomqtyonhand(integer, integer, integer); Type: FUNCTION; Schema: adempiere; Owner: adempiere
--

CREATE FUNCTION bomqtyonhand(m_product_id integer, m_warehouse_id integer, m_locator_id integer) RETURNS numeric
    AS $$org.compiere.sqlj.Product.bomQtyOnHand(int,int,int)$$
    LANGUAGE java;


ALTER FUNCTION adempiere.bomqtyonhand(m_product_id integer, m_warehouse_id integer, m_locator_id integer) OWNER TO adempiere;

--
-- Name: bomqtyonhand(integer, integer, integer, integer); Type: FUNCTION; Schema: adempiere; Owner: adempiere
--

CREATE FUNCTION bomqtyonhand(m_product_id integer, m_attributesetinstance_id integer, m_warehouse_id integer, m_locator_id integer) RETURNS numeric
    AS $$org.compiere.sqlj.Product.bomQtyOnHand(int,int,int,int)$$
    LANGUAGE java;


ALTER FUNCTION adempiere.bomqtyonhand(m_product_id integer, m_attributesetinstance_id integer, m_warehouse_id integer, m_locator_id integer) OWNER TO adempiere;

--
-- Name: bomqtyordered(integer, integer, integer); Type: FUNCTION; Schema: adempiere; Owner: adempiere
--

CREATE FUNCTION bomqtyordered(m_product_id integer, m_warehouse_id integer, m_locator_id integer) RETURNS numeric
    AS $$org.compiere.sqlj.Product.bomQtyOrdered(int,int,int)$$
    LANGUAGE java;


ALTER FUNCTION adempiere.bomqtyordered(m_product_id integer, m_warehouse_id integer, m_locator_id integer) OWNER TO adempiere;

--
-- Name: bomqtyordered(integer, integer, integer, integer); Type: FUNCTION; Schema: adempiere; Owner: adempiere
--

CREATE FUNCTION bomqtyordered(m_product_id integer, m_attributesetinstance_id integer, m_warehouse_id integer, m_locator_id integer) RETURNS numeric
    AS $$org.compiere.sqlj.Product.bomQtyOrdered(int,int,int,int)$$
    LANGUAGE java;


ALTER FUNCTION adempiere.bomqtyordered(m_product_id integer, m_attributesetinstance_id integer, m_warehouse_id integer, m_locator_id integer) OWNER TO adempiere;

--
-- Name: bomqtyreserved(integer, integer, integer); Type: FUNCTION; Schema: adempiere; Owner: adempiere
--

CREATE FUNCTION bomqtyreserved(m_product_id integer, m_warehouse_id integer, m_locator_id integer) RETURNS numeric
    AS $$org.compiere.sqlj.Product.bomQtyReserved(int,int,int)$$
    LANGUAGE java;


ALTER FUNCTION adempiere.bomqtyreserved(m_product_id integer, m_warehouse_id integer, m_locator_id integer) OWNER TO adempiere;

--
-- Name: bomqtyreserved(integer, integer, integer, integer); Type: FUNCTION; Schema: adempiere; Owner: adempiere
--

CREATE FUNCTION bomqtyreserved(m_product_id integer, m_attributesetinstance_id integer, m_warehouse_id integer, m_locator_id integer) RETURNS numeric
    AS $$org.compiere.sqlj.Product.bomQtyReserved(int,int,int,int)$$
    LANGUAGE java;


ALTER FUNCTION adempiere.bomqtyreserved(m_product_id integer, m_attributesetinstance_id integer, m_warehouse_id integer, m_locator_id integer) OWNER TO adempiere;

--
-- Name: bpartnerremitlocation(integer); Type: FUNCTION; Schema: adempiere; Owner: adempiere
--

CREATE FUNCTION bpartnerremitlocation(p_c_bpartner_id integer) RETURNS integer
    AS $$org.compiere.sqlj.BPartner.remitLocation(int)$$
    LANGUAGE java;


ALTER FUNCTION adempiere.bpartnerremitlocation(p_c_bpartner_id integer) OWNER TO adempiere;

--
-- Name: charat(character varying, integer); Type: FUNCTION; Schema: adempiere; Owner: adempiere
--

CREATE FUNCTION charat(source character varying, pos integer) RETURNS character varying
    AS $$org.compiere.sqlj.Adempiere.charAt (java.lang.String,int)$$
    LANGUAGE java;


ALTER FUNCTION adempiere.charat(source character varying, pos integer) OWNER TO adempiere;

--
-- Name: currencybase(numeric, integer, timestamp with time zone, integer, integer); Type: FUNCTION; Schema: adempiere; Owner: adempiere
--

CREATE FUNCTION currencybase(amount numeric, c_currencyfrom_id integer, conversiondate timestamp with time zone, ad_client_id integer, ad_org_id integer) RETURNS numeric
    AS $$org.compiere.sqlj.Currency.base(java.math.BigDecimal,int,java.sql.Timestamp,int,int)$$
    LANGUAGE java;


ALTER FUNCTION adempiere.currencybase(amount numeric, c_currencyfrom_id integer, conversiondate timestamp with time zone, ad_client_id integer, ad_org_id integer) OWNER TO adempiere;

--
-- Name: currencyconvert(numeric, integer, integer, timestamp with time zone, integer, integer, integer); Type: FUNCTION; Schema: adempiere; Owner: adempiere
--

CREATE FUNCTION currencyconvert(amount numeric, c_currencyfrom_id integer, c_currencyto_id integer, conversiondate timestamp with time zone, c_conversiontype_id integer, ad_client_id integer, ad_org_id integer) RETURNS numeric
    AS $$org.compiere.sqlj.Currency.convert(java.math.BigDecimal,int,int,java.sql.Timestamp,int,int,int)$$
    LANGUAGE java;


ALTER FUNCTION adempiere.currencyconvert(amount numeric, c_currencyfrom_id integer, c_currencyto_id integer, conversiondate timestamp with time zone, c_conversiontype_id integer, ad_client_id integer, ad_org_id integer) OWNER TO adempiere;

--
-- Name: currencyrate(integer, integer, timestamp with time zone, integer, integer, integer); Type: FUNCTION; Schema: adempiere; Owner: adempiere
--

CREATE FUNCTION currencyrate(c_currencyfrom_id integer, c_currencyto_id integer, conversiondate timestamp with time zone, c_conversiontype_id integer, ad_client_id integer, ad_org_id integer) RETURNS numeric
    AS $$org.compiere.sqlj.Currency.rate(int,int,java.sql.Timestamp,int,int,int)$$
    LANGUAGE java;


ALTER FUNCTION adempiere.currencyrate(c_currencyfrom_id integer, c_currencyto_id integer, conversiondate timestamp with time zone, c_conversiontype_id integer, ad_client_id integer, ad_org_id integer) OWNER TO adempiere;

--
-- Name: daysbetween(timestamp with time zone, timestamp with time zone); Type: FUNCTION; Schema: adempiere; Owner: adempiere
--

CREATE FUNCTION daysbetween(datetime1 timestamp with time zone, datetime2 timestamp with time zone) RETURNS integer
    AS $$org.compiere.sqlj.Adempiere.getDaysBetween(java.sql.Timestamp,java.sql.Timestamp)$$
    LANGUAGE java;


ALTER FUNCTION adempiere.daysbetween(datetime1 timestamp with time zone, datetime2 timestamp with time zone) OWNER TO adempiere;

--
-- Name: documentno(integer); Type: FUNCTION; Schema: adempiere; Owner: adempiere
--

CREATE FUNCTION documentno(p_mpc_mrp_id integer) RETURNS character varying
    AS $$org.compiere.sqlj.Manufacturing.documentNo(int)$$
    LANGUAGE java;


ALTER FUNCTION adempiere.documentno(p_mpc_mrp_id integer) OWNER TO adempiere;

--
-- Name: firstof(timestamp with time zone, character varying); Type: FUNCTION; Schema: adempiere; Owner: adempiere
--

CREATE FUNCTION firstof(datetime timestamp with time zone, xx character varying) RETURNS timestamp with time zone
    AS $$org.compiere.sqlj.Adempiere.firstOf(java.sql.Timestamp,java.lang.String)$$
    LANGUAGE java;


ALTER FUNCTION adempiere.firstof(datetime timestamp with time zone, xx character varying) OWNER TO adempiere;

--
-- Name: getdate(); Type: FUNCTION; Schema: adempiere; Owner: postgres
--

CREATE FUNCTION getdate() RETURNS timestamp with time zone
    AS $$
BEGIN
    RETURN now();
END;
$$
    LANGUAGE plpgsql;


ALTER FUNCTION adempiere.getdate() OWNER TO postgres;

--
-- Name: id(numeric); Type: FUNCTION; Schema: adempiere; Owner: postgres
--

CREATE FUNCTION id(record numeric) RETURNS integer
    AS $$
DECLARE 
ID integer := 0;
BEGIN
    ID := CAST(record AS INTEGER);
    --RAISE NOTICE 'Quantity here is %', ID;
    RETURN ID;
END;
$$
    LANGUAGE plpgsql;


ALTER FUNCTION adempiere.id(record numeric) OWNER TO postgres;

--
-- Name: invoicediscount(integer, timestamp with time zone, integer); Type: FUNCTION; Schema: adempiere; Owner: adempiere
--

CREATE FUNCTION invoicediscount(p_c_invoice_id integer, p_paydate timestamp with time zone, p_c_invoicepayschedule_id integer) RETURNS numeric
    AS $$org.compiere.sqlj.Invoice.discount(int,java.sql.Timestamp,int)$$
    LANGUAGE java;


ALTER FUNCTION adempiere.invoicediscount(p_c_invoice_id integer, p_paydate timestamp with time zone, p_c_invoicepayschedule_id integer) OWNER TO adempiere;

--
-- Name: invoiceopen(integer, integer); Type: FUNCTION; Schema: adempiere; Owner: adempiere
--

CREATE FUNCTION invoiceopen(p_c_invoice_id integer, p_c_invoicepayschedule_id integer) RETURNS numeric
    AS $$org.compiere.sqlj.Invoice.open(int,int)$$
    LANGUAGE java;


ALTER FUNCTION adempiere.invoiceopen(p_c_invoice_id integer, p_c_invoicepayschedule_id integer) OWNER TO adempiere;

--
-- Name: invoicepaid(integer, integer, integer); Type: FUNCTION; Schema: adempiere; Owner: adempiere
--

CREATE FUNCTION invoicepaid(p_c_invoice_id integer, p_c_currency_id integer, p_multiplierap integer) RETURNS numeric
    AS $$org.compiere.sqlj.Invoice.paid(int,int,int)$$
    LANGUAGE java;


ALTER FUNCTION adempiere.invoicepaid(p_c_invoice_id integer, p_c_currency_id integer, p_multiplierap integer) OWNER TO adempiere;

--
-- Name: nextid(integer, character varying); Type: FUNCTION; Schema: adempiere; Owner: adempiere
--

CREATE FUNCTION nextid(ad_sequence_id integer, "system" character varying) RETURNS integer
    AS $$org.compiere.sqlj.Adempiere.nextID(int,java.lang.String)$$
    LANGUAGE java;


ALTER FUNCTION adempiere.nextid(ad_sequence_id integer, "system" character varying) OWNER TO adempiere;

--
-- Name: paymentallocated(integer, integer); Type: FUNCTION; Schema: adempiere; Owner: adempiere
--

CREATE FUNCTION paymentallocated(p_c_payment_id integer, p_c_currency_id integer) RETURNS numeric
    AS $$org.compiere.sqlj.Payment.allocated(int,int)$$
    LANGUAGE java;


ALTER FUNCTION adempiere.paymentallocated(p_c_payment_id integer, p_c_currency_id integer) OWNER TO adempiere;

--
-- Name: paymentavailable(integer); Type: FUNCTION; Schema: adempiere; Owner: adempiere
--

CREATE FUNCTION paymentavailable(p_c_payment_id integer) RETURNS numeric
    AS $$org.compiere.sqlj.Payment.available(int)$$
    LANGUAGE java;


ALTER FUNCTION adempiere.paymentavailable(p_c_payment_id integer) OWNER TO adempiere;

--
-- Name: paymenttermdiscount(numeric, integer, timestamp with time zone, timestamp with time zone); Type: FUNCTION; Schema: adempiere; Owner: adempiere
--

CREATE FUNCTION paymenttermdiscount(p_amount numeric, p_c_paymentterm_id integer, p_docdate timestamp with time zone, p_paydate timestamp with time zone) RETURNS numeric
    AS $$org.compiere.sqlj.PaymentTerm.discount(java.math.BigDecimal,int,java.sql.Timestamp,java.sql.Timestamp)$$
    LANGUAGE java;


ALTER FUNCTION adempiere.paymenttermdiscount(p_amount numeric, p_c_paymentterm_id integer, p_docdate timestamp with time zone, p_paydate timestamp with time zone) OWNER TO adempiere;

--
-- Name: paymenttermduedate(integer, timestamp with time zone); Type: FUNCTION; Schema: adempiere; Owner: adempiere
--

CREATE FUNCTION paymenttermduedate(p_c_paymentterm_id integer, p_docdate timestamp with time zone) RETURNS timestamp with time zone
    AS $$org.compiere.sqlj.PaymentTerm.dueDate(int,java.sql.Timestamp)$$
    LANGUAGE java;


ALTER FUNCTION adempiere.paymenttermduedate(p_c_paymentterm_id integer, p_docdate timestamp with time zone) OWNER TO adempiere;

--
-- Name: paymenttermduedays(integer, timestamp with time zone, timestamp with time zone); Type: FUNCTION; Schema: adempiere; Owner: adempiere
--

CREATE FUNCTION paymenttermduedays(p_c_paymentterm_id integer, p_docdate timestamp with time zone, p_paydate timestamp with time zone) RETURNS integer
    AS $$org.compiere.sqlj.PaymentTerm.dueDays(int,java.sql.Timestamp,java.sql.Timestamp)$$
    LANGUAGE java;


ALTER FUNCTION adempiere.paymenttermduedays(p_c_paymentterm_id integer, p_docdate timestamp with time zone, p_paydate timestamp with time zone) OWNER TO adempiere;

--
-- Name: productattribute(integer); Type: FUNCTION; Schema: adempiere; Owner: adempiere
--

CREATE FUNCTION productattribute(m_attributesetinstance_id integer) RETURNS character varying
    AS $$org.compiere.sqlj.Product.attributeName(int)$$
    LANGUAGE java;


ALTER FUNCTION adempiere.productattribute(m_attributesetinstance_id integer) OWNER TO adempiere;

--
-- Name: subtractdays(timestamp with time zone, numeric); Type: FUNCTION; Schema: adempiere; Owner: postgres
--

CREATE FUNCTION subtractdays("day" timestamp with time zone, days numeric) RETURNS timestamp with time zone
    AS $$
BEGIN
    RETURN adempiere.addDays(day,adempiere.ID(days * -1));
END;
$$
    LANGUAGE plpgsql;


ALTER FUNCTION adempiere.subtractdays("day" timestamp with time zone, days numeric) OWNER TO postgres;

--
-- Name: subtractdays(timestamp with time zone, integer); Type: FUNCTION; Schema: adempiere; Owner: postgres
--

CREATE FUNCTION subtractdays("day" timestamp with time zone, days integer) RETURNS timestamp with time zone
    AS $$
BEGIN
    RETURN adempiere.addDays(day,days * -1);
END;
$$
    LANGUAGE plpgsql;


ALTER FUNCTION adempiere.subtractdays("day" timestamp with time zone, days integer) OWNER TO postgres;

--
-- Name: trunc(timestamp with time zone); Type: FUNCTION; Schema: adempiere; Owner: adempiere
--

CREATE FUNCTION trunc(datetime timestamp with time zone) RETURNS timestamp with time zone
    AS $$org.compiere.sqlj.Adempiere.trunc(java.sql.Timestamp)$$
    LANGUAGE java;


ALTER FUNCTION adempiere.trunc(datetime timestamp with time zone) OWNER TO adempiere;

SET search_path = public, pg_catalog;

--
-- Name: plpgsql_call_handler(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION plpgsql_call_handler() RETURNS language_handler
    AS '$libdir/plpgsql', 'plpgsql_call_handler'
    LANGUAGE c;


ALTER FUNCTION public.plpgsql_call_handler() OWNER TO postgres;

--
-- Name: plpgsql_validator(oid); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION plpgsql_validator(oid) RETURNS void
    AS '$libdir/plpgsql', 'plpgsql_validator'
    LANGUAGE c;


ALTER FUNCTION public.plpgsql_validator(oid) OWNER TO postgres;

SET search_path = sqlj, pg_catalog;

--
-- Name: add_type_mapping(character varying, character varying); Type: FUNCTION; Schema: sqlj; Owner: adempiere
--

CREATE FUNCTION add_type_mapping(character varying, character varying) RETURNS void
    AS $$org.postgresql.pljava.management.Commands.addTypeMapping$$
    LANGUAGE java SECURITY DEFINER;


ALTER FUNCTION sqlj.add_type_mapping(character varying, character varying) OWNER TO adempiere;

--
-- Name: drop_type_mapping(character varying); Type: FUNCTION; Schema: sqlj; Owner: adempiere
--

CREATE FUNCTION drop_type_mapping(character varying) RETURNS void
    AS $$org.postgresql.pljava.management.Commands.dropTypeMapping$$
    LANGUAGE java SECURITY DEFINER;


ALTER FUNCTION sqlj.drop_type_mapping(character varying) OWNER TO adempiere;

--
-- Name: get_classpath(character varying); Type: FUNCTION; Schema: sqlj; Owner: adempiere
--

CREATE FUNCTION get_classpath(character varying) RETURNS character varying
    AS $$org.postgresql.pljava.management.Commands.getClassPath$$
    LANGUAGE java STABLE SECURITY DEFINER;


ALTER FUNCTION sqlj.get_classpath(character varying) OWNER TO adempiere;

--
-- Name: install_jar(character varying, character varying, boolean); Type: FUNCTION; Schema: sqlj; Owner: adempiere
--

CREATE FUNCTION install_jar(character varying, character varying, boolean) RETURNS void
    AS $$org.postgresql.pljava.management.Commands.installJar$$
    LANGUAGE java SECURITY DEFINER;


ALTER FUNCTION sqlj.install_jar(character varying, character varying, boolean) OWNER TO adempiere;

--
-- Name: install_jar(bytea, character varying, boolean); Type: FUNCTION; Schema: sqlj; Owner: adempiere
--

CREATE FUNCTION install_jar(bytea, character varying, boolean) RETURNS void
    AS $$org.postgresql.pljava.management.Commands.installJar$$
    LANGUAGE java SECURITY DEFINER;


ALTER FUNCTION sqlj.install_jar(bytea, character varying, boolean) OWNER TO adempiere;

--
-- Name: remove_jar(character varying, boolean); Type: FUNCTION; Schema: sqlj; Owner: adempiere
--

CREATE FUNCTION remove_jar(character varying, boolean) RETURNS void
    AS $$org.postgresql.pljava.management.Commands.removeJar$$
    LANGUAGE java SECURITY DEFINER;


ALTER FUNCTION sqlj.remove_jar(character varying, boolean) OWNER TO adempiere;

--
-- Name: replace_jar(character varying, character varying, boolean); Type: FUNCTION; Schema: sqlj; Owner: adempiere
--

CREATE FUNCTION replace_jar(character varying, character varying, boolean) RETURNS void
    AS $$org.postgresql.pljava.management.Commands.replaceJar$$
    LANGUAGE java SECURITY DEFINER;


ALTER FUNCTION sqlj.replace_jar(character varying, character varying, boolean) OWNER TO adempiere;

--
-- Name: replace_jar(bytea, character varying, boolean); Type: FUNCTION; Schema: sqlj; Owner: adempiere
--

CREATE FUNCTION replace_jar(bytea, character varying, boolean) RETURNS void
    AS $$org.postgresql.pljava.management.Commands.replaceJar$$
    LANGUAGE java SECURITY DEFINER;


ALTER FUNCTION sqlj.replace_jar(bytea, character varying, boolean) OWNER TO adempiere;

--
-- Name: set_classpath(character varying, character varying); Type: FUNCTION; Schema: sqlj; Owner: adempiere
--

CREATE FUNCTION set_classpath(character varying, character varying) RETURNS void
    AS $$org.postgresql.pljava.management.Commands.setClassPath$$
    LANGUAGE java SECURITY DEFINER;


ALTER FUNCTION sqlj.set_classpath(character varying, character varying) OWNER TO adempiere;

SET search_path = adempiere, pg_catalog;
