package simplewebapp;

import java.sql.*;

public class DatabaseDAO {
	private static Connection connection;

	private static DatabaseDAO instance = null;

	protected ResultSet doQuery(String query) {
		try {
			Statement sqlStatement = connection.createStatement();
			ResultSet sqlResultSet = sqlStatement.executeQuery(query);
			return sqlResultSet;
		} catch (SQLException e) {
			System.err.println(e);
		}
		return null;
	}

	//Empty private constructor to prevent other classes calling this
	private DatabaseDAO() {

	}

	private void init() {
		try {
			//String dbMode = "derby";
			//String dbClassName = "org.apache.derby.jdbc.ClientDriver";
			//String host = "localhost:1527";
			//String db = "blog";
			String dbMode = "mysql";
			String dbClassName = "com.mysql.jdbc.Driver";
			String host = "mysql";
			
			// ## CHANGE THESE ##
			String db = "cms_ictg1";       // or cms_ictg2
			String username = "cms-ictg1"; // or cms-ictg2 
			String password = "!SDPAiscool!10";
			// ## ############ ##
			
			Class.forName(dbClassName);

		// Setting the derby connection URI
			String DB_CONNSTRING = "jdbc:"+dbMode+"://" + host + "/" + db;

			connection = DriverManager.getConnection(DB_CONNSTRING, username, password);

		} catch(ClassNotFoundException e) {
			System.err.println(e);
		} catch(SQLException e) {
			System.err.println(e);
		}
	}

	public static DatabaseDAO getInstance() {
		if (instance == null) {
			instance = new DatabaseDAO();
			instance.init();
		}
		return instance;
	}
}