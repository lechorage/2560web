/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import java.net.*;
import java.sql.*;

import bean.Todo;
import java.util.ArrayList;

/**
 *
 * @author YuanSun
 */
public class TodoDao {

    Connection conn = null;
    Statement st;
    ResultSet rs = null;

    public ArrayList<Todo> getTodo(int userid) {
        try {
            try {
                Class.forName("org.apache.derby.jdbc.ClientDriver");
            } catch (Exception e) {
                e.printStackTrace();
            }

            String connectionURL = "jdbc:derby://localhost:1527/YuanSun";
            conn = DriverManager.getConnection(connectionURL, "IS2560", "IS2560");

            st = conn.createStatement();
            String q1 = new String("select * from TODOLIST where USERID=" + userid + "");
            System.out.println(q1);
            rs = st.executeQuery(q1);
            ArrayList<Todo> todos = new ArrayList<Todo>();
            while (rs.next()) {
                Todo todo = new Todo();
                todo.setId(Integer.parseInt(rs.getString("ID")));
                todo.setTodo(rs.getString("TODO"));
                if (rs.getString("COMPLETE").compareTo("TRUE") == 0) {
                    todo.setComplete(true);
                } else {
                    todo.setComplete(false);
                }
                todos.add(todo);
            }
            rs.close();
            st.close();
            return todos;

        } catch (SQLException se) {
            se.printStackTrace();
            throw new RuntimeException(se);
        }
    }

    public void changeStatus(int id) {
        try {
            try {
                Class.forName("org.apache.derby.jdbc.ClientDriver");
            } catch (Exception e) {
                e.printStackTrace();
            }

            String connectionURL = "jdbc:derby://localhost:1527/YuanSun";
            conn = DriverManager.getConnection(connectionURL, "IS2560", "IS2560");

            st = conn.createStatement();
            String q1 = new String("select * from TODOLIST where ID=" + id + "");
            rs = st.executeQuery(q1);
            if (rs.next()) {
                String status;
                if (rs.getString("COMPLETE").compareTo("TRUE") == 0) {
                    status = "FALSE";
                } else {
                    status = "TRUE";
                }
                String q2 = new String("update TODOLIST set COMPLETE = " + status + " where ID=" + id + "");
                st.executeUpdate(q2);
            }
            rs.close();
            st.close();

        } catch (SQLException se) {
            se.printStackTrace();
            throw new RuntimeException(se);
        }
    }
    
    public void add(int id, String todo) {
        try {
            try {
                Class.forName("org.apache.derby.jdbc.ClientDriver");
            } catch (Exception e) {
                e.printStackTrace();
            }

            String connectionURL = "jdbc:derby://localhost:1527/YuanSun";
            conn = DriverManager.getConnection(connectionURL, "IS2560", "IS2560");

            st = conn.createStatement();
            String q1 = new String("insert into TODOLIST(USERID, TODO, COMPLETE) values (" + id + ",'" + todo + "','" + "FALSE" + "')");
            st.executeUpdate(q1);
            st.close();

        } catch (SQLException se) {
            se.printStackTrace();
            throw new RuntimeException(se);
        }
    }
}
