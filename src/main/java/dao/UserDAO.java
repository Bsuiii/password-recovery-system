package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Random;

import model.User;

public class UserDAO {
private Connection con;

	
	public UserDAO() {
		
	}
	
	public ArrayList<User> getAll() {
		String query="SELECT `id`, `FullName`, `email`, `password`, `repCode` FROM `user`;";
		try {
			PreparedStatement pst=Connect.getConnect().getConnection().prepareStatement(query);
			ResultSet rs=pst.executeQuery();
			ArrayList<User> users=new ArrayList();
			while(rs.next()) {
				User user=new User();
				user.setId(rs.getString("id"));
			    user.setFullName(rs.getString("FullName"));
			    user.setEmail(rs.getString("email"));
			    user.setPassword(rs.getString("password"));
			    user.setRepCode(rs.getString("repCode"));
			    users.add(user);
		}
			return users;
		} catch (Exception e) {
		return null;
		}
	}
	
	public User emailExists(String email) {
		String query="SELECT `id`, `FullName`, `email`, `password`, `repCode` FROM `user` WHERE `email`=?";
		try {
			PreparedStatement pst=Connect.getConnect().getConnection().prepareStatement(query);
			pst.setString(1, email);
			ResultSet rs=pst.executeQuery();
			User user=new User();
			
			if(rs.next()) {
				user.setId(rs.getString("id"));
			    user.setFullName(rs.getString("FullName"));
			    user.setEmail(rs.getString("email"));
			    user.setPassword(rs.getString("password"));
			    user.setRepCode(rs.getString("repCode"));
			    return user;
		}
			
			return null;
		} catch (Exception e) {
			System.out.println("USER DAO "+e.getMessage());
		return null;
		}
	}
	
	public User getById(int id) {
		String query="SELECT `id`, `FullName`, `email`, `password`, `repCode` FROM `user` WHERE `id`=?";
		try {
			PreparedStatement pst=Connect.getConnect().getConnection().prepareStatement(query);
			pst.setInt(1,id);
			ResultSet rs=pst.executeQuery();
			User user=new User();
			
			if(rs.next()) {
				user.setId(rs.getString("id"));
			    user.setFullName(rs.getString("FullName"));
			    user.setEmail(rs.getString("email"));
			    user.setPassword(rs.getString("password"));
			    user.setRepCode(rs.getString("repCode"));
			    return user;
		}
			
			return null;
		} catch (Exception e) {
			System.out.println("USER DAO "+e.getMessage());
		return null;
		}
	}
	
	
	
	public void updatePin(int id,int pin) {
		String query="UPDATE `user` SET  `repCode`=? WHERE `id`=?";
		try {
			PreparedStatement pst=Connect.getConnect().getConnection().prepareStatement(query);
			pst.setInt(1, pin);
			pst.setInt(2, id);
			pst.execute();
		
		} catch (Exception e) {
			System.out.println("USER DAO "+e.getMessage());
		}
	}
	
	public void updatePassword(int id,String password) {
		String query="UPDATE `user` SET `password`=? WHERE `id`=?";
		try {
			PreparedStatement pst=Connect.getConnect().getConnection().prepareStatement(query);
			pst.setString(1, password);
			pst.setInt(2, id);
			pst.execute();
		
		} catch (Exception e) {
			System.out.println("USER DAO "+e.getMessage());
		}
	}
}
