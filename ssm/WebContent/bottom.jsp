﻿<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
   String path = request.getContextPath();
 %>
<!doctype html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>底部bottom</title>
<link href="<%=path%>/css/css.css" type="text/css" rel="stylesheet" />
<style>
#footer{font-size:12px;}
.footer_pad{padding:7px 9px 5px 9px;}
</style>
</head>
<body style="overflow-x:hidden; background:url(<%=path%>/images/main/bottombg.jpg) repeat-x top left;" onselectstart="return false" oncontextmenu=return(false) >
<table width="100%" border="0" cellspacing="0" cellpadding="0" id="footer">
  <tr>
    <td align="left" valign="middle" class="footer_pad">COPYRIGHT©2017-2030 </td>
    <td align="right" valign="middle" class="footer_pad">
         <img src="<%=path%>/images/main/why.gif" width="12" height="12" alt="疑问图标" align="absmiddle">&nbsp;&nbsp;如有疑问请您联系管理员TEL：***-88****038</td>
  </tr>
</table>
</body>
</html>