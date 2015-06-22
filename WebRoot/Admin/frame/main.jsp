<%@ page language="java" contentType="text/html; UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>后台管理系统-首页</title>
<link href="../css/style.css" rel="stylesheet" type="text/css" />
<style type="text/css">
#wrap{
  padding: 180px 0 0 250px;
}
h2{
  font-size: 35px;
}
</style>
</head>

<body>
    <div id="wrap">
      <h2>欢迎使用后台管理系统</h2>
    </div>
</body>
</html>
