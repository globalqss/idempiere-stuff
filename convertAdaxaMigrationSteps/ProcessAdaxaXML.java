import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.parsers.ParserConfigurationException;

import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;
import org.xml.sax.InputSource;
import org.xml.sax.SAXException;

public class ProcessAdaxaXML {

	static String command;
	static List<String> columns;
	static List<String> values;
	
	public static void main(String[] args) throws SQLException {
		DocumentBuilderFactory dbf = DocumentBuilderFactory.newInstance();
		dbf.setNamespaceAware(true);
		dbf.setIgnoringElementContentWhitespace(true);
		
		for (String filename : args) {
			File file = new File(filename);
			System.out.println("-- File = " + file.getName());
			Document doc = null;
			try {
				DocumentBuilder builder = dbf.newDocumentBuilder();
				InputSource is1 = new InputSource(new FileInputStream(filename));
				doc = builder.parse(is1);
			} catch (FileNotFoundException e) {
				e.printStackTrace();
			} catch (ParserConfigurationException e) {
				e.printStackTrace();
			} catch (SAXException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}

			NodeList migrations = doc.getDocumentElement().getElementsByTagName("Migration");
			for ( int i = 0; i < migrations.getLength(); i++ )
			{
				fromXmlNode((Element) migrations.item(i));
			}
		}

	}

	public static void fromXmlNode(Element element) throws SQLException
	{

		if ( !"Migration".equals(element.getLocalName() ) )
			return;

		String name = element.getAttribute("Name");
		String seqNo = element.getAttribute("SeqNo");
		String entityType = element.getAttribute("EntityType");
		String releaseNo = element.getAttribute("ReleaseNo");

		System.out.println("-- Migration " + name + ", SeqNo=" + seqNo);
		Node comment = (Element) element.getElementsByTagName("Comments").item(0);    // gets first comment of migration or its steps

		NodeList children = element.getElementsByTagName("Step");
		for ( int i = 0; i < children.getLength(); i++ )
		{
			Element step = (Element) children.item(i);
			if ( "Step".equals(step.getTagName()))
				stepFromXmlNode(step);
		}

	}

	public static void stepFromXmlNode(Node stepNode) throws SQLException {
		Element step = (Element) stepNode;
		// Integer.parseInt(step.getAttribute("SeqNo"));
		String stepType = step.getAttribute("StepType");
		String seqNo = step.getAttribute("SeqNo");
		
		String binaryData = null;
		String title = "zip";
		Node comment = (Element) step.getElementsByTagName("Comments").item(0);
		// comment.getTextContent()
		if ( "AD".equals(stepType) )
		{
			NodeList children = step.getElementsByTagName("PO");
			for ( int i = 0; i < children.getLength(); i++ )
			{
				Element element = (Element) children.item(i);
				String action = element.getAttribute("Action");
				String table = element.getAttribute("Table");
				int recordID = Integer.parseInt(element.getAttribute("Record_ID"));

				NodeList data = element.getElementsByTagName("Data");
				columns = new ArrayList<String>();
				values = new ArrayList<String>();
				for ( int j =0 ; j < data.getLength(); j++ )
				{
					dataFromXmlNode(table, data.item(j));
					if (((Element)data.item(j)).getAttribute("Column").equals("Title")) {
						title =  ((Element)data.item(j)).getTextContent();
					}
				}

				if ("I".equals(action)) {
					command = "INSERT INTO " + table + "(";
					for (int idx = 0; idx < columns.size(); idx++) {
						String col = columns.get(idx);
						command += col;
						command += ",";
					}
					command += table;
					command += "_UU) VALUES (";
					for (int idx = 0; idx < values.size(); idx++) {
						String val = values.get(idx);
						command += val;
						command += ",";
					}
					command += "'";
					command += UUID.randomUUID().toString();
					command += "');";
				} else if ("U".equals(action)) {
					command = "UPDATE " + table + " SET ";
					for (int idx = 0; idx < columns.size(); idx++) {
						String col = columns.get(idx);
						String val = values.get(idx);
						command += col;
						command += "=";
						command += val;
						if (idx < values.size()-1)
							command += ",";
					}
					command += " WHERE " + table + "_ID=" + recordID + ";";
				} else {
					command = "** Action " + action + " not implemented **";
				}
				
			}
		}
		else if ( "SQL".equals(stepType) )
		{
			// step.getAttribute("DBType"));
			Node sql = step.getElementsByTagName("SQLStatement").item(0);
			command = sql.getTextContent();
			// sql = step.getElementsByTagName("RollbackStatement").item(0);
			// if ( sql != null )
				// mstep.setRollbackStatement(sql.getTextContent());
		} else {
			command = "** StepType not implemented = " + stepType + " **";
		}
		
		System.out.println("-- Step SeqNo = " + seqNo + ", StepType = " + stepType);
		System.out.println(command);
		System.out.println();
	}

	public static void dataFromXmlNode(String table, Node item) throws SQLException {
		/* ad_client_id, ad_column_id, ad_migrationstep_id, ad_org_id, " + 
		"            created, createdby,  isoldnull, isnewnull, " + 
		"            newvalue, oldvalue, updated, updatedb */

		Element element = (Element) item;
		String column = element.getAttribute("Column");
		String value = element.getTextContent();
		if (  value != null
			&& value.trim().length() > 0
			&& !(table.toLowerCase().equals("ad_element") && column.toLowerCase().equals("fieldlength"))
			&& !(table.toLowerCase().equals("ad_element") && column.toLowerCase().equals("ad_reference_id"))
		   ) {
			columns.add(column);
			String realValue;
			if (   column.toLowerCase().endsWith("_id")
				|| column.toLowerCase().equals("updatedby")
				|| column.toLowerCase().equals("createdby")
			   ) {
				realValue = value;
			} else if (value.equals("false")) {
				realValue="'N'";
			} else if (value.equals("true")) {
				realValue="'Y'";
			} else if (value.matches("20[0-9][0-9]-[0-9][0-9]-[0-9][0-9] [0-9][0-9]:[0-9][0-9]:[0-9][0-9].*")) {
				if (value.indexOf('.') >= 0) {
					realValue="TO_TIMESTAMP('" + value.substring(0, value.indexOf('.')) + "','YYYY-MM-DD HH24:MI:SS')";
				} else {
					realValue="TO_TIMESTAMP('" + value + "','YYYY-MM-DD HH24:MI:SS')";
				}
			} else {
				realValue="'" + value.replaceAll("'", "''") + "'";
			}
			values.add(realValue);
		}
	}


}
