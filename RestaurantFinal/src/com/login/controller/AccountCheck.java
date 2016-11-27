package com.login.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
@WebServlet("/login/AccountCheck")
public class AccountCheck extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public AccountCheck() {
        super();

    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setHeader("content-type", "text/html;charset=UTF-8");
		response.setCharacterEncoding("UTF-8");
		PrintWriter out = response.getWriter();
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		String url = "jdbc:sqlserver://localhost:1433;DatabaseName=Rest89";
		String query = "select count(*) from Employee where emp_email=?";
		String email = request.getParameter("email");
		try {
			DriverManager.registerDriver(new com.microsoft.sqlserver.jdbc.SQLServerDriver());
			conn = DriverManager.getConnection(url, "sa", "P@ssw0rd");
			stmt = conn.prepareStatement(query);
			stmt.setString(1, email);

			rs = stmt.executeQuery();
			String strMsg = "信箱不存在";

			rs.next();
			if (rs.getInt(1) >= 1) {
				strMsg = "信箱已存在";
			}

			out.write(strMsg);
			rs.close();
			stmt.close();
			conn.close();
		} catch (SQLException e) {
			out.println("Error:" + e.getMessage());
		} finally {
			try {
				if (stmt != null)
					stmt.close();
			} catch (SQLException se2) {
			}
			try {
				if (conn != null)
					conn.close();
			} catch (SQLException se) {
				se.printStackTrace();
			}
		}

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		doGet(request, response);
	}

}
