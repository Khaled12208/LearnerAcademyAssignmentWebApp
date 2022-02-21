<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page import="com.model.*"%>
<%@page import="org.hibernate.query.Query"%>
<%@page import="org.hibernate.Session"%>
<%@page import="com.utilties.HibernateUtils"%>
<%@page import="java.util.*"%>

<!DOCTYPE html>
<html>
<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<%@include file="all_js_css.jsp"%>
<style>
body {
	background-image: url('img/Background.jpg');
}
</style>

<title>Learner's Academy : Class</title>

</head>
<body>
	<% 
	if (session.getAttribute("loginUser")==null)
	{
		RequestDispatcher requestDispatcher = request.getRequestDispatcher("login.jsp");
		requestDispatcher.forward(request, response);
	}
	
	%>
	<div class="container mt-2">
		<%@include file="navbar.jsp"%>
		<hr>
		<div class="col-md-2">

			<div class="list-group">
				<button type="button"
					class="list-group-item list-group-item-action active">Menu</button>
				<a href="subjects.jsp"
					class="list-group-item list-group-item-action">Back</a>

			</div>
		</div>
		<div class="row mt-3">
			<div class="col-md-10 col-md-offset-0">
				<%
					Session s = HibernateUtils.getSessionFactory().openSession();
					Query q = s.createQuery("from Classes");
					List<Classes> list = q.list();
					for (Classes classes : list) {
					%>

				<div class="card mt-3 ">
					<img src="img/class.png" style="max-width: 30px;"
						class="card-img-top pt-2 pl-2 m-2 " alt="...">
					<div class="card-body px-5">
						<h5>
							ID :
							<%=classes.getClassid()%></h5>
						<h5 class="card-title">
							Class Title:
							<%=classes.getClasstitle()%></h5>
						<p class="card-text">
							Class Name:<%=classes.getClassname()%></p>

						<form method="post">
							<button type="submit" class="btn btn-success"
								formaction="<%=request.getContextPath()%>/SubjectToClass?classes_id=<%=classes.getClassid()%>&subject_id=<%=request.getParameter("subject_id")%>">Assgin</button>
						</form>
					</div>
				</div>

				<%
					}

					s.close();
					%>
			</div>
		</div>
		<hr>

	</div>

</body>
<%@include file="footer.jsp"%>
</html>