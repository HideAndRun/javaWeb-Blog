<%@ page contentType="text/html; charset=utf-8" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
	String mainPage=(String)request.getAttribute("mainPage");
	if(mainPage==null||mainPage.equals(""))
		mainPage="default.jsp";
%>
<html>
	<head>
		<title>博客内容</title>
		<base href="<%=basePath%>">
		<script src="js/jquery-1.11.0.min.js"></script>
		<script src="js/bootstrap.min.js"></script>
		<script src="js/popover.js"></script>
		<link rel="icon" href="images/icon.ico" type="image/x-icon" />
		<link type="text/css" rel="stylesheet" href="css/bootstrap.min.css" />
		<link type="text/css" rel="stylesheet" href="css/font-awesome.css"/>
		<link type="text/css"  rel="stylesheet" href="css/main.css"/>
	</head>
	<body>
    	<center class="container-fluid">
	        <div class="container" >
    	        <div class="row"><%@ include file="top.jsp" %></div>
        	    <div class="row" style="margin-top:100px;background-color:#fff;opacity: 0.9;padding-bottom:10px">
            	    <div class="col-md-4" style="float:left"><jsp:include page="left.jsp"/></div>
                	<div class="col-md-8"><jsp:include page="<%=mainPage%>"/></div>
	            </div>
    	        <div class="row">
    	        	<div><%@ include file="end.jsp" %></div>
    	        </div>
        	</div>        
	    </center>
	</body>
</html>