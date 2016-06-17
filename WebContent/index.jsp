<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%!Connection conn;
	Statement stm;
	ResultSet ret;

	String query = "select * from member";%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>

	<%
		try {

			Class.forName("oracle.jdbc.driver.OracleDriver"); //oracle.jdbc.driver.OracleDriver
			conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "user_id", "user_pw"); //jdbc:oracle:thin:@localhost:1521:xe
			stm = conn.createStatement();
			ret = stm.executeQuery(query); //select * from member

			while (ret.next()) {
				String id = ret.getString("id");
				String pw = ret.getString("pw");
				String name = ret.getString("name");
				String phone = ret.getString("phone");

				out.println("id : " + id + ", pw : " + pw + ", name : " + name + ", tel : " + phone + "<br />");
			}

		} catch (Exception e) {
			e.printStackTrace();
			out.println(e.getMessage());

		} finally {
			try {
				if (ret != null)
					ret.close();
				if (stm != null)
					stm.close();
				if (conn != null)
					conn.close();
			} catch (Exception e) {
			}
		}
	%>

</body>
</html>