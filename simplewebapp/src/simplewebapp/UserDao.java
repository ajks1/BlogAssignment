package simplewebapp;

import java.sql.Connection;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.*;

public class UserDao {
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

		String sql = "INSERT INTO userTable" + "(user_name, user_password,user_Email,user_Confirm) VALUES"
				+ "(?,?,?,?)";

		try {
			databaseDAO.getConnection().prepareStatement(sql);
			preparedStatement = databaseDAO.getConnection().prepareStatement(sql);
			System.out.println("The user is: " + user.getUserName());
			preparedStatement.setString(1, user.getUserName());
			preparedStatement.setString(2, user.getUserPassword());
			preparedStatement.setString(3, user.getUserEmail());
			preparedStatement.setString(4, user.getuserConfirm());
			preparedStatement.executeUpdate();
		} catch (SQLException e) {

			e.printStackTrace();
		} /*
			 * finally { // æ‰§è¡Œå®Œå…³é—­æ•°æ�®åº“ dbmanage.closeDB(sta,
			 * conn); }
			 */

	}

	public UserVo judgeUserPassword(String userName, String userPassword) {
		// longin

		PreparedStatement preparedStatement = null;
		String selectSQL = "SELECT * FROM userTable WHERE user_name = ? AND user_password = ?";

		try {
			databaseDAO.getConnection().prepareStatement(selectSQL);
			preparedStatement = databaseDAO.getConnection().prepareStatement(selectSQL);
			preparedStatement.setString(1, userName);
			preparedStatement.setString(2, userPassword);

			System.out.println(userName);
			System.out.println(userPassword);
			ResultSet res = preparedStatement.executeQuery();
			// System.out.println("resultset: "+ res.next() );
			while (res.next()) {
				// Converting the results into a Article object
				String username = res.getString("user_name");
				String email = res.getString("user_Email");
				// String profilePhoto = res.getString("profile_photo");

				String name = res.getString("name");
				String title = res.getString("title");
				String birthday = res.getString("birthday");
				String occupation = res.getString("occupation");
				String city = res.getString("city");
				String country = res.getString("country");
				String travel = res.getString("travel");
				String favourite = res.getString("favourite");
				Integer userId = res.getInt("user_id");

				// Adding the post object to the list

				return new UserVo(username, email, name, title, birthday, occupation, city, country, travel, favourite,
						userId);

			}

		} catch (SQLException e) {

			e.printStackTrace();
		}
		return null;

	}

	public void updateUserProfile(UserVo updateUser) {
		// TODO Auto-generated method stub

		PreparedStatement preparedStatement = null;
		String sql = "update userTable  set  user_name = ?,user_Email = ? where user_id=?";

		try {
			databaseDAO.getConnection().prepareStatement(sql);
			preparedStatement = databaseDAO.getConnection().prepareStatement(sql);
			System.out.println("The user is: " + updateUser.getUserName());
			preparedStatement.setString(1, updateUser.getUserName());
			preparedStatement.setString(2, updateUser.getUserEmail());
			preparedStatement.setInt(3, updateUser.getUserId());
			preparedStatement.executeUpdate();
		} catch (SQLException e) {

			e.printStackTrace();
		}

	}

}