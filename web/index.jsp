<%@ page import="java.sql.Connection" %>
<%@ page import="javax.naming.Context" %>
<%@ page import="javax.naming.InitialContext" %>
<%@ page import="javax.sql.DataSource" %>
<%@ page import="javax.naming.NamingException" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="java.sql.PreparedStatement" %>
<%--
  Created by IntelliJ IDEA.
  User: nero
  Date: 2020/6/6
  Time: 9:38
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="utf-8" %>
<html>
<head>
    <title>$Title$</title>
</head>
<body>
<%
    Connection conn = null;
    try {
        //1、初始化名称查找上下文
        Context ctx = new InitialContext();

        //2、通过JNDI名称找到DataSource,对名称进行定位java:comp/env是必须加的,后面跟的是DataSource名
        DataSource ds = (DataSource) ctx.lookup("java:comp/env/jdbc/mysql");
        //3、通过DataSource取得一个连接
        conn = ds.getConnection();
        out.println("MySQL Connection pool connected !!");
        //4、操作数据库
        PreparedStatement statement = conn.prepareStatement("insert into user values (0,'jndi',15)");
        out.println("插入数据库:" + statement.executeUpdate());
    } catch (NamingException e) {
        System.out.println(e.getMessage());
    } catch (SQLException e) {
        e.printStackTrace();
    } finally {
        //5、关闭数据库，关闭的时候是将连接放回到连接池之中
        conn.close();
    }
%>
</body>
</html>
