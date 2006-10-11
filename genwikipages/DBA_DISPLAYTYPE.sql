CREATE OR REPLACE FUNCTION DBA_DisplayType
(
	AD_Reference_ID		IN	NUMBER
)
RETURN VARCHAR2
AS
BEGIN
/*************************************************************************
 * The contents of this file are subject to the Compiere License.  You may
 * obtain a copy of the License at    http://www.compiere.org/license.html 
 * Software is on an  "AS IS" basis,  WITHOUT WARRANTY OF ANY KIND, either 
 * express or implied. See the License for details. Code: Compiere ERP+CRM
 * Copyright (C) 1999-2001 Jorg Janke, ComPiere, Inc. All Rights Reserved.
 *************************************************************************
 * $Id: DBA_DisplayType.sql,v 1.4 2005/04/27 17:48:07 jjanke Exp $
 ***
 * Title:	Show clear text od DisplayType
 * Description:
 ************************************************************************/
/*
	IF (AD_Reference_ID = 10)    THEN RETURN 'String    = 10';
	ELSIF (AD_Reference_ID = 11) THEN RETURN 'Integer   = 11';
	ELSIF (AD_Reference_ID = 12) THEN RETURN 'Amount    = 12';
	ELSIF (AD_Reference_ID = 13) THEN RETURN 'ID        = 13';
	ELSIF (AD_Reference_ID = 14) THEN RETURN 'Text      = 14';
	ELSIF (AD_Reference_ID = 15) THEN RETURN 'Date      = 15';
	ELSIF (AD_Reference_ID = 16) THEN RETURN 'DateTime  = 16';
	ELSIF (AD_Reference_ID = 17) THEN RETURN 'List      = 17';
	ELSIF (AD_Reference_ID = 18) THEN RETURN 'Table     = 18';
	ELSIF (AD_Reference_ID = 19) THEN RETURN 'TableDir  = 19';
	ELSIF (AD_Reference_ID = 20) THEN RETURN 'YesNo     = 20';
	ELSIF (AD_Reference_ID = 21) THEN RETURN 'Location  = 21';
	ELSIF (AD_Reference_ID = 22) THEN RETURN 'Number    = 22';
	ELSIF (AD_Reference_ID = 23) THEN RETURN 'Binary    = 23';
	ELSIF (AD_Reference_ID = 24) THEN RETURN 'Time      = 24';
	ELSIF (AD_Reference_ID = 25) THEN RETURN 'Account   = 25';
	ELSIF (AD_Reference_ID = 26) THEN RETURN 'RowID     = 26';
	ELSIF (AD_Reference_ID = 27) THEN RETURN 'Color     = 27';
	ELSIF (AD_Reference_ID = 28) THEN RETURN 'Button    = 28';
	ELSIF (AD_Reference_ID = 29) THEN RETURN 'Quantity  = 29';
	ELSIF (AD_Reference_ID = 30) THEN RETURN 'Search    = 30';
	ELSIF (AD_Reference_ID = 31) THEN RETURN 'Locator   = 31';
	ELSIF (AD_Reference_ID = 32) THEN RETURN 'Image     = 32';  
	ELSIF (AD_Reference_ID = 33) THEN RETURN 'Assignment= 33';  
	ELSE  RETURN 'Unknown ('||AD_Reference_ID||')';  END IF;
*/
	IF (AD_Reference_ID = 10)    THEN RETURN 'String';
	ELSIF (AD_Reference_ID = 11) THEN RETURN 'Integer';
	ELSIF (AD_Reference_ID = 12) THEN RETURN 'Amount';
	ELSIF (AD_Reference_ID = 13) THEN RETURN 'ID';
	ELSIF (AD_Reference_ID = 14) THEN RETURN 'Text';
	ELSIF (AD_Reference_ID = 15) THEN RETURN 'Date';
	ELSIF (AD_Reference_ID = 16) THEN RETURN 'DateTime';
	ELSIF (AD_Reference_ID = 17) THEN RETURN 'List';
	ELSIF (AD_Reference_ID = 18) THEN RETURN 'Table';
	ELSIF (AD_Reference_ID = 19) THEN RETURN 'TableDir';
	ELSIF (AD_Reference_ID = 20) THEN RETURN 'YesNo';
	ELSIF (AD_Reference_ID = 21) THEN RETURN 'Location';
	ELSIF (AD_Reference_ID = 22) THEN RETURN 'Number';
	ELSIF (AD_Reference_ID = 23) THEN RETURN 'Binary';
	ELSIF (AD_Reference_ID = 24) THEN RETURN 'Time';
	ELSIF (AD_Reference_ID = 25) THEN RETURN 'Account';
	ELSIF (AD_Reference_ID = 26) THEN RETURN 'RowID';
	ELSIF (AD_Reference_ID = 27) THEN RETURN 'Color';
	ELSIF (AD_Reference_ID = 28) THEN RETURN 'Button';
	ELSIF (AD_Reference_ID = 29) THEN RETURN 'Quantity';
	ELSIF (AD_Reference_ID = 30) THEN RETURN 'Search';
	ELSIF (AD_Reference_ID = 31) THEN RETURN 'Locator';
	ELSIF (AD_Reference_ID = 32) THEN RETURN 'Image';  
	ELSIF (AD_Reference_ID = 33) THEN RETURN 'Assignment';  
	ELSIF (AD_Reference_ID = 34) THEN RETURN 'Memo';  
	ELSIF (AD_Reference_ID = 35) THEN RETURN 'ProductAttribute';  
	ELSIF (AD_Reference_ID = 36) THEN RETURN 'TextLong';  
	ELSIF (AD_Reference_ID = 37) THEN RETURN 'CostsPrices';  
	ELSE  RETURN 'Unknown ('||AD_Reference_ID||')';  END IF;
END DBA_DisplayType;
/
