<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>    
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="sf"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Logout Page</title>

<style type="text/css">
    .errorblock{
        color: #ff0000;
        background-color: #ffEEEE;
        border: 3px solid #ff0000;
        padding: 8px;
        margin: 16px;
    }
</style>

<!-- <link href ="resources/css/loginstyle.css" rel="stylesheet" type="text/css"> -->
</head>
<body>
    
	<%@ include file="/WEB-INF/views/header.jsp" %>
    
    <h3>Logout Page</h3>
    <h1>Thanks for using our website !</h1>

	<%@ include file="/WEB-INF/views/footer.jsp" %>

</body>
</html>