--
-- Name: ad_changelog_v; Type: VIEW; Schema: adempiere; Owner: adempiere
--

CREATE VIEW ad_changelog_v AS
    SELECT l.ad_session_id, l.ad_changelog_id, t.tablename, l.record_id, c.columnname, l.oldvalue, l.newvalue, u.name, l.created FROM (((ad_changelog l JOIN ad_table t ON ((l.ad_table_id = t.ad_table_id))) JOIN ad_column c ON ((l.ad_column_id = c.ad_column_id))) JOIN ad_user u ON ((l.createdby = u.ad_user_id))) ORDER BY l.ad_session_id, l.ad_changelog_id, t.tablename, l.record_id, c.columnname;


ALTER TABLE adempiere.ad_changelog_v OWNER TO adempiere;

--
-- Name: ad_field_v; Type: VIEW; Schema: adempiere; Owner: adempiere
--

CREATE VIEW ad_field_v AS
    SELECT t.ad_window_id, f.ad_tab_id, f.ad_field_id, tbl.ad_table_id, f.ad_column_id, f.name, f.description, f.help, f.isdisplayed, f.displaylogic, f.displaylength, f.seqno, f.sortno, f.issameline, f.isheading, f.isfieldonly, f.isreadonly, f.isencrypted AS isencryptedfield, f.obscuretype, c.columnname, c.columnsql, c.fieldlength, c.vformat, c.defaultvalue, c.iskey, c.isparent, COALESCE(f.ismandatory, c.ismandatory) AS ismandatory, c.isidentifier, c.istranslated, c.ad_reference_value_id, c.callout, COALESCE(f.ad_reference_id, c.ad_reference_id) AS ad_reference_id, c.ad_val_rule_id, c.ad_process_id, c.isalwaysupdateable, c.readonlylogic, c.isupdateable, c.isencrypted AS isencryptedcolumn, c.isselectioncolumn, tbl.tablename, c.valuemin, c.valuemax, fg.name AS fieldgroup, vr.code AS validationcode FROM ((((((ad_field f JOIN ad_tab t ON ((f.ad_tab_id = t.ad_tab_id))) LEFT JOIN ad_fieldgroup fg ON ((f.ad_fieldgroup_id = fg.ad_fieldgroup_id))) LEFT JOIN ad_column c ON ((f.ad_column_id = c.ad_column_id))) JOIN ad_table tbl ON ((c.ad_table_id = tbl.ad_table_id))) JOIN ad_reference r ON ((c.ad_reference_id = r.ad_reference_id))) LEFT JOIN ad_val_rule vr ON ((c.ad_val_rule_id = vr.ad_val_rule_id))) WHERE ((f.isactive = 'Y'::bpchar) AND (c.isactive = 'Y'::bpchar));


ALTER TABLE adempiere.ad_field_v OWNER TO adempiere;

--
-- Name: ad_field_vt; Type: VIEW; Schema: adempiere; Owner: adempiere
--

CREATE VIEW ad_field_vt AS
    SELECT trl.ad_language, t.ad_window_id, f.ad_tab_id, f.ad_field_id, tbl.ad_table_id, f.ad_column_id, trl.name, trl.description, trl.help, f.isdisplayed, f.displaylogic, f.displaylength, f.seqno, f.sortno, f.issameline, f.isheading, f.isfieldonly, f.isreadonly, f.isencrypted AS isencryptedfield, f.obscuretype, c.columnname, c.columnsql, c.fieldlength, c.vformat, c.defaultvalue, c.iskey, c.isparent, COALESCE(f.ismandatory, c.ismandatory) AS ismandatory, c.isidentifier, c.istranslated, c.ad_reference_value_id, c.callout, COALESCE(f.ad_reference_id, c.ad_reference_id) AS ad_reference_id, c.ad_val_rule_id, c.ad_process_id, c.isalwaysupdateable, c.readonlylogic, c.isupdateable, c.isencrypted AS isencryptedcolumn, c.isselectioncolumn, tbl.tablename, c.valuemin, c.valuemax, fgt.name AS fieldgroup, vr.code AS validationcode FROM (((((((ad_field f JOIN ad_field_trl trl ON ((f.ad_field_id = trl.ad_field_id))) JOIN ad_tab t ON ((f.ad_tab_id = t.ad_tab_id))) LEFT JOIN ad_fieldgroup_trl fgt ON (((f.ad_fieldgroup_id = fgt.ad_fieldgroup_id) AND ((trl.ad_language)::text = (fgt.ad_language)::text)))) LEFT JOIN ad_column c ON ((f.ad_column_id = c.ad_column_id))) JOIN ad_table tbl ON ((c.ad_table_id = tbl.ad_table_id))) JOIN ad_reference r ON ((c.ad_reference_id = r.ad_reference_id))) LEFT JOIN ad_val_rule vr ON ((c.ad_val_rule_id = vr.ad_val_rule_id))) WHERE ((f.isactive = 'Y'::bpchar) AND (c.isactive = 'Y'::bpchar));


ALTER TABLE adempiere.ad_field_vt OWNER TO adempiere;

--
-- Name: ad_org_v; Type: VIEW; Schema: adempiere; Owner: adempiere
--

CREATE VIEW ad_org_v AS
    SELECT o.ad_client_id, o.ad_org_id, o.isactive, o.created, o.createdby, o.updated, o.updatedby, o.value, o.name, o.description, o.issummary, i.c_location_id, i.duns, i.taxid, i.supervisor_id, i.parent_org_id, i.ad_orgtype_id, i.m_warehouse_id, bp.c_bpartner_id FROM ((ad_org o JOIN ad_orginfo i ON ((o.ad_org_id = i.ad_org_id))) LEFT JOIN c_bpartner bp ON ((o.ad_org_id = bp.ad_orgbp_id)));


ALTER TABLE adempiere.ad_org_v OWNER TO adempiere;

--
-- Name: ad_tab_v; Type: VIEW; Schema: adempiere; Owner: adempiere
--

CREATE VIEW ad_tab_v AS
    SELECT t.ad_tab_id, t.ad_window_id, t.ad_table_id, t.name, t.description, t.help, t.seqno, t.issinglerow, t.hastree, t.isinfotab, tbl.replicationtype, tbl.tablename, tbl.accesslevel, tbl.issecurityenabled, tbl.isdeleteable, tbl.ishighvolume, tbl.isview, 'N' AS hasassociation, t.istranslationtab, t.isreadonly, t.ad_image_id, t.tablevel, t.whereclause, t.orderbyclause, t.commitwarning, t.readonlylogic, t.displaylogic, t.ad_column_id, t.ad_process_id, t.issorttab, t.isinsertrecord, t.isadvancedtab, t.ad_columnsortorder_id, t.ad_columnsortyesno_id, t.included_tab_id FROM (ad_tab t JOIN ad_table tbl ON ((t.ad_table_id = tbl.ad_table_id))) WHERE ((t.isactive = 'Y'::bpchar) AND (tbl.isactive = 'Y'::bpchar));


ALTER TABLE adempiere.ad_tab_v OWNER TO adempiere;

--
-- Name: ad_tab_vt; Type: VIEW; Schema: adempiere; Owner: adempiere
--

CREATE VIEW ad_tab_vt AS
    SELECT trl.ad_language, t.ad_tab_id, t.ad_window_id, t.ad_table_id, trl.name, trl.description, trl.help, t.seqno, t.issinglerow, t.hastree, t.isinfotab, tbl.replicationtype, tbl.tablename, tbl.accesslevel, tbl.issecurityenabled, tbl.isdeleteable, tbl.ishighvolume, tbl.isview, 'N' AS hasassociation, t.istranslationtab, t.isreadonly, t.ad_image_id, t.tablevel, t.whereclause, t.orderbyclause, trl.commitwarning, t.readonlylogic, t.displaylogic, t.ad_column_id, t.ad_process_id, t.issorttab, t.isinsertrecord, t.isadvancedtab, t.ad_columnsortorder_id, t.ad_columnsortyesno_id, t.included_tab_id FROM ((ad_tab t JOIN ad_table tbl ON ((t.ad_table_id = tbl.ad_table_id))) JOIN ad_tab_trl trl ON ((t.ad_tab_id = trl.ad_tab_id))) WHERE ((t.isactive = 'Y'::bpchar) AND (tbl.isactive = 'Y'::bpchar));


ALTER TABLE adempiere.ad_tab_vt OWNER TO adempiere;

--
-- Name: ad_user_roles_v; Type: VIEW; Schema: adempiere; Owner: adempiere
--

CREATE VIEW ad_user_roles_v AS
    SELECT u.name, r.name AS rolename FROM ((ad_user_roles ur JOIN ad_user u ON ((ur.ad_user_id = u.ad_user_id))) JOIN ad_role r ON ((ur.ad_role_id = r.ad_role_id)));


ALTER TABLE adempiere.ad_user_roles_v OWNER TO adempiere;

--
-- Name: ad_window_vt; Type: VIEW; Schema: adempiere; Owner: adempiere
--

CREATE VIEW ad_window_vt AS
    SELECT trl.ad_language, bt.ad_window_id, trl.name, trl.description, trl.help, bt.windowtype, bt.ad_color_id, bt.ad_image_id, bt.isactive, bt.winwidth, bt.winheight, bt.issotrx FROM (ad_window bt JOIN ad_window_trl trl ON ((bt.ad_window_id = trl.ad_window_id))) WHERE (bt.isactive = 'Y'::bpchar);


ALTER TABLE adempiere.ad_window_vt OWNER TO adempiere;

--
-- Name: c_dunning_header_v; Type: VIEW; Schema: adempiere; Owner: adempiere
--

CREATE VIEW c_dunning_header_v AS
    SELECT dr.ad_client_id, dr.ad_org_id, dr.isactive, dr.created, dr.createdby, dr.updated, dr.updatedby, 'en_US' AS ad_language, dr.c_dunningrun_id, dre.c_dunningrunentry_id, dr.dunningdate, dl.printname, dl.note AS documentnote, dre.c_bpartner_id, bp.value AS bpvalue, bp.taxid AS bptaxid, bp.naics, bp.duns, oi.c_location_id AS org_location_id, oi.taxid, dre.salesrep_id, COALESCE(ubp.name, u.name) AS salesrep_name, bpg.greeting AS bpgreeting, bp.name, bp.name2, bpcg.greeting AS bpcontactgreeting, bpc.title, bpc.phone, NULLIF((bpc.name)::text, (bp.name)::text) AS contactname, bpl.c_location_id, bp.referenceno, ((l.postal)::text || (l.postal_add)::text) AS postal, dre.amt, dre.qty, dre.note FROM (((((((((((c_dunningrun dr JOIN c_dunninglevel dl ON ((dr.c_dunninglevel_id = dl.c_dunninglevel_id))) JOIN c_dunningrunentry dre ON ((dr.c_dunningrun_id = dre.c_dunningrun_id))) JOIN c_bpartner bp ON ((dre.c_bpartner_id = bp.c_bpartner_id))) LEFT JOIN c_greeting bpg ON ((bp.c_greeting_id = bpg.c_greeting_id))) JOIN c_bpartner_location bpl ON ((dre.c_bpartner_location_id = bpl.c_bpartner_location_id))) JOIN c_location l ON ((bpl.c_location_id = l.c_location_id))) LEFT JOIN ad_user bpc ON ((dre.ad_user_id = bpc.ad_user_id))) LEFT JOIN c_greeting bpcg ON ((bpc.c_greeting_id = bpcg.c_greeting_id))) JOIN ad_orginfo oi ON ((dr.ad_org_id = oi.ad_org_id))) LEFT JOIN ad_user u ON ((dre.salesrep_id = u.ad_user_id))) LEFT JOIN c_bpartner ubp ON ((u.c_bpartner_id = ubp.c_bpartner_id)));


ALTER TABLE adempiere.c_dunning_header_v OWNER TO adempiere;

--
-- Name: c_dunning_header_vt; Type: VIEW; Schema: adempiere; Owner: adempiere
--

CREATE VIEW c_dunning_header_vt AS
    SELECT dr.ad_client_id, dr.ad_org_id, dr.isactive, dr.created, dr.createdby, dr.updated, dr.updatedby, dlt.ad_language, dr.c_dunningrun_id, dre.c_dunningrunentry_id, dr.dunningdate, dlt.printname, dlt.note AS documentnote, dre.c_bpartner_id, bp.value AS bpvalue, bp.taxid AS bptaxid, bp.naics, bp.duns, oi.c_location_id AS org_location_id, oi.taxid, dre.salesrep_id, COALESCE(ubp.name, u.name) AS salesrep_name, bpg.greeting AS bpgreeting, bp.name, bp.name2, bpcg.greeting AS bpcontactgreeting, bpc.title, bpc.phone, NULLIF((bpc.name)::text, (bp.name)::text) AS contactname, bpl.c_location_id, bp.referenceno, ((l.postal)::text || (l.postal_add)::text) AS postal, dre.amt, dre.qty, dre.note FROM ((((((((((((c_dunningrun dr JOIN c_dunninglevel dl ON ((dr.c_dunninglevel_id = dl.c_dunninglevel_id))) JOIN c_dunninglevel_trl dlt ON ((dl.c_dunninglevel_id = dlt.c_dunninglevel_id))) JOIN c_dunningrunentry dre ON ((dr.c_dunningrun_id = dre.c_dunningrun_id))) JOIN c_bpartner bp ON ((dre.c_bpartner_id = bp.c_bpartner_id))) LEFT JOIN c_greeting_trl bpg ON (((bp.c_greeting_id = bpg.c_greeting_id) AND ((dlt.ad_language)::text = (bpg.ad_language)::text)))) JOIN c_bpartner_location bpl ON ((dre.c_bpartner_location_id = bpl.c_bpartner_location_id))) JOIN c_location l ON ((bpl.c_location_id = l.c_location_id))) LEFT JOIN ad_user bpc ON ((dre.ad_user_id = bpc.ad_user_id))) LEFT JOIN c_greeting_trl bpcg ON (((bpc.c_greeting_id = bpcg.c_greeting_id) AND ((dlt.ad_language)::text = (bpcg.ad_language)::text)))) JOIN ad_orginfo oi ON ((dr.ad_org_id = oi.ad_org_id))) LEFT JOIN ad_user u ON ((dre.salesrep_id = u.ad_user_id))) LEFT JOIN c_bpartner ubp ON ((u.c_bpartner_id = ubp.c_bpartner_id)));


ALTER TABLE adempiere.c_dunning_header_vt OWNER TO adempiere;

--
-- Name: c_dunning_line_v; Type: VIEW; Schema: adempiere; Owner: adempiere
--

CREATE VIEW c_dunning_line_v AS
    SELECT drl.ad_client_id, drl.ad_org_id, drl.isactive, drl.created, drl.createdby, drl.updated, drl.updatedby, 'en_US' AS ad_language, drl.c_dunningrunline_id, drl.c_dunningrunentry_id, drl.amt, drl.convertedamt, drl.daysdue, drl.timesdunned, drl.interestamt, drl.feeamt, drl.totalamt, drl.c_invoice_id, COALESCE(i.issotrx, p.isreceipt) AS issotrx, COALESCE(i.documentno, p.documentno) AS documentno, COALESCE(i.docstatus, p.docstatus) AS docstatus, COALESCE(i.dateinvoiced, p.datetrx) AS datetrx, COALESCE(i.c_doctype_id, p.c_doctype_id) AS c_doctype_id, COALESCE(dt.printname, dtp.printname) AS documenttype, COALESCE(i.description, p.description) AS description, COALESCE(i.c_currency_id, p.c_currency_id) AS c_currency_id, COALESCE(i.c_campaign_id, p.c_campaign_id) AS c_campaign_id, COALESCE(i.c_project_id, p.c_project_id) AS c_project_id, COALESCE(i.c_activity_id, p.c_activity_id) AS c_activity_id, COALESCE(i.user1_id, p.user1_id) AS user1_id, COALESCE(i.user2_id, p.user2_id) AS user2_id, COALESCE(i.dateacct, p.dateacct) AS dateacct, COALESCE(i.c_conversiontype_id, i.c_conversiontype_id) AS c_conversiontype_id, COALESCE(i.ad_orgtrx_id, p.ad_orgtrx_id) AS ad_orgtrx_id, i.poreference, i.dateordered, i.dateinvoiced, i.isindispute, pt.name AS paymentterm, i.c_charge_id, i.chargeamt, i.totallines, i.grandtotal, i.grandtotal AS amtinwords, i.m_pricelist_id, i.ispaid, p.isallocated, p.tendertype, p.discountamt FROM (((((c_dunningrunline drl LEFT JOIN c_invoice i ON ((drl.c_invoice_id = i.c_invoice_id))) LEFT JOIN c_doctype dt ON ((i.c_doctype_id = dt.c_doctype_id))) LEFT JOIN c_paymentterm pt ON ((i.c_paymentterm_id = pt.c_paymentterm_id))) LEFT JOIN c_payment p ON ((drl.c_payment_id = p.c_payment_id))) LEFT JOIN c_doctype dtp ON ((p.c_doctype_id = dtp.c_doctype_id)));


ALTER TABLE adempiere.c_dunning_line_v OWNER TO adempiere;

--
-- Name: c_dunning_line_vt; Type: VIEW; Schema: adempiere; Owner: adempiere
--

CREATE VIEW c_dunning_line_vt AS
    SELECT drl.ad_client_id, drl.ad_org_id, drl.isactive, drl.created, drl.createdby, drl.updated, drl.updatedby, COALESCE(dt.ad_language, dtp.ad_language) AS ad_language, drl.c_dunningrunline_id, drl.c_dunningrunentry_id, drl.amt, drl.convertedamt, drl.daysdue, drl.timesdunned, drl.interestamt, drl.feeamt, drl.totalamt, drl.c_invoice_id, COALESCE(i.issotrx, p.isreceipt) AS issotrx, COALESCE(i.documentno, p.documentno) AS documentno, COALESCE(i.docstatus, p.docstatus) AS docstatus, COALESCE(i.dateinvoiced, p.datetrx) AS datetrx, COALESCE(i.c_doctype_id, p.c_doctype_id) AS c_doctype_id, COALESCE(dt.printname, dtp.printname) AS documenttype, COALESCE(i.description, p.description) AS description, COALESCE(i.c_currency_id, p.c_currency_id) AS c_currency_id, COALESCE(i.c_campaign_id, p.c_campaign_id) AS c_campaign_id, COALESCE(i.c_project_id, p.c_project_id) AS c_project_id, COALESCE(i.c_activity_id, p.c_activity_id) AS c_activity_id, COALESCE(i.user1_id, p.user1_id) AS user1_id, COALESCE(i.user2_id, p.user2_id) AS user2_id, COALESCE(i.dateacct, p.dateacct) AS dateacct, COALESCE(i.c_conversiontype_id, i.c_conversiontype_id) AS c_conversiontype_id, COALESCE(i.ad_orgtrx_id, p.ad_orgtrx_id) AS ad_orgtrx_id, i.poreference, i.dateordered, i.dateinvoiced, i.isindispute, pt.name AS paymentterm, i.c_charge_id, i.chargeamt, i.totallines, i.grandtotal, i.grandtotal AS amtinwords, i.m_pricelist_id, i.ispaid, p.isallocated, p.tendertype, p.discountamt FROM (((((c_dunningrunline drl LEFT JOIN c_invoice i ON ((drl.c_invoice_id = i.c_invoice_id))) LEFT JOIN c_doctype_trl dt ON ((i.c_doctype_id = dt.c_doctype_id))) LEFT JOIN c_paymentterm_trl pt ON (((i.c_paymentterm_id = pt.c_paymentterm_id) AND ((pt.ad_language)::text = (dt.ad_language)::text)))) LEFT JOIN c_payment p ON ((drl.c_payment_id = p.c_payment_id))) LEFT JOIN c_doctype_trl dtp ON ((p.c_doctype_id = dtp.c_doctype_id))) WHERE ((COALESCE(dt.ad_language, dtp.ad_language))::text = (COALESCE(dtp.ad_language, dt.ad_language))::text);


ALTER TABLE adempiere.c_dunning_line_vt OWNER TO adempiere;

--
-- Name: c_invoice_candidate_v; Type: VIEW; Schema: adempiere; Owner: adempiere
--

CREATE VIEW c_invoice_candidate_v AS
    SELECT o.ad_client_id, o.ad_org_id, o.c_bpartner_id, o.c_order_id, o.documentno, o.dateordered, o.c_doctype_id, sum(((l.qtyordered - l.qtyinvoiced) * l.priceactual)) AS totallines FROM (((c_order o JOIN c_orderline l ON ((o.c_order_id = l.c_order_id))) JOIN c_bpartner bp ON ((o.c_bpartner_id = bp.c_bpartner_id))) LEFT JOIN c_invoiceschedule si ON ((bp.c_invoiceschedule_id = si.c_invoiceschedule_id))) WHERE ((((o.docstatus = ANY (ARRAY['CO'::bpchar, 'CL'::bpchar, 'IP'::bpchar])) AND (o.c_doctype_id IN (SELECT c_doctype.c_doctype_id FROM c_doctype WHERE ((c_doctype.docbasetype = 'SOO'::bpchar) AND (c_doctype.docsubtypeso <> ALL (ARRAY['ON'::bpchar, 'OB'::bpchar, 'WR'::bpchar])))))) AND (l.qtyordered <> l.qtyinvoiced)) AND (((((o.invoicerule = 'I'::bpchar) OR (o.invoicerule = 'O'::bpchar)) OR ((o.invoicerule = 'D'::bpchar) AND (l.qtyinvoiced <> l.qtydelivered))) OR ((o.invoicerule = 'S'::bpchar) AND (bp.c_invoiceschedule_id IS NULL))) OR (((o.invoicerule = 'S'::bpchar) AND (bp.c_invoiceschedule_id IS NOT NULL)) AND (((((si.invoicefrequency IS NULL) OR (si.invoicefrequency = 'D'::bpchar)) OR (si.invoicefrequency = 'W'::bpchar)) OR ((si.invoicefrequency = 'T'::bpchar) AND (((trunc((o.dateordered)::timestamp with time zone) <= ((firstof(getdate(), 'MM'::character varying) + si.invoicedaycutoff) - 1)) AND (trunc(getdate()) >= ((firstof((o.dateordered)::timestamp with time zone, 'MM'::character varying) + si.invoiceday) - 1))) OR ((trunc((o.dateordered)::timestamp with time zone) <= ((firstof(getdate(), 'MM'::character varying) + si.invoicedaycutoff) + 14)) AND (trunc(getdate()) >= ((firstof((o.dateordered)::timestamp with time zone, 'MM'::character varying) + si.invoiceday) + 14)))))) OR (((si.invoicefrequency = 'M'::bpchar) AND (trunc((o.dateordered)::timestamp with time zone) <= ((firstof(getdate(), 'MM'::character varying) + si.invoicedaycutoff) - 1))) AND (trunc(getdate()) >= ((firstof((o.dateordered)::timestamp with time zone, 'MM'::character varying) + si.invoiceday) - 1))))))) GROUP BY o.ad_client_id, o.ad_org_id, o.c_bpartner_id, o.c_order_id, o.documentno, o.dateordered, o.c_doctype_id;


ALTER TABLE adempiere.c_invoice_candidate_v OWNER TO adempiere;

--
-- Name: c_invoice_header_v; Type: VIEW; Schema: adempiere; Owner: adempiere
--

CREATE VIEW c_invoice_header_v AS
    SELECT i.ad_client_id, i.ad_org_id, i.isactive, i.created, i.createdby, i.updated, i.updatedby, 'en_US' AS ad_language, i.c_invoice_id, i.issotrx, i.documentno, i.docstatus, i.c_doctype_id, i.c_bpartner_id, bp.value AS bpvalue, bp.taxid AS bptaxid, bp.naics, bp.duns, oi.c_location_id AS org_location_id, oi.taxid, dt.printname AS documenttype, dt.documentnote AS documenttypenote, i.c_order_id, i.salesrep_id, COALESCE(ubp.name, u.name) AS salesrep_name, i.dateinvoiced, bpg.greeting AS bpgreeting, bp.name, bp.name2, bpcg.greeting AS bpcontactgreeting, bpc.title, bpc.phone, NULLIF((bpc.name)::text, (bp.name)::text) AS contactname, bpl.c_location_id, bp.referenceno, ((l.postal)::text || (l.postal_add)::text) AS postal, i.description, i.poreference, i.dateordered, i.c_currency_id, pt.name AS paymentterm, pt.documentnote AS paymenttermnote, i.c_charge_id, i.chargeamt, i.totallines, i.grandtotal, i.grandtotal AS amtinwords, i.m_pricelist_id, i.istaxincluded, i.c_campaign_id, i.c_project_id, i.c_activity_id, i.ispaid FROM (((((((((((c_invoice i JOIN c_doctype dt ON ((i.c_doctype_id = dt.c_doctype_id))) JOIN c_paymentterm pt ON ((i.c_paymentterm_id = pt.c_paymentterm_id))) JOIN c_bpartner bp ON ((i.c_bpartner_id = bp.c_bpartner_id))) LEFT JOIN c_greeting bpg ON ((bp.c_greeting_id = bpg.c_greeting_id))) JOIN c_bpartner_location bpl ON ((i.c_bpartner_location_id = bpl.c_bpartner_location_id))) JOIN c_location l ON ((bpl.c_location_id = l.c_location_id))) LEFT JOIN ad_user bpc ON ((i.ad_user_id = bpc.ad_user_id))) LEFT JOIN c_greeting bpcg ON ((bpc.c_greeting_id = bpcg.c_greeting_id))) JOIN ad_orginfo oi ON ((i.ad_org_id = oi.ad_org_id))) LEFT JOIN ad_user u ON ((i.salesrep_id = u.ad_user_id))) LEFT JOIN c_bpartner ubp ON ((u.c_bpartner_id = ubp.c_bpartner_id)));


ALTER TABLE adempiere.c_invoice_header_v OWNER TO adempiere;

--
-- Name: c_invoice_header_vt; Type: VIEW; Schema: adempiere; Owner: adempiere
--

CREATE VIEW c_invoice_header_vt AS
    SELECT i.ad_client_id, i.ad_org_id, i.isactive, i.created, i.createdby, i.updated, i.updatedby, dt.ad_language, i.c_invoice_id, i.issotrx, i.documentno, i.docstatus, i.c_doctype_id, i.c_bpartner_id, bp.value AS bpvalue, bp.taxid AS bptaxid, bp.naics, bp.duns, oi.c_location_id AS org_location_id, oi.taxid, dt.printname AS documenttype, dt.documentnote AS documenttypenote, i.c_order_id, i.salesrep_id, COALESCE(ubp.name, u.name) AS salesrep_name, i.dateinvoiced, bpg.greeting AS bpgreeting, bp.name, bp.name2, bpcg.greeting AS bpcontactgreeting, bpc.title, bpc.phone, NULLIF((bpc.name)::text, (bp.name)::text) AS contactname, bpl.c_location_id, bp.referenceno, ((l.postal)::text || (l.postal_add)::text) AS postal, i.description, i.poreference, i.dateordered, i.c_currency_id, pt.name AS paymentterm, pt.documentnote AS paymenttermnote, i.c_charge_id, i.chargeamt, i.totallines, i.grandtotal, i.grandtotal AS amtinwords, i.m_pricelist_id, i.istaxincluded, i.c_campaign_id, i.c_project_id, i.c_activity_id, i.ispaid FROM (((((((((((c_invoice i JOIN c_doctype_trl dt ON ((i.c_doctype_id = dt.c_doctype_id))) JOIN c_paymentterm_trl pt ON (((i.c_paymentterm_id = pt.c_paymentterm_id) AND ((dt.ad_language)::text = (pt.ad_language)::text)))) JOIN c_bpartner bp ON ((i.c_bpartner_id = bp.c_bpartner_id))) LEFT JOIN c_greeting_trl bpg ON (((bp.c_greeting_id = bpg.c_greeting_id) AND ((dt.ad_language)::text = (bpg.ad_language)::text)))) JOIN c_bpartner_location bpl ON ((i.c_bpartner_location_id = bpl.c_bpartner_location_id))) JOIN c_location l ON ((bpl.c_location_id = l.c_location_id))) LEFT JOIN ad_user bpc ON ((i.ad_user_id = bpc.ad_user_id))) LEFT JOIN c_greeting_trl bpcg ON (((bpc.c_greeting_id = bpcg.c_greeting_id) AND ((dt.ad_language)::text = (bpcg.ad_language)::text)))) JOIN ad_orginfo oi ON ((i.ad_org_id = oi.ad_org_id))) LEFT JOIN ad_user u ON ((i.salesrep_id = u.ad_user_id))) LEFT JOIN c_bpartner ubp ON ((u.c_bpartner_id = ubp.c_bpartner_id)));


ALTER TABLE adempiere.c_invoice_header_vt OWNER TO adempiere;

--
-- Name: c_invoice_linetax_v; Type: VIEW; Schema: adempiere; Owner: adempiere
--

CREATE VIEW c_invoice_linetax_v AS
    (((SELECT il.ad_client_id, il.ad_org_id, il.isactive, il.created, il.createdby, il.updated, il.updatedby, 'en_US' AS ad_language, il.c_invoice_id, il.c_invoiceline_id, il.c_tax_id, il.taxamt, il.linetotalamt, t.taxindicator, il.line, p.m_product_id, CASE WHEN ((il.qtyinvoiced <> (0)::numeric) OR (il.m_product_id IS NOT NULL)) THEN il.qtyinvoiced ELSE NULL::numeric END AS qtyinvoiced, CASE WHEN ((il.qtyentered <> (0)::numeric) OR (il.m_product_id IS NOT NULL)) THEN il.qtyentered ELSE NULL::numeric END AS qtyentered, CASE WHEN ((il.qtyentered <> (0)::numeric) OR (il.m_product_id IS NOT NULL)) THEN uom.uomsymbol ELSE NULL::character varying END AS uomsymbol, COALESCE(c.name, (((p.name)::text || (productattribute(il.m_attributesetinstance_id))::text))::character varying, il.description) AS name, CASE WHEN (COALESCE(c.name, p.name) IS NOT NULL) THEN il.description ELSE NULL::character varying END AS description, p.documentnote, p.upc, p.sku, COALESCE(pp.vendorproductno, p.value) AS productvalue, ra.description AS resourcedescription, CASE WHEN ((i.isdiscountprinted = 'Y'::bpchar) AND (il.pricelist <> (0)::numeric)) THEN il.pricelist ELSE NULL::numeric END AS pricelist, CASE WHEN (((i.isdiscountprinted = 'Y'::bpchar) AND (il.pricelist <> (0)::numeric)) AND (il.qtyentered <> (0)::numeric)) THEN ((il.pricelist * il.qtyinvoiced) / il.qtyentered) ELSE NULL::numeric END AS priceenteredlist, CASE WHEN (((i.isdiscountprinted = 'Y'::bpchar) AND (il.pricelist > il.priceactual)) AND (il.pricelist <> (0)::numeric)) THEN (((il.pricelist - il.priceactual) / il.pricelist) * (100)::numeric) ELSE NULL::numeric END AS discount, CASE WHEN ((il.priceactual <> (0)::numeric) OR (il.m_product_id IS NOT NULL)) THEN il.priceactual ELSE NULL::numeric END AS priceactual, CASE WHEN ((il.priceentered <> (0)::numeric) OR (il.m_product_id IS NOT NULL)) THEN il.priceentered ELSE NULL::numeric END AS priceentered, CASE WHEN ((il.linenetamt <> (0)::numeric) OR (il.m_product_id IS NOT NULL)) THEN il.linenetamt ELSE NULL::numeric END AS linenetamt, il.m_attributesetinstance_id, asi.m_attributeset_id, asi.serno, asi.lot, asi.m_lot_id, asi.guaranteedate, p.description AS productdescription, p.imageurl, il.c_campaign_id, il.c_project_id, il.c_activity_id, il.c_projectphase_id, il.c_projecttask_id FROM ((((((((c_invoiceline il JOIN c_uom uom ON ((il.c_uom_id = uom.c_uom_id))) JOIN c_invoice i ON ((il.c_invoice_id = i.c_invoice_id))) LEFT JOIN c_tax t ON ((il.c_tax_id = t.c_tax_id))) LEFT JOIN m_product p ON ((il.m_product_id = p.m_product_id))) LEFT JOIN c_charge c ON ((il.c_charge_id = c.c_charge_id))) LEFT JOIN c_bpartner_product pp ON (((il.m_product_id = pp.m_product_id) AND (i.c_bpartner_id = pp.c_bpartner_id)))) LEFT JOIN s_resourceassignment ra ON ((il.s_resourceassignment_id = ra.s_resourceassignment_id))) LEFT JOIN m_attributesetinstance asi ON ((il.m_attributesetinstance_id = asi.m_attributesetinstance_id))) UNION SELECT il.ad_client_id, il.ad_org_id, il.isactive, il.created, il.createdby, il.updated, il.updatedby, 'en_US' AS ad_language, il.c_invoice_id, il.c_invoiceline_id, il.c_tax_id, il.taxamt, il.linetotalamt, t.taxindicator, (il.line + (b.line / 100)) AS line, p.m_product_id, (il.qtyinvoiced * b.bomqty) AS qtyinvoiced, (il.qtyentered * b.bomqty) AS qtyentered, uom.uomsymbol, p.name, b.description, p.documentnote, p.upc, p.sku, p.value AS productvalue, NULL::"unknown" AS resourcedescription, NULL::"unknown" AS pricelist, NULL::"unknown" AS priceenteredlist, NULL::"unknown" AS discount, NULL::"unknown" AS priceactual, NULL::"unknown" AS priceentered, NULL::"unknown" AS linenetamt, il.m_attributesetinstance_id, asi.m_attributeset_id, asi.serno, asi.lot, asi.m_lot_id, asi.guaranteedate, p.description AS productdescription, p.imageurl, il.c_campaign_id, il.c_project_id, il.c_activity_id, il.c_projectphase_id, il.c_projecttask_id FROM ((((((m_product_bom b JOIN c_invoiceline il ON ((b.m_product_id = il.m_product_id))) JOIN m_product bp ON (((((bp.m_product_id = il.m_product_id) AND (bp.isbom = 'Y'::bpchar)) AND (bp.isverified = 'Y'::bpchar)) AND (bp.isinvoiceprintdetails = 'Y'::bpchar)))) JOIN m_product p ON ((b.m_productbom_id = p.m_product_id))) JOIN c_uom uom ON ((p.c_uom_id = uom.c_uom_id))) LEFT JOIN c_tax t ON ((il.c_tax_id = t.c_tax_id))) LEFT JOIN m_attributesetinstance asi ON ((il.m_attributesetinstance_id = asi.m_attributesetinstance_id)))) UNION SELECT il.ad_client_id, il.ad_org_id, il.isactive, il.created, il.createdby, il.updated, il.updatedby, 'en_US' AS ad_language, il.c_invoice_id, il.c_invoiceline_id, NULL::"unknown" AS c_tax_id, NULL::"unknown" AS taxamt, NULL::"unknown" AS linetotalamt, NULL::"unknown" AS taxindicator, il.line, NULL::"unknown" AS m_product_id, NULL::"unknown" AS qtyinvoiced, NULL::"unknown" AS qtyentered, NULL::"unknown" AS uomsymbol, il.description AS name, NULL::"unknown" AS description, NULL::"unknown" AS documentnote, NULL::"unknown" AS upc, NULL::"unknown" AS sku, NULL::"unknown" AS productvalue, NULL::"unknown" AS resourcedescription, NULL::"unknown" AS pricelist, NULL::"unknown" AS priceenteredlist, NULL::"unknown" AS discount, NULL::"unknown" AS priceactual, NULL::"unknown" AS priceentered, NULL::"unknown" AS linenetamt, NULL::"unknown" AS m_attributesetinstance_id, NULL::"unknown" AS m_attributeset_id, NULL::"unknown" AS serno, NULL::"unknown" AS lot, NULL::"unknown" AS m_lot_id, NULL::"unknown" AS guaranteedate, NULL::"unknown" AS productdescription, NULL::"unknown" AS imageurl, NULL::"unknown" AS c_campaign_id, NULL::"unknown" AS c_project_id, NULL::"unknown" AS c_activity_id, NULL::"unknown" AS c_projectphase_id, NULL::"unknown" AS c_projecttask_id FROM c_invoiceline il WHERE (il.c_uom_id IS NULL)) UNION SELECT c_invoice.ad_client_id, c_invoice.ad_org_id, c_invoice.isactive, c_invoice.created, c_invoice.createdby, c_invoice.updated, c_invoice.updatedby, 'en_US' AS ad_language, c_invoice.c_invoice_id, NULL::"unknown" AS c_invoiceline_id, NULL::"unknown" AS c_tax_id, NULL::"unknown" AS taxamt, NULL::"unknown" AS linetotalamt, NULL::"unknown" AS taxindicator, 9998 AS line, NULL::"unknown" AS m_product_id, NULL::"unknown" AS qtyinvoiced, NULL::"unknown" AS qtyentered, NULL::"unknown" AS uomsymbol, NULL::"unknown" AS name, NULL::"unknown" AS description, NULL::"unknown" AS documentnote, NULL::"unknown" AS upc, NULL::"unknown" AS sku, NULL::"unknown" AS productvalue, NULL::"unknown" AS resourcedescription, NULL::"unknown" AS pricelist, NULL::"unknown" AS priceenteredlist, NULL::"unknown" AS discount, NULL::"unknown" AS priceactual, NULL::"unknown" AS priceentered, NULL::"unknown" AS linenetamt, NULL::"unknown" AS m_attributesetinstance_id, NULL::"unknown" AS m_attributeset_id, NULL::"unknown" AS serno, NULL::"unknown" AS lot, NULL::"unknown" AS m_lot_id, NULL::"unknown" AS guaranteedate, NULL::"unknown" AS productdescription, NULL::"unknown" AS imageurl, NULL::"unknown" AS c_campaign_id, NULL::"unknown" AS c_project_id, NULL::"unknown" AS c_activity_id, NULL::"unknown" AS c_projectphase_id, NULL::"unknown" AS c_projecttask_id FROM c_invoice) UNION SELECT it.ad_client_id, it.ad_org_id, it.isactive, it.created, it.createdby, it.updated, it.updatedby, 'en_US' AS ad_language, it.c_invoice_id, NULL::"unknown" AS c_invoiceline_id, it.c_tax_id, NULL::"unknown" AS taxamt, NULL::"unknown" AS linetotalamt, t.taxindicator, 9999 AS line, NULL::"unknown" AS m_product_id, NULL::"unknown" AS qtyinvoiced, NULL::"unknown" AS qtyentered, NULL::"unknown" AS uomsymbol, t.name, NULL::"unknown" AS description, NULL::"unknown" AS documentnote, NULL::"unknown" AS upc, NULL::"unknown" AS sku, NULL::"unknown" AS productvalue, NULL::"unknown" AS resourcedescription, NULL::"unknown" AS pricelist, NULL::"unknown" AS priceenteredlist, NULL::"unknown" AS discount, CASE WHEN (it.istaxincluded = 'Y'::bpchar) THEN it.taxamt ELSE it.taxbaseamt END AS priceactual, CASE WHEN (it.istaxincluded = 'Y'::bpchar) THEN it.taxamt ELSE it.taxbaseamt END AS priceentered, CASE WHEN (it.istaxincluded = 'Y'::bpchar) THEN NULL::numeric ELSE it.taxamt END AS linenetamt, NULL::"unknown" AS m_attributesetinstance_id, NULL::"unknown" AS m_attributeset_id, NULL::"unknown" AS serno, NULL::"unknown" AS lot, NULL::"unknown" AS m_lot_id, NULL::"unknown" AS guaranteedate, NULL::"unknown" AS productdescription, NULL::"unknown" AS imageurl, NULL::"unknown" AS c_campaign_id, NULL::"unknown" AS c_project_id, NULL::"unknown" AS c_activity_id, NULL::"unknown" AS c_projectphase_id, NULL::"unknown" AS c_projecttask_id FROM (c_invoicetax it JOIN c_tax t ON ((it.c_tax_id = t.c_tax_id)));


ALTER TABLE adempiere.c_invoice_linetax_v OWNER TO adempiere;

--
-- Name: c_invoice_linetax_vt; Type: VIEW; Schema: adempiere; Owner: adempiere
--

CREATE VIEW c_invoice_linetax_vt AS
    (((SELECT il.ad_client_id, il.ad_org_id, il.isactive, il.created, il.createdby, il.updated, il.updatedby, uom.ad_language, il.c_invoice_id, il.c_invoiceline_id, il.c_tax_id, il.taxamt, il.linetotalamt, t.taxindicator, il.line, p.m_product_id, CASE WHEN ((il.qtyinvoiced <> (0)::numeric) OR (il.m_product_id IS NOT NULL)) THEN il.qtyinvoiced ELSE NULL::numeric END AS qtyinvoiced, CASE WHEN ((il.qtyentered <> (0)::numeric) OR (il.m_product_id IS NOT NULL)) THEN il.qtyentered ELSE NULL::numeric END AS qtyentered, CASE WHEN ((il.qtyentered <> (0)::numeric) OR (il.m_product_id IS NOT NULL)) THEN uom.uomsymbol ELSE NULL::character varying END AS uomsymbol, COALESCE(c.name, (((COALESCE(pt.name, p.name))::text || (productattribute(il.m_attributesetinstance_id))::text))::character varying, il.description) AS name, CASE WHEN (COALESCE(c.name, pt.name, p.name) IS NOT NULL) THEN il.description ELSE NULL::character varying END AS description, COALESCE(pt.documentnote, p.documentnote) AS documentnote, p.upc, p.sku, COALESCE(pp.vendorproductno, p.value) AS productvalue, ra.description AS resourcedescription, CASE WHEN ((i.isdiscountprinted = 'Y'::bpchar) AND (il.pricelist <> (0)::numeric)) THEN il.pricelist ELSE NULL::numeric END AS pricelist, CASE WHEN (((i.isdiscountprinted = 'Y'::bpchar) AND (il.pricelist <> (0)::numeric)) AND (il.qtyentered <> (0)::numeric)) THEN ((il.pricelist * il.qtyinvoiced) / il.qtyentered) ELSE NULL::numeric END AS priceenteredlist, CASE WHEN (((i.isdiscountprinted = 'Y'::bpchar) AND (il.pricelist > il.priceactual)) AND (il.pricelist <> (0)::numeric)) THEN (((il.pricelist - il.priceactual) / il.pricelist) * (100)::numeric) ELSE NULL::numeric END AS discount, CASE WHEN ((il.priceactual <> (0)::numeric) OR (il.m_product_id IS NOT NULL)) THEN il.priceactual ELSE NULL::numeric END AS priceactual, CASE WHEN ((il.priceentered <> (0)::numeric) OR (il.m_product_id IS NOT NULL)) THEN il.priceentered ELSE NULL::numeric END AS priceentered, CASE WHEN ((il.linenetamt <> (0)::numeric) OR (il.m_product_id IS NOT NULL)) THEN il.linenetamt ELSE NULL::numeric END AS linenetamt, il.m_attributesetinstance_id, asi.m_attributeset_id, asi.serno, asi.lot, asi.m_lot_id, asi.guaranteedate, pt.description AS productdescription, p.imageurl, il.c_campaign_id, il.c_project_id, il.c_activity_id, il.c_projectphase_id, il.c_projecttask_id FROM (((((((((c_invoiceline il JOIN c_uom_trl uom ON ((il.c_uom_id = uom.c_uom_id))) JOIN c_invoice i ON ((il.c_invoice_id = i.c_invoice_id))) LEFT JOIN c_tax_trl t ON (((il.c_tax_id = t.c_tax_id) AND ((uom.ad_language)::text = (t.ad_language)::text)))) LEFT JOIN m_product p ON ((il.m_product_id = p.m_product_id))) LEFT JOIN c_charge c ON ((il.c_charge_id = c.c_charge_id))) LEFT JOIN c_bpartner_product pp ON (((il.m_product_id = pp.m_product_id) AND (i.c_bpartner_id = pp.c_bpartner_id)))) LEFT JOIN m_product_trl pt ON (((il.m_product_id = pt.m_product_id) AND ((uom.ad_language)::text = (pt.ad_language)::text)))) LEFT JOIN s_resourceassignment ra ON ((il.s_resourceassignment_id = ra.s_resourceassignment_id))) LEFT JOIN m_attributesetinstance asi ON ((il.m_attributesetinstance_id = asi.m_attributesetinstance_id))) UNION SELECT il.ad_client_id, il.ad_org_id, il.isactive, il.created, il.createdby, il.updated, il.updatedby, uom.ad_language, il.c_invoice_id, il.c_invoiceline_id, il.c_tax_id, il.taxamt, il.linetotalamt, t.taxindicator, (il.line + (b.line / 100)) AS line, p.m_product_id, (il.qtyinvoiced * b.bomqty) AS qtyinvoiced, (il.qtyentered * b.bomqty) AS qtyentered, uom.uomsymbol, COALESCE(pt.name, p.name) AS name, b.description, COALESCE(pt.documentnote, p.documentnote) AS documentnote, p.upc, p.sku, p.value AS productvalue, NULL::"unknown" AS resourcedescription, NULL::"unknown" AS pricelist, NULL::"unknown" AS priceenteredlist, NULL::"unknown" AS discount, NULL::"unknown" AS priceactual, NULL::"unknown" AS priceentered, NULL::"unknown" AS linenetamt, il.m_attributesetinstance_id, asi.m_attributeset_id, asi.serno, asi.lot, asi.m_lot_id, asi.guaranteedate, pt.description AS productdescription, p.imageurl, il.c_campaign_id, il.c_project_id, il.c_activity_id, il.c_projectphase_id, il.c_projecttask_id FROM (((((((m_product_bom b JOIN c_invoiceline il ON ((b.m_product_id = il.m_product_id))) JOIN m_product bp ON (((((bp.m_product_id = il.m_product_id) AND (bp.isbom = 'Y'::bpchar)) AND (bp.isverified = 'Y'::bpchar)) AND (bp.isinvoiceprintdetails = 'Y'::bpchar)))) JOIN m_product p ON ((b.m_productbom_id = p.m_product_id))) JOIN c_uom_trl uom ON ((p.c_uom_id = uom.c_uom_id))) JOIN m_product_trl pt ON (((b.m_productbom_id = pt.m_product_id) AND ((uom.ad_language)::text = (pt.ad_language)::text)))) LEFT JOIN c_tax t ON ((il.c_tax_id = t.c_tax_id))) LEFT JOIN m_attributesetinstance asi ON ((il.m_attributesetinstance_id = asi.m_attributesetinstance_id)))) UNION SELECT il.ad_client_id, il.ad_org_id, il.isactive, il.created, il.createdby, il.updated, il.updatedby, l.ad_language, il.c_invoice_id, il.c_invoiceline_id, NULL::"unknown" AS c_tax_id, NULL::"unknown" AS taxamt, NULL::"unknown" AS linetotalamt, NULL::"unknown" AS taxindicator, il.line, NULL::"unknown" AS m_product_id, NULL::"unknown" AS qtyinvoiced, NULL::"unknown" AS qtyentered, NULL::"unknown" AS uomsymbol, il.description AS name, NULL::"unknown" AS description, NULL::"unknown" AS documentnote, NULL::"unknown" AS upc, NULL::"unknown" AS sku, NULL::"unknown" AS productvalue, NULL::"unknown" AS resourcedescription, NULL::"unknown" AS pricelist, NULL::"unknown" AS priceenteredlist, NULL::"unknown" AS discount, NULL::"unknown" AS priceactual, NULL::"unknown" AS priceentered, NULL::"unknown" AS linenetamt, NULL::"unknown" AS m_attributesetinstance_id, NULL::"unknown" AS m_attributeset_id, NULL::"unknown" AS serno, NULL::"unknown" AS lot, NULL::"unknown" AS m_lot_id, NULL::"unknown" AS guaranteedate, NULL::"unknown" AS productdescription, NULL::"unknown" AS imageurl, NULL::"unknown" AS c_campaign_id, NULL::"unknown" AS c_project_id, NULL::"unknown" AS c_activity_id, NULL::"unknown" AS c_projectphase_id, NULL::"unknown" AS c_projecttask_id FROM c_invoiceline il, ad_language l WHERE (((il.c_uom_id IS NULL) AND (l.isbaselanguage = 'N'::bpchar)) AND (l.issystemlanguage = 'Y'::bpchar))) UNION SELECT i.ad_client_id, i.ad_org_id, i.isactive, i.created, i.createdby, i.updated, i.updatedby, l.ad_language, i.c_invoice_id, NULL::"unknown" AS c_invoiceline_id, NULL::"unknown" AS c_tax_id, NULL::"unknown" AS taxamt, NULL::"unknown" AS linetotalamt, NULL::"unknown" AS taxindicator, 9998 AS line, NULL::"unknown" AS m_product_id, NULL::"unknown" AS qtyinvoiced, NULL::"unknown" AS qtyentered, NULL::"unknown" AS uomsymbol, NULL::"unknown" AS name, NULL::"unknown" AS description, NULL::"unknown" AS documentnote, NULL::"unknown" AS upc, NULL::"unknown" AS sku, NULL::"unknown" AS productvalue, NULL::"unknown" AS resourcedescription, NULL::"unknown" AS pricelist, NULL::"unknown" AS priceenteredlist, NULL::"unknown" AS discount, NULL::"unknown" AS priceactual, NULL::"unknown" AS priceentered, NULL::"unknown" AS linenetamt, NULL::"unknown" AS m_attributesetinstance_id, NULL::"unknown" AS m_attributeset_id, NULL::"unknown" AS serno, NULL::"unknown" AS lot, NULL::"unknown" AS m_lot_id, NULL::"unknown" AS guaranteedate, NULL::"unknown" AS productdescription, NULL::"unknown" AS imageurl, NULL::"unknown" AS c_campaign_id, NULL::"unknown" AS c_project_id, NULL::"unknown" AS c_activity_id, NULL::"unknown" AS c_projectphase_id, NULL::"unknown" AS c_projecttask_id FROM c_invoice i, ad_language l WHERE ((l.isbaselanguage = 'N'::bpchar) AND (l.issystemlanguage = 'Y'::bpchar))) UNION SELECT it.ad_client_id, it.ad_org_id, it.isactive, it.created, it.createdby, it.updated, it.updatedby, t.ad_language, it.c_invoice_id, NULL::"unknown" AS c_invoiceline_id, it.c_tax_id, NULL::"unknown" AS taxamt, NULL::"unknown" AS linetotalamt, t.taxindicator, 9999 AS line, NULL::"unknown" AS m_product_id, NULL::"unknown" AS qtyinvoiced, NULL::"unknown" AS qtyentered, NULL::"unknown" AS uomsymbol, t.name, NULL::"unknown" AS description, NULL::"unknown" AS documentnote, NULL::"unknown" AS upc, NULL::"unknown" AS sku, NULL::"unknown" AS productvalue, NULL::"unknown" AS resourcedescription, NULL::"unknown" AS pricelist, NULL::"unknown" AS priceenteredlist, NULL::"unknown" AS discount, CASE WHEN (it.istaxincluded = 'Y'::bpchar) THEN it.taxamt ELSE it.taxbaseamt END AS priceactual, CASE WHEN (it.istaxincluded = 'Y'::bpchar) THEN it.taxamt ELSE it.taxbaseamt END AS priceentered, CASE WHEN (it.istaxincluded = 'Y'::bpchar) THEN NULL::numeric ELSE it.taxamt END AS linenetamt, NULL::"unknown" AS m_attributesetinstance_id, NULL::"unknown" AS m_attributeset_id, NULL::"unknown" AS serno, NULL::"unknown" AS lot, NULL::"unknown" AS m_lot_id, NULL::"unknown" AS guaranteedate, NULL::"unknown" AS productdescription, NULL::"unknown" AS imageurl, NULL::"unknown" AS c_campaign_id, NULL::"unknown" AS c_project_id, NULL::"unknown" AS c_activity_id, NULL::"unknown" AS c_projectphase_id, NULL::"unknown" AS c_projecttask_id FROM (c_invoicetax it JOIN c_tax_trl t ON ((it.c_tax_id = t.c_tax_id)));


ALTER TABLE adempiere.c_invoice_linetax_vt OWNER TO adempiere;

--
-- Name: c_invoice_v; Type: VIEW; Schema: adempiere; Owner: adempiere
--

CREATE VIEW c_invoice_v AS
    SELECT i.c_invoice_id, i.ad_client_id, i.ad_org_id, i.isactive, i.created, i.createdby, i.updated, i.updatedby, i.issotrx, i.documentno, i.docstatus, i.docaction, i.processing, i.processed, i.c_doctype_id, i.c_doctypetarget_id, i.c_order_id, i.description, i.isapproved, i.istransferred, i.salesrep_id, i.dateinvoiced, i.dateprinted, i.dateacct, i.c_bpartner_id, i.c_bpartner_location_id, i.ad_user_id, i.poreference, i.dateordered, i.c_currency_id, i.c_conversiontype_id, i.paymentrule, i.c_paymentterm_id, i.c_charge_id, i.m_pricelist_id, i.c_campaign_id, i.c_project_id, i.c_activity_id, i.isprinted, i.isdiscountprinted, i.ispaid, i.isindispute, i.ispayschedulevalid, 0 AS c_invoicepayschedule_id, i.invoicecollectiontype, CASE WHEN ((charat((d.docbasetype)::character varying, 3))::text = 'C'::text) THEN (i.chargeamt * (-1)::numeric) ELSE i.chargeamt END AS chargeamt, CASE WHEN ((charat((d.docbasetype)::character varying, 3))::text = 'C'::text) THEN (i.totallines * (-1)::numeric) ELSE i.totallines END AS totallines, CASE WHEN ((charat((d.docbasetype)::character varying, 3))::text = 'C'::text) THEN (i.grandtotal * (-1)::numeric) ELSE i.grandtotal END AS grandtotal, CASE WHEN ((charat((d.docbasetype)::character varying, 3))::text = 'C'::text) THEN -1.0 ELSE 1.0 END AS multiplier, CASE WHEN ((charat((d.docbasetype)::character varying, 2))::text = 'P'::text) THEN -1.0 ELSE 1.0 END AS multiplierap, d.docbasetype FROM (c_invoice i JOIN c_doctype d ON ((i.c_doctype_id = d.c_doctype_id))) WHERE (i.ispayschedulevalid <> 'Y'::bpchar) UNION SELECT i.c_invoice_id, i.ad_client_id, i.ad_org_id, i.isactive, i.created, i.createdby, i.updated, i.updatedby, i.issotrx, i.documentno, i.docstatus, i.docaction, i.processing, i.processed, i.c_doctype_id, i.c_doctypetarget_id, i.c_order_id, i.description, i.isapproved, i.istransferred, i.salesrep_id, i.dateinvoiced, i.dateprinted, i.dateacct, i.c_bpartner_id, i.c_bpartner_location_id, i.ad_user_id, i.poreference, i.dateordered, i.c_currency_id, i.c_conversiontype_id, i.paymentrule, i.c_paymentterm_id, i.c_charge_id, i.m_pricelist_id, i.c_campaign_id, i.c_project_id, i.c_activity_id, i.isprinted, i.isdiscountprinted, i.ispaid, i.isindispute, i.ispayschedulevalid, ips.c_invoicepayschedule_id, i.invoicecollectiontype, 0 AS chargeamt, 0 AS totallines, CASE WHEN ((charat((d.docbasetype)::character varying, 3))::text = 'C'::text) THEN (ips.dueamt * (-1)::numeric) ELSE ips.dueamt END AS grandtotal, CASE WHEN ((charat((d.docbasetype)::character varying, 3))::text = 'C'::text) THEN -1.0 ELSE 1.0 END AS multiplier, CASE WHEN ((charat((d.docbasetype)::character varying, 2))::text = 'P'::text) THEN -1.0 ELSE 1.0 END AS multiplierap, d.docbasetype FROM ((c_invoice i JOIN c_doctype d ON ((i.c_doctype_id = d.c_doctype_id))) JOIN c_invoicepayschedule ips ON ((i.c_invoice_id = ips.c_invoice_id))) WHERE ((i.ispayschedulevalid = 'Y'::bpchar) AND (ips.isvalid = 'Y'::bpchar));


ALTER TABLE adempiere.c_invoice_v OWNER TO adempiere;

--
-- Name: c_invoice_v1; Type: VIEW; Schema: adempiere; Owner: adempiere
--

CREATE VIEW c_invoice_v1 AS
    SELECT i.c_invoice_id, i.ad_client_id, i.ad_org_id, i.isactive, i.created, i.createdby, i.updated, i.updatedby, i.issotrx, i.documentno, i.docstatus, i.docaction, i.processing, i.processed, i.c_doctype_id, i.c_doctypetarget_id, i.c_order_id, i.description, i.isapproved, i.istransferred, i.salesrep_id, i.dateinvoiced, i.dateprinted, i.dateacct, i.c_bpartner_id, i.c_bpartner_location_id, i.ad_user_id, i.poreference, i.dateordered, i.c_currency_id, i.c_conversiontype_id, i.paymentrule, i.c_paymentterm_id, i.c_charge_id, i.m_pricelist_id, i.c_campaign_id, i.c_project_id, i.c_activity_id, i.isprinted, i.isdiscountprinted, i.ispaid, i.isindispute, i.ispayschedulevalid, 0 AS c_invoicepayschedule_id, i.invoicecollectiontype, CASE WHEN ((charat((d.docbasetype)::character varying, 3))::text = 'C'::text) THEN (i.chargeamt * (-1)::numeric) ELSE i.chargeamt END AS chargeamt, CASE WHEN ((charat((d.docbasetype)::character varying, 3))::text = 'C'::text) THEN (i.totallines * (-1)::numeric) ELSE i.totallines END AS totallines, CASE WHEN ((charat((d.docbasetype)::character varying, 3))::text = 'C'::text) THEN (i.grandtotal * (-1)::numeric) ELSE i.grandtotal END AS grandtotal, CASE WHEN ((charat((d.docbasetype)::character varying, 3))::text = 'C'::text) THEN -1.0 ELSE 1.0 END AS multiplier, CASE WHEN ((charat((d.docbasetype)::character varying, 2))::text = 'P'::text) THEN -1.0 ELSE 1.0 END AS multiplierap, d.docbasetype FROM (c_invoice i JOIN c_doctype d ON ((i.c_doctype_id = d.c_doctype_id)));


ALTER TABLE adempiere.c_invoice_v1 OWNER TO adempiere;

--
-- Name: c_invoiceline_v; Type: VIEW; Schema: adempiere; Owner: adempiere
--

CREATE VIEW c_invoiceline_v AS
    SELECT il.ad_client_id, il.ad_org_id, il.c_invoiceline_id, i.c_invoice_id, i.salesrep_id, i.c_bpartner_id, il.m_product_id, i.documentno, i.dateinvoiced, i.dateacct, i.issotrx, i.docstatus, round((i.multiplier * il.linenetamt), 2) AS linenetamt, round(((i.multiplier * il.pricelist) * il.qtyinvoiced), 2) AS linelistamt, CASE WHEN (COALESCE(il.pricelimit, (0)::numeric) = (0)::numeric) THEN round((i.multiplier * il.linenetamt), 2) ELSE round(((i.multiplier * il.pricelimit) * il.qtyinvoiced), 2) END AS linelimitamt, round((((i.multiplier * il.pricelist) * il.qtyinvoiced) - il.linenetamt), 2) AS linediscountamt, CASE WHEN (COALESCE(il.pricelimit, (0)::numeric) = (0)::numeric) THEN (0)::numeric ELSE round(((i.multiplier * il.linenetamt) - (il.pricelimit * il.qtyinvoiced)), 2) END AS lineoverlimitamt, il.qtyinvoiced, il.qtyentered, il.line, il.c_orderline_id, il.c_uom_id, il.c_campaign_id, il.c_project_id, il.c_activity_id, il.c_projectphase_id, il.c_projecttask_id FROM c_invoice_v i, c_invoiceline il WHERE (i.c_invoice_id = il.c_invoice_id);


ALTER TABLE adempiere.c_invoiceline_v OWNER TO adempiere;

--
-- Name: c_order_header_v; Type: VIEW; Schema: adempiere; Owner: adempiere
--

CREATE VIEW c_order_header_v AS
    SELECT o.ad_client_id, o.ad_org_id, o.isactive, o.created, o.createdby, o.updated, o.updatedby, 'en_US' AS ad_language, o.c_order_id, o.issotrx, o.documentno, o.docstatus, o.c_doctype_id, o.c_bpartner_id, bp.value AS bpvalue, bp.taxid AS bptaxid, bp.naics, bp.duns, oi.c_location_id AS org_location_id, oi.taxid, o.m_warehouse_id, wh.c_location_id AS warehouse_location_id, dt.printname AS documenttype, dt.documentnote AS documenttypenote, o.salesrep_id, COALESCE(ubp.name, u.name) AS salesrep_name, o.dateordered, o.datepromised, bpg.greeting AS bpgreeting, bp.name, bp.name2, bpcg.greeting AS bpcontactgreeting, bpc.title, bpc.phone, NULLIF((bpc.name)::text, (bp.name)::text) AS contactname, bpl.c_location_id, ((l.postal)::text || (l.postal_add)::text) AS postal, bp.referenceno, o.bill_bpartner_id, o.bill_location_id, o.bill_user_id, bbp.value AS bill_bpvalue, bbp.taxid AS bill_bptaxid, bbp.name AS bill_name, bbp.name2 AS bill_name2, bbpc.title AS bill_title, bbpc.phone AS bill_phone, NULLIF((bbpc.name)::text, (bbp.name)::text) AS bill_contactname, bbpl.c_location_id AS bill_c_location_id, o.description, o.poreference, o.c_currency_id, pt.name AS paymentterm, pt.documentnote AS paymenttermnote, o.c_charge_id, o.chargeamt, o.totallines, o.grandtotal, o.grandtotal AS amtinwords, o.m_pricelist_id, o.istaxincluded, o.volume, o.weight, o.c_campaign_id, o.c_project_id, o.c_activity_id, o.m_shipper_id, o.deliveryrule, o.deliveryviarule, o.priorityrule, o.invoicerule FROM (((((((((((((((c_order o JOIN c_doctype dt ON ((o.c_doctype_id = dt.c_doctype_id))) JOIN m_warehouse wh ON ((o.m_warehouse_id = wh.m_warehouse_id))) JOIN c_paymentterm pt ON ((o.c_paymentterm_id = pt.c_paymentterm_id))) JOIN c_bpartner bp ON ((o.c_bpartner_id = bp.c_bpartner_id))) LEFT JOIN c_greeting bpg ON ((bp.c_greeting_id = bpg.c_greeting_id))) JOIN c_bpartner_location bpl ON ((o.c_bpartner_location_id = bpl.c_bpartner_location_id))) JOIN c_location l ON ((bpl.c_location_id = l.c_location_id))) LEFT JOIN ad_user bpc ON ((o.ad_user_id = bpc.ad_user_id))) LEFT JOIN c_greeting bpcg ON ((bpc.c_greeting_id = bpcg.c_greeting_id))) JOIN ad_orginfo oi ON ((o.ad_org_id = oi.ad_org_id))) LEFT JOIN ad_user u ON ((o.salesrep_id = u.ad_user_id))) LEFT JOIN c_bpartner ubp ON ((u.c_bpartner_id = ubp.c_bpartner_id))) JOIN c_bpartner bbp ON ((o.bill_bpartner_id = bbp.c_bpartner_id))) JOIN c_bpartner_location bbpl ON ((o.bill_location_id = bbpl.c_bpartner_location_id))) LEFT JOIN ad_user bbpc ON ((o.bill_user_id = bbpc.ad_user_id)));


ALTER TABLE adempiere.c_order_header_v OWNER TO adempiere;

--
-- Name: c_order_header_vt; Type: VIEW; Schema: adempiere; Owner: adempiere
--

CREATE VIEW c_order_header_vt AS
    SELECT o.ad_client_id, o.ad_org_id, o.isactive, o.created, o.createdby, o.updated, o.updatedby, dt.ad_language, o.c_order_id, o.issotrx, o.documentno, o.docstatus, o.c_doctype_id, o.c_bpartner_id, bp.value AS bpvalue, bp.taxid AS bptaxid, bp.naics, bp.duns, oi.c_location_id AS org_location_id, oi.taxid, o.m_warehouse_id, wh.c_location_id AS warehouse_location_id, dt.printname AS documenttype, dt.documentnote AS documenttypenote, o.salesrep_id, COALESCE(ubp.name, u.name) AS salesrep_name, o.dateordered, o.datepromised, bpg.greeting AS bpgreeting, bp.name, bp.name2, bpcg.greeting AS bpcontactgreeting, bpc.title, bpc.phone, NULLIF((bpc.name)::text, (bp.name)::text) AS contactname, bpl.c_location_id, ((l.postal)::text || (l.postal_add)::text) AS postal, bp.referenceno, o.bill_bpartner_id, o.bill_location_id, o.bill_user_id, bbp.value AS bill_bpvalue, bbp.taxid AS bill_bptaxid, bbp.name AS bill_name, bbp.name2 AS bill_name2, bbpc.title AS bill_title, bbpc.phone AS bill_phone, NULLIF((bbpc.name)::text, (bbp.name)::text) AS bill_contactname, bbpl.c_location_id AS bill_c_location_id, o.description, o.poreference, o.c_currency_id, pt.name AS paymentterm, pt.documentnote AS paymenttermnote, o.c_charge_id, o.chargeamt, o.totallines, o.grandtotal, o.grandtotal AS amtinwords, o.m_pricelist_id, o.istaxincluded, o.volume, o.weight, o.c_campaign_id, o.c_project_id, o.c_activity_id, o.m_shipper_id, o.deliveryrule, o.deliveryviarule, o.priorityrule, o.invoicerule FROM (((((((((((((((c_order o JOIN c_doctype_trl dt ON ((o.c_doctype_id = dt.c_doctype_id))) JOIN m_warehouse wh ON ((o.m_warehouse_id = wh.m_warehouse_id))) JOIN c_paymentterm_trl pt ON (((o.c_paymentterm_id = pt.c_paymentterm_id) AND ((dt.ad_language)::text = (pt.ad_language)::text)))) JOIN c_bpartner bp ON ((o.c_bpartner_id = bp.c_bpartner_id))) LEFT JOIN c_greeting_trl bpg ON (((bp.c_greeting_id = bpg.c_greeting_id) AND ((dt.ad_language)::text = (bpg.ad_language)::text)))) JOIN c_bpartner_location bpl ON ((o.c_bpartner_location_id = bpl.c_bpartner_location_id))) JOIN c_location l ON ((bpl.c_location_id = l.c_location_id))) LEFT JOIN ad_user bpc ON ((o.ad_user_id = bpc.ad_user_id))) LEFT JOIN c_greeting_trl bpcg ON (((bpc.c_greeting_id = bpcg.c_greeting_id) AND ((dt.ad_language)::text = (bpcg.ad_language)::text)))) JOIN ad_orginfo oi ON ((o.ad_org_id = oi.ad_org_id))) LEFT JOIN ad_user u ON ((o.salesrep_id = u.ad_user_id))) LEFT JOIN c_bpartner ubp ON ((u.c_bpartner_id = ubp.c_bpartner_id))) JOIN c_bpartner bbp ON ((o.bill_bpartner_id = bbp.c_bpartner_id))) JOIN c_bpartner_location bbpl ON ((o.bill_location_id = bbpl.c_bpartner_location_id))) LEFT JOIN ad_user bbpc ON ((o.bill_user_id = bbpc.ad_user_id)));


ALTER TABLE adempiere.c_order_header_vt OWNER TO adempiere;

--
-- Name: c_order_linetax_v; Type: VIEW; Schema: adempiere; Owner: adempiere
--

CREATE VIEW c_order_linetax_v AS
    ((SELECT ol.ad_client_id, ol.ad_org_id, ol.isactive, ol.created, ol.createdby, ol.updated, ol.updatedby, 'en_US' AS ad_language, ol.c_order_id, ol.c_orderline_id, ol.c_tax_id, t.taxindicator, ol.c_bpartner_id, ol.c_bpartner_location_id, bp.name AS bpname, bpl.c_location_id, ol.line, p.m_product_id, CASE WHEN ((ol.qtyordered <> (0)::numeric) OR (ol.m_product_id IS NOT NULL)) THEN ol.qtyordered ELSE NULL::numeric END AS qtyordered, CASE WHEN ((ol.qtyentered <> (0)::numeric) OR (ol.m_product_id IS NOT NULL)) THEN ol.qtyentered ELSE NULL::numeric END AS qtyentered, CASE WHEN ((ol.qtyentered <> (0)::numeric) OR (ol.m_product_id IS NOT NULL)) THEN uom.uomsymbol ELSE NULL::character varying END AS uomsymbol, COALESCE(c.name, (((p.name)::text || (productattribute(ol.m_attributesetinstance_id))::text))::character varying, ol.description) AS name, CASE WHEN (COALESCE(c.name, p.name) IS NOT NULL) THEN ol.description ELSE NULL::character varying END AS description, p.documentnote, p.upc, p.sku, COALESCE(pp.vendorproductno, p.value) AS productvalue, ra.description AS resourcedescription, CASE WHEN ((i.isdiscountprinted = 'Y'::bpchar) AND (ol.pricelist <> (0)::numeric)) THEN ol.pricelist ELSE NULL::numeric END AS pricelist, CASE WHEN (((i.isdiscountprinted = 'Y'::bpchar) AND (ol.pricelist <> (0)::numeric)) AND (ol.qtyentered <> (0)::numeric)) THEN ((ol.pricelist * ol.qtyordered) / ol.qtyentered) ELSE NULL::numeric END AS priceenteredlist, CASE WHEN (((i.isdiscountprinted = 'Y'::bpchar) AND (ol.pricelist > ol.priceactual)) AND (ol.pricelist <> (0)::numeric)) THEN (((ol.pricelist - ol.priceactual) / ol.pricelist) * (100)::numeric) ELSE NULL::numeric END AS discount, CASE WHEN ((ol.priceactual <> (0)::numeric) OR (ol.m_product_id IS NOT NULL)) THEN ol.priceactual ELSE NULL::numeric END AS priceactual, CASE WHEN ((ol.priceentered <> (0)::numeric) OR (ol.m_product_id IS NOT NULL)) THEN ol.priceentered ELSE NULL::numeric END AS priceentered, CASE WHEN ((ol.linenetamt <> (0)::numeric) OR (ol.m_product_id IS NOT NULL)) THEN ol.linenetamt ELSE NULL::numeric END AS linenetamt, p.description AS productdescription, p.imageurl, ol.c_campaign_id, ol.c_project_id, ol.c_activity_id, ol.c_projectphase_id, ol.c_projecttask_id FROM (((((((((c_orderline ol JOIN c_uom uom ON ((ol.c_uom_id = uom.c_uom_id))) JOIN c_order i ON ((ol.c_order_id = i.c_order_id))) LEFT JOIN m_product p ON ((ol.m_product_id = p.m_product_id))) LEFT JOIN s_resourceassignment ra ON ((ol.s_resourceassignment_id = ra.s_resourceassignment_id))) LEFT JOIN c_charge c ON ((ol.c_charge_id = c.c_charge_id))) LEFT JOIN c_bpartner_product pp ON (((ol.m_product_id = pp.m_product_id) AND (i.c_bpartner_id = pp.c_bpartner_id)))) JOIN c_bpartner bp ON ((ol.c_bpartner_id = bp.c_bpartner_id))) JOIN c_bpartner_location bpl ON ((ol.c_bpartner_location_id = bpl.c_bpartner_location_id))) LEFT JOIN c_tax t ON ((ol.c_tax_id = t.c_tax_id))) UNION SELECT ol.ad_client_id, ol.ad_org_id, ol.isactive, ol.created, ol.createdby, ol.updated, ol.updatedby, 'en_US' AS ad_language, ol.c_order_id, ol.c_orderline_id, ol.c_tax_id, NULL::"unknown" AS taxindicator, NULL::"unknown" AS c_bpartner_id, NULL::"unknown" AS c_bpartner_location_id, NULL::"unknown" AS bpname, NULL::"unknown" AS c_location_id, (ol.line + (b.line / 100)) AS line, p.m_product_id, (ol.qtyordered * b.bomqty) AS qtyordered, (ol.qtyentered * b.bomqty) AS qtyentered, uom.uomsymbol, p.name, b.description, p.documentnote, p.upc, p.sku, p.value AS productvalue, NULL::"unknown" AS resourcedescription, NULL::"unknown" AS pricelist, NULL::"unknown" AS priceenteredlist, NULL::"unknown" AS discount, NULL::"unknown" AS priceactual, NULL::"unknown" AS priceentered, NULL::"unknown" AS linenetamt, p.description AS productdescription, p.imageurl, ol.c_campaign_id, ol.c_project_id, ol.c_activity_id, ol.c_projectphase_id, ol.c_projecttask_id FROM ((((m_product_bom b JOIN c_orderline ol ON ((b.m_product_id = ol.m_product_id))) JOIN m_product bp ON (((((bp.m_product_id = ol.m_product_id) AND (bp.isbom = 'Y'::bpchar)) AND (bp.isverified = 'Y'::bpchar)) AND (bp.isinvoiceprintdetails = 'Y'::bpchar)))) JOIN m_product p ON ((b.m_productbom_id = p.m_product_id))) JOIN c_uom uom ON ((p.c_uom_id = uom.c_uom_id)))) UNION SELECT c_order.ad_client_id, c_order.ad_org_id, c_order.isactive, c_order.created, c_order.createdby, c_order.updated, c_order.updatedby, 'en_US' AS ad_language, c_order.c_order_id, NULL::"unknown" AS c_orderline_id, NULL::"unknown" AS c_tax_id, NULL::"unknown" AS taxindicator, NULL::"unknown" AS c_bpartner_id, NULL::"unknown" AS c_bpartner_location_id, NULL::"unknown" AS bpname, NULL::"unknown" AS c_location_id, NULL::"unknown" AS line, NULL::"unknown" AS m_product_id, NULL::"unknown" AS qtyordered, NULL::"unknown" AS qtyentered, NULL::"unknown" AS uomsymbol, NULL::"unknown" AS name, NULL::"unknown" AS description, NULL::"unknown" AS documentnote, NULL::"unknown" AS upc, NULL::"unknown" AS sku, NULL::"unknown" AS productvalue, NULL::"unknown" AS resourcedescription, NULL::"unknown" AS pricelist, NULL::"unknown" AS priceenteredlist, NULL::"unknown" AS discount, NULL::"unknown" AS priceactual, NULL::"unknown" AS priceentered, NULL::"unknown" AS linenetamt, NULL::"unknown" AS productdescription, NULL::"unknown" AS imageurl, NULL::"unknown" AS c_campaign_id, NULL::"unknown" AS c_project_id, NULL::"unknown" AS c_activity_id, NULL::"unknown" AS c_projectphase_id, NULL::"unknown" AS c_projecttask_id FROM c_order) UNION SELECT ot.ad_client_id, ot.ad_org_id, ot.isactive, ot.created, ot.createdby, ot.updated, ot.updatedby, 'en_US' AS ad_language, ot.c_order_id, NULL::"unknown" AS c_orderline_id, ot.c_tax_id, t.taxindicator, NULL::"unknown" AS c_bpartner_id, NULL::"unknown" AS c_bpartner_location_id, NULL::"unknown" AS bpname, NULL::"unknown" AS c_location_id, NULL::"unknown" AS line, NULL::"unknown" AS m_product_id, NULL::"unknown" AS qtyordered, NULL::"unknown" AS qtyentered, NULL::"unknown" AS uomsymbol, t.name, NULL::"unknown" AS description, NULL::"unknown" AS documentnote, NULL::"unknown" AS upc, NULL::"unknown" AS sku, NULL::"unknown" AS productvalue, NULL::"unknown" AS resourcedescription, NULL::"unknown" AS pricelist, NULL::"unknown" AS priceenteredlist, NULL::"unknown" AS discount, CASE WHEN (ot.istaxincluded = 'Y'::bpchar) THEN ot.taxamt ELSE ot.taxbaseamt END AS priceactual, CASE WHEN (ot.istaxincluded = 'Y'::bpchar) THEN ot.taxamt ELSE ot.taxbaseamt END AS priceentered, CASE WHEN (ot.istaxincluded = 'Y'::bpchar) THEN NULL::numeric ELSE ot.taxamt END AS linenetamt, NULL::"unknown" AS productdescription, NULL::"unknown" AS imageurl, NULL::"unknown" AS c_campaign_id, NULL::"unknown" AS c_project_id, NULL::"unknown" AS c_activity_id, NULL::"unknown" AS c_projectphase_id, NULL::"unknown" AS c_projecttask_id FROM (c_ordertax ot JOIN c_tax t ON ((ot.c_tax_id = t.c_tax_id)));


ALTER TABLE adempiere.c_order_linetax_v OWNER TO adempiere;

--
-- Name: c_order_linetax_vt; Type: VIEW; Schema: adempiere; Owner: adempiere
--

CREATE VIEW c_order_linetax_vt AS
    ((SELECT ol.ad_client_id, ol.ad_org_id, ol.isactive, ol.created, ol.createdby, ol.updated, ol.updatedby, uom.ad_language, ol.c_order_id, ol.c_orderline_id, ol.c_tax_id, t.taxindicator, ol.c_bpartner_id, ol.c_bpartner_location_id, bp.name AS bpname, bpl.c_location_id, ol.line, p.m_product_id, CASE WHEN ((ol.qtyordered <> (0)::numeric) OR (ol.m_product_id IS NOT NULL)) THEN ol.qtyordered ELSE NULL::numeric END AS qtyordered, CASE WHEN ((ol.qtyentered <> (0)::numeric) OR (ol.m_product_id IS NOT NULL)) THEN ol.qtyentered ELSE NULL::numeric END AS qtyentered, CASE WHEN ((ol.qtyentered <> (0)::numeric) OR (ol.m_product_id IS NOT NULL)) THEN uom.uomsymbol ELSE NULL::character varying END AS uomsymbol, COALESCE(c.name, (((p.name)::text || (productattribute(ol.m_attributesetinstance_id))::text))::character varying, ol.description) AS name, CASE WHEN (COALESCE(c.name, pt.name, p.name) IS NOT NULL) THEN ol.description ELSE NULL::character varying END AS description, COALESCE(pt.documentnote, p.documentnote) AS documentnote, p.upc, p.sku, COALESCE(pp.vendorproductno, p.value) AS productvalue, ra.description AS resourcedescription, CASE WHEN ((i.isdiscountprinted = 'Y'::bpchar) AND (ol.pricelist <> (0)::numeric)) THEN ol.pricelist ELSE NULL::numeric END AS pricelist, CASE WHEN (((i.isdiscountprinted = 'Y'::bpchar) AND (ol.pricelist <> (0)::numeric)) AND (ol.qtyentered <> (0)::numeric)) THEN ((ol.pricelist * ol.qtyordered) / ol.qtyentered) ELSE NULL::numeric END AS priceenteredlist, CASE WHEN (((i.isdiscountprinted = 'Y'::bpchar) AND (ol.pricelist > ol.priceactual)) AND (ol.pricelist <> (0)::numeric)) THEN (((ol.pricelist - ol.priceactual) / ol.pricelist) * (100)::numeric) ELSE NULL::numeric END AS discount, CASE WHEN ((ol.priceactual <> (0)::numeric) OR (ol.m_product_id IS NOT NULL)) THEN ol.priceactual ELSE NULL::numeric END AS priceactual, CASE WHEN ((ol.priceentered <> (0)::numeric) OR (ol.m_product_id IS NOT NULL)) THEN ol.priceentered ELSE NULL::numeric END AS priceentered, CASE WHEN ((ol.linenetamt <> (0)::numeric) OR (ol.m_product_id IS NOT NULL)) THEN ol.linenetamt ELSE NULL::numeric END AS linenetamt, pt.description AS productdescription, p.imageurl, ol.c_campaign_id, ol.c_project_id, ol.c_activity_id, ol.c_projectphase_id, ol.c_projecttask_id FROM ((((((((((c_orderline ol JOIN c_uom_trl uom ON ((ol.c_uom_id = uom.c_uom_id))) JOIN c_order i ON ((ol.c_order_id = i.c_order_id))) LEFT JOIN m_product p ON ((ol.m_product_id = p.m_product_id))) LEFT JOIN m_product_trl pt ON (((ol.m_product_id = pt.m_product_id) AND ((uom.ad_language)::text = (pt.ad_language)::text)))) LEFT JOIN s_resourceassignment ra ON ((ol.s_resourceassignment_id = ra.s_resourceassignment_id))) LEFT JOIN c_charge c ON ((ol.c_charge_id = c.c_charge_id))) LEFT JOIN c_bpartner_product pp ON (((ol.m_product_id = pp.m_product_id) AND (i.c_bpartner_id = pp.c_bpartner_id)))) JOIN c_bpartner bp ON ((ol.c_bpartner_id = bp.c_bpartner_id))) JOIN c_bpartner_location bpl ON ((ol.c_bpartner_location_id = bpl.c_bpartner_location_id))) LEFT JOIN c_tax_trl t ON (((ol.c_tax_id = t.c_tax_id) AND ((uom.ad_language)::text = (t.ad_language)::text)))) UNION SELECT ol.ad_client_id, ol.ad_org_id, ol.isactive, ol.created, ol.createdby, ol.updated, ol.updatedby, uom.ad_language, ol.c_order_id, ol.c_orderline_id, ol.c_tax_id, NULL::"unknown" AS taxindicator, NULL::"unknown" AS c_bpartner_id, NULL::"unknown" AS c_bpartner_location_id, NULL::"unknown" AS bpname, NULL::"unknown" AS c_location_id, (ol.line + (b.line / 100)) AS line, p.m_product_id, (ol.qtyordered * b.bomqty) AS qtyordered, (ol.qtyentered * b.bomqty) AS qtyentered, uom.uomsymbol, COALESCE(pt.name, p.name) AS name, b.description, COALESCE(pt.documentnote, p.documentnote) AS documentnote, p.upc, p.sku, p.value AS productvalue, NULL::"unknown" AS resourcedescription, NULL::"unknown" AS pricelist, NULL::"unknown" AS priceenteredlist, NULL::"unknown" AS discount, NULL::"unknown" AS priceactual, NULL::"unknown" AS priceentered, NULL::"unknown" AS linenetamt, pt.description AS productdescription, p.imageurl, ol.c_campaign_id, ol.c_project_id, ol.c_activity_id, ol.c_projectphase_id, ol.c_projecttask_id FROM (((((m_product_bom b JOIN c_orderline ol ON ((b.m_product_id = ol.m_product_id))) JOIN m_product bp ON (((((bp.m_product_id = ol.m_product_id) AND (bp.isbom = 'Y'::bpchar)) AND (bp.isverified = 'Y'::bpchar)) AND (bp.isinvoiceprintdetails = 'Y'::bpchar)))) JOIN m_product p ON ((b.m_productbom_id = p.m_product_id))) JOIN c_uom_trl uom ON ((p.c_uom_id = uom.c_uom_id))) JOIN m_product_trl pt ON (((b.m_productbom_id = pt.m_product_id) AND ((uom.ad_language)::text = (pt.ad_language)::text))))) UNION SELECT o.ad_client_id, o.ad_org_id, o.isactive, o.created, o.createdby, o.updated, o.updatedby, l.ad_language, o.c_order_id, NULL::"unknown" AS c_orderline_id, NULL::"unknown" AS c_tax_id, NULL::"unknown" AS taxindicator, NULL::"unknown" AS c_bpartner_id, NULL::"unknown" AS c_bpartner_location_id, NULL::"unknown" AS bpname, NULL::"unknown" AS c_location_id, NULL::"unknown" AS line, NULL::"unknown" AS m_product_id, NULL::"unknown" AS qtyordered, NULL::"unknown" AS qtyentered, NULL::"unknown" AS uomsymbol, NULL::"unknown" AS name, NULL::"unknown" AS description, NULL::"unknown" AS documentnote, NULL::"unknown" AS upc, NULL::"unknown" AS sku, NULL::"unknown" AS productvalue, NULL::"unknown" AS resourcedescription, NULL::"unknown" AS pricelist, NULL::"unknown" AS priceenteredlist, NULL::"unknown" AS discount, NULL::"unknown" AS priceactual, NULL::"unknown" AS priceentered, NULL::"unknown" AS linenetamt, NULL::"unknown" AS productdescription, NULL::"unknown" AS imageurl, NULL::"unknown" AS c_campaign_id, NULL::"unknown" AS c_project_id, NULL::"unknown" AS c_activity_id, NULL::"unknown" AS c_projectphase_id, NULL::"unknown" AS c_projecttask_id FROM c_order o, ad_language l WHERE ((l.isbaselanguage = 'N'::bpchar) AND (l.issystemlanguage = 'Y'::bpchar))) UNION SELECT ot.ad_client_id, ot.ad_org_id, ot.isactive, ot.created, ot.createdby, ot.updated, ot.updatedby, t.ad_language, ot.c_order_id, NULL::"unknown" AS c_orderline_id, ot.c_tax_id, t.taxindicator, NULL::"unknown" AS c_bpartner_id, NULL::"unknown" AS c_bpartner_location_id, NULL::"unknown" AS bpname, NULL::"unknown" AS c_location_id, NULL::"unknown" AS line, NULL::"unknown" AS m_product_id, NULL::"unknown" AS qtyordered, NULL::"unknown" AS qtyentered, NULL::"unknown" AS uomsymbol, t.name, NULL::"unknown" AS description, NULL::"unknown" AS documentnote, NULL::"unknown" AS upc, NULL::"unknown" AS sku, NULL::"unknown" AS productvalue, NULL::"unknown" AS resourcedescription, NULL::"unknown" AS pricelist, NULL::"unknown" AS priceenteredlist, NULL::"unknown" AS discount, CASE WHEN (ot.istaxincluded = 'Y'::bpchar) THEN ot.taxamt ELSE ot.taxbaseamt END AS priceactual, CASE WHEN (ot.istaxincluded = 'Y'::bpchar) THEN ot.taxamt ELSE ot.taxbaseamt END AS priceentered, CASE WHEN (ot.istaxincluded = 'Y'::bpchar) THEN NULL::numeric ELSE ot.taxamt END AS linenetamt, NULL::"unknown" AS productdescription, NULL::"unknown" AS imageurl, NULL::"unknown" AS c_campaign_id, NULL::"unknown" AS c_project_id, NULL::"unknown" AS c_activity_id, NULL::"unknown" AS c_projectphase_id, NULL::"unknown" AS c_projecttask_id FROM (c_ordertax ot JOIN c_tax_trl t ON ((ot.c_tax_id = t.c_tax_id)));


ALTER TABLE adempiere.c_order_linetax_vt OWNER TO adempiere;

--
-- Name: c_payment_v; Type: VIEW; Schema: adempiere; Owner: adempiere
--

CREATE VIEW c_payment_v AS
    SELECT c_payment.c_payment_id, c_payment.ad_client_id, c_payment.ad_org_id, c_payment.isactive, c_payment.created, c_payment.createdby, c_payment.updated, c_payment.updatedby, c_payment.documentno, c_payment.datetrx, c_payment.isreceipt, c_payment.c_doctype_id, c_payment.trxtype, c_payment.c_bankaccount_id, c_payment.c_bpartner_id, c_payment.c_invoice_id, c_payment.c_bp_bankaccount_id, c_payment.c_paymentbatch_id, c_payment.tendertype, c_payment.creditcardtype, c_payment.creditcardnumber, c_payment.creditcardvv, c_payment.creditcardexpmm, c_payment.creditcardexpyy, c_payment.micr, c_payment.routingno, c_payment.accountno, c_payment.checkno, c_payment.a_name, c_payment.a_street, c_payment.a_city, c_payment.a_state, c_payment.a_zip, c_payment.a_ident_dl, c_payment.a_ident_ssn, c_payment.a_email, c_payment.voiceauthcode, c_payment.orig_trxid, c_payment.ponum, c_payment.c_currency_id, c_payment.c_conversiontype_id, CASE c_payment.isreceipt WHEN 'Y'::bpchar THEN c_payment.payamt ELSE (c_payment.payamt * (-1)::numeric) END AS payamt, CASE c_payment.isreceipt WHEN 'Y'::bpchar THEN c_payment.discountamt ELSE (c_payment.discountamt * (-1)::numeric) END AS discountamt, CASE c_payment.isreceipt WHEN 'Y'::bpchar THEN c_payment.writeoffamt ELSE (c_payment.writeoffamt * (-1)::numeric) END AS writeoffamt, CASE c_payment.isreceipt WHEN 'Y'::bpchar THEN c_payment.taxamt ELSE (c_payment.taxamt * (-1)::numeric) END AS taxamt, CASE c_payment.isreceipt WHEN 'Y'::bpchar THEN c_payment.overunderamt ELSE (c_payment.overunderamt * (-1)::numeric) END AS overunderamt, CASE c_payment.isreceipt WHEN 'Y'::bpchar THEN 1.0 ELSE -1.0 END AS multiplierap, c_payment.isoverunderpayment, c_payment.isapproved, c_payment.r_pnref, c_payment.r_result, c_payment.r_respmsg, c_payment.r_authcode, c_payment.r_avsaddr, c_payment.r_avszip, c_payment.r_info, c_payment.processing, c_payment.oprocessing, c_payment.docstatus, c_payment.docaction, c_payment.isprepayment, c_payment.c_charge_id, c_payment.isreconciled, c_payment.isallocated, c_payment.isonline, c_payment.processed, c_payment.posted, c_payment.c_campaign_id, c_payment.c_project_id, c_payment.c_activity_id FROM c_payment;


ALTER TABLE adempiere.c_payment_v OWNER TO adempiere;

--
-- Name: c_payselection_check_v; Type: VIEW; Schema: adempiere; Owner: adempiere
--

CREATE VIEW c_payselection_check_v AS
    SELECT psc.ad_client_id, psc.ad_org_id, 'en_US' AS ad_language, psc.c_payselection_id, psc.c_payselectioncheck_id, oi.c_location_id AS org_location_id, oi.taxid, 0 AS c_doctype_id, bp.c_bpartner_id, bp.value AS bpvalue, bp.taxid AS bptaxid, bp.naics, bp.duns, bpg.greeting AS bpgreeting, bp.name, bp.name2, bpartnerremitlocation(bp.c_bpartner_id) AS c_location_id, bp.referenceno, bp.poreference, ps.paydate, psc.payamt, psc.payamt AS amtinwords, psc.qty, psc.paymentrule, psc.documentno FROM ((((c_payselectioncheck psc JOIN c_payselection ps ON ((psc.c_payselection_id = ps.c_payselection_id))) JOIN c_bpartner bp ON ((psc.c_bpartner_id = bp.c_bpartner_id))) LEFT JOIN c_greeting bpg ON ((bp.c_greeting_id = bpg.c_greeting_id))) JOIN ad_orginfo oi ON ((psc.ad_org_id = oi.ad_org_id)));


ALTER TABLE adempiere.c_payselection_check_v OWNER TO adempiere;

--
-- Name: c_payselection_check_vt; Type: VIEW; Schema: adempiere; Owner: adempiere
--

CREATE VIEW c_payselection_check_vt AS
    SELECT psc.ad_client_id, psc.ad_org_id, l.ad_language, psc.c_payselection_id, psc.c_payselectioncheck_id, oi.c_location_id AS org_location_id, oi.taxid, 0 AS c_doctype_id, bp.c_bpartner_id, bp.value AS bpvalue, bp.taxid AS bptaxid, bp.naics, bp.duns, bpg.greeting AS bpgreeting, bp.name, bp.name2, bpartnerremitlocation(bp.c_bpartner_id) AS c_location_id, bp.referenceno, bp.poreference, ps.paydate, psc.payamt, psc.payamt AS amtinwords, psc.qty, psc.paymentrule, psc.documentno FROM (((((c_payselectioncheck psc JOIN c_payselection ps ON ((psc.c_payselection_id = ps.c_payselection_id))) JOIN c_bpartner bp ON ((psc.c_bpartner_id = bp.c_bpartner_id))) JOIN ad_orginfo oi ON ((psc.ad_org_id = oi.ad_org_id))) LEFT JOIN ad_language l ON ((l.issystemlanguage = 'Y'::bpchar))) LEFT JOIN c_greeting_trl bpg ON (((bp.c_greeting_id = bpg.c_greeting_id) AND ((bpg.ad_language)::text = (l.ad_language)::text))));


ALTER TABLE adempiere.c_payselection_check_vt OWNER TO adempiere;

--
-- Name: c_payselection_remittance_v; Type: VIEW; Schema: adempiere; Owner: adempiere
--

CREATE VIEW c_payselection_remittance_v AS
    SELECT psl.ad_client_id, psl.ad_org_id, 'en_US' AS ad_language, psl.c_payselection_id, psl.c_payselectionline_id, psl.c_payselectioncheck_id, psl.paymentrule, psl.line, psl.openamt, psl.payamt, psl.discountamt, psl.differenceamt, i.c_bpartner_id, i.documentno, i.dateinvoiced, i.grandtotal, i.grandtotal AS amtinwords FROM (c_payselectionline psl JOIN c_invoice i ON ((psl.c_invoice_id = i.c_invoice_id)));


ALTER TABLE adempiere.c_payselection_remittance_v OWNER TO adempiere;

--
-- Name: c_payselection_remittance_vt; Type: VIEW; Schema: adempiere; Owner: adempiere
--

CREATE VIEW c_payselection_remittance_vt AS
    SELECT psl.ad_client_id, psl.ad_org_id, l.ad_language, psl.c_payselection_id, psl.c_payselectionline_id, psl.c_payselectioncheck_id, psl.paymentrule, psl.line, psl.openamt, psl.payamt, psl.discountamt, psl.differenceamt, i.c_bpartner_id, i.documentno, i.dateinvoiced, i.grandtotal, i.grandtotal AS amtinwords FROM ((c_payselectionline psl JOIN c_invoice i ON ((psl.c_invoice_id = i.c_invoice_id))) JOIN ad_language l ON ((l.issystemlanguage = 'Y'::bpchar)));


ALTER TABLE adempiere.c_payselection_remittance_vt OWNER TO adempiere;

--
-- Name: c_project_details_v; Type: VIEW; Schema: adempiere; Owner: adempiere
--

CREATE VIEW c_project_details_v AS
    SELECT pl.ad_client_id, pl.ad_org_id, pl.isactive, pl.created, pl.createdby, pl.updated, pl.updatedby, 'en_US' AS ad_language, pj.c_project_id, pl.c_projectline_id, pl.line, pl.plannedqty, pl.plannedprice, pl.plannedamt, pl.plannedmarginamt, pl.committedamt, pl.m_product_id, COALESCE(p.name, pl.description) AS name, CASE WHEN (p.name IS NOT NULL) THEN pl.description ELSE NULL::character varying END AS description, p.documentnote, p.upc, p.sku, p.value AS productvalue, pl.m_product_category_id, pl.invoicedamt, pl.invoicedqty, pl.committedqty FROM ((c_projectline pl JOIN c_project pj ON ((pl.c_project_id = pj.c_project_id))) LEFT JOIN m_product p ON ((pl.m_product_id = p.m_product_id))) WHERE (pl.isprinted = 'Y'::bpchar);


ALTER TABLE adempiere.c_project_details_v OWNER TO adempiere;

--
-- Name: c_project_details_vt; Type: VIEW; Schema: adempiere; Owner: adempiere
--

CREATE VIEW c_project_details_vt AS
    SELECT pl.ad_client_id, pl.ad_org_id, pl.isactive, pl.created, pl.createdby, pl.updated, pl.updatedby, l.ad_language, pj.c_project_id, pl.c_projectline_id, pl.line, pl.plannedqty, pl.plannedprice, pl.plannedamt, pl.plannedmarginamt, pl.committedamt, pl.m_product_id, COALESCE(p.name, pl.description) AS name, CASE WHEN (p.name IS NOT NULL) THEN pl.description ELSE NULL::character varying END AS description, p.documentnote, p.upc, p.sku, p.value AS productvalue, pl.m_product_category_id, pl.invoicedamt, pl.invoicedqty, pl.committedqty FROM (((c_projectline pl JOIN c_project pj ON ((pl.c_project_id = pj.c_project_id))) LEFT JOIN m_product p ON ((pl.m_product_id = p.m_product_id))) JOIN ad_language l ON ((l.issystemlanguage = 'Y'::bpchar))) WHERE (pl.isprinted = 'Y'::bpchar);


ALTER TABLE adempiere.c_project_details_vt OWNER TO adempiere;

--
-- Name: c_project_header_v; Type: VIEW; Schema: adempiere; Owner: adempiere
--

CREATE VIEW c_project_header_v AS
    SELECT p.ad_client_id, p.ad_org_id, p.isactive, p.created, p.createdby, p.updated, p.updatedby, 'en_US' AS ad_language, p.c_project_id, p.value, p.name AS projectname, p.description, p.note, p.issummary, p.projectcategory, oi.c_location_id AS org_location_id, oi.taxid, p.c_projecttype_id, pjt.name AS projecttypename, p.c_phase_id, pjp.name AS projectphasename, p.salesrep_id, COALESCE(ubp.name, u.name) AS salesrep_name, p.c_bpartner_id, bp.value AS bpvalue, bp.taxid AS bptaxid, bp.naics, bp.duns, bpg.greeting AS bpgreeting, bp.name, bp.name2, bpcg.greeting AS bpcontactgreeting, bpc.title, bpc.phone, NULLIF((bpc.name)::text, (bp.name)::text) AS contactname, bpl.c_location_id, bp.referenceno, pt.name AS paymentterm, pt.documentnote AS paymenttermnote, p.poreference, p.c_currency_id, p.m_pricelist_version_id, p.c_campaign_id, p.plannedamt, p.plannedqty, p.plannedmarginamt, p.invoicedamt, p.invoicedqty, p.projectbalanceamt, p.iscommitment, p.committedamt, p.committedqty, p.datecontract, p.datefinish, p.iscommitceiling, p.m_warehouse_id FROM (((((((((((c_project p LEFT JOIN c_bpartner bp ON ((p.c_bpartner_id = bp.c_bpartner_id))) JOIN ad_orginfo oi ON ((p.ad_org_id = oi.ad_org_id))) LEFT JOIN c_projecttype pjt ON ((p.c_projecttype_id = pjt.c_projecttype_id))) LEFT JOIN c_phase pjp ON ((p.c_phase_id = pjp.c_phase_id))) LEFT JOIN ad_user u ON ((p.salesrep_id = u.ad_user_id))) LEFT JOIN c_bpartner ubp ON ((u.c_bpartner_id = ubp.c_bpartner_id))) LEFT JOIN c_greeting bpg ON ((bp.c_greeting_id = bpg.c_greeting_id))) LEFT JOIN ad_user bpc ON ((p.ad_user_id = bpc.ad_user_id))) LEFT JOIN c_greeting bpcg ON ((bpc.c_greeting_id = bpcg.c_greeting_id))) LEFT JOIN c_bpartner_location bpl ON ((p.c_bpartner_location_id = bpl.c_bpartner_location_id))) LEFT JOIN c_paymentterm pt ON ((p.c_paymentterm_id = pt.c_paymentterm_id)));


ALTER TABLE adempiere.c_project_header_v OWNER TO adempiere;

--
-- Name: c_project_header_vt; Type: VIEW; Schema: adempiere; Owner: adempiere
--

CREATE VIEW c_project_header_vt AS
    SELECT p.ad_client_id, p.ad_org_id, p.isactive, p.created, p.createdby, p.updated, p.updatedby, pt.ad_language, p.c_project_id, p.value, p.name AS projectname, p.description, p.note, p.issummary, p.projectcategory, oi.c_location_id AS org_location_id, oi.taxid, p.c_projecttype_id, pjt.name AS projecttypename, p.c_phase_id, pjp.name AS projectphasename, p.salesrep_id, COALESCE(ubp.name, u.name) AS salesrep_name, p.c_bpartner_id, bp.value AS bpvalue, bp.taxid AS bptaxid, bp.naics, bp.duns, bpg.greeting AS bpgreeting, bp.name, bp.name2, bpcg.greeting AS bpcontactgreeting, bpc.title, bpc.phone, NULLIF((bpc.name)::text, (bp.name)::text) AS contactname, bpl.c_location_id, bp.referenceno, pt.name AS paymentterm, pt.documentnote AS paymenttermnote, p.poreference, p.c_currency_id, p.m_pricelist_version_id, p.c_campaign_id, p.plannedamt, p.plannedqty, p.plannedmarginamt, p.invoicedamt, p.invoicedqty, p.projectbalanceamt, p.iscommitment, p.committedamt, p.committedqty, p.datecontract, p.datefinish, p.iscommitceiling, p.m_warehouse_id FROM (((((((((((c_project p LEFT JOIN c_bpartner bp ON ((p.c_bpartner_id = bp.c_bpartner_id))) JOIN ad_orginfo oi ON ((p.ad_org_id = oi.ad_org_id))) LEFT JOIN c_paymentterm_trl pt ON ((p.c_paymentterm_id = pt.c_paymentterm_id))) LEFT JOIN c_projecttype pjt ON ((p.c_projecttype_id = pjt.c_projecttype_id))) LEFT JOIN c_phase pjp ON ((p.c_phase_id = pjp.c_phase_id))) LEFT JOIN ad_user u ON ((p.salesrep_id = u.ad_user_id))) LEFT JOIN c_bpartner ubp ON ((u.c_bpartner_id = ubp.c_bpartner_id))) LEFT JOIN c_greeting bpg ON ((bp.c_greeting_id = bpg.c_greeting_id))) LEFT JOIN ad_user bpc ON ((p.ad_user_id = bpc.ad_user_id))) LEFT JOIN c_greeting bpcg ON ((bpc.c_greeting_id = bpcg.c_greeting_id))) LEFT JOIN c_bpartner_location bpl ON ((p.c_bpartner_location_id = bpl.c_bpartner_location_id)));


ALTER TABLE adempiere.c_project_header_vt OWNER TO adempiere;

--
-- Name: c_rfqresponse_v; Type: VIEW; Schema: adempiere; Owner: adempiere
--

CREATE VIEW c_rfqresponse_v AS
    SELECT rr.c_rfqresponse_id, rr.c_rfq_id, rr.ad_client_id, rr.ad_org_id, rr.isactive, rr.created, rr.createdby, rr.updated, rr.updatedby, 'en_US' AS ad_language, oi.c_location_id AS org_location_id, oi.taxid, r.name, r.description, r.help, r.c_currency_id, c.iso_code, r.dateresponse, r.dateworkstart, r.deliverydays, rr.c_bpartner_id, bp.name AS bpname, bp.name2 AS bpname2, rr.c_bpartner_location_id, bpl.c_location_id, rr.ad_user_id, bpc.title, bpc.phone, NULLIF((bpc.name)::text, (bp.name)::text) AS contactname FROM ((((((c_rfqresponse rr JOIN c_rfq r ON ((rr.c_rfq_id = r.c_rfq_id))) JOIN ad_orginfo oi ON ((rr.ad_org_id = oi.ad_org_id))) JOIN c_currency c ON ((r.c_currency_id = c.c_currency_id))) JOIN c_bpartner bp ON ((rr.c_bpartner_id = bp.c_bpartner_id))) JOIN c_bpartner_location bpl ON ((rr.c_bpartner_location_id = bpl.c_bpartner_location_id))) LEFT JOIN ad_user bpc ON ((rr.ad_user_id = bpc.ad_user_id)));


ALTER TABLE adempiere.c_rfqresponse_v OWNER TO adempiere;

--
-- Name: c_rfqresponse_vt; Type: VIEW; Schema: adempiere; Owner: adempiere
--

CREATE VIEW c_rfqresponse_vt AS
    SELECT rr.c_rfqresponse_id, rr.c_rfq_id, rr.ad_client_id, rr.ad_org_id, rr.isactive, rr.created, rr.createdby, rr.updated, rr.updatedby, l.ad_language, oi.c_location_id AS org_location_id, oi.taxid, r.name, r.description, r.help, r.c_currency_id, c.iso_code, r.dateresponse, r.dateworkstart, r.deliverydays, rr.c_bpartner_id, bp.name AS bpname, bp.name2 AS bpname2, rr.c_bpartner_location_id, bpl.c_location_id, rr.ad_user_id, bpc.title, bpc.phone, NULLIF((bpc.name)::text, (bp.name)::text) AS contactname FROM (((((((c_rfqresponse rr JOIN c_rfq r ON ((rr.c_rfq_id = r.c_rfq_id))) JOIN ad_orginfo oi ON ((rr.ad_org_id = oi.ad_org_id))) JOIN c_currency c ON ((r.c_currency_id = c.c_currency_id))) JOIN c_bpartner bp ON ((rr.c_bpartner_id = bp.c_bpartner_id))) JOIN c_bpartner_location bpl ON ((rr.c_bpartner_location_id = bpl.c_bpartner_location_id))) LEFT JOIN ad_user bpc ON ((rr.ad_user_id = bpc.ad_user_id))) JOIN ad_language l ON ((l.issystemlanguage = 'Y'::bpchar)));


ALTER TABLE adempiere.c_rfqresponse_vt OWNER TO adempiere;

--
-- Name: c_rfqresponseline_v; Type: VIEW; Schema: adempiere; Owner: adempiere
--

CREATE VIEW c_rfqresponseline_v AS
    SELECT rrl.c_rfqresponse_id, rrl.c_rfqresponseline_id, rrl.c_rfqline_id, rq.c_rfqresponselineqty_id, rq.c_rfqlineqty_id, rrl.ad_client_id, rrl.ad_org_id, rrl.isactive, rrl.created, rrl.createdby, rrl.updated, rrl.updatedby, 'en_US' AS ad_language, rl.line, rl.m_product_id, rl.m_attributesetinstance_id, COALESCE(((p.name)::text || (productattribute(rl.m_attributesetinstance_id))::text), (rl.description)::text) AS name, CASE WHEN (p.name IS NOT NULL) THEN rl.description ELSE NULL::character varying END AS description, p.documentnote, p.upc, p.sku, p.value AS productvalue, rl.help, rl.dateworkstart, rl.deliverydays, q.c_uom_id, uom.uomsymbol, q.benchmarkprice, q.qty, rq.price, rq.discount FROM (((((c_rfqresponselineqty rq JOIN c_rfqlineqty q ON ((rq.c_rfqlineqty_id = q.c_rfqlineqty_id))) JOIN c_uom uom ON ((q.c_uom_id = uom.c_uom_id))) JOIN c_rfqresponseline rrl ON ((rq.c_rfqresponseline_id = rrl.c_rfqresponseline_id))) JOIN c_rfqline rl ON ((rrl.c_rfqline_id = rl.c_rfqline_id))) LEFT JOIN m_product p ON ((rl.m_product_id = p.m_product_id))) WHERE ((((rq.isactive = 'Y'::bpchar) AND (q.isactive = 'Y'::bpchar)) AND (rrl.isactive = 'Y'::bpchar)) AND (rl.isactive = 'Y'::bpchar));


ALTER TABLE adempiere.c_rfqresponseline_v OWNER TO adempiere;

--
-- Name: c_rfqresponseline_vt; Type: VIEW; Schema: adempiere; Owner: adempiere
--

CREATE VIEW c_rfqresponseline_vt AS
    SELECT rrl.c_rfqresponse_id, rrl.c_rfqresponseline_id, rrl.c_rfqline_id, rq.c_rfqresponselineqty_id, rq.c_rfqlineqty_id, rrl.ad_client_id, rrl.ad_org_id, rrl.isactive, rrl.created, rrl.createdby, rrl.updated, rrl.updatedby, l.ad_language, rl.line, rl.m_product_id, rl.m_attributesetinstance_id, COALESCE(((p.name)::text || (productattribute(rl.m_attributesetinstance_id))::text), (rl.description)::text) AS name, CASE WHEN (p.name IS NOT NULL) THEN rl.description ELSE NULL::character varying END AS description, p.documentnote, p.upc, p.sku, p.value AS productvalue, rl.help, rl.dateworkstart, rl.deliverydays, q.c_uom_id, uom.uomsymbol, q.qty, rq.price, rq.discount FROM ((((((c_rfqresponselineqty rq JOIN c_rfqlineqty q ON ((rq.c_rfqlineqty_id = q.c_rfqlineqty_id))) JOIN c_uom uom ON ((q.c_uom_id = uom.c_uom_id))) JOIN c_rfqresponseline rrl ON ((rq.c_rfqresponseline_id = rrl.c_rfqresponseline_id))) JOIN c_rfqline rl ON ((rrl.c_rfqline_id = rl.c_rfqline_id))) LEFT JOIN m_product p ON ((rl.m_product_id = p.m_product_id))) JOIN ad_language l ON ((l.issystemlanguage = 'Y'::bpchar))) WHERE ((((rq.isactive = 'Y'::bpchar) AND (q.isactive = 'Y'::bpchar)) AND (rrl.isactive = 'Y'::bpchar)) AND (rl.isactive = 'Y'::bpchar));


ALTER TABLE adempiere.c_rfqresponseline_vt OWNER TO adempiere;

--
-- Name: c_rfqresponselineqty_v; Type: VIEW; Schema: adempiere; Owner: adempiere
--

CREATE VIEW c_rfqresponselineqty_v AS
    SELECT rq.c_rfqresponseline_id, rq.c_rfqresponselineqty_id, rq.c_rfqlineqty_id, rq.ad_client_id, rq.ad_org_id, rq.isactive, rq.created, rq.createdby, rq.updated, rq.updatedby, 'en_US' AS ad_language, q.c_uom_id, uom.uomsymbol, q.qty, rq.price, rq.discount FROM ((c_rfqresponselineqty rq JOIN c_rfqlineqty q ON ((rq.c_rfqlineqty_id = q.c_rfqlineqty_id))) JOIN c_uom uom ON ((q.c_uom_id = uom.c_uom_id))) WHERE ((rq.isactive = 'Y'::bpchar) AND (q.isactive = 'Y'::bpchar));


ALTER TABLE adempiere.c_rfqresponselineqty_v OWNER TO adempiere;

--
-- Name: c_rfqresponselineqty_vt; Type: VIEW; Schema: adempiere; Owner: adempiere
--

CREATE VIEW c_rfqresponselineqty_vt AS
    SELECT rq.c_rfqresponseline_id, rq.c_rfqresponselineqty_id, rq.c_rfqlineqty_id, rq.ad_client_id, rq.ad_org_id, rq.isactive, rq.created, rq.createdby, rq.updated, rq.updatedby, l.ad_language, q.c_uom_id, uom.uomsymbol, q.qty, rq.price, rq.discount FROM (((c_rfqresponselineqty rq JOIN c_rfqlineqty q ON ((rq.c_rfqlineqty_id = q.c_rfqlineqty_id))) JOIN c_uom uom ON ((q.c_uom_id = uom.c_uom_id))) JOIN ad_language l ON ((l.issystemlanguage = 'Y'::bpchar))) WHERE ((rq.isactive = 'Y'::bpchar) AND (q.isactive = 'Y'::bpchar));


ALTER TABLE adempiere.c_rfqresponselineqty_vt OWNER TO adempiere;

--
-- Name: gl_journalline_acct_v; Type: VIEW; Schema: adempiere; Owner: adempiere
--

CREATE VIEW gl_journalline_acct_v AS
    SELECT gl.gl_journalline_id, gl.ad_client_id, gl.ad_org_id, gl.isactive, gl.created, gl.createdby, gl.updated, gl.updatedby, gl.gl_journal_id, gl.line, gl.isgenerated, gl.description, gl.amtsourcedr, gl.amtsourcecr, gl.c_currency_id, gl.c_conversiontype_id, gl.currencyrate, gl.dateacct, gl.amtacctdr, gl.amtacctcr, gl.c_uom_id, gl.qty, gl.c_validcombination_id, vc.c_acctschema_id, vc.account_id, vc.m_product_id, vc.c_bpartner_id, vc.ad_orgtrx_id, vc.c_locfrom_id, vc.c_locto_id, vc.c_salesregion_id, vc.c_project_id, vc.c_campaign_id, vc.user1_id, vc.user2_id, vc.isfullyqualified, vc.c_activity_id FROM gl_journalline gl, c_validcombination vc WHERE (gl.c_validcombination_id = vc.c_validcombination_id);


ALTER TABLE adempiere.gl_journalline_acct_v OWNER TO adempiere;

--
-- Name: m_inout_candidate_v; Type: VIEW; Schema: adempiere; Owner: adempiere
--

CREATE VIEW m_inout_candidate_v AS
    SELECT o.ad_client_id, o.ad_org_id, o.c_bpartner_id, o.c_order_id, o.documentno, o.dateordered, o.c_doctype_id, o.poreference, o.description, o.salesrep_id, l.m_warehouse_id, sum(((l.qtyordered - l.qtydelivered) * l.priceactual)) AS totallines FROM (c_order o JOIN c_orderline l ON ((o.c_order_id = l.c_order_id))) WHERE (((((((((o.docstatus = 'CO'::bpchar) AND (o.isdelivered = 'N'::bpchar)) AND (o.c_doctype_id IN (SELECT c_doctype.c_doctype_id FROM c_doctype WHERE ((c_doctype.docbasetype = 'SOO'::bpchar) AND (c_doctype.docsubtypeso <> ALL (ARRAY['ON'::bpchar, 'OB'::bpchar, 'WR'::bpchar])))))) AND (o.deliveryrule <> 'M'::bpchar)) AND ((l.m_product_id IS NULL) OR (EXISTS (SELECT p.m_product_id, p.ad_client_id, p.ad_org_id, p.isactive, p.created, p.createdby, p.updated, p.updatedby, p.value, p.name, p.description, p.documentnote, p.help, p.upc, p.sku, p.c_uom_id, p.salesrep_id, p.issummary, p.isstocked, p.ispurchased, p.issold, p.isbom, p.isinvoiceprintdetails, p.ispicklistprintdetails, p.isverified, p.c_revenuerecognition_id, p.m_product_category_id, p.classification, p.volume, p.weight, p.shelfwidth, p.shelfheight, p.shelfdepth, p.unitsperpallet, p.c_taxcategory_id, p.s_resource_id, p.discontinued, p.discontinuedby, p.processing, p.s_expensetype_id, p.producttype, p.imageurl, p.descriptionurl, p.guaranteedays, p.r_mailtext_id, p.versionno, p.m_attributeset_id, p.m_attributesetinstance_id, p.downloadurl, p.m_freightcategory_id, p.m_locator_id, p.guaranteedaysmin, p.iswebstorefeatured, p.isselfservice, p.c_subscriptiontype_id, p.isdropship, p.isexcludeautodelivery FROM m_product p WHERE ((l.m_product_id = p.m_product_id) AND (p.isexcludeautodelivery = 'N'::bpchar)))))) AND (l.qtyordered <> l.qtydelivered)) AND (o.isdropship = 'N'::bpchar)) AND ((l.m_product_id IS NOT NULL) OR (l.c_charge_id IS NOT NULL))) AND (NOT (EXISTS (SELECT iol.m_inoutline_id, iol.ad_client_id, iol.ad_org_id, iol.isactive, iol.created, iol.createdby, iol.updated, iol.updatedby, iol.line, iol.description, iol.m_inout_id, iol.c_orderline_id, iol.m_locator_id, iol.m_product_id, iol.c_uom_id, iol.movementqty, iol.isinvoiced, iol.m_attributesetinstance_id, iol.isdescription, iol.confirmedqty, iol.pickedqty, iol.scrappedqty, iol.targetqty, iol.ref_inoutline_id, iol.processed, iol.qtyentered, iol.c_charge_id, iol.c_project_id, iol.c_projectphase_id, iol.c_projecttask_id, iol.c_campaign_id, iol.c_activity_id, iol.user1_id, iol.user2_id, iol.ad_orgtrx_id, io.m_inout_id, io.ad_client_id, io.ad_org_id, io.isactive, io.created, io.createdby, io.updated, io.updatedby, io.issotrx, io.documentno, io.docaction, io.docstatus, io.posted, io.processing, io.processed, io.c_doctype_id, io.description, io.c_order_id, io.dateordered, io.isprinted, io.movementtype, io.movementdate, io.dateacct, io.c_bpartner_id, io.c_bpartner_location_id, io.m_warehouse_id, io.poreference, io.deliveryrule, io.freightcostrule, io.freightamt, io.deliveryviarule, io.m_shipper_id, io.c_charge_id, io.chargeamt, io.priorityrule, io.dateprinted, io.c_invoice_id, io.createfrom, io.generateto, io.sendemail, io.ad_user_id, io.salesrep_id, io.nopackages, io.pickdate, io.shipdate, io.trackingno, io.ad_orgtrx_id, io.c_project_id, io.c_campaign_id, io.c_activity_id, io.user1_id, io.user2_id, io.datereceived, io.isintransit, io.ref_inout_id, io.createconfirm, io.createpackage, io.isapproved, io.isindispute, io.volume, io.weight FROM (m_inoutline iol JOIN m_inout io ON ((iol.m_inout_id = io.m_inout_id))) WHERE ((iol.c_orderline_id = l.c_orderline_id) AND (io.docstatus = ANY (ARRAY['IP'::bpchar, 'WC'::bpchar]))))))) GROUP BY o.ad_client_id, o.ad_org_id, o.c_bpartner_id, o.c_order_id, o.documentno, o.dateordered, o.c_doctype_id, o.poreference, o.description, o.salesrep_id, l.m_warehouse_id;


ALTER TABLE adempiere.m_inout_candidate_v OWNER TO adempiere;

--
-- Name: m_inout_header_v; Type: VIEW; Schema: adempiere; Owner: adempiere
--

CREATE VIEW m_inout_header_v AS
    SELECT io.ad_client_id, io.ad_org_id, io.isactive, io.created, io.createdby, io.updated, io.updatedby, 'en_US' AS ad_language, io.m_inout_id, io.issotrx, io.documentno, io.docstatus, io.c_doctype_id, io.c_bpartner_id, bp.value AS bpvalue, bp.taxid AS bptaxid, bp.naics, bp.duns, oi.c_location_id AS org_location_id, oi.taxid, io.m_warehouse_id, wh.c_location_id AS warehouse_location_id, dt.printname AS documenttype, dt.documentnote AS documenttypenote, io.c_order_id, io.movementdate, io.movementtype, bpg.greeting AS bpgreeting, bp.name, bp.name2, bpcg.greeting AS bpcontactgreeting, bpc.title, bpc.phone, NULLIF((bpc.name)::text, (bp.name)::text) AS contactname, bpl.c_location_id, ((l.postal)::text || (l.postal_add)::text) AS postal, bp.referenceno, io.description, io.poreference, io.dateordered, io.volume, io.weight, io.m_shipper_id, io.deliveryrule, io.deliveryviarule, io.priorityrule FROM (((((((((m_inout io JOIN c_doctype dt ON ((io.c_doctype_id = dt.c_doctype_id))) JOIN c_bpartner bp ON ((io.c_bpartner_id = bp.c_bpartner_id))) LEFT JOIN c_greeting bpg ON ((bp.c_greeting_id = bpg.c_greeting_id))) JOIN c_bpartner_location bpl ON ((io.c_bpartner_location_id = bpl.c_bpartner_location_id))) JOIN c_location l ON ((bpl.c_location_id = l.c_location_id))) LEFT JOIN ad_user bpc ON ((io.ad_user_id = bpc.ad_user_id))) LEFT JOIN c_greeting bpcg ON ((bpc.c_greeting_id = bpcg.c_greeting_id))) JOIN ad_orginfo oi ON ((io.ad_org_id = oi.ad_org_id))) JOIN m_warehouse wh ON ((io.m_warehouse_id = wh.m_warehouse_id)));


ALTER TABLE adempiere.m_inout_header_v OWNER TO adempiere;

--
-- Name: m_inout_header_vt; Type: VIEW; Schema: adempiere; Owner: adempiere
--

CREATE VIEW m_inout_header_vt AS
    SELECT io.ad_client_id, io.ad_org_id, io.isactive, io.created, io.createdby, io.updated, io.updatedby, dt.ad_language, io.m_inout_id, io.issotrx, io.documentno, io.docstatus, io.c_doctype_id, io.c_bpartner_id, bp.value AS bpvalue, bp.taxid AS bptaxid, bp.naics, bp.duns, oi.c_location_id AS org_location_id, oi.taxid, io.m_warehouse_id, wh.c_location_id AS warehouse_location_id, dt.printname AS documenttype, dt.documentnote AS documenttypenote, io.c_order_id, bpc.phone, io.movementdate, io.movementtype, bpg.greeting AS bpgreeting, bp.name, bp.name2, bpcg.greeting AS bpcontactgreeting, bpc.title, NULLIF((bpc.name)::text, (bp.name)::text) AS contactname, bpl.c_location_id, ((l.postal)::text || (l.postal_add)::text) AS postal, bp.referenceno, io.description, io.poreference, io.dateordered, io.volume, io.weight, io.m_shipper_id, io.deliveryrule, io.deliveryviarule, io.priorityrule FROM (((((((((m_inout io JOIN c_doctype_trl dt ON ((io.c_doctype_id = dt.c_doctype_id))) JOIN c_bpartner bp ON ((io.c_bpartner_id = bp.c_bpartner_id))) LEFT JOIN c_greeting_trl bpg ON (((bp.c_greeting_id = bpg.c_greeting_id) AND ((dt.ad_language)::text = (bpg.ad_language)::text)))) JOIN c_bpartner_location bpl ON ((io.c_bpartner_location_id = bpl.c_bpartner_location_id))) JOIN c_location l ON ((bpl.c_location_id = l.c_location_id))) LEFT JOIN ad_user bpc ON ((io.ad_user_id = bpc.ad_user_id))) LEFT JOIN c_greeting_trl bpcg ON (((bpc.c_greeting_id = bpcg.c_greeting_id) AND ((dt.ad_language)::text = (bpcg.ad_language)::text)))) JOIN ad_orginfo oi ON ((io.ad_org_id = oi.ad_org_id))) JOIN m_warehouse wh ON ((io.m_warehouse_id = wh.m_warehouse_id)));


ALTER TABLE adempiere.m_inout_header_vt OWNER TO adempiere;

--
-- Name: m_inout_line_v; Type: VIEW; Schema: adempiere; Owner: adempiere
--

CREATE VIEW m_inout_line_v AS
    SELECT iol.ad_client_id, iol.ad_org_id, iol.isactive, iol.created, iol.createdby, iol.updated, iol.updatedby, 'en_US' AS ad_language, iol.m_inout_id, iol.m_inoutline_id, iol.line, p.m_product_id, CASE WHEN ((iol.movementqty <> (0)::numeric) OR (iol.m_product_id IS NOT NULL)) THEN iol.movementqty ELSE NULL::numeric END AS movementqty, CASE WHEN ((iol.qtyentered <> (0)::numeric) OR (iol.m_product_id IS NOT NULL)) THEN iol.qtyentered ELSE NULL::numeric END AS qtyentered, CASE WHEN ((iol.movementqty <> (0)::numeric) OR (iol.m_product_id IS NOT NULL)) THEN uom.uomsymbol ELSE NULL::character varying END AS uomsymbol, ol.qtyordered, ol.qtydelivered, CASE WHEN ((iol.movementqty <> (0)::numeric) OR (iol.m_product_id IS NOT NULL)) THEN (ol.qtyordered - ol.qtydelivered) ELSE NULL::numeric END AS qtybackordered, COALESCE(((p.name)::text || (productattribute(iol.m_attributesetinstance_id))::text), (c.name)::text, (iol.description)::text) AS name, CASE WHEN (COALESCE(c.name, p.name) IS NOT NULL) THEN iol.description ELSE NULL::character varying END AS description, p.documentnote, p.upc, p.sku, p.value AS productvalue, iol.m_locator_id, l.m_warehouse_id, l.x, l.y, l.z, iol.m_attributesetinstance_id, asi.m_attributeset_id, asi.serno, asi.lot, asi.m_lot_id, asi.guaranteedate, p.description AS productdescription, p.imageurl, iol.c_campaign_id, iol.c_project_id, iol.c_activity_id, iol.c_projectphase_id, iol.c_projecttask_id FROM ((((((m_inoutline iol JOIN c_uom uom ON ((iol.c_uom_id = uom.c_uom_id))) LEFT JOIN m_product p ON ((iol.m_product_id = p.m_product_id))) LEFT JOIN m_attributesetinstance asi ON ((iol.m_attributesetinstance_id = asi.m_attributesetinstance_id))) LEFT JOIN m_locator l ON ((iol.m_locator_id = l.m_locator_id))) LEFT JOIN c_orderline ol ON ((iol.c_orderline_id = ol.c_orderline_id))) LEFT JOIN c_charge c ON ((iol.c_charge_id = c.c_charge_id))) UNION SELECT iol.ad_client_id, iol.ad_org_id, iol.isactive, iol.created, iol.createdby, iol.updated, iol.updatedby, 'en_US' AS ad_language, iol.m_inout_id, iol.m_inoutline_id, (iol.line + (b.line / 100)) AS line, p.m_product_id, (iol.movementqty * b.bomqty) AS movementqty, (iol.qtyentered * b.bomqty) AS qtyentered, uom.uomsymbol, NULL::"unknown" AS qtyordered, NULL::"unknown" AS qtydelivered, NULL::"unknown" AS qtybackordered, p.name, b.description, p.documentnote, p.upc, p.sku, p.value AS productvalue, iol.m_locator_id, l.m_warehouse_id, l.x, l.y, l.z, iol.m_attributesetinstance_id, asi.m_attributeset_id, asi.serno, asi.lot, asi.m_lot_id, asi.guaranteedate, p.description AS productdescription, p.imageurl, iol.c_campaign_id, iol.c_project_id, iol.c_activity_id, iol.c_projectphase_id, iol.c_projecttask_id FROM ((((((m_product_bom b JOIN m_inoutline iol ON ((b.m_product_id = iol.m_product_id))) JOIN m_product bp ON (((((bp.m_product_id = iol.m_product_id) AND (bp.isbom = 'Y'::bpchar)) AND (bp.isverified = 'Y'::bpchar)) AND (bp.ispicklistprintdetails = 'Y'::bpchar)))) JOIN m_product p ON ((b.m_productbom_id = p.m_product_id))) JOIN c_uom uom ON ((p.c_uom_id = uom.c_uom_id))) LEFT JOIN m_attributesetinstance asi ON ((iol.m_attributesetinstance_id = asi.m_attributesetinstance_id))) LEFT JOIN m_locator l ON ((iol.m_locator_id = l.m_locator_id)));


ALTER TABLE adempiere.m_inout_line_v OWNER TO adempiere;

--
-- Name: m_inout_line_vt; Type: VIEW; Schema: adempiere; Owner: adempiere
--

CREATE VIEW m_inout_line_vt AS
    SELECT iol.ad_client_id, iol.ad_org_id, iol.isactive, iol.created, iol.createdby, iol.updated, iol.updatedby, uom.ad_language, iol.m_inout_id, iol.m_inoutline_id, iol.line, p.m_product_id, CASE WHEN ((iol.movementqty <> (0)::numeric) OR (iol.m_product_id IS NOT NULL)) THEN iol.movementqty ELSE NULL::numeric END AS movementqty, CASE WHEN ((iol.qtyentered <> (0)::numeric) OR (iol.m_product_id IS NOT NULL)) THEN iol.qtyentered ELSE NULL::numeric END AS qtyentered, CASE WHEN ((iol.movementqty <> (0)::numeric) OR (iol.m_product_id IS NOT NULL)) THEN uom.uomsymbol ELSE NULL::character varying END AS uomsymbol, ol.qtyordered, ol.qtydelivered, CASE WHEN ((iol.movementqty <> (0)::numeric) OR (iol.m_product_id IS NOT NULL)) THEN (ol.qtyordered - ol.qtydelivered) ELSE NULL::numeric END AS qtybackordered, COALESCE(((COALESCE(pt.name, p.name))::text || (productattribute(iol.m_attributesetinstance_id))::text), (c.name)::text, (iol.description)::text) AS name, CASE WHEN (COALESCE(pt.name, p.name, c.name) IS NOT NULL) THEN iol.description ELSE NULL::character varying END AS description, COALESCE(pt.documentnote, p.documentnote) AS documentnote, p.upc, p.sku, p.value AS productvalue, iol.m_locator_id, l.m_warehouse_id, l.x, l.y, l.z, iol.m_attributesetinstance_id, asi.m_attributeset_id, asi.serno, asi.lot, asi.m_lot_id, asi.guaranteedate, pt.description AS productdescription, p.imageurl, iol.c_campaign_id, iol.c_project_id, iol.c_activity_id, iol.c_projectphase_id, iol.c_projecttask_id FROM (((((((m_inoutline iol JOIN c_uom_trl uom ON ((iol.c_uom_id = uom.c_uom_id))) LEFT JOIN m_product p ON ((iol.m_product_id = p.m_product_id))) LEFT JOIN m_product_trl pt ON (((iol.m_product_id = pt.m_product_id) AND ((uom.ad_language)::text = (pt.ad_language)::text)))) LEFT JOIN m_attributesetinstance asi ON ((iol.m_attributesetinstance_id = asi.m_attributesetinstance_id))) LEFT JOIN m_locator l ON ((iol.m_locator_id = l.m_locator_id))) LEFT JOIN c_orderline ol ON ((iol.c_orderline_id = ol.c_orderline_id))) LEFT JOIN c_charge c ON ((iol.c_charge_id = c.c_charge_id))) UNION SELECT iol.ad_client_id, iol.ad_org_id, iol.isactive, iol.created, iol.createdby, iol.updated, iol.updatedby, uom.ad_language, iol.m_inout_id, iol.m_inoutline_id, (iol.line + (b.line / 100)) AS line, p.m_product_id, (iol.movementqty * b.bomqty) AS movementqty, (iol.qtyentered * b.bomqty) AS qtyentered, uom.uomsymbol, NULL::"unknown" AS qtyordered, NULL::"unknown" AS qtydelivered, NULL::"unknown" AS qtybackordered, COALESCE(pt.name, p.name) AS name, b.description, COALESCE(pt.documentnote, p.documentnote) AS documentnote, p.upc, p.sku, p.value AS productvalue, iol.m_locator_id, l.m_warehouse_id, l.x, l.y, l.z, iol.m_attributesetinstance_id, asi.m_attributeset_id, asi.serno, asi.lot, asi.m_lot_id, asi.guaranteedate, pt.description AS productdescription, p.imageurl, iol.c_campaign_id, iol.c_project_id, iol.c_activity_id, iol.c_projectphase_id, iol.c_projecttask_id FROM (((((((m_product_bom b JOIN m_inoutline iol ON ((b.m_product_id = iol.m_product_id))) JOIN m_product bp ON (((((bp.m_product_id = iol.m_product_id) AND (bp.isbom = 'Y'::bpchar)) AND (bp.isverified = 'Y'::bpchar)) AND (bp.ispicklistprintdetails = 'Y'::bpchar)))) JOIN m_product p ON ((b.m_productbom_id = p.m_product_id))) JOIN c_uom_trl uom ON ((p.c_uom_id = uom.c_uom_id))) JOIN m_product_trl pt ON (((iol.m_product_id = pt.m_product_id) AND ((uom.ad_language)::text = (pt.ad_language)::text)))) LEFT JOIN m_attributesetinstance asi ON ((iol.m_attributesetinstance_id = asi.m_attributesetinstance_id))) LEFT JOIN m_locator l ON ((iol.m_locator_id = l.m_locator_id)));


ALTER TABLE adempiere.m_inout_line_vt OWNER TO adempiere;

--
-- Name: m_inout_lineconfirm_v; Type: VIEW; Schema: adempiere; Owner: adempiere
--

CREATE VIEW m_inout_lineconfirm_v AS
    SELECT iolc.ad_client_id, iolc.ad_org_id, iolc.isactive, iolc.created, iolc.createdby, iolc.updated, iolc.updatedby, 'en_US' AS ad_language, iolc.m_inoutlineconfirm_id, iolc.m_inoutconfirm_id, iolc.targetqty, iolc.confirmedqty, iolc.differenceqty, iolc.scrappedqty, iolc.description, iolc.processed, iol.m_inout_id, iol.m_inoutline_id, iol.line, p.m_product_id, iol.movementqty, uom.uomsymbol, (ol.qtyordered - ol.qtydelivered) AS qtybackordered, COALESCE(p.name, iol.description) AS name, CASE WHEN (p.name IS NOT NULL) THEN iol.description ELSE NULL::character varying END AS shipdescription, p.documentnote, p.upc, p.sku, p.value AS productvalue, iol.m_locator_id, l.m_warehouse_id, l.x, l.y, l.z, iol.m_attributesetinstance_id, asi.m_attributeset_id, asi.serno, asi.lot, asi.m_lot_id, asi.guaranteedate FROM ((((((m_inoutlineconfirm iolc JOIN m_inoutline iol ON ((iolc.m_inoutline_id = iol.m_inoutline_id))) JOIN c_uom uom ON ((iol.c_uom_id = uom.c_uom_id))) LEFT JOIN m_product p ON ((iol.m_product_id = p.m_product_id))) LEFT JOIN m_attributesetinstance asi ON ((iol.m_attributesetinstance_id = asi.m_attributesetinstance_id))) LEFT JOIN m_locator l ON ((iol.m_locator_id = l.m_locator_id))) LEFT JOIN c_orderline ol ON ((iol.c_orderline_id = ol.c_orderline_id)));


ALTER TABLE adempiere.m_inout_lineconfirm_v OWNER TO adempiere;

--
-- Name: m_inout_lineconfirm_vt; Type: VIEW; Schema: adempiere; Owner: adempiere
--

CREATE VIEW m_inout_lineconfirm_vt AS
    SELECT iolc.ad_client_id, iolc.ad_org_id, iolc.isactive, iolc.created, iolc.createdby, iolc.updated, iolc.updatedby, uom.ad_language, iolc.m_inoutlineconfirm_id, iolc.m_inoutconfirm_id, iolc.targetqty, iolc.confirmedqty, iolc.differenceqty, iolc.scrappedqty, iolc.description, iolc.processed, iol.m_inout_id, iol.m_inoutline_id, iol.line, p.m_product_id, iol.movementqty, uom.uomsymbol, (ol.qtyordered - ol.qtydelivered) AS qtybackordered, COALESCE(COALESCE(pt.name, p.name), iol.description) AS name, CASE WHEN (COALESCE(pt.name, p.name) IS NOT NULL) THEN iol.description ELSE NULL::character varying END AS shipdescription, COALESCE(pt.documentnote, p.documentnote) AS documentnote, p.upc, p.sku, p.value AS productvalue, iol.m_locator_id, l.m_warehouse_id, l.x, l.y, l.z, iol.m_attributesetinstance_id, asi.m_attributeset_id, asi.serno, asi.lot, asi.m_lot_id, asi.guaranteedate FROM (((((((m_inoutlineconfirm iolc JOIN m_inoutline iol ON ((iolc.m_inoutline_id = iol.m_inoutline_id))) JOIN c_uom_trl uom ON ((iol.c_uom_id = uom.c_uom_id))) LEFT JOIN m_product p ON ((iol.m_product_id = p.m_product_id))) LEFT JOIN m_product_trl pt ON (((iol.m_product_id = pt.m_product_id) AND ((uom.ad_language)::text = (pt.ad_language)::text)))) LEFT JOIN m_attributesetinstance asi ON ((iol.m_attributesetinstance_id = asi.m_attributesetinstance_id))) LEFT JOIN m_locator l ON ((iol.m_locator_id = l.m_locator_id))) LEFT JOIN c_orderline ol ON ((iol.c_orderline_id = ol.c_orderline_id)));


ALTER TABLE adempiere.m_inout_lineconfirm_vt OWNER TO adempiere;

--
-- Name: m_inoutconfirm_v; Type: VIEW; Schema: adempiere; Owner: adempiere
--

CREATE VIEW m_inoutconfirm_v AS
    SELECT ioc.ad_client_id, ioc.ad_org_id, ioc.isactive, ioc.created, ioc.createdby, ioc.updated, ioc.updatedby, 'en_US' AS ad_language, ioc.m_inoutconfirm_id, ioc.documentno, ioc.confirmtype, ioc.isapproved, ioc.iscancelled, ioc.description, io.m_inout_id, io.description AS shipdescription, io.c_bpartner_id, io.c_bpartner_location_id, io.ad_user_id, io.salesrep_id, io.c_doctype_id, dt.printname AS documenttype, io.c_order_id, io.dateordered, io.movementdate, io.movementtype, io.m_warehouse_id, io.poreference, io.deliveryrule, io.freightcostrule, io.deliveryviarule, io.m_shipper_id, io.priorityrule, ioc.processed FROM ((m_inoutconfirm ioc JOIN m_inout io ON ((ioc.m_inout_id = io.m_inout_id))) JOIN c_doctype dt ON ((io.c_doctype_id = dt.c_doctype_id)));


ALTER TABLE adempiere.m_inoutconfirm_v OWNER TO adempiere;

--
-- Name: m_inoutconfirm_vt; Type: VIEW; Schema: adempiere; Owner: adempiere
--

CREATE VIEW m_inoutconfirm_vt AS
    SELECT ioc.ad_client_id, ioc.ad_org_id, ioc.isactive, ioc.created, ioc.createdby, ioc.updated, ioc.updatedby, dt.ad_language, ioc.m_inoutconfirm_id, ioc.documentno, ioc.confirmtype, ioc.isapproved, ioc.iscancelled, ioc.description, io.m_inout_id, io.description AS shipdescription, io.c_bpartner_id, io.c_bpartner_location_id, io.ad_user_id, io.salesrep_id, io.c_doctype_id, dt.printname AS documenttype, io.c_order_id, io.dateordered, io.movementdate, io.movementtype, io.m_warehouse_id, io.poreference, io.deliveryrule, io.freightcostrule, io.deliveryviarule, io.m_shipper_id, io.priorityrule, ioc.processed FROM ((m_inoutconfirm ioc JOIN m_inout io ON ((ioc.m_inout_id = io.m_inout_id))) JOIN c_doctype_trl dt ON ((io.c_doctype_id = dt.c_doctype_id)));


ALTER TABLE adempiere.m_inoutconfirm_vt OWNER TO adempiere;

--
-- Name: m_inoutlinema_v; Type: VIEW; Schema: adempiere; Owner: adempiere
--

CREATE VIEW m_inoutlinema_v AS
    SELECT m.ad_client_id, m.ad_org_id, m.isactive, m.created, m.createdby, m.updated, m.updatedby, l.m_inout_id, m.m_inoutline_id, l.line, l.m_product_id, m.m_attributesetinstance_id, m.movementqty, l.m_locator_id FROM (m_inoutlinema m JOIN m_inoutline l ON ((m.m_inoutline_id = l.m_inoutline_id))) UNION SELECT m_inoutline.ad_client_id, m_inoutline.ad_org_id, m_inoutline.isactive, m_inoutline.created, m_inoutline.createdby, m_inoutline.updated, m_inoutline.updatedby, m_inoutline.m_inout_id, m_inoutline.m_inoutline_id, m_inoutline.line, m_inoutline.m_product_id, m_inoutline.m_attributesetinstance_id, m_inoutline.movementqty, m_inoutline.m_locator_id FROM m_inoutline;


ALTER TABLE adempiere.m_inoutlinema_v OWNER TO adempiere;

--
-- Name: m_inoutlinema_vt; Type: VIEW; Schema: adempiere; Owner: adempiere
--

CREATE VIEW m_inoutlinema_vt AS
    SELECT m.ad_client_id, m.ad_org_id, m.isactive, m.created, m.createdby, m.updated, m.updatedby, l.m_inout_id, m.m_inoutline_id, l.line, l.m_product_id, m.m_attributesetinstance_id, m.movementqty, l.m_locator_id FROM (m_inoutlinema m JOIN m_inoutline l ON ((m.m_inoutline_id = l.m_inoutline_id))) UNION SELECT m_inoutline.ad_client_id, m_inoutline.ad_org_id, m_inoutline.isactive, m_inoutline.created, m_inoutline.createdby, m_inoutline.updated, m_inoutline.updatedby, m_inoutline.m_inout_id, m_inoutline.m_inoutline_id, m_inoutline.line, m_inoutline.m_product_id, m_inoutline.m_attributesetinstance_id, m_inoutline.movementqty, m_inoutline.m_locator_id FROM m_inoutline;


ALTER TABLE adempiere.m_inoutlinema_vt OWNER TO adempiere;

--
-- Name: m_movementlinema_v; Type: VIEW; Schema: adempiere; Owner: adempiere
--

CREATE VIEW m_movementlinema_v AS
    SELECT m.ad_client_id, m.ad_org_id, m.isactive, m.created, m.createdby, m.updated, m.updatedby, l.m_movement_id, m.m_movementline_id, l.line, l.m_product_id, m.m_attributesetinstance_id, m.movementqty, l.m_locator_id, l.m_locatorto_id FROM (m_movementlinema m JOIN m_movementline l ON ((m.m_movementline_id = l.m_movementline_id))) UNION SELECT m_movementline.ad_client_id, m_movementline.ad_org_id, m_movementline.isactive, m_movementline.created, m_movementline.createdby, m_movementline.updated, m_movementline.updatedby, m_movementline.m_movement_id, m_movementline.m_movementline_id, m_movementline.line, m_movementline.m_product_id, m_movementline.m_attributesetinstance_id, m_movementline.movementqty, m_movementline.m_locator_id, m_movementline.m_locatorto_id FROM m_movementline;


ALTER TABLE adempiere.m_movementlinema_v OWNER TO adempiere;

--
-- Name: m_movementlinema_vt; Type: VIEW; Schema: adempiere; Owner: adempiere
--

CREATE VIEW m_movementlinema_vt AS
    SELECT m.ad_client_id, m.ad_org_id, m.isactive, m.created, m.createdby, m.updated, m.updatedby, l.m_movement_id, m.m_movementline_id, l.line, l.m_product_id, m.m_attributesetinstance_id, m.movementqty, l.m_locator_id, l.m_locatorto_id FROM (m_movementlinema m JOIN m_movementline l ON ((m.m_movementline_id = l.m_movementline_id))) UNION SELECT m_movementline.ad_client_id, m_movementline.ad_org_id, m_movementline.isactive, m_movementline.created, m_movementline.createdby, m_movementline.updated, m_movementline.updatedby, m_movementline.m_movement_id, m_movementline.m_movementline_id, m_movementline.line, m_movementline.m_product_id, m_movementline.m_attributesetinstance_id, m_movementline.movementqty, m_movementline.m_locator_id, m_movementline.m_locatorto_id FROM m_movementline;


ALTER TABLE adempiere.m_movementlinema_vt OWNER TO adempiere;

--
-- Name: m_transaction_v; Type: VIEW; Schema: adempiere; Owner: adempiere
--

CREATE VIEW m_transaction_v AS
    SELECT t.m_transaction_id, t.ad_client_id, t.ad_org_id, t.isactive, t.created, t.createdby, t.updated, t.updatedby, t.movementtype, t.m_locator_id, t.m_product_id, t.movementdate, t.movementqty, t.m_inventoryline_id, i.m_inventory_id, t.m_movementline_id, m.m_movement_id, t.m_inoutline_id, io.m_inout_id, t.m_productionline_id, pp.m_production_id, t.c_projectissue_id, pi.c_project_id, t.m_attributesetinstance_id FROM ((((((m_transaction t LEFT JOIN m_inoutline io ON (((t.m_inoutline_id = io.m_inoutline_id) AND (t.m_attributesetinstance_id = io.m_attributesetinstance_id)))) LEFT JOIN m_movementline m ON (((t.m_movementline_id = m.m_movementline_id) AND (t.m_attributesetinstance_id = m.m_attributesetinstance_id)))) LEFT JOIN m_inventoryline i ON (((t.m_inventoryline_id = i.m_inventoryline_id) AND (t.m_attributesetinstance_id = i.m_attributesetinstance_id)))) LEFT JOIN c_projectissue pi ON (((t.c_projectissue_id = pi.c_projectissue_id) AND (t.m_attributesetinstance_id = pi.m_attributesetinstance_id)))) LEFT JOIN m_productionline pl ON (((t.m_productionline_id = pl.m_productionline_id) AND (t.m_attributesetinstance_id = pl.m_attributesetinstance_id)))) LEFT JOIN m_productionplan pp ON ((pl.m_productionplan_id = pp.m_productionplan_id)));


ALTER TABLE adempiere.m_transaction_v OWNER TO adempiere;

--
-- Name: r_request_v; Type: VIEW; Schema: adempiere; Owner: adempiere
--

CREATE VIEW r_request_v AS
    SELECT r_request.r_request_id, r_request.ad_client_id, r_request.ad_org_id, r_request.isactive, r_request.created, r_request.createdby, r_request.updated, r_request.updatedby, r_request.documentno, r_request.r_requesttype_id, r_request.r_group_id, r_request.r_category_id, r_request.r_status_id, r_request.r_resolution_id, r_request.r_requestrelated_id, r_request.priority, r_request.priorityuser, r_request.duetype, r_request.summary, r_request.confidentialtype, r_request.isescalated, r_request.isselfservice, r_request.salesrep_id, r_request.ad_role_id, r_request.datelastaction, r_request.datelastalert, r_request.lastresult, r_request.processed, r_request.isinvoiced, r_request.c_bpartner_id, r_request.ad_user_id, r_request.c_campaign_id, r_request.c_order_id, r_request.c_invoice_id, r_request.c_payment_id, r_request.m_product_id, r_request.c_project_id, r_request.a_asset_id, r_request.m_inout_id, r_request.m_rma_id, r_request.ad_table_id, r_request.record_id, r_request.requestamt, r_request.r_mailtext_id, r_request.result, r_request.confidentialtypeentry, r_request.r_standardresponse_id, r_request.nextaction, r_request.datenextaction, r_request.starttime, r_request.endtime, r_request.qtyspent, r_request.qtyinvoiced, r_request.m_productspent_id, r_request.c_activity_id, r_request.startdate, r_request.closedate, r_request.c_invoicerequest_id, r_request.m_changerequest_id, r_request.taskstatus, r_request.qtyplan, r_request.datecompleteplan, r_request.datestartplan, r_request.m_fixchangenotice_id FROM r_request WHERE (((r_request.isactive = 'Y'::bpchar) AND (r_request.processed = 'N'::bpchar)) AND (getdate() > r_request.datenextaction));


ALTER TABLE adempiere.r_request_v OWNER TO adempiere;

--
-- Name: rv_allocation; Type: VIEW; Schema: adempiere; Owner: adempiere
--

CREATE VIEW rv_allocation AS
    SELECT h.c_allocationhdr_id, h.ad_client_id, h.ad_org_id, h.isactive, h.created, h.createdby, h.updated, h.updatedby, h.documentno, h.description, h.datetrx, h.dateacct, h.c_currency_id, h.approvalamt, h.ismanual, h.docstatus, h.docaction, h.processed, l.c_allocationline_id, l.c_invoice_id, l.c_bpartner_id, l.c_order_id, l.c_payment_id, l.c_cashline_id, l.amount, l.discountamt, l.writeoffamt, l.overunderamt FROM (c_allocationhdr h JOIN c_allocationline l ON ((h.c_allocationhdr_id = l.c_allocationhdr_id)));


ALTER TABLE adempiere.rv_allocation OWNER TO adempiere;

--
-- Name: rv_asset_customer; Type: VIEW; Schema: adempiere; Owner: adempiere
--

CREATE VIEW rv_asset_customer AS
    SELECT a.a_asset_id, a.ad_client_id, a.ad_org_id, a.isactive, a.created, a.createdby, a.updated, a.updatedby, a.value, a.name, a.description, a.help, a.a_asset_group_id, a.m_product_id, a.serno, a.lot, a.versionno, a.guaranteedate, a.assetservicedate, a.c_bpartner_id, a.c_bpartner_location_id, a.ad_user_id, (SELECT count(*) AS count FROM a_asset_delivery ad WHERE (a.a_asset_id = ad.a_asset_id)) AS deliverycount FROM a_asset a WHERE (a.c_bpartner_id IS NOT NULL);


ALTER TABLE adempiere.rv_asset_customer OWNER TO adempiere;

--
-- Name: rv_asset_delivery; Type: VIEW; Schema: adempiere; Owner: adempiere
--

CREATE VIEW rv_asset_delivery AS
    SELECT ad.a_asset_delivery_id, ad.ad_client_id, ad.ad_org_id, ad.isactive, ad.created, ad.createdby, ad.updated, ad.updatedby, a.a_asset_id, a.a_asset_group_id, a.m_product_id, a.guaranteedate, a.assetservicedate, a.c_bpartner_id, ad.ad_user_id, ad.movementdate, ad.serno, ad.lot, ad.versionno, ad.m_inoutline_id, ad.email, ad.messageid, ad.deliveryconfirmation, ad.url, ad.remote_addr, ad.remote_host, ad.referrer, ad.description FROM (a_asset_delivery ad JOIN a_asset a ON ((a.a_asset_id = ad.a_asset_id)));


ALTER TABLE adempiere.rv_asset_delivery OWNER TO adempiere;

--
-- Name: rv_asset_summonth; Type: VIEW; Schema: adempiere; Owner: adempiere
--

CREATE VIEW rv_asset_summonth AS
    SELECT a.ad_client_id, a.ad_org_id, a.isactive, a.created, a.createdby, a.updated, a.updatedby, a.a_asset_id, a.a_asset_group_id, a.m_product_id, a.value, a.name, a.description, a.help, a.guaranteedate, a.assetservicedate, a.c_bpartner_id, a.ad_user_id, a.serno, a.lot, a.versionno, firstof((ad.movementdate)::timestamp with time zone, 'MM'::character varying) AS movementdate, count(*) AS deliverycount FROM (a_asset a JOIN a_asset_delivery ad ON ((a.a_asset_id = ad.a_asset_id))) GROUP BY a.ad_client_id, a.ad_org_id, a.isactive, a.created, a.createdby, a.updated, a.updatedby, a.a_asset_id, a.a_asset_group_id, a.m_product_id, a.value, a.name, a.description, a.help, a.guaranteedate, a.assetservicedate, a.c_bpartner_id, a.ad_user_id, a.serno, a.lot, a.versionno, firstof((ad.movementdate)::timestamp with time zone, 'MM'::character varying);


ALTER TABLE adempiere.rv_asset_summonth OWNER TO adempiere;

--
-- Name: rv_bpartner; Type: VIEW; Schema: adempiere; Owner: adempiere
--

CREATE VIEW rv_bpartner AS
    SELECT bp.ad_client_id, bp.ad_org_id, bp.isactive, bp.created, bp.createdby, bp.updated, bp.updatedby, bp.c_bpartner_id, bp.value, bp.name, bp.name2, bp.description, bp.issummary, bp.c_bp_group_id, bp.isonetime, bp.isprospect, bp.isvendor, bp.iscustomer, bp.isemployee, bp.issalesrep, bp.referenceno, bp.duns, bp.url, bp.ad_language, bp.taxid, bp.istaxexempt, bp.c_invoiceschedule_id, bp.rating, bp.salesvolume, bp.numberemployees, bp.naics, bp.firstsale, bp.acqusitioncost, bp.potentiallifetimevalue, bp.actuallifetimevalue, bp.shareofcustomer, bp.paymentrule, bp.so_creditlimit, bp.so_creditused, (bp.so_creditused - bp.so_creditlimit) AS so_creditavailable, bp.c_paymentterm_id, bp.m_pricelist_id, bp.m_discountschema_id, bp.c_dunning_id, bp.isdiscountprinted, bp.so_description, bp.poreference, bp.paymentrulepo, bp.po_pricelist_id, bp.po_discountschema_id, bp.po_paymentterm_id, bp.documentcopies, bp.c_greeting_id, bp.invoicerule, bp.deliveryrule, bp.freightcostrule, bp.deliveryviarule, bp.salesrep_id, bp.sendemail, bp.bpartner_parent_id, bp.invoice_printformat_id, bp.socreditstatus, bp.shelflifeminpct, bp.ad_orgbp_id, bp.flatdiscount, bp.totalopenbalance, c.ad_user_id, c.name AS contactname, c.description AS contactdescription, c.email, c.supervisor_id, c.emailuser, c.c_greeting_id AS bpcontactgreeting, c.title, c.comments, c.phone, c.phone2, c.fax, c.lastcontact, c.lastresult, c.birthday, c.ad_orgtrx_id, c.emailverify, c.ldapuser, c.emailverifydate, c.notificationtype, l.c_bpartner_location_id, a.postal, a.city, a.address1, a.address2, a.address3, a.c_region_id, COALESCE(r.name, a.regionname) AS regionname, a.c_country_id, cc.name AS countryname FROM (((((c_bpartner bp LEFT JOIN c_bpartner_location l ON (((bp.c_bpartner_id = l.c_bpartner_id) AND (l.isactive = 'Y'::bpchar)))) LEFT JOIN ad_user c ON ((((bp.c_bpartner_id = c.c_bpartner_id) AND ((c.c_bpartner_location_id IS NULL) OR (c.c_bpartner_location_id = l.c_bpartner_location_id))) AND (c.isactive = 'Y'::bpchar)))) LEFT JOIN c_location a ON ((l.c_location_id = a.c_location_id))) LEFT JOIN c_region r ON ((a.c_region_id = r.c_region_id))) JOIN c_country cc ON ((a.c_country_id = cc.c_country_id)));


ALTER TABLE adempiere.rv_bpartner OWNER TO adempiere;

--
-- Name: rv_bpartneropen; Type: VIEW; Schema: adempiere; Owner: adempiere
--

CREATE VIEW rv_bpartneropen AS
    SELECT i.ad_client_id, i.ad_org_id, i.isactive, i.created, i.createdby, i.updated, i.updatedby, i.c_bpartner_id, i.c_currency_id, (i.grandtotal * i.multiplierap) AS amt, (invoiceopen(i.c_invoice_id, i.c_invoicepayschedule_id) * i.multiplierap) AS openamt, i.dateinvoiced AS datedoc, COALESCE(daysbetween(getdate(), (ips.duedate)::timestamp with time zone), paymenttermduedays(i.c_paymentterm_id, (i.dateinvoiced)::timestamp with time zone, getdate())) AS daysdue, i.c_campaign_id, i.c_project_id, i.c_activity_id FROM (c_invoice_v i LEFT JOIN c_invoicepayschedule ips ON ((i.c_invoicepayschedule_id = ips.c_invoicepayschedule_id))) WHERE ((i.ispaid = 'N'::bpchar) AND (i.docstatus = ANY (ARRAY['CO'::bpchar, 'CL'::bpchar]))) UNION SELECT p.ad_client_id, p.ad_org_id, p.isactive, p.created, p.createdby, p.updated, p.updatedby, p.c_bpartner_id, p.c_currency_id, ((p.payamt * p.multiplierap) * (-1)::numeric) AS amt, ((paymentavailable(p.c_payment_id) * p.multiplierap) * (-1)::numeric) AS openamt, p.datetrx AS datedoc, NULL::"unknown" AS daysdue, p.c_campaign_id, p.c_project_id, p.c_activity_id FROM c_payment_v p WHERE (((p.isallocated = 'N'::bpchar) AND (p.c_bpartner_id IS NOT NULL)) AND (p.docstatus = ANY (ARRAY['CO'::bpchar, 'CL'::bpchar])));


ALTER TABLE adempiere.rv_bpartneropen OWNER TO adempiere;

--
-- Name: rv_c_invoice; Type: VIEW; Schema: adempiere; Owner: adempiere
--

CREATE VIEW rv_c_invoice AS
    SELECT i.c_invoice_id, i.ad_client_id, i.ad_org_id, i.isactive, i.created, i.createdby, i.updated, i.updatedby, i.issotrx, i.documentno, i.docstatus, i.docaction, i.isprinted, i.isdiscountprinted, i.processing, i.processed, i.istransferred, i.ispaid, i.c_doctype_id, i.c_doctypetarget_id, i.c_order_id, i.description, i.isapproved, i.salesrep_id, i.dateinvoiced, i.dateprinted, i.dateacct, i.c_bpartner_id, i.c_bpartner_location_id, i.ad_user_id, b.c_bp_group_id, i.poreference, i.dateordered, i.c_currency_id, i.c_conversiontype_id, i.paymentrule, i.c_paymentterm_id, i.m_pricelist_id, i.c_campaign_id, i.c_project_id, i.c_activity_id, i.ispayschedulevalid, i.invoicecollectiontype, loc.c_country_id, loc.c_region_id, loc.postal, loc.city, i.c_charge_id, CASE WHEN ((charat((d.docbasetype)::character varying, 3))::text = 'C'::text) THEN (i.chargeamt * (-1)::numeric) ELSE i.chargeamt END AS chargeamt, CASE WHEN ((charat((d.docbasetype)::character varying, 3))::text = 'C'::text) THEN (i.totallines * (-1)::numeric) ELSE i.totallines END AS totallines, CASE WHEN ((charat((d.docbasetype)::character varying, 3))::text = 'C'::text) THEN (i.grandtotal * (-1)::numeric) ELSE i.grandtotal END AS grandtotal, CASE WHEN ((charat((d.docbasetype)::character varying, 3))::text = 'C'::text) THEN -1.0 ELSE 1.0 END AS multiplier FROM ((((c_invoice i JOIN c_doctype d ON ((i.c_doctype_id = d.c_doctype_id))) JOIN c_bpartner b ON ((i.c_bpartner_id = b.c_bpartner_id))) JOIN c_bpartner_location bpl ON ((i.c_bpartner_location_id = bpl.c_bpartner_location_id))) JOIN c_location loc ON ((bpl.c_location_id = loc.c_location_id)));


ALTER TABLE adempiere.rv_c_invoice OWNER TO adempiere;

--
-- Name: rv_c_invoiceline; Type: VIEW; Schema: adempiere; Owner: adempiere
--

CREATE VIEW rv_c_invoiceline AS
    SELECT il.ad_client_id, il.ad_org_id, il.isactive, il.created, il.createdby, il.updated, il.updatedby, il.c_invoiceline_id, i.c_invoice_id, i.salesrep_id, i.c_bpartner_id, i.c_bp_group_id, il.m_product_id, p.m_product_category_id, i.dateinvoiced, i.dateacct, i.issotrx, i.c_doctype_id, i.docstatus, i.ispaid, il.c_campaign_id, il.c_project_id, il.c_activity_id, il.c_projectphase_id, il.c_projecttask_id, (il.qtyinvoiced * i.multiplier) AS qtyinvoiced, (il.qtyentered * i.multiplier) AS qtyentered, il.m_attributesetinstance_id, productattribute(il.m_attributesetinstance_id) AS productattribute, pasi.m_attributeset_id, pasi.m_lot_id, pasi.guaranteedate, pasi.lot, pasi.serno, il.pricelist, il.priceactual, il.pricelimit, il.priceentered, CASE WHEN (il.pricelist = (0)::numeric) THEN (0)::numeric ELSE round((((il.pricelist - il.priceactual) / il.pricelist) * (100)::numeric), 2) END AS discount, CASE WHEN (il.pricelimit = (0)::numeric) THEN (0)::numeric ELSE round((((il.priceactual - il.pricelimit) / il.pricelimit) * (100)::numeric), 2) END AS margin, CASE WHEN (il.pricelimit = (0)::numeric) THEN (0)::numeric ELSE ((il.priceactual - il.pricelimit) * il.qtyinvoiced) END AS marginamt, round((i.multiplier * il.linenetamt), 2) AS linenetamt, round(((i.multiplier * il.pricelist) * il.qtyinvoiced), 2) AS linelistamt, CASE WHEN (COALESCE(il.pricelimit, (0)::numeric) = (0)::numeric) THEN round((i.multiplier * il.linenetamt), 2) ELSE round(((i.multiplier * il.pricelimit) * il.qtyinvoiced), 2) END AS linelimitamt, round((((i.multiplier * il.pricelist) * il.qtyinvoiced) - il.linenetamt), 2) AS linediscountamt, CASE WHEN (COALESCE(il.pricelimit, (0)::numeric) = (0)::numeric) THEN (0)::numeric ELSE round(((i.multiplier * il.linenetamt) - (il.pricelimit * il.qtyinvoiced)), 2) END AS lineoverlimitamt FROM (((rv_c_invoice i JOIN c_invoiceline il ON ((i.c_invoice_id = il.c_invoice_id))) LEFT JOIN m_product p ON ((il.m_product_id = p.m_product_id))) LEFT JOIN m_attributesetinstance pasi ON ((il.m_attributesetinstance_id = pasi.m_attributesetinstance_id)));


ALTER TABLE adempiere.rv_c_invoiceline OWNER TO adempiere;

--
-- Name: rv_c_invoice_customerprodqtr; Type: VIEW; Schema: adempiere; Owner: adempiere
--

CREATE VIEW rv_c_invoice_customerprodqtr AS
    SELECT il.ad_client_id, il.ad_org_id, il.c_bpartner_id, il.m_product_category_id, firstof((il.dateinvoiced)::timestamp with time zone, 'Q'::character varying) AS dateinvoiced, sum(il.linenetamt) AS linenetamt, sum(il.linelistamt) AS linelistamt, sum(il.linelimitamt) AS linelimitamt, sum(il.linediscountamt) AS linediscountamt, CASE WHEN (sum(il.linelistamt) = (0)::numeric) THEN (0)::numeric ELSE round((((sum(il.linelistamt) - sum(il.linenetamt)) / sum(il.linelistamt)) * (100)::numeric), 2) END AS linediscount, sum(il.lineoverlimitamt) AS lineoverlimitamt, CASE WHEN (sum(il.linenetamt) = (0)::numeric) THEN (0)::numeric ELSE ((100)::numeric - round((((sum(il.linenetamt) - sum(il.lineoverlimitamt)) / sum(il.linenetamt)) * (100)::numeric), 2)) END AS lineoverlimit, sum(il.qtyinvoiced) AS qtyinvoiced, il.issotrx FROM rv_c_invoiceline il GROUP BY il.ad_client_id, il.ad_org_id, il.c_bpartner_id, il.m_product_category_id, firstof((il.dateinvoiced)::timestamp with time zone, 'Q'::character varying), il.issotrx;


ALTER TABLE adempiere.rv_c_invoice_customerprodqtr OWNER TO adempiere;

--
-- Name: rv_c_invoice_customervendqtr; Type: VIEW; Schema: adempiere; Owner: adempiere
--

CREATE VIEW rv_c_invoice_customervendqtr AS
    SELECT il.ad_client_id, il.ad_org_id, il.c_bpartner_id, po.c_bpartner_id AS vendor_id, firstof((il.dateinvoiced)::timestamp with time zone, 'Q'::character varying) AS dateinvoiced, sum(il.linenetamt) AS linenetamt, sum(il.linelistamt) AS linelistamt, sum(il.linelimitamt) AS linelimitamt, sum(il.linediscountamt) AS linediscountamt, CASE WHEN (sum(il.linelistamt) = (0)::numeric) THEN (0)::numeric ELSE round((((sum(il.linelistamt) - sum(il.linenetamt)) / sum(il.linelistamt)) * (100)::numeric), 2) END AS linediscount, sum(il.lineoverlimitamt) AS lineoverlimitamt, CASE WHEN (sum(il.linenetamt) = (0)::numeric) THEN (0)::numeric ELSE ((100)::numeric - round((((sum(il.linenetamt) - sum(il.lineoverlimitamt)) / sum(il.linenetamt)) * (100)::numeric), 2)) END AS lineoverlimit, sum(il.qtyinvoiced) AS qtyinvoiced FROM (rv_c_invoiceline il JOIN m_product_po po ON ((il.m_product_id = po.m_product_id))) WHERE (il.issotrx = 'Y'::bpchar) GROUP BY il.ad_client_id, il.ad_org_id, il.c_bpartner_id, po.c_bpartner_id, firstof((il.dateinvoiced)::timestamp with time zone, 'Q'::character varying);


ALTER TABLE adempiere.rv_c_invoice_customervendqtr OWNER TO adempiere;

--
-- Name: rv_c_invoice_day; Type: VIEW; Schema: adempiere; Owner: adempiere
--

CREATE VIEW rv_c_invoice_day AS
    SELECT rv_c_invoiceline.ad_client_id, rv_c_invoiceline.ad_org_id, rv_c_invoiceline.salesrep_id, firstof((rv_c_invoiceline.dateinvoiced)::timestamp with time zone, 'DD'::character varying) AS dateinvoiced, sum(rv_c_invoiceline.linenetamt) AS linenetamt, sum(rv_c_invoiceline.linelistamt) AS linelistamt, sum(rv_c_invoiceline.linelimitamt) AS linelimitamt, sum(rv_c_invoiceline.linediscountamt) AS linediscountamt, CASE WHEN (sum(rv_c_invoiceline.linelistamt) = (0)::numeric) THEN (0)::numeric ELSE round((((sum(rv_c_invoiceline.linelistamt) - sum(rv_c_invoiceline.linenetamt)) / sum(rv_c_invoiceline.linelistamt)) * (100)::numeric), 2) END AS linediscount, sum(rv_c_invoiceline.lineoverlimitamt) AS lineoverlimitamt, CASE WHEN (sum(rv_c_invoiceline.linenetamt) = (0)::numeric) THEN (0)::numeric ELSE ((100)::numeric - round((((sum(rv_c_invoiceline.linenetamt) - sum(rv_c_invoiceline.lineoverlimitamt)) / sum(rv_c_invoiceline.linenetamt)) * (100)::numeric), 2)) END AS lineoverlimit, rv_c_invoiceline.issotrx FROM rv_c_invoiceline GROUP BY rv_c_invoiceline.ad_client_id, rv_c_invoiceline.ad_org_id, rv_c_invoiceline.salesrep_id, firstof((rv_c_invoiceline.dateinvoiced)::timestamp with time zone, 'DD'::character varying), rv_c_invoiceline.issotrx;


ALTER TABLE adempiere.rv_c_invoice_day OWNER TO adempiere;

--
-- Name: rv_c_invoice_month; Type: VIEW; Schema: adempiere; Owner: adempiere
--

CREATE VIEW rv_c_invoice_month AS
    SELECT rv_c_invoiceline.ad_client_id, rv_c_invoiceline.ad_org_id, rv_c_invoiceline.salesrep_id, firstof((rv_c_invoiceline.dateinvoiced)::timestamp with time zone, 'MM'::character varying) AS dateinvoiced, sum(rv_c_invoiceline.linenetamt) AS linenetamt, sum(rv_c_invoiceline.linelistamt) AS linelistamt, sum(rv_c_invoiceline.linelimitamt) AS linelimitamt, sum(rv_c_invoiceline.linediscountamt) AS linediscountamt, CASE WHEN (sum(rv_c_invoiceline.linelistamt) = (0)::numeric) THEN (0)::numeric ELSE round((((sum(rv_c_invoiceline.linelistamt) - sum(rv_c_invoiceline.linenetamt)) / sum(rv_c_invoiceline.linelistamt)) * (100)::numeric), 2) END AS linediscount, sum(rv_c_invoiceline.lineoverlimitamt) AS lineoverlimitamt, CASE WHEN (sum(rv_c_invoiceline.linenetamt) = (0)::numeric) THEN (0)::numeric ELSE ((100)::numeric - round((((sum(rv_c_invoiceline.linenetamt) - sum(rv_c_invoiceline.lineoverlimitamt)) / sum(rv_c_invoiceline.linenetamt)) * (100)::numeric), 2)) END AS lineoverlimit, rv_c_invoiceline.issotrx FROM rv_c_invoiceline GROUP BY rv_c_invoiceline.ad_client_id, rv_c_invoiceline.ad_org_id, rv_c_invoiceline.salesrep_id, firstof((rv_c_invoiceline.dateinvoiced)::timestamp with time zone, 'MM'::character varying), rv_c_invoiceline.issotrx;


ALTER TABLE adempiere.rv_c_invoice_month OWNER TO adempiere;

--
-- Name: rv_c_invoice_prodmonth; Type: VIEW; Schema: adempiere; Owner: adempiere
--

CREATE VIEW rv_c_invoice_prodmonth AS
    SELECT il.ad_client_id, il.ad_org_id, il.m_product_category_id, firstof((il.dateinvoiced)::timestamp with time zone, 'MM'::character varying) AS dateinvoiced, sum(il.linenetamt) AS linenetamt, sum(il.linelistamt) AS linelistamt, sum(il.linelimitamt) AS linelimitamt, sum(il.linediscountamt) AS linediscountamt, CASE WHEN (sum(il.linelistamt) = (0)::numeric) THEN (0)::numeric ELSE round((((sum(il.linelistamt) - sum(il.linenetamt)) / sum(il.linelistamt)) * (100)::numeric), 2) END AS linediscount, sum(il.lineoverlimitamt) AS lineoverlimitamt, CASE WHEN (sum(il.linenetamt) = (0)::numeric) THEN (0)::numeric ELSE ((100)::numeric - round((((sum(il.linenetamt) - sum(il.lineoverlimitamt)) / sum(il.linenetamt)) * (100)::numeric), 2)) END AS lineoverlimit, sum(il.qtyinvoiced) AS qtyinvoiced, il.issotrx FROM rv_c_invoiceline il GROUP BY il.ad_client_id, il.ad_org_id, il.m_product_category_id, firstof((il.dateinvoiced)::timestamp with time zone, 'MM'::character varying), il.issotrx;


ALTER TABLE adempiere.rv_c_invoice_prodmonth OWNER TO adempiere;

--
-- Name: rv_c_invoice_productmonth; Type: VIEW; Schema: adempiere; Owner: adempiere
--

CREATE VIEW rv_c_invoice_productmonth AS
    SELECT il.ad_client_id, il.ad_org_id, il.m_product_id, firstof((il.dateinvoiced)::timestamp with time zone, 'MM'::character varying) AS dateinvoiced, sum(il.linenetamt) AS linenetamt, sum(il.linelistamt) AS linelistamt, sum(il.linelimitamt) AS linelimitamt, sum(il.linediscountamt) AS linediscountamt, CASE WHEN (sum(il.linelistamt) = (0)::numeric) THEN (0)::numeric ELSE round((((sum(il.linelistamt) - sum(il.linenetamt)) / sum(il.linelistamt)) * (100)::numeric), 2) END AS linediscount, sum(il.lineoverlimitamt) AS lineoverlimitamt, CASE WHEN (sum(il.linenetamt) = (0)::numeric) THEN (0)::numeric ELSE ((100)::numeric - round((((sum(il.linenetamt) - sum(il.lineoverlimitamt)) / sum(il.linenetamt)) * (100)::numeric), 2)) END AS lineoverlimit, sum(il.qtyinvoiced) AS qtyinvoiced, il.issotrx FROM rv_c_invoiceline il GROUP BY il.ad_client_id, il.ad_org_id, il.m_product_id, firstof((il.dateinvoiced)::timestamp with time zone, 'MM'::character varying), il.issotrx;


ALTER TABLE adempiere.rv_c_invoice_productmonth OWNER TO adempiere;

--
-- Name: rv_c_invoice_productqtr; Type: VIEW; Schema: adempiere; Owner: adempiere
--

CREATE VIEW rv_c_invoice_productqtr AS
    SELECT il.ad_client_id, il.ad_org_id, il.m_product_id, firstof((il.dateinvoiced)::timestamp with time zone, 'Q'::character varying) AS dateinvoiced, sum(il.linenetamt) AS linenetamt, sum(il.linelistamt) AS linelistamt, sum(il.linelimitamt) AS linelimitamt, sum(il.linediscountamt) AS linediscountamt, CASE WHEN (sum(il.linelistamt) = (0)::numeric) THEN (0)::numeric ELSE round((((sum(il.linelistamt) - sum(il.linenetamt)) / sum(il.linelistamt)) * (100)::numeric), 2) END AS linediscount, sum(il.lineoverlimitamt) AS lineoverlimitamt, CASE WHEN (sum(il.linenetamt) = (0)::numeric) THEN (0)::numeric ELSE ((100)::numeric - round((((sum(il.linenetamt) - sum(il.lineoverlimitamt)) / sum(il.linenetamt)) * (100)::numeric), 2)) END AS lineoverlimit, sum(il.qtyinvoiced) AS qtyinvoiced, il.issotrx FROM rv_c_invoiceline il GROUP BY il.ad_client_id, il.ad_org_id, il.m_product_id, firstof((il.dateinvoiced)::timestamp with time zone, 'Q'::character varying), il.issotrx;


ALTER TABLE adempiere.rv_c_invoice_productqtr OWNER TO adempiere;

--
-- Name: rv_c_invoice_prodweek; Type: VIEW; Schema: adempiere; Owner: adempiere
--

CREATE VIEW rv_c_invoice_prodweek AS
    SELECT il.ad_client_id, il.ad_org_id, il.m_product_category_id, firstof((il.dateinvoiced)::timestamp with time zone, 'DY'::character varying) AS dateinvoiced, sum(il.linenetamt) AS linenetamt, sum(il.linelistamt) AS linelistamt, sum(il.linelimitamt) AS linelimitamt, sum(il.linediscountamt) AS linediscountamt, CASE WHEN (sum(il.linelistamt) = (0)::numeric) THEN (0)::numeric ELSE round((((sum(il.linelistamt) - sum(il.linenetamt)) / sum(il.linelistamt)) * (100)::numeric), 2) END AS linediscount, sum(il.lineoverlimitamt) AS lineoverlimitamt, CASE WHEN (sum(il.linenetamt) = (0)::numeric) THEN (0)::numeric ELSE ((100)::numeric - round((((sum(il.linenetamt) - sum(il.lineoverlimitamt)) / sum(il.linenetamt)) * (100)::numeric), 2)) END AS lineoverlimit, sum(il.qtyinvoiced) AS qtyinvoiced, il.issotrx FROM rv_c_invoiceline il GROUP BY il.ad_client_id, il.ad_org_id, il.m_product_category_id, firstof((il.dateinvoiced)::timestamp with time zone, 'DY'::character varying), il.issotrx;


ALTER TABLE adempiere.rv_c_invoice_prodweek OWNER TO adempiere;

--
-- Name: rv_c_invoice_vendormonth; Type: VIEW; Schema: adempiere; Owner: adempiere
--

CREATE VIEW rv_c_invoice_vendormonth AS
    SELECT il.ad_client_id, il.ad_org_id, po.c_bpartner_id, il.m_product_category_id, firstof((il.dateinvoiced)::timestamp with time zone, 'MM'::character varying) AS dateinvoiced, sum(il.linenetamt) AS linenetamt, sum(il.linelistamt) AS linelistamt, sum(il.linelimitamt) AS linelimitamt, sum(il.linediscountamt) AS linediscountamt, CASE WHEN (sum(il.linelistamt) = (0)::numeric) THEN (0)::numeric ELSE round((((sum(il.linelistamt) - sum(il.linenetamt)) / sum(il.linelistamt)) * (100)::numeric), 2) END AS linediscount, sum(il.lineoverlimitamt) AS lineoverlimitamt, CASE WHEN (sum(il.linenetamt) = (0)::numeric) THEN (0)::numeric ELSE ((100)::numeric - round((((sum(il.linenetamt) - sum(il.lineoverlimitamt)) / sum(il.linenetamt)) * (100)::numeric), 2)) END AS lineoverlimit, sum(il.qtyinvoiced) AS qtyinvoiced FROM (rv_c_invoiceline il JOIN m_product_po po ON ((il.m_product_id = po.m_product_id))) WHERE (il.issotrx = 'Y'::bpchar) GROUP BY il.ad_client_id, il.ad_org_id, po.c_bpartner_id, il.m_product_category_id, firstof((il.dateinvoiced)::timestamp with time zone, 'MM'::character varying);


ALTER TABLE adempiere.rv_c_invoice_vendormonth OWNER TO adempiere;

--
-- Name: rv_c_invoice_week; Type: VIEW; Schema: adempiere; Owner: adempiere
--

CREATE VIEW rv_c_invoice_week AS
    SELECT rv_c_invoiceline.ad_client_id, rv_c_invoiceline.ad_org_id, rv_c_invoiceline.salesrep_id, firstof((rv_c_invoiceline.dateinvoiced)::timestamp with time zone, 'DY'::character varying) AS dateinvoiced, sum(rv_c_invoiceline.linenetamt) AS linenetamt, sum(rv_c_invoiceline.linelistamt) AS linelistamt, sum(rv_c_invoiceline.linelimitamt) AS linelimitamt, sum(rv_c_invoiceline.linediscountamt) AS linediscountamt, CASE WHEN (sum(rv_c_invoiceline.linelistamt) = (0)::numeric) THEN (0)::numeric ELSE round((((sum(rv_c_invoiceline.linelistamt) - sum(rv_c_invoiceline.linenetamt)) / sum(rv_c_invoiceline.linelistamt)) * (100)::numeric), 2) END AS linediscount, sum(rv_c_invoiceline.lineoverlimitamt) AS lineoverlimitamt, CASE WHEN (sum(rv_c_invoiceline.linenetamt) = (0)::numeric) THEN (0)::numeric ELSE ((100)::numeric - round((((sum(rv_c_invoiceline.linenetamt) - sum(rv_c_invoiceline.lineoverlimitamt)) / sum(rv_c_invoiceline.linenetamt)) * (100)::numeric), 2)) END AS lineoverlimit, rv_c_invoiceline.issotrx FROM rv_c_invoiceline GROUP BY rv_c_invoiceline.ad_client_id, rv_c_invoiceline.ad_org_id, rv_c_invoiceline.salesrep_id, firstof((rv_c_invoiceline.dateinvoiced)::timestamp with time zone, 'DY'::character varying), rv_c_invoiceline.issotrx;


ALTER TABLE adempiere.rv_c_invoice_week OWNER TO adempiere;

--
-- Name: rv_c_invoicetax; Type: VIEW; Schema: adempiere; Owner: adempiere
--

CREATE VIEW rv_c_invoicetax AS
    SELECT i.ad_client_id, i.ad_org_id, i.isactive, t.created, t.createdby, t.updated, t.updatedby, t.c_tax_id, i.c_invoice_id, i.c_doctype_id, i.c_bpartner_id, bp.taxid, bp.istaxexempt, i.dateacct, i.dateinvoiced, i.issotrx, i.documentno, i.ispaid, i.c_currency_id, CASE WHEN ((charat((d.docbasetype)::character varying, 3))::text = 'C'::text) THEN (t.taxbaseamt * (-1)::numeric) ELSE t.taxbaseamt END AS taxbaseamt, CASE WHEN ((charat((d.docbasetype)::character varying, 3))::text = 'C'::text) THEN (t.taxamt * (-1)::numeric) ELSE t.taxamt END AS taxamt, CASE WHEN ((charat((d.docbasetype)::character varying, 3))::text = 'C'::text) THEN ((t.taxbaseamt + t.taxamt) * (-1)::numeric) ELSE (t.taxbaseamt + t.taxamt) END AS taxlinetotal, CASE WHEN ((charat((d.docbasetype)::character varying, 3))::text = 'C'::text) THEN -1.0 ELSE 1.0 END AS multiplier FROM (((c_invoicetax t JOIN c_invoice i ON ((t.c_invoice_id = i.c_invoice_id))) JOIN c_doctype d ON ((i.c_doctype_id = d.c_doctype_id))) JOIN c_bpartner bp ON ((i.c_bpartner_id = bp.c_bpartner_id)));


ALTER TABLE adempiere.rv_c_invoicetax OWNER TO adempiere;

--
-- Name: rv_c_rfq_unanswered; Type: VIEW; Schema: adempiere; Owner: adempiere
--

CREATE VIEW rv_c_rfq_unanswered AS
    SELECT q.ad_client_id, q.ad_org_id, q.c_rfq_id, q.name, q.description, q.help, q.salesrep_id, q.c_rfq_topic_id, q.quotetype, q.isquotetotalamt, q.isquoteallqty, q.c_currency_id, q.dateresponse, q.isrfqresponseaccepted, q.dateworkstart, q.deliverydays, q.dateworkcomplete, r.c_bpartner_id, r.c_bpartner_location_id, r.ad_user_id FROM (c_rfq q JOIN c_rfqresponse r ON ((q.c_rfq_id = r.c_rfq_id))) WHERE ((r.iscomplete = 'N'::bpchar) AND (q.processed = 'N'::bpchar));


ALTER TABLE adempiere.rv_c_rfq_unanswered OWNER TO adempiere;

--
-- Name: rv_c_rfqresponse; Type: VIEW; Schema: adempiere; Owner: adempiere
--

CREATE VIEW rv_c_rfqresponse AS
    SELECT q.ad_client_id, q.ad_org_id, q.c_rfq_id, q.c_rfq_topic_id, r.c_bpartner_id, r.c_bpartner_location_id, r.ad_user_id, r.c_rfqresponse_id, r.c_currency_id, r.dateresponse, r.dateworkstart, r.deliverydays, r.dateworkcomplete, r.price, r.ranking, r.isselfservice, r.description, r.help, ql.m_product_id, ql.m_attributesetinstance_id, ql.line, rl.dateworkstart AS linedateworkstart, rl.deliverydays AS linedeliverydays, rl.dateworkcomplete AS linedateworkcomplete, rl.description AS linedescription, rl.help AS linehelp, qlq.c_uom_id, qlq.qty, qlq.benchmarkprice, (rlq.price - qlq.benchmarkprice) AS benchmarkdifference, rlq.price AS qtyprice, rlq.discount, rlq.ranking AS qtyranking FROM (((((c_rfq q JOIN c_rfqline ql ON ((q.c_rfq_id = ql.c_rfq_id))) JOIN c_rfqlineqty qlq ON ((ql.c_rfqline_id = qlq.c_rfqline_id))) JOIN c_rfqresponse r ON ((q.c_rfq_id = r.c_rfq_id))) JOIN c_rfqresponseline rl ON (((r.c_rfqresponse_id = rl.c_rfqresponse_id) AND (ql.c_rfqline_id = rl.c_rfqline_id)))) JOIN c_rfqresponselineqty rlq ON (((rl.c_rfqresponseline_id = rlq.c_rfqresponseline_id) AND (qlq.c_rfqlineqty_id = rlq.c_rfqlineqty_id)))) WHERE ((r.iscomplete = 'Y'::bpchar) AND (q.processed = 'N'::bpchar));


ALTER TABLE adempiere.rv_c_rfqresponse OWNER TO adempiere;

--
-- Name: rv_cash_detail; Type: VIEW; Schema: adempiere; Owner: adempiere
--

CREATE VIEW rv_cash_detail AS
    SELECT cl.c_cash_id, cl.c_cashline_id, c.ad_client_id, c.ad_org_id, cl.isactive, cl.created, cl.createdby, cl.updated, cl.updatedby, c.c_cashbook_id, c.name, c.statementdate, c.dateacct, c.processed, c.posted, cl.line, cl.description, cl.cashtype, cl.c_currency_id, cl.amount, currencyconvert(cl.amount, cl.c_currency_id, cb.c_currency_id, (c.statementdate)::timestamp with time zone, 0, c.ad_client_id, c.ad_org_id) AS convertedamt, cl.c_bankaccount_id, cl.c_invoice_id, cl.c_charge_id FROM ((c_cash c JOIN c_cashline cl ON ((c.c_cash_id = cl.c_cash_id))) JOIN c_cashbook cb ON ((c.c_cashbook_id = cb.c_cashbook_id)));


ALTER TABLE adempiere.rv_cash_detail OWNER TO adempiere;

--
-- Name: rv_click_month; Type: VIEW; Schema: adempiere; Owner: adempiere
--

CREATE VIEW rv_click_month AS
    SELECT cc.ad_client_id, cc.ad_org_id, cc.name, cc.description, cc.targeturl, cc.c_bpartner_id, firstof((c.created)::timestamp with time zone, 'MM'::character varying) AS created, count(*) AS counter FROM (w_clickcount cc JOIN w_click c ON ((cc.w_clickcount_id = c.w_clickcount_id))) WHERE (cc.isactive = 'Y'::bpchar) GROUP BY cc.ad_client_id, cc.ad_org_id, cc.name, cc.description, cc.targeturl, cc.c_bpartner_id, firstof((c.created)::timestamp with time zone, 'MM'::character varying);


ALTER TABLE adempiere.rv_click_month OWNER TO adempiere;

--
-- Name: rv_click_unprocessed; Type: VIEW; Schema: adempiere; Owner: adempiere
--

CREATE VIEW rv_click_unprocessed AS
    SELECT w_click.w_click_id, w_click.ad_client_id, w_click.ad_org_id, w_click.isactive, w_click.created, w_click.createdby, w_click.updated, w_click.updatedby, w_click.targeturl, w_click.referrer, w_click.remote_host, w_click.remote_addr, w_click.useragent, w_click.acceptlanguage, w_click.processed, w_click.w_clickcount_id, w_click.ad_user_id, w_click.email FROM w_click WHERE ((w_click.w_clickcount_id IS NULL) OR (w_click.processed = 'N'::bpchar));


ALTER TABLE adempiere.rv_click_unprocessed OWNER TO adempiere;

--
-- Name: rv_commissionrundetail; Type: VIEW; Schema: adempiere; Owner: adempiere
--

CREATE VIEW rv_commissionrundetail AS
    SELECT cr.ad_client_id, cr.ad_org_id, cr.isactive, cr.created, cr.createdby, cr.updated, cr.updatedby, cr.c_commissionrun_id, cr.documentno, cr.description, cr.startdate, cr.grandtotal, cr.processed, c.c_commission_id, c.c_bpartner_id AS commission_bpartner_id, ca.c_commissionamt_id, ca.convertedamt AS commissionconvertedamt, ca.actualqty AS commissionqty, ca.commissionamt, cd.c_commissiondetail_id, cd.reference, cd.c_orderline_id, cd.c_invoiceline_id, cd.info, cd.c_currency_id, cd.actualamt, cd.convertedamt, cd.actualqty, i.documentno AS invoicedocumentno, COALESCE(i.dateinvoiced, o.dateordered) AS datedoc, COALESCE(il.m_product_id, ol.m_product_id) AS m_product_id, COALESCE(i.c_bpartner_id, o.c_bpartner_id) AS c_bpartner_id, COALESCE(i.c_bpartner_location_id, o.c_bpartner_location_id) AS c_bpartner_location_id, COALESCE(i.ad_user_id, o.ad_user_id) AS ad_user_id, COALESCE(i.c_doctype_id, o.c_doctype_id) AS c_doctype_id FROM (((((((c_commissionrun cr JOIN c_commission c ON ((cr.c_commission_id = c.c_commission_id))) JOIN c_commissionamt ca ON ((cr.c_commissionrun_id = ca.c_commissionrun_id))) JOIN c_commissiondetail cd ON ((ca.c_commissionamt_id = cd.c_commissionamt_id))) LEFT JOIN c_orderline ol ON ((cd.c_orderline_id = ol.c_orderline_id))) LEFT JOIN c_invoiceline il ON ((cd.c_invoiceline_id = il.c_invoiceline_id))) LEFT JOIN c_order o ON ((ol.c_order_id = o.c_order_id))) LEFT JOIN c_invoice i ON ((il.c_invoice_id = i.c_invoice_id)));


ALTER TABLE adempiere.rv_commissionrundetail OWNER TO adempiere;

--
-- Name: rv_cost; Type: VIEW; Schema: adempiere; Owner: adempiere
--

CREATE VIEW rv_cost AS
    SELECT c.ad_client_id, c.ad_org_id, c.isactive, c.created, c.createdby, c.updated, c.updatedby, p.m_product_id, p.value, p.name, p.upc, p.isbom, p.producttype, p.m_product_category_id, c.m_costtype_id, ce.m_costelement_id, ce.costelementtype, ce.costingmethod, ce.iscalculated, acct.c_acctschema_id, acct.c_currency_id, c.currentcostprice, c.futurecostprice, c.description FROM (((m_cost c JOIN m_product p ON ((c.m_product_id = p.m_product_id))) JOIN m_costelement ce ON ((c.m_costelement_id = ce.m_costelement_id))) JOIN c_acctschema acct ON ((c.c_acctschema_id = acct.c_acctschema_id)));


ALTER TABLE adempiere.rv_cost OWNER TO adempiere;

--
-- Name: rv_costdetail; Type: VIEW; Schema: adempiere; Owner: adempiere
--

CREATE VIEW rv_costdetail AS
    SELECT c.ad_client_id, c.ad_org_id, c.isactive, c.created, c.createdby, c.updated, c.updatedby, p.m_product_id, p.value, p.name, p.upc, p.isbom, p.producttype, p.m_product_category_id, c.m_inoutline_id, c.c_invoiceline_id, asi.m_attributesetinstance_id, asi.m_attributeset_id, asi.lot, asi.serno, acct.c_acctschema_id, acct.c_currency_id, c.amt, c.qty, c.description, c.processed FROM (((m_costdetail c JOIN m_product p ON ((c.m_product_id = p.m_product_id))) JOIN c_acctschema acct ON ((c.c_acctschema_id = acct.c_acctschema_id))) JOIN m_attributesetinstance asi ON ((c.m_attributesetinstance_id = asi.m_attributesetinstance_id)));


ALTER TABLE adempiere.rv_costdetail OWNER TO adempiere;

--
-- Name: rv_costsummary; Type: VIEW; Schema: adempiere; Owner: adempiere
--

CREATE VIEW rv_costsummary AS
    SELECT c.ad_client_id, c.ad_org_id, c.isactive, 0 AS createdby, now() AS created, 0 AS updatedby, now() AS updated, p.m_product_id, p.value, p.name, p.upc, p.isbom, p.producttype, p.m_product_category_id, c.m_costtype_id, acct.c_acctschema_id, acct.c_currency_id, sum(c.currentcostprice) AS currentcostprice, sum(c.futurecostprice) AS futurecostprice FROM ((m_cost c JOIN m_product p ON ((c.m_product_id = p.m_product_id))) JOIN c_acctschema acct ON ((c.c_acctschema_id = acct.c_acctschema_id))) WHERE (acct.m_costtype_id = c.m_costtype_id) GROUP BY c.ad_client_id, c.ad_org_id, c.isactive, p.m_product_id, p.value, p.name, p.upc, p.isbom, p.producttype, p.m_product_category_id, c.m_costtype_id, acct.c_acctschema_id, acct.c_currency_id;


ALTER TABLE adempiere.rv_costsummary OWNER TO adempiere;

--
-- Name: rv_fact_acct; Type: VIEW; Schema: adempiere; Owner: adempiere
--

CREATE VIEW rv_fact_acct AS
    SELECT f.ad_client_id, f.ad_org_id, f.isactive, f.created, f.createdby, f.updated, f.updatedby, f.fact_acct_id, f.c_acctschema_id, f.account_id, f.datetrx, f.dateacct, f.c_period_id, f.ad_table_id, f.record_id, f.line_id, f.gl_category_id, f.gl_budget_id, f.c_tax_id, f.m_locator_id, f.postingtype, f.c_currency_id, f.amtsourcedr, f.amtsourcecr, (f.amtsourcedr - f.amtsourcecr) AS amtsource, f.amtacctdr, f.amtacctcr, (f.amtacctdr - f.amtacctcr) AS amtacct, CASE WHEN ((f.amtsourcedr - f.amtsourcecr) = (0)::numeric) THEN (0)::numeric ELSE ((f.amtacctdr - f.amtacctcr) / (f.amtsourcedr - f.amtsourcecr)) END AS rate, f.c_uom_id, f.qty, f.m_product_id, f.c_bpartner_id, f.ad_orgtrx_id, f.c_locfrom_id, f.c_locto_id, f.c_salesregion_id, f.c_project_id, f.c_campaign_id, f.c_activity_id, f.user1_id, f.user2_id, f.a_asset_id, f.description, o.value AS orgvalue, o.name AS orgname, ev.value AS accountvalue, ev.name, ev.accounttype, bp.value AS bpartnervalue, bp.name AS bpname, bp.c_bp_group_id, p.value AS productvalue, p.name AS productname, p.upc, p.m_product_category_id FROM ((((fact_acct f JOIN ad_org o ON ((f.ad_org_id = o.ad_org_id))) JOIN c_elementvalue ev ON ((f.account_id = ev.c_elementvalue_id))) LEFT JOIN c_bpartner bp ON ((f.c_bpartner_id = bp.c_bpartner_id))) LEFT JOIN m_product p ON ((f.m_product_id = p.m_product_id)));


ALTER TABLE adempiere.rv_fact_acct OWNER TO adempiere;

--
-- Name: rv_fact_acct_day; Type: VIEW; Schema: adempiere; Owner: adempiere
--

CREATE VIEW rv_fact_acct_day AS
    SELECT fact_acct.ad_client_id, fact_acct.ad_org_id, fact_acct.c_acctschema_id, fact_acct.account_id, firstof((fact_acct.dateacct)::timestamp with time zone, 'DD'::character varying) AS dateacct, fact_acct.c_period_id, fact_acct.gl_category_id, fact_acct.gl_budget_id, fact_acct.c_tax_id, fact_acct.m_locator_id, fact_acct.postingtype, fact_acct.c_currency_id, sum(fact_acct.amtsourcedr) AS amtsourcedr, sum(fact_acct.amtsourcecr) AS amtsourcecr, sum((fact_acct.amtsourcedr - fact_acct.amtsourcecr)) AS amtsource, sum(fact_acct.amtacctdr) AS amtacctdr, sum(fact_acct.amtacctcr) AS amtacctcr, sum((fact_acct.amtacctdr - fact_acct.amtacctcr)) AS amtacct, CASE WHEN (sum((fact_acct.amtsourcedr - fact_acct.amtsourcecr)) = (0)::numeric) THEN (0)::numeric ELSE (sum((fact_acct.amtacctdr - fact_acct.amtacctcr)) / sum((fact_acct.amtsourcedr - fact_acct.amtsourcecr))) END AS rate, fact_acct.m_product_id, fact_acct.c_bpartner_id, fact_acct.ad_orgtrx_id, fact_acct.c_locfrom_id, fact_acct.c_locto_id, fact_acct.c_salesregion_id, fact_acct.c_project_id, fact_acct.c_campaign_id, fact_acct.c_activity_id, fact_acct.user1_id, fact_acct.user2_id, fact_acct.a_asset_id FROM fact_acct GROUP BY fact_acct.ad_client_id, fact_acct.ad_org_id, fact_acct.c_acctschema_id, fact_acct.account_id, firstof((fact_acct.dateacct)::timestamp with time zone, 'DD'::character varying), fact_acct.c_period_id, fact_acct.gl_category_id, fact_acct.gl_budget_id, fact_acct.c_tax_id, fact_acct.m_locator_id, fact_acct.postingtype, fact_acct.c_currency_id, fact_acct.m_product_id, fact_acct.c_bpartner_id, fact_acct.ad_orgtrx_id, fact_acct.c_locfrom_id, fact_acct.c_locto_id, fact_acct.c_salesregion_id, fact_acct.c_project_id, fact_acct.c_campaign_id, fact_acct.c_activity_id, fact_acct.user1_id, fact_acct.user2_id, fact_acct.a_asset_id;


ALTER TABLE adempiere.rv_fact_acct_day OWNER TO adempiere;

--
-- Name: rv_fact_acct_period; Type: VIEW; Schema: adempiere; Owner: adempiere
--

CREATE VIEW rv_fact_acct_period AS
    SELECT fact_acct.ad_client_id, fact_acct.ad_org_id, fact_acct.c_acctschema_id, fact_acct.account_id, fact_acct.c_period_id, fact_acct.gl_category_id, fact_acct.gl_budget_id, fact_acct.c_tax_id, fact_acct.m_locator_id, fact_acct.postingtype, fact_acct.c_currency_id, sum(fact_acct.amtsourcedr) AS amtsourcedr, sum(fact_acct.amtsourcecr) AS amtsourcecr, sum((fact_acct.amtsourcedr - fact_acct.amtsourcecr)) AS amtsource, sum(fact_acct.amtacctdr) AS amtacctdr, sum(fact_acct.amtacctcr) AS amtacctcr, sum((fact_acct.amtacctdr - fact_acct.amtacctcr)) AS amtacct, CASE WHEN (sum((fact_acct.amtsourcedr - fact_acct.amtsourcecr)) = (0)::numeric) THEN (0)::numeric ELSE (sum((fact_acct.amtacctdr - fact_acct.amtacctcr)) / sum((fact_acct.amtsourcedr - fact_acct.amtsourcecr))) END AS rate, fact_acct.m_product_id, fact_acct.c_bpartner_id, fact_acct.ad_orgtrx_id, fact_acct.c_locfrom_id, fact_acct.c_locto_id, fact_acct.c_salesregion_id, fact_acct.c_project_id, fact_acct.c_campaign_id, fact_acct.c_activity_id, fact_acct.user1_id, fact_acct.user2_id, fact_acct.a_asset_id FROM fact_acct GROUP BY fact_acct.ad_client_id, fact_acct.ad_org_id, fact_acct.c_acctschema_id, fact_acct.account_id, fact_acct.c_period_id, fact_acct.gl_category_id, fact_acct.gl_budget_id, fact_acct.c_tax_id, fact_acct.m_locator_id, fact_acct.postingtype, fact_acct.c_currency_id, fact_acct.m_product_id, fact_acct.c_bpartner_id, fact_acct.ad_orgtrx_id, fact_acct.c_locfrom_id, fact_acct.c_locto_id, fact_acct.c_salesregion_id, fact_acct.c_project_id, fact_acct.c_campaign_id, fact_acct.c_activity_id, fact_acct.user1_id, fact_acct.user2_id, fact_acct.a_asset_id;


ALTER TABLE adempiere.rv_fact_acct_period OWNER TO adempiere;

--
-- Name: rv_inoutconfirm; Type: VIEW; Schema: adempiere; Owner: adempiere
--

CREATE VIEW rv_inoutconfirm AS
    SELECT c.m_inoutconfirm_id, c.ad_client_id, c.ad_org_id, c.isactive, c.created, c.createdby, c.updated, c.updatedby, c.m_inout_id, c.documentno, c.confirmtype, c.isapproved, c.iscancelled, c.description, c.processing, c.processed, i.c_bpartner_id, i.c_bpartner_location_id, i.m_warehouse_id, i.c_order_id, i.issotrx FROM (m_inoutconfirm c JOIN m_inout i ON ((c.m_inout_id = i.m_inout_id)));


ALTER TABLE adempiere.rv_inoutconfirm OWNER TO adempiere;

--
-- Name: rv_inoutdetails; Type: VIEW; Schema: adempiere; Owner: adempiere
--

CREATE VIEW rv_inoutdetails AS
    SELECT h.ad_client_id, h.ad_org_id, l.isactive, l.created, l.createdby, l.updated, l.updatedby, h.m_inout_id, h.issotrx, h.documentno, h.docaction, h.docstatus, h.posted, h.processed, h.c_doctype_id, h.description, h.c_order_id, h.dateordered, h.movementtype, h.movementdate, h.dateacct, h.c_bpartner_id, h.c_bpartner_location_id, h.ad_user_id, h.salesrep_id, h.m_warehouse_id, h.poreference, h.deliveryrule, h.freightcostrule, h.freightamt, h.deliveryviarule, h.m_shipper_id, h.priorityrule, h.dateprinted, h.nopackages, h.pickdate, h.shipdate, h.trackingno, h.ad_orgtrx_id, h.c_project_id, h.c_campaign_id, h.c_activity_id, h.user1_id, h.user2_id, h.datereceived, h.isapproved, h.isindispute, l.m_inoutline_id, l.line, l.description AS linedescription, l.c_orderline_id, l.m_locator_id, l.m_product_id, l.c_uom_id, l.m_attributesetinstance_id, productattribute(l.m_attributesetinstance_id) AS productattribute, pasi.m_attributeset_id, pasi.m_lot_id, pasi.guaranteedate, pasi.lot, pasi.serno, l.movementqty, l.qtyentered, l.isdescription, l.confirmedqty, l.pickedqty, l.scrappedqty, l.targetqty, loc.value AS locatorvalue, loc.x, loc.y, loc.z FROM (((m_inout h JOIN m_inoutline l ON ((h.m_inout_id = l.m_inout_id))) LEFT JOIN m_locator loc ON ((l.m_locator_id = loc.m_locator_id))) LEFT JOIN m_attributesetinstance pasi ON ((l.m_attributesetinstance_id = pasi.m_attributesetinstance_id)));


ALTER TABLE adempiere.rv_inoutdetails OWNER TO adempiere;

--
-- Name: rv_inoutlineconfirm; Type: VIEW; Schema: adempiere; Owner: adempiere
--

CREATE VIEW rv_inoutlineconfirm AS
    SELECT cl.m_inoutconfirm_id, cl.m_inoutlineconfirm_id, cl.ad_client_id, cl.ad_org_id, cl.isactive, cl.created, cl.createdby, cl.updated, cl.updatedby, cl.targetqty, cl.confirmedqty, cl.differenceqty, cl.scrappedqty, cl.description, cl.processed, c.m_inout_id, c.documentno, c.confirmtype, c.isapproved, c.iscancelled, i.c_bpartner_id, i.c_bpartner_location_id, i.m_warehouse_id, i.c_order_id, i.issotrx, cl.m_inoutline_id, il.m_product_id, il.m_attributesetinstance_id, il.m_locator_id FROM (((m_inoutlineconfirm cl JOIN m_inoutconfirm c ON ((cl.m_inoutconfirm_id = c.m_inoutconfirm_id))) JOIN m_inout i ON ((c.m_inout_id = i.m_inout_id))) JOIN m_inoutline il ON ((cl.m_inoutline_id = il.m_inoutline_id)));


ALTER TABLE adempiere.rv_inoutlineconfirm OWNER TO adempiere;

--
-- Name: rv_m_requisition; Type: VIEW; Schema: adempiere; Owner: adempiere
--

CREATE VIEW rv_m_requisition AS
    SELECT r.m_requisition_id, r.ad_client_id, r.ad_org_id, r.isactive, r.created, r.createdby, r.updated, r.updatedby, r.documentno, r.description, r.help, r.ad_user_id, r.m_pricelist_id, r.m_warehouse_id, r.isapproved, r.priorityrule, r.daterequired, r.totallines, r.docaction, r.docstatus, r.processed, l.m_requisitionline_id, l.line, l.qty, l.m_product_id, l.description AS linedescription, l.priceactual, l.linenetamt FROM (m_requisition r JOIN m_requisitionline l ON ((r.m_requisition_id = l.m_requisition_id)));


ALTER TABLE adempiere.rv_m_requisition OWNER TO adempiere;

--
-- Name: rv_m_transaction; Type: VIEW; Schema: adempiere; Owner: adempiere
--

CREATE VIEW rv_m_transaction AS
    SELECT t.ad_client_id, t.ad_org_id, t.movementdate, t.movementqty, t.m_product_id, t.m_locator_id, t.m_attributesetinstance_id, p.m_product_category_id, p.value, po.c_bpartner_id, po.pricepo, po.pricelastpo, po.pricelist FROM ((m_transaction t JOIN m_product p ON ((t.m_product_id = p.m_product_id))) JOIN m_product_po po ON ((t.m_product_id = po.m_product_id))) WHERE (po.iscurrentvendor = 'Y'::bpchar);


ALTER TABLE adempiere.rv_m_transaction OWNER TO adempiere;

--
-- Name: rv_m_transaction_sum; Type: VIEW; Schema: adempiere; Owner: adempiere
--

CREATE VIEW rv_m_transaction_sum AS
    SELECT t.ad_client_id, t.ad_org_id, t.movementtype, l.m_warehouse_id, t.m_locator_id, t.m_product_id, t.movementdate, sum(t.movementqty) AS movementqty FROM m_transaction t, m_locator l WHERE (t.m_locator_id = l.m_locator_id) GROUP BY t.ad_client_id, t.ad_org_id, t.movementtype, l.m_warehouse_id, t.m_locator_id, t.m_product_id, t.movementdate;


ALTER TABLE adempiere.rv_m_transaction_sum OWNER TO adempiere;

--
-- Name: rv_openitem; Type: VIEW; Schema: adempiere; Owner: adempiere
--

CREATE VIEW rv_openitem AS
    SELECT i.ad_org_id, i.ad_client_id, i.documentno, i.c_invoice_id, i.c_order_id, i.c_bpartner_id, i.issotrx, i.dateinvoiced, i.dateacct, p.netdays, paymenttermduedate(i.c_paymentterm_id, (i.dateinvoiced)::timestamp with time zone) AS duedate, paymenttermduedays(i.c_paymentterm_id, (i.dateinvoiced)::timestamp with time zone, getdate()) AS daysdue, adddays((i.dateinvoiced)::timestamp with time zone, p.discountdays) AS discountdate, round(((i.grandtotal * p.discount) / (100)::numeric), 2) AS discountamt, i.grandtotal, invoicepaid(i.c_invoice_id, i.c_currency_id, 1) AS paidamt, invoiceopen(i.c_invoice_id, 0) AS openamt, i.c_currency_id, i.c_conversiontype_id, i.c_paymentterm_id, i.ispayschedulevalid, 0 AS c_invoicepayschedule_id, i.invoicecollectiontype, i.c_campaign_id, i.c_project_id, i.c_activity_id FROM (rv_c_invoice i JOIN c_paymentterm p ON ((i.c_paymentterm_id = p.c_paymentterm_id))) WHERE (((invoiceopen(i.c_invoice_id, 0) <> (0)::numeric) AND (i.ispayschedulevalid <> 'Y'::bpchar)) AND (i.docstatus <> 'DR'::bpchar)) UNION SELECT i.ad_org_id, i.ad_client_id, i.documentno, i.c_invoice_id, i.c_order_id, i.c_bpartner_id, i.issotrx, i.dateinvoiced, i.dateacct, daysbetween((ips.duedate)::timestamp with time zone, (i.dateinvoiced)::timestamp with time zone) AS netdays, ips.duedate, daysbetween(getdate(), (ips.duedate)::timestamp with time zone) AS daysdue, ips.discountdate, ips.discountamt, ips.dueamt AS grandtotal, invoicepaid(i.c_invoice_id, i.c_currency_id, 1) AS paidamt, invoiceopen(i.c_invoice_id, ips.c_invoicepayschedule_id) AS openamt, i.c_currency_id, i.c_conversiontype_id, i.c_paymentterm_id, i.ispayschedulevalid, ips.c_invoicepayschedule_id, i.invoicecollectiontype, i.c_campaign_id, i.c_project_id, i.c_activity_id FROM (rv_c_invoice i JOIN c_invoicepayschedule ips ON ((i.c_invoice_id = ips.c_invoice_id))) WHERE ((((invoiceopen(i.c_invoice_id, ips.c_invoicepayschedule_id) <> (0)::numeric) AND (i.ispayschedulevalid = 'Y'::bpchar)) AND (i.docstatus <> 'DR'::bpchar)) AND (ips.isvalid = 'Y'::bpchar));


ALTER TABLE adempiere.rv_openitem OWNER TO adempiere;

--
-- Name: rv_orderdetail; Type: VIEW; Schema: adempiere; Owner: adempiere
--

CREATE VIEW rv_orderdetail AS
    SELECT l.ad_client_id, l.ad_org_id, l.isactive, l.created, l.createdby, l.updated, l.updatedby, o.c_order_id, o.docstatus, o.docaction, o.c_doctype_id, o.isapproved, o.iscreditapproved, o.salesrep_id, o.bill_bpartner_id, o.bill_location_id, o.bill_user_id, o.isdropship, l.c_bpartner_id, l.c_bpartner_location_id, o.ad_user_id, o.poreference, o.c_currency_id, o.issotrx, l.c_campaign_id, l.c_project_id, l.c_activity_id, l.c_projectphase_id, l.c_projecttask_id, l.c_orderline_id, l.dateordered, l.datepromised, l.m_product_id, l.m_warehouse_id, l.m_attributesetinstance_id, productattribute(l.m_attributesetinstance_id) AS productattribute, pasi.m_attributeset_id, pasi.m_lot_id, pasi.guaranteedate, pasi.lot, pasi.serno, l.c_uom_id, l.qtyentered, l.qtyordered, l.qtyreserved, l.qtydelivered, l.qtyinvoiced, l.priceactual, l.priceentered, (l.qtyordered - l.qtydelivered) AS qtytodeliver, (l.qtyordered - l.qtyinvoiced) AS qtytoinvoice, ((l.qtyordered - l.qtyinvoiced) * l.priceactual) AS netamttoinvoice, l.qtylostsales, (l.qtylostsales * l.priceactual) AS amtlostsales, CASE WHEN (l.pricelist = (0)::numeric) THEN (0)::numeric ELSE round((((l.pricelist - l.priceactual) / l.pricelist) * (100)::numeric), 2) END AS discount, CASE WHEN (l.pricelimit = (0)::numeric) THEN (0)::numeric ELSE round((((l.priceactual - l.pricelimit) / l.pricelimit) * (100)::numeric), 2) END AS margin, CASE WHEN (l.pricelimit = (0)::numeric) THEN (0)::numeric ELSE ((l.priceactual - l.pricelimit) * l.qtydelivered) END AS marginamt FROM ((c_order o JOIN c_orderline l ON ((o.c_order_id = l.c_order_id))) LEFT JOIN m_attributesetinstance pasi ON ((l.m_attributesetinstance_id = pasi.m_attributesetinstance_id)));


ALTER TABLE adempiere.rv_orderdetail OWNER TO adempiere;

--
-- Name: rv_payment; Type: VIEW; Schema: adempiere; Owner: adempiere
--

CREATE VIEW rv_payment AS
    SELECT c_payment.c_payment_id, c_payment.ad_client_id, c_payment.ad_org_id, c_payment.isactive, c_payment.created, c_payment.createdby, c_payment.updated, c_payment.updatedby, c_payment.documentno, c_payment.datetrx, c_payment.isreceipt, c_payment.c_doctype_id, c_payment.trxtype, c_payment.c_bankaccount_id, c_payment.c_bpartner_id, c_payment.c_invoice_id, c_payment.c_bp_bankaccount_id, c_payment.c_paymentbatch_id, c_payment.tendertype, c_payment.creditcardtype, c_payment.creditcardnumber, c_payment.creditcardvv, c_payment.creditcardexpmm, c_payment.creditcardexpyy, c_payment.micr, c_payment.routingno, c_payment.accountno, c_payment.checkno, c_payment.a_name, c_payment.a_street, c_payment.a_city, c_payment.a_state, c_payment.a_zip, c_payment.a_ident_dl, c_payment.a_ident_ssn, c_payment.a_email, c_payment.voiceauthcode, c_payment.orig_trxid, c_payment.ponum, c_payment.c_currency_id, c_payment.c_conversiontype_id, CASE c_payment.isreceipt WHEN 'Y'::bpchar THEN c_payment.payamt ELSE (c_payment.payamt * (-1)::numeric) END AS payamt, CASE c_payment.isreceipt WHEN 'Y'::bpchar THEN c_payment.discountamt ELSE (c_payment.discountamt * (-1)::numeric) END AS discountamt, CASE c_payment.isreceipt WHEN 'Y'::bpchar THEN c_payment.writeoffamt ELSE (c_payment.writeoffamt * (-1)::numeric) END AS writeoffamt, CASE c_payment.isreceipt WHEN 'Y'::bpchar THEN c_payment.taxamt ELSE (c_payment.taxamt * (-1)::numeric) END AS taxamt, CASE c_payment.isreceipt WHEN 'Y'::bpchar THEN c_payment.overunderamt ELSE (c_payment.overunderamt * (-1)::numeric) END AS overunderamt, CASE c_payment.isreceipt WHEN 'Y'::bpchar THEN 1.0 ELSE -1.0 END AS multiplierap, paymentallocated(c_payment.c_payment_id, c_payment.c_currency_id) AS allocatedamt, paymentavailable(c_payment.c_payment_id) AS availableamt, c_payment.isoverunderpayment, c_payment.isapproved, c_payment.r_pnref, c_payment.r_result, c_payment.r_respmsg, c_payment.r_authcode, c_payment.r_avsaddr, c_payment.r_avszip, c_payment.r_info, c_payment.processing, c_payment.oprocessing, c_payment.docstatus, c_payment.docaction, c_payment.isprepayment, c_payment.c_charge_id, c_payment.isreconciled, c_payment.isallocated, c_payment.isonline, c_payment.processed, c_payment.posted, c_payment.c_campaign_id, c_payment.c_project_id, c_payment.c_activity_id FROM c_payment;


ALTER TABLE adempiere.rv_payment OWNER TO adempiere;

--
-- Name: rv_printformatdetail; Type: VIEW; Schema: adempiere; Owner: adempiere
--

CREATE VIEW rv_printformatdetail AS
    SELECT f.ad_client_id, f.ad_org_id, i.isactive, i.created, i.createdby, i.updated, i.updatedby, f.ad_printformat_id, f.name, f.description, f.istablebased, f.isform, f.ad_table_id, f.ad_reportview_id, f.ad_printpaper_id, f.ad_printcolor_id AS default_ad_printcolor_id, f.ad_printfont_id AS default_ad_printfont_id, f.isstandardheaderfooter, f.ad_printtableformat_id, f.headermargin, f.footermargin, f.printername, f.isdefault, i.ad_printformatitem_id, i.name AS itemname, i.printname, i.printnamesuffix, i.isprinted, i.printareatype, i.seqno, i.printformattype, i.ad_column_id, i.ad_printformatchild_id, i.imageisattached, i.imageurl, i.isrelativeposition, i.isnextline, i.xspace, i.yspace, i.xposition, i.yposition, i.maxwidth, i.isheightoneline, i.maxheight, i.isfixedwidth, i.issetnlposition, i.issuppressnull, i.belowcolumn, i.fieldalignmenttype, i.linealignmenttype, i.ad_printcolor_id, i.ad_printfont_id, i.isorderby, i.sortno, i.isgroupby, i.ispagebreak, i.isnextpage, i.issummarized, i.isaveraged, i.iscounted, i.ismincalc, i.ismaxcalc, i.isvariancecalc, i.isdeviationcalc, i.isrunningtotal, i.runningtotallines, i.ad_printgraph_id FROM (ad_printformat f JOIN ad_printformatitem i ON ((f.ad_printformat_id = i.ad_printformat_id)));


ALTER TABLE adempiere.rv_printformatdetail OWNER TO adempiere;

--
-- Name: rv_product_costing; Type: VIEW; Schema: adempiere; Owner: adempiere
--

CREATE VIEW rv_product_costing AS
    SELECT pc.m_product_id, pc.c_acctschema_id, p.value, p.name, p.m_product_category_id, pc.ad_client_id, pc.ad_org_id, pc.isactive, pc.created, pc.createdby, pc.updated, pc.updatedby, pc.currentcostprice, pc.futurecostprice, pc.coststandard, pc.coststandardpoqty, pc.coststandardpoamt, CASE WHEN (pc.coststandardpoqty = (0)::numeric) THEN (0)::numeric ELSE (pc.coststandardpoamt / pc.coststandardpoqty) END AS coststandardpodiff, pc.coststandardcumqty, pc.coststandardcumamt, CASE WHEN (pc.coststandardcumqty = (0)::numeric) THEN (0)::numeric ELSE (pc.coststandardcumamt / pc.coststandardcumqty) END AS coststandardinvdiff, pc.costaverage, pc.costaveragecumqty, pc.costaveragecumamt, pc.totalinvqty, pc.totalinvamt, CASE WHEN (pc.totalinvqty = (0)::numeric) THEN (0)::numeric ELSE (pc.totalinvamt / pc.totalinvqty) END AS totalinvcost, pc.pricelastpo, pc.pricelastinv FROM (m_product_costing pc JOIN m_product p ON ((pc.m_product_id = p.m_product_id)));


ALTER TABLE adempiere.rv_product_costing OWNER TO adempiere;

--
-- Name: rv_projectcycle; Type: VIEW; Schema: adempiere; Owner: adempiere
--

CREATE VIEW rv_projectcycle AS
    SELECT p.ad_client_id, p.ad_org_id, p.isactive, p.created, p.createdby, p.updated, p.updatedby, c.c_cycle_id, c.name AS cyclename, c.c_currency_id, cs.c_cyclestep_id, cs.name AS cyclestepname, cs.seqno, cs.relativeweight, pp.c_phase_id, pp.name AS projectphasename, pt.c_projecttype_id, pt.name AS projecttypename, p.value AS projectvalue, p.name AS projectname, p.description, p.note, p.c_bpartner_id, p.c_bpartner_location_id, p.ad_user_id, p.poreference, p.salesrep_id, p.m_warehouse_id, p.projectcategory, p.datecontract, p.datefinish, p.iscommitment, p.iscommitceiling, (p.committedqty * cs.relativeweight) AS committedqty, (currencyconvert(p.committedamt, p.c_currency_id, c.c_currency_id, getdate(), 0, p.ad_client_id, p.ad_org_id) * cs.relativeweight) AS committedamt, (p.plannedqty * cs.relativeweight) AS plannedqty, (currencyconvert(p.plannedamt, p.c_currency_id, c.c_currency_id, getdate(), 0, p.ad_client_id, p.ad_org_id) * cs.relativeweight) AS plannedamt, (currencyconvert(p.plannedmarginamt, p.c_currency_id, c.c_currency_id, getdate(), 0, p.ad_client_id, p.ad_org_id) * cs.relativeweight) AS plannedmarginamt, (currencyconvert(p.invoicedamt, p.c_currency_id, c.c_currency_id, getdate(), 0, p.ad_client_id, p.ad_org_id) * cs.relativeweight) AS invoicedamt, (p.invoicedqty * cs.relativeweight) AS invoicedqty, (currencyconvert(p.projectbalanceamt, p.c_currency_id, c.c_currency_id, getdate(), 0, p.ad_client_id, p.ad_org_id) * cs.relativeweight) AS projectbalanceamt FROM (((((c_cycle c JOIN c_cyclestep cs ON ((c.c_cycle_id = cs.c_cycle_id))) JOIN c_cyclephase cp ON ((cs.c_cyclestep_id = cp.c_cyclestep_id))) JOIN c_phase pp ON ((cp.c_phase_id = pp.c_phase_id))) JOIN c_project p ON ((cp.c_phase_id = p.c_phase_id))) JOIN c_projecttype pt ON ((p.c_projecttype_id = pt.c_projecttype_id)));


ALTER TABLE adempiere.rv_projectcycle OWNER TO adempiere;

--
-- Name: rv_projectlineissue; Type: VIEW; Schema: adempiere; Owner: adempiere
--

CREATE VIEW rv_projectlineissue AS
    SELECT COALESCE(l.ad_client_id, i.ad_client_id) AS ad_client_id, COALESCE(l.ad_org_id, i.ad_org_id) AS ad_org_id, COALESCE(l.isactive, i.isactive) AS isactive, COALESCE(l.created, i.created) AS created, COALESCE(l.createdby, i.createdby) AS createdby, COALESCE(l.updated, i.updated) AS updated, COALESCE(l.updatedby, i.updatedby) AS updatedby, COALESCE(l.c_project_id, i.c_project_id) AS c_project_id, COALESCE(l.m_product_id, i.m_product_id) AS m_product_id, l.c_projectline_id, l.line, l.description, l.plannedqty, l.plannedprice, l.plannedamt, l.plannedmarginamt, l.committedqty, i.c_projectissue_id, i.m_locator_id, i.movementqty, i.movementdate, i.line AS issueline, i.description AS issuedescription, i.m_inoutline_id, i.s_timeexpenseline_id, fa.c_acctschema_id, fa.account_id, fa.amtsourcedr, fa.amtsourcecr, fa.amtacctdr, fa.amtacctcr, ((l.plannedamt - fa.amtsourcedr) + fa.amtsourcecr) AS linemargin FROM ((c_projectline l FULL JOIN c_projectissue i ON (((i.c_project_id = l.c_project_id) AND (i.c_projectissue_id = l.c_projectissue_id)))) LEFT JOIN fact_acct fa ON ((((fa.ad_table_id = 623) AND (fa.record_id = i.c_projectissue_id)) AND (fa.m_locator_id IS NULL))));


ALTER TABLE adempiere.rv_projectlineissue OWNER TO adempiere;

--
-- Name: rv_requestupdates; Type: VIEW; Schema: adempiere; Owner: adempiere
--

CREATE VIEW rv_requestupdates AS
    (((((SELECT r_requestupdates.ad_client_id, r_requestupdates.ad_org_id, r_requestupdates.isactive, r_requestupdates.created, r_requestupdates.createdby, r_requestupdates.updated, r_requestupdates.updatedby, r_requestupdates.r_request_id, r_requestupdates.ad_user_id, r_requestupdates.isselfservice, 0 AS r_group_id, 0 AS r_requesttype_id, 0 AS r_category_id FROM r_requestupdates UNION SELECT u.ad_client_id, u.ad_org_id, u.isactive, u.created, u.createdby, u.updated, u.updatedby, r.r_request_id, u.ad_user_id, u.isselfservice, r.r_group_id, 0 AS r_requesttype_id, 0 AS r_category_id FROM (r_groupupdates u JOIN r_request r ON ((u.r_group_id = r.r_group_id)))) UNION SELECT u.ad_client_id, u.ad_org_id, u.isactive, u.created, u.createdby, u.updated, u.updatedby, r.r_request_id, u.ad_user_id, u.isselfservice, 0 AS r_group_id, r.r_requesttype_id, 0 AS r_category_id FROM (r_requesttypeupdates u JOIN r_request r ON ((u.r_requesttype_id = r.r_requesttype_id)))) UNION SELECT u.ad_client_id, u.ad_org_id, u.isactive, u.created, u.createdby, u.updated, u.updatedby, r.r_request_id, u.ad_user_id, u.isselfservice, 0 AS r_group_id, 0 AS r_requesttype_id, r.r_category_id FROM (r_categoryupdates u JOIN r_request r ON ((u.r_category_id = r.r_category_id)))) UNION SELECT r_request.ad_client_id, r_request.ad_org_id, r_request.isactive, r_request.created, r_request.createdby, r_request.updated, r_request.updatedby, r_request.r_request_id, r_request.ad_user_id, r_request.isselfservice, 0 AS r_group_id, 0 AS r_requesttype_id, 0 AS r_category_id FROM r_request WHERE (r_request.ad_user_id IS NOT NULL)) UNION SELECT u.ad_client_id, u.ad_org_id, u.isactive, u.created, u.createdby, u.updated, u.updatedby, r.r_request_id, u.ad_user_id, NULL::"unknown" AS isselfservice, 0 AS r_group_id, 0 AS r_requesttype_id, r.r_category_id FROM (ad_user u JOIN r_request r ON ((u.ad_user_id = r.salesrep_id)))) UNION SELECT r.ad_client_id, r.ad_org_id, u.isactive, r.created, r.createdby, r.updated, r.updatedby, r.r_request_id, u.ad_user_id, NULL::"unknown" AS isselfservice, 0 AS r_group_id, 0 AS r_requesttype_id, 0 AS r_category_id FROM (r_request r JOIN ad_user_roles u ON ((u.ad_role_id = r.ad_role_id)));


ALTER TABLE adempiere.rv_requestupdates OWNER TO adempiere;

--
-- Name: rv_requestupdates_only; Type: VIEW; Schema: adempiere; Owner: adempiere
--

CREATE VIEW rv_requestupdates_only AS
    SELECT min(rv_requestupdates.ad_client_id) AS ad_client_id, min(rv_requestupdates.ad_org_id) AS ad_org_id, 'Y' AS isactive, now() AS created, 0 AS createdby, now() AS updated, 0 AS updatedby, rv_requestupdates.r_request_id, rv_requestupdates.ad_user_id FROM rv_requestupdates WHERE (rv_requestupdates.isactive = 'Y'::bpchar) GROUP BY rv_requestupdates.r_request_id, rv_requestupdates.ad_user_id;


ALTER TABLE adempiere.rv_requestupdates_only OWNER TO adempiere;

--
-- Name: rv_storage; Type: VIEW; Schema: adempiere; Owner: adempiere
--

CREATE VIEW rv_storage AS
    SELECT s.ad_client_id, s.ad_org_id, s.m_product_id, p.value, p.name, p.description, p.upc, p.sku, p.c_uom_id, p.m_product_category_id, p.classification, p.weight, p.volume, p.versionno, p.guaranteedays, p.guaranteedaysmin, s.m_locator_id, l.m_warehouse_id, l.x, l.y, l.z, s.qtyonhand, s.qtyreserved, (s.qtyonhand - s.qtyreserved) AS qtyavailable, s.qtyordered, s.datelastinventory, s.m_attributesetinstance_id, asi.m_attributeset_id, asi.serno, asi.lot, asi.m_lot_id, asi.guaranteedate, daysbetween((asi.guaranteedate)::timestamp with time zone, getdate()) AS shelflifedays, (daysbetween((asi.guaranteedate)::timestamp with time zone, getdate()) - p.guaranteedaysmin) AS goodfordays, round((((daysbetween((asi.guaranteedate)::timestamp with time zone, getdate()) / p.guaranteedays) * 100))::numeric, 0) AS shelfliferemainingpct FROM (((m_storage s JOIN m_locator l ON ((s.m_locator_id = l.m_locator_id))) JOIN m_product p ON ((s.m_product_id = p.m_product_id))) LEFT JOIN m_attributesetinstance asi ON ((s.m_attributesetinstance_id = asi.m_attributesetinstance_id)));


ALTER TABLE adempiere.rv_storage OWNER TO adempiere;

--
-- Name: rv_transaction; Type: VIEW; Schema: adempiere; Owner: adempiere
--

CREATE VIEW rv_transaction AS
    SELECT t.m_transaction_id, t.ad_client_id, t.ad_org_id, t.movementtype, t.movementdate, t.movementqty, t.m_attributesetinstance_id, asi.m_attributeset_id, asi.serno, asi.lot, asi.m_lot_id, asi.guaranteedate, t.m_product_id, p.value, p.name, p.description, p.upc, p.sku, p.c_uom_id, p.m_product_category_id, p.classification, p.weight, p.volume, p.versionno, t.m_locator_id, l.m_warehouse_id, l.x, l.y, l.z, t.m_inventoryline_id, il.m_inventory_id, t.m_movementline_id, ml.m_movement_id, t.m_inoutline_id, iol.m_inout_id, t.m_productionline_id, prdl.m_productionplan_id, prdp.m_production_id, t.c_projectissue_id, pjl.c_project_id, COALESCE(il.line, ml.line, iol.line, prdl.line, pjl.line) AS line FROM (((((((((m_transaction t JOIN m_locator l ON ((t.m_locator_id = l.m_locator_id))) JOIN m_product p ON ((t.m_product_id = p.m_product_id))) LEFT JOIN m_attributesetinstance asi ON ((t.m_attributesetinstance_id = asi.m_attributesetinstance_id))) LEFT JOIN m_inventoryline il ON ((t.m_inventoryline_id = il.m_inventoryline_id))) LEFT JOIN m_movementline ml ON ((t.m_movementline_id = ml.m_movementline_id))) LEFT JOIN m_inoutline iol ON ((t.m_inoutline_id = iol.m_inoutline_id))) LEFT JOIN m_productionline prdl ON ((t.m_productionline_id = prdl.m_productionline_id))) LEFT JOIN m_productionplan prdp ON ((prdl.m_productionplan_id = prdp.m_productionplan_id))) LEFT JOIN c_projectissue pjl ON ((t.c_projectissue_id = pjl.c_projectissue_id)));


ALTER TABLE adempiere.rv_transaction OWNER TO adempiere;

--
-- Name: rv_unposted; Type: VIEW; Schema: adempiere; Owner: adempiere
--

CREATE VIEW rv_unposted AS
    (((((((((((((SELECT gl_journal.ad_client_id, gl_journal.ad_org_id, gl_journal.created, gl_journal.createdby, gl_journal.updated, gl_journal.updatedby, gl_journal.isactive, gl_journal.documentno, gl_journal.datedoc, gl_journal.dateacct, 224 AS ad_table_id, gl_journal.gl_journal_id AS record_id, 'N' AS issotrx FROM gl_journal WHERE ((gl_journal.posted <> 'Y'::bpchar) AND (gl_journal.docstatus <> 'VO'::bpchar)) UNION SELECT pi.ad_client_id, pi.ad_org_id, pi.created, pi.createdby, pi.updated, pi.updatedby, pi.isactive, (((p.name)::text || '_'::text) || (pi.line)::text) AS documentno, pi.movementdate AS datedoc, pi.movementdate AS dateacct, 623 AS ad_table_id, pi.c_projectissue_id AS record_id, 'N' AS issotrx FROM (c_projectissue pi JOIN c_project p ON ((pi.c_project_id = p.c_project_id))) WHERE (pi.posted <> 'Y'::bpchar)) UNION SELECT c_invoice.ad_client_id, c_invoice.ad_org_id, c_invoice.created, c_invoice.createdby, c_invoice.updated, c_invoice.updatedby, c_invoice.isactive, c_invoice.documentno, c_invoice.dateinvoiced AS datedoc, c_invoice.dateacct, 318 AS ad_table_id, c_invoice.c_invoice_id AS record_id, c_invoice.issotrx FROM c_invoice WHERE ((c_invoice.posted <> 'Y'::bpchar) AND (c_invoice.docstatus <> 'VO'::bpchar))) UNION SELECT m_inout.ad_client_id, m_inout.ad_org_id, m_inout.created, m_inout.createdby, m_inout.updated, m_inout.updatedby, m_inout.isactive, m_inout.documentno, m_inout.movementdate AS datedoc, m_inout.dateacct, 319 AS ad_table_id, m_inout.m_inout_id AS record_id, m_inout.issotrx FROM m_inout WHERE ((m_inout.posted <> 'Y'::bpchar) AND (m_inout.docstatus <> 'VO'::bpchar))) UNION SELECT m_inventory.ad_client_id, m_inventory.ad_org_id, m_inventory.created, m_inventory.createdby, m_inventory.updated, m_inventory.updatedby, m_inventory.isactive, m_inventory.documentno, m_inventory.movementdate AS datedoc, m_inventory.movementdate AS dateacct, 321 AS ad_table_id, m_inventory.m_inventory_id AS record_id, 'N' AS issotrx FROM m_inventory WHERE ((m_inventory.posted <> 'Y'::bpchar) AND (m_inventory.docstatus <> 'VO'::bpchar))) UNION SELECT m_movement.ad_client_id, m_movement.ad_org_id, m_movement.created, m_movement.createdby, m_movement.updated, m_movement.updatedby, m_movement.isactive, m_movement.documentno, m_movement.movementdate AS datedoc, m_movement.movementdate AS dateacct, 323 AS ad_table_id, m_movement.m_movement_id AS record_id, 'N' AS issotrx FROM m_movement WHERE ((m_movement.posted <> 'Y'::bpchar) AND (m_movement.docstatus <> 'VO'::bpchar))) UNION SELECT m_production.ad_client_id, m_production.ad_org_id, m_production.created, m_production.createdby, m_production.updated, m_production.updatedby, m_production.isactive, m_production.name AS documentno, m_production.movementdate AS datedoc, m_production.movementdate AS dateacct, 325 AS ad_table_id, m_production.m_production_id AS record_id, 'N' AS issotrx FROM m_production WHERE (m_production.posted <> 'Y'::bpchar)) UNION SELECT c_cash.ad_client_id, c_cash.ad_org_id, c_cash.created, c_cash.createdby, c_cash.updated, c_cash.updatedby, c_cash.isactive, c_cash.name AS documentno, c_cash.statementdate AS datedoc, c_cash.dateacct, 407 AS ad_table_id, c_cash.c_cash_id AS record_id, 'N' AS issotrx FROM c_cash WHERE ((c_cash.posted <> 'Y'::bpchar) AND (c_cash.docstatus <> 'VO'::bpchar))) UNION SELECT c_payment.ad_client_id, c_payment.ad_org_id, c_payment.created, c_payment.createdby, c_payment.updated, c_payment.updatedby, c_payment.isactive, c_payment.documentno, c_payment.datetrx AS datedoc, c_payment.datetrx AS dateacct, 335 AS ad_table_id, c_payment.c_payment_id AS record_id, 'N' AS issotrx FROM c_payment WHERE ((c_payment.posted <> 'Y'::bpchar) AND (c_payment.docstatus <> 'VO'::bpchar))) UNION SELECT c_allocationhdr.ad_client_id, c_allocationhdr.ad_org_id, c_allocationhdr.created, c_allocationhdr.createdby, c_allocationhdr.updated, c_allocationhdr.updatedby, c_allocationhdr.isactive, c_allocationhdr.documentno, c_allocationhdr.datetrx AS datedoc, c_allocationhdr.datetrx AS dateacct, 735 AS ad_table_id, c_allocationhdr.c_allocationhdr_id AS record_id, 'N' AS issotrx FROM c_allocationhdr WHERE ((c_allocationhdr.posted <> 'Y'::bpchar) AND (c_allocationhdr.docstatus <> 'VO'::bpchar))) UNION SELECT c_bankstatement.ad_client_id, c_bankstatement.ad_org_id, c_bankstatement.created, c_bankstatement.createdby, c_bankstatement.updated, c_bankstatement.updatedby, c_bankstatement.isactive, c_bankstatement.name AS documentno, c_bankstatement.statementdate AS datedoc, c_bankstatement.statementdate AS dateacct, 392 AS ad_table_id, c_bankstatement.c_bankstatement_id AS record_id, 'N' AS issotrx FROM c_bankstatement WHERE ((c_bankstatement.posted <> 'Y'::bpchar) AND (c_bankstatement.docstatus <> 'VO'::bpchar))) UNION SELECT m_matchinv.ad_client_id, m_matchinv.ad_org_id, m_matchinv.created, m_matchinv.createdby, m_matchinv.updated, m_matchinv.updatedby, m_matchinv.isactive, m_matchinv.documentno, m_matchinv.datetrx AS datedoc, m_matchinv.datetrx AS dateacct, 472 AS ad_table_id, m_matchinv.m_matchinv_id AS record_id, 'N' AS issotrx FROM m_matchinv WHERE (m_matchinv.posted <> 'Y'::bpchar)) UNION SELECT m_matchpo.ad_client_id, m_matchpo.ad_org_id, m_matchpo.created, m_matchpo.createdby, m_matchpo.updated, m_matchpo.updatedby, m_matchpo.isactive, m_matchpo.documentno, m_matchpo.datetrx AS datedoc, m_matchpo.datetrx AS dateacct, 473 AS ad_table_id, m_matchpo.m_matchpo_id AS record_id, 'N' AS issotrx FROM m_matchpo WHERE (m_matchpo.posted <> 'Y'::bpchar)) UNION SELECT c_order.ad_client_id, c_order.ad_org_id, c_order.created, c_order.createdby, c_order.updated, c_order.updatedby, c_order.isactive, c_order.documentno, c_order.dateordered AS datedoc, c_order.dateacct, 259 AS ad_table_id, c_order.c_order_id AS record_id, c_order.issotrx FROM c_order WHERE ((c_order.posted <> 'Y'::bpchar) AND (c_order.docstatus <> 'VO'::bpchar))) UNION SELECT m_requisition.ad_client_id, m_requisition.ad_org_id, m_requisition.created, m_requisition.createdby, m_requisition.updated, m_requisition.updatedby, m_requisition.isactive, m_requisition.documentno, m_requisition.daterequired AS datedoc, m_requisition.daterequired AS dateacct, 702 AS ad_table_id, m_requisition.m_requisition_id AS record_id, 'N' AS issotrx FROM m_requisition WHERE ((m_requisition.posted <> 'Y'::bpchar) AND (m_requisition.docstatus <> 'VO'::bpchar));


ALTER TABLE adempiere.rv_unposted OWNER TO adempiere;

--
-- Name: rv_warehouseprice; Type: VIEW; Schema: adempiere; Owner: adempiere
--

CREATE VIEW rv_warehouseprice AS
    SELECT w.ad_client_id, w.ad_org_id, CASE WHEN (p.discontinued = 'N'::bpchar) THEN 'Y'::text ELSE 'N'::text END AS isactive, pr.created, pr.createdby, pr.updated, pr.updatedby, p.m_product_id, pr.m_pricelist_version_id, w.m_warehouse_id, p.value, p.name, p.upc, p.sku, uom.c_uom_id, uom.uomsymbol, bompricelist(p.m_product_id, pr.m_pricelist_version_id) AS pricelist, bompricestd(p.m_product_id, pr.m_pricelist_version_id) AS pricestd, (bompricestd(p.m_product_id, pr.m_pricelist_version_id) - bompricelimit(p.m_product_id, pr.m_pricelist_version_id)) AS margin, bompricelimit(p.m_product_id, pr.m_pricelist_version_id) AS pricelimit, w.name AS warehousename, bomqtyavailable(p.m_product_id, w.m_warehouse_id, 0) AS qtyavailable, bomqtyonhand(p.m_product_id, w.m_warehouse_id, 0) AS qtyonhand, bomqtyreserved(p.m_product_id, w.m_warehouse_id, 0) AS qtyreserved, bomqtyordered(p.m_product_id, w.m_warehouse_id, 0) AS qtyordered, COALESCE(pa.isinstanceattribute, 'N'::bpchar) AS isinstanceattribute FROM ((((m_product p JOIN m_productprice pr ON ((p.m_product_id = pr.m_product_id))) JOIN c_uom uom ON ((p.c_uom_id = uom.c_uom_id))) LEFT JOIN m_attributeset pa ON ((p.m_attributeset_id = pa.m_attributeset_id))) JOIN m_warehouse w ON ((p.ad_client_id = w.ad_client_id))) WHERE ((((p.issummary = 'N'::bpchar) AND (p.isactive = 'Y'::bpchar)) AND (pr.isactive = 'Y'::bpchar)) AND (w.isactive = 'Y'::bpchar));


ALTER TABLE adempiere.rv_warehouseprice OWNER TO adempiere;

--
-- Name: t_invoicegl_v; Type: VIEW; Schema: adempiere; Owner: adempiere
--

CREATE VIEW t_invoicegl_v AS
    SELECT i.ad_client_id, i.ad_org_id, i.isactive, i.created, i.createdby, i.updated, i.updatedby, i.c_invoice_id, i.issotrx, i.documentno, i.docstatus, i.c_doctype_id, i.c_order_id, i.description, i.salesrep_id, i.dateinvoiced, i.dateacct, i.c_paymentterm_id, i.c_bpartner_id, i.c_bpartner_location_id, i.ad_user_id, i.isselfservice, i.c_currency_id, i.c_conversiontype_id, i.grandtotal, i.istaxincluded, i.c_campaign_id, i.c_project_id, i.c_activity_id, i.ad_orgtrx_id, i.user1_id, i.user2_id, fa.c_locfrom_id, fa.c_locto_id, fa.c_salesregion_id, fa.fact_acct_id, fa.c_acctschema_id, fa.account_id, fa.c_period_id, fa.gl_category_id, fa.gl_budget_id, fa.c_tax_id, fa.m_locator_id, fa.postingtype, fa.amtsourcedr, fa.amtsourcecr, fa.amtacctdr, fa.amtacctcr, fa.c_uom_id, fa.qty, gl.ad_pinstance_id, gl.apar, gl.openamt, gl.percent, gl.amtrevaldr, gl.amtrevalcr, gl.datereval, gl.c_conversiontypereval_id, gl.amtsourcebalance, gl.amtacctbalance, gl.c_doctypereval_id, gl.amtrevaldrdiff, gl.amtrevalcrdiff, gl.isallcurrencies, ((fa.amtacctdr * gl.percent) / (100)::numeric) AS amtacctopendr, ((fa.amtacctcr * gl.percent) / (100)::numeric) AS amtacctopencr, (((fa.amtacctdr - fa.amtacctcr) * gl.percent) / (100)::numeric) AS amtacctopenbalance FROM ((t_invoicegl gl JOIN c_invoice i ON ((gl.c_invoice_id = i.c_invoice_id))) JOIN fact_acct fa ON ((gl.fact_acct_id = fa.fact_acct_id)));


ALTER TABLE adempiere.t_invoicegl_v OWNER TO adempiere;

--
-- Name: t_invoicegl_vt; Type: VIEW; Schema: adempiere; Owner: adempiere
--

CREATE VIEW t_invoicegl_vt AS
    SELECT i.ad_client_id, i.ad_org_id, i.isactive, i.created, i.createdby, i.updated, i.updatedby, i.c_invoice_id, i.issotrx, i.documentno, i.docstatus, i.c_doctype_id, i.c_order_id, i.description, i.salesrep_id, i.dateinvoiced, i.dateacct, i.c_paymentterm_id, i.c_bpartner_id, i.c_bpartner_location_id, i.ad_user_id, i.isselfservice, i.c_currency_id, i.c_conversiontype_id, i.grandtotal, i.istaxincluded, i.c_campaign_id, i.c_project_id, i.c_activity_id, i.ad_orgtrx_id, i.user1_id, i.user2_id, fa.c_locfrom_id, fa.c_locto_id, fa.c_salesregion_id, fa.fact_acct_id, fa.c_acctschema_id, fa.account_id, fa.c_period_id, fa.gl_category_id, fa.gl_budget_id, fa.c_tax_id, fa.m_locator_id, fa.postingtype, fa.amtsourcedr, fa.amtsourcecr, fa.amtacctdr, fa.amtacctcr, fa.c_uom_id, fa.qty, gl.ad_pinstance_id, gl.apar, gl.openamt, gl.percent, gl.amtrevaldr, gl.amtrevalcr, gl.datereval, gl.c_conversiontypereval_id, gl.amtsourcebalance, gl.amtacctbalance, gl.c_doctypereval_id, gl.amtrevaldrdiff, gl.amtrevalcrdiff, gl.isallcurrencies, ((fa.amtacctdr * gl.percent) / (100)::numeric) AS amtacctopendr, ((fa.amtacctcr * gl.percent) / (100)::numeric) AS amtacctopencr, (((fa.amtacctdr - fa.amtacctcr) * gl.percent) / (100)::numeric) AS amtacctopenbalance FROM ((t_invoicegl gl JOIN c_invoice i ON ((gl.c_invoice_id = i.c_invoice_id))) JOIN fact_acct fa ON ((gl.fact_acct_id = fa.fact_acct_id)));


ALTER TABLE adempiere.t_invoicegl_vt OWNER TO adempiere;

