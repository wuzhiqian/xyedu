<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
   String path = request.getContextPath();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<script src="<%=path %>/js/jquery.js"></script>
<script>
   $(function(){
	   
	   
	   $("input:first").keyup(function(){
		   var bookName = this.value;
		   $("table").empty();
		   if(bookName!=""){
		     $("table").show();
		      $.ajax({
			      type:'get',
			      url:'<%=path%>/book/show?name='+bookName,
			      dataType:'json',
			      cache:false,
			      success:function(data){
				      $.each(data,function(index,val){
					      $("table").append("<tr><td onclick='load(this);'>"+val.name+"</td></tr>");
				      });
			      },
			      error:function(){alert("处理失败!");}
		      });
		   }else{
			   $("table").empty();
			   $("table").hide();
		   }
	   });
   });
   
   function load(obj){
	   $("input:first").val(obj.innerText);
	   $("table").empty();
	   $("table").hide();
   }
</script>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body> 
   <center>
      <input id="bookname"/>
      <table border="1"></table>
   </center>
</body>
</html>