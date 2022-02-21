<!doctype html>
<%@page import="com.model.*"%>
<%@page import="org.hibernate.query.Query"%>
<%@page import="org.hibernate.Session"%>
<%@page import="com.utilties.HibernateUtils"%>
<%@page import="java.util.List"%>
<html lang="en">

<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<%@include file="all_js_css.jsp"%>

<title>Learner's Academy : Classes</title>
<style>
body {
	background-image: url('img/Background.jpg');
}
</style>

</head>

<body>
	<div class="container mt-2">
		<%@include file="navbar.jsp"%>
		
	<% 
	if (session.getAttribute("loginUser")==null)
	{
		RequestDispatcher requestDispatcher = request.getRequestDispatcher("login.jsp");
		requestDispatcher.forward(request, response);
	}
	
	%>
	<hr>
		<div class="container mt-3">


			<div class="row mt-5">
				<div class="col-md-2">

					<div class="list-group">
						<button type="button"
							class="list-group-item list-group-item-action active">Menu</button><a
							href="classes.jsp" class="list-group-item list-group-item-action">Back</a>

					</div>
				</div>

				<div class="col-md-10">

					<h3>Please fill class details:</h3>

					<!-- this is add form  -->
					<form action="AddClasses" method="post">
						<div class="mb-3">
							<label for="title" class="form-label">Class title</label> <input
								name="title" required type="text" class="form-control"
								id="title" placeholder="Class" />

						</div>
						<div class="mb-3">
							<label for="name" class="form-label">Class Name "Place"</label> <input
								name="name" required type="text" class="form-control"
								id="section" placeholder="Section" />

						</div>
						<div class="container text-center">
							<button type="submit" class="btn btn-primary">Add</button>
						</div>

					</form>

				</div>


			</div>

		</div>
	<hr>


	</div>

</body>
<%@include file="footer.jsp"%>
</html>