package simplewebapp;

import java.sql.Connection;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.*;



public class UserDao{
	private static UserDao instance;
	private static DatabaseDAO databaseDAO;

	public UserDao() {
		databaseDAO = DatabaseDAO.getInstance();
	}

	public static UserDao getInstance() {
		if (instance == null) {
			instance = new UserDao();
		}
		return instance;
	}
public void insertUser(UserVo user) {
	
	PreparedStatement preparedStatement = null;
         Connection conn = null;
        Statement sta = null;
       
        String sql= "INSERT INTO userTable"+"(user_name, user_password,user_Email,user_Confirm) VALUES" +"(?,?,?,?)";
        
        try {    
        	databaseDAO.getConnection().prepareStatement(sql);
        	preparedStatement = databaseDAO.getConnection().prepareStatement(sql);
        	System.out.println("The user is: " + user.getUserName());
            preparedStatement.setString(1,user.getUserName()); 
            preparedStatement.setString(2,user.getUserPassword());
            preparedStatement.setString(3,user.getUserEmail());
            preparedStatement.setString(4,user.getuserConfirm());
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
 
            e.printStackTrace();
        }/* finally {
             // 执行完关闭数据库
             dbmanage.closeDB(sta, conn);
        }*/

}
public UserVo judgeUserPassword(String userName, String userPassword) {
	// longin


	
	PreparedStatement preparedStatement = null;
	String selectSQL = "SELECT * FROM userTable WHERE user_name = ? AND user_password = ?";
	
	try {
		databaseDAO.getConnection().prepareStatement(selectSQL);
    	preparedStatement = databaseDAO.getConnection().prepareStatement(selectSQL);
    	preparedStatement.setString(1,userName);
    	preparedStatement.setString(2,userPassword);
    	
		System.out.println(userName);
		System.out.println(userPassword);
		ResultSet res =preparedStatement.executeQuery();
		//System.out.println("resultset: "+ res.next() );
		while(res.next()) {
			// Converting the results into a Article object
			String name =  res.getString("user_name");
			String email = res.getString("user_Email");
			
			
			// Adding the post object to the list
		
			return new UserVo(name,email);

		}

	} catch (SQLException e) {

		e.printStackTrace();
	}
	return null;
 

	
}

public void updateUserProfile(UserVo updateUser) {
	// TODO Auto-generated method stub
	
	PreparedStatement preparedStatement = null;
    String sql = "update userTable  set  user_name = ?,user_password = ?,user_Email = ?";
	
	try {    
    	databaseDAO.getConnection().prepareStatement(sql);
    	preparedStatement = databaseDAO.getConnection().prepareStatement(sql);
    	System.out.println("The user is: " + updateUser.getUserName());
        preparedStatement.setString(1,updateUser.getUserName()); 
        preparedStatement.setString(2,updateUser.getUserPassword());
        preparedStatement.setString(3,updateUser.getUserEmail());
        preparedStatement.executeUpdate();
    } catch (SQLException e) {

        e.printStackTrace();
    }	
 

	
}

}