﻿<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
   String path = request.getContextPath();
 %>
<html>
<head>
<!-- 引用Jquery -->
<script src="<%=path%>/js/jquery.js"></script>
<script>
   
   var ajaxEngine;
   $(function(){
	   $("input:first").blur(function(){
		   var empNO = this.value;
		   alert(empNO);
		   if(window.ActiveXObject){
			   ajaxEngine = new ActiveXObject("microsoft.xmlhttp");
		   }else{
		       //创建ajax引擎对象
		       ajaxEngine = new XMLHttpRequest();
		   }
		   //读取请求
		   ajaxEngine.open("get","<%=path%>/emp/check?empno="+empNO+"&time=<%=new Date().getTime()%>",true);
		   //状态没改变一次就触发此事件
		   ajaxEngine.onreadystatechange=getData;	 	   
		   //将请求发送给服务器
		   ajaxEngine.send();
	   });
   });
   
   function getData(){
	   //在成功的处理完毕后获取服务器的响应结果
	   if(ajaxEngine.status==200 && ajaxEngine.readyState==4){
	      var result = ajaxEngine.responseText;
	      if(result=="yes"){
	    	  $("#tip").text("员工工号可以使用!");
	    	  $(":submit").attr("disabled",false);
	      }else{
	    	  $("#tip").text("员工工号已存在!");  
	    	  $(":submit").attr("disabled",true);
	      }
	   }
   }
</script>
<script src="<%=path%>/js/My97DatePicker/WdatePicker.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>main</title>
<link href="<%=path%>/css/css.css" type="text/css" rel="stylesheet" />
<link href="<%=path%>/css/main.css" type="text/css" rel="stylesheet" />
<link rel="shortcut icon" href="<%=path%>/images/main/favicon.ico" />
<style>
body{overflow-x:hidden; background:#f2f0f5; padding:15px 0px 10px 5px;}
#searchmain{ font-size:12px;}
#search{ font-size:12px; background:#548fc9; margin:10px 10px 0 0; display:inline; width:100%; color:#FFF}
#search form span{height:40px; line-height:40px; padding:0 0px 0 10px; float:left;}
#search form input.text-word{height:24px; line-height:24px; width:180px; margin:8px 0 6px 0; padding:0 0px 0 10px; float:left; border:1px solid #FFF;}
#search form input.text-but{height:24px; line-height:24px; width:55px; background:url(<%=path%>/images/main/list_input.jpg) no-repeat left top; border:none; cursor:pointer; font-family:"Microsoft YaHei","Tahoma","Arial",'宋体'; color:#666; float:left; margin:8px 0 0 6px; display:inline;}
#search a.add{ background:url(<%=path%>/images/main/add.jpg) no-repeat 0px 6px; padding:0 10px 0 26px; height:40px; line-height:40px; font-size:14px; font-weight:bold; color:#FFF}
#search a:hover.add{ text-decoration:underline; color:#d2e9ff;}
#main-tab{ border:1px solid #eaeaea; background:#FFF; font-size:12px;}
#main-tab th{ font-size:12px; background:url(<%=path%>/images/main/list_bg.jpg) repeat-x; height:32px; line-height:32px;}
#main-tab td{ font-size:12px; line-height:40px;}
#main-tab td a{ font-size:12px; color:#548fc9;}
#main-tab td a:hover{color:#565656; text-decoration:underline;}
.bordertop{ border-top:1px solid #ebebeb}
.borderright{ border-right:1px solid #ebebeb}
.borderbottom{ border-bottom:1px solid #ebebeb}
.borderleft{ border-left:1px solid #ebebeb}
.gray{ color:#dbdbdb;}
td.fenye{ padding:10px 0 0 0; text-align:right;}
.bggray{ background:#f9f9f9; font-size:14px; font-weight:bold; padding:10px 10px 10px 0; width:120px;}
.main-for{ padding:10px;}
.main-for input.text-word{ width:310px; height:36px; line-height:36px; border:#ebebeb 1px solid; background:#FFF; font-family:"Microsoft YaHei","Tahoma","Arial",'宋体'; padding:0 10px;}
.main-for select{ width:310px; height:36px; line-height:36px; border:#ebebeb 1px solid; background:#FFF; font-family:"Microsoft YaHei","Tahoma","Arial",'宋体'; color:#666;}
.main-for input.text-but{ width:100px; height:40px; line-height:30px; border: 1px solid #cdcdcd; background:#e6e6e6; font-family:"Microsoft YaHei","Tahoma","Arial",'宋体'; color:#969696; float:left; margin:0 10px 0 0; display:inline; cursor:pointer; font-size:14px; font-weight:bold;}
.main-for textarea{ width:100%; height:150px; line-height:24px; border:#ebebeb 1px solid; background:#FFF; font-family:"Microsoft YaHei","Tahoma","Arial",'宋体'; padding:10px; color:#666}
#addinfo a{ font-size:14px; font-weight:bold; background:url(<%=path%>/images/main/addinfoblack.jpg) no-repeat 0 1px; padding:0px 0 0px 20px; line-height:45px;}
#addinfo a:hover{ background:url(<%=path%>/images/main/addinfoblue.jpg) no-repeat 0 1px;}
</style>
</head>
<body>
<!--main_top-->
<table width="99%" border="0" cellspacing="0" cellpadding="0" id="searchmain">

  <tr>
    <td align="left" valign="top" id="addinfo">
     <a href="#" target="mainFrame" onFocus="this.blur()" class="add">数据添加</a>
    </td>
  </tr>
  <tr>
    <td align="left" valign="top">
    <form method="post" action="<%=path%>/emp/add" enctype="multipart/form-data">
    <table width="100%" border="0" cellspacing="0" cellpadding="0" id="main-tab">
      <tr onMouseOut="this.style.backgroundColor='#ffffff'" onMouseOver="this.style.backgroundColor='#edf5ff'">
        <td align="right" valign="middle" class="borderright borderbottom bggray">工号：</td>
        <td align="left" valign="middle" class="borderright borderbottom main-for">
          <input type="text" name="empno" value="" class="text-word"><label id="tip"></label>
        </td>
      </tr>
        
      <tr onMouseOut="this.style.backgroundColor='#ffffff'" onMouseOver="this.style.backgroundColor='#edf5ff'">
        <td align="right" valign="middle" class="borderright borderbottom bggray">姓名：</td>
        <td align="left" valign="middle" class="borderright borderbottom main-for">
        <input type="text" name="name" value="" class="text-word">
        </td>
      </tr>
          
      <tr onMouseOut="this.style.backgroundColor='#ffffff'" onMouseOver="this.style.backgroundColor='#edf5ff'">
        <td align="right" valign="middle" class="borderright borderbottom bggray">性别：</td>
        <td align="left" valign="middle" class="borderright borderbottom main-for">
        <select name="sex">
		    <option>男</option>
	        <option>女 </option>
        </select>
        </td>
      </tr>
   
       <tr onMouseOut="this.style.backgroundColor='#ffffff'" onMouseOver="this.style.backgroundColor='#edf5ff'">
        <td align="right" valign="middle" class="borderright borderbottom bggray">联系电话：</td>
        <td align="left" valign="middle" class="borderright borderbottom main-for">
        <input type="text" name="tel" value="" class="text-word">
        </td>
       </tr>
          
      <tr onMouseOut="this.style.backgroundColor='#ffffff'" onMouseOver="this.style.backgroundColor='#edf5ff'">
        <td align="right" valign="middle" class="borderright borderbottom bggray">月薪：</td>
        <td align="left" valign="middle" class="borderright borderbottom main-for">
        <input type="text" name="salary" value="" class="text-word">
        </td>
       </tr>
                 
      <tr onMouseOut="this.style.backgroundColor='#ffffff'" onMouseOver="this.style.backgroundColor='#edf5ff'">
        <td align="right" valign="middle" class="borderright borderbottom bggray">入职日期：</td>
        <td align="left" valign="middle" class="borderright borderbottom main-for">
        <input type="text" name="offer" value="" class="text-word" onclick="WdatePicker({dateFmt:'yyyy-MM-dd'})"/>
        </td>
       </tr>
       
       <tr onMouseOut="this.style.backgroundColor='#ffffff'" onMouseOver="this.style.backgroundColor='#edf5ff'">
        <td align="right" valign="middle" class="borderright borderbottom bggray">部门：</td>
        <td align="left" valign="middle" class="borderright borderbottom main-for">
           <select name="deptId">
             <c:forEach var="record" items="${depts }">
                  <option value="${record[0]}">${record[1]}</option>
             </c:forEach>  
           </select>
        </td>
       </tr>
       
       <tr onMouseOut="this.style.backgroundColor='#ffffff'" onMouseOver="this.style.backgroundColor='#edf5ff'">
        <td align="right" valign="middle" class="borderright borderbottom bggray">员工照片：</td>
        <td align="left" valign="middle" class="borderright borderbottom main-for">
          <input type="file" name="photo" value="" class="text-word">
        </td>
       </tr>
      
      <tr onMouseOut="this.style.backgroundColor='#ffffff'" onMouseOver="this.style.backgroundColor='#edf5ff'">
        <td align="right" valign="middle" class="borderright borderbottom bggray">&nbsp;</td>
        <td align="left" valign="middle" class="borderright borderbottom main-for">
        <input name="" type="submit" value="提交" class="text-but">
        <input name="" type="reset" value="重置" class="text-but"></td>
        </tr>
    </table>
    </form>
    </td>
    </tr>
</table>
</body>
</html>