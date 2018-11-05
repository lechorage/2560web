/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import java.net.*;
import java.sql.*;

import bean.User;

/**
 *
 * @author YuanSun
 */
public class UserDao {

    Connection conn = null;
    Statement st;
    ResultSet rs = null;

    public User login(String username, String password) {
        try {
            try {
                Class.forName("org.apache.derby.jdbc.ClientDriver");
            } catch (Exception e) {
                e.printStackTrace();
            }

            String connectionURL = "jdbc:derby://localhost:1527/YuanSun";
            conn = DriverManager.getConnection(connectionURL, "IS2560", "IS2560");

            st = conn.createStatement();
            String q1 = new String("select * from USERS where USERNAME='" + username + "' and PASSWORD='" + password + "'");
            System.out.println(q1);
            rs = st.executeQuery(q1);
            User user = new User();
            if (rs.next()) {
                user.setId(Integer.parseInt(rs.getString("ID")));
                user.setUsername(rs.getString("USERNAME"));
                user.setPassword(rs.getString("PASSWORD"));
            } else {
                return null;
            }
            rs.close();
            st.close();
            System.out.println(user.getId());
            return user;

        } catch (SQLException se) {
            se.printStackTrace();
            throw new RuntimeException(se);
        }
    }
    
    public void register(String username, String password) {
        try {
            try {
                Class.forName("org.apache.derby.jdbc.ClientDriver");
            } catch (Exception e) {
                e.printStackTrace();
            }

            String connectionURL = "jdbc:derby://localhost:1527/YuanSun";
            conn = DriverManager.getConnection(connectionURL, "IS2560", "IS2560");

            st = conn.createStatement();
            String q1 = new String("insert into USERS(USERNAME, PASSWORD) values ('" + username + "','" + password + "')");
            System.out.println(q1);
            st.executeUpdate(q1);
            
            st.close();

        } catch (SQLException se) {
            se.printStackTrace();
            throw new RuntimeException(se);
        }
    }
}
