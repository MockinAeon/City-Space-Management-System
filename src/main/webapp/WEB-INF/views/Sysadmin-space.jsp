<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Sysadmin</title>
<!-- Latest compiled and minified JavaScript -->

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"
	integrity="sha384-0mSbJDEHialfmuBBQP6A4Qrprq5OVfW37PRR3j5ELqxss1yVqOtnepnHVP9aJ7xS"
	crossorigin="anonymous"></script>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css"
	integrity="sha384-1q8mTJOASx8j1Au+a5WDVnPi2lkFfwwEAa8hDDdjZlpLegxhjVME1fgjWPGmkzs7"
	crossorigin="anonymous">

<!-- Optional theme -->


<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.5.0/css/font-awesome.min.css">

<link rel="stylesheet" href="resources/css/user-home.css">
<link rel="stylesheet" href="resources/css/sysadmin.css">
</head>

<body>
	<div class="wrapper">
		<div class="container-fluid">
			<div class="row top-bar">
				<div class="col-sm-6 col-xs-6">
					<div class="col-xs-offset-3 col-sm-3">
						<div id="logoimg">
							<img src="resources/pic/logo.png" alt="logoimg" />
						</div>
					</div>
				</div>

				<div class="col-sm-6 col-xs-6">
					<div class="row icon-part">
						<div id="logout-part">
							<form method="post" action="welcome-logout.htm">
								<a href="SysadminRoleAccount">Check My Account</a>
								<button id="logout-btn" type="submit" name="action"
									value="logout" class="btn btn-default">Logout</button>
							</form>
						</div>

						<div class="col-sm-2 col-xs-2"></div>
						<div class="col-sm-2 col-xs-2"></div>
						<div class="col-xs-offset-6 col-sm-3 col-xs-3">
							<div class="icon-part-icon">
								<a id="login"><i class="fa fa-user fa-2x"></i> <span>
										Hello <c:out value="${sessionScope.name}"></c:out>

								</span></a>
							</div>

						</div>

					</div>

				</div>
			</div>
			<div class="row">
				<nav id="nav-bar" class="navbar navbar-default">
					<div class="container-fluid">

						<!-- Brand and toggle get grouped for better mobile display -->
						<div class="navbar-header">
							<button type="button" class="navbar-toggle collapsed"
								data-toggle="collapse"
								data-target="#bs-example-navbar-collapse-1"
								aria-expanded="false">
								<span class="sr-only">Toggle navigation</span> <span
									class="icon-bar"></span> <span class="icon-bar"></span> <span
									class="icon-bar"></span>
							</button>
						</div>

						<!-- Collect the nav links, forms, and other content for toggling -->
						<div class="collapse navbar-collapse"
							id="bs-example-navbar-collapse-1">


							<ul class="nav navbar-nav navbar-right">
								<li id="active" class="active"><a
									href="managecity">Manage City-Space</a></li>
								<li><a href="managereserve">Manage
										Account</a></li>
							</ul>
						</div>
						<div id="mouseout"></div>
						<!-- /.navbar-collapse -->
					</div>
					<!-- /.container-fluid -->
				</nav>
			</div>
		</div>

		<div class="container">
			<div class="col-sm-3 left-part">
				<a href="managecity">Manage City</a> <a
					href="manageenterprise">Manage Enterprise</a> <a
					href="managebuilding">Manage Building</a> <a
					href="managefloor">Manage Floor</a> <a
					href="managespace">Manage Space</a>
			</div>
			<div class="col-sm-9 right-part">
				<div class="row">
					<h2>All Space</h2>
					<button class="btn btn-default" data-toggle="modal"
						data-target="#addbuilding">Add a Space</button>
				</div>
				<div class="row">

					<table class="table table-bordered table-striped table-hover">
						<thead>
							<tr>
								<th>Space Name</th>
								<th>Floor Name</th>
								<th>Building Name</th>
								<th>Enterprise Name</th>
								<th>City Name</th>
								<th>Space Status</th>
							</tr>
						</thead>
						<%-- <c:forEach var="i" begin="0" end="${sessionScope.spacelistsize}"
							step="1">

							<tr>
								<td><c:out value="${sessionScope.spacelist[i]}"></c:out></td>
							</tr>
						</c:forEach> --%>
						<c:forEach var="space" items="${sessionScope.spacelist}">
							<tr>
								<td>${space.spacename}</td>
								<td>${space.floorname}</td>
								<td>${space.floorname.buildingname}</td>
								<td>${space.floorname.buildingname.enterprisename}</td>
								<td>${space.floorname.buildingname.enterprisename.cityname}</td>
								<td>${space.canReserve}</td>
							</tr>
						</c:forEach>
					</table>
				</div>
			</div>
		</div>
		<!--end container-->
		<div class="row foot-part"></div>
		<!--			end foot-part-->
	</div>
	<!--end wrapper-->

	<div class="modal fade" tabindex="-1" role="dialog" id="addbuilding">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h3 class="modal-title">Add a space</h3>
				</div>
				<div class="modal-body">

					<form action="addspace.htm" method="post" id="addspaceform">
						<div class="form-group">

							<select class="form-control" name="floorselect" id="floorselect">
								<c:forEach var="floor" items="${sessionScope.floorlist}">
									<option value="${floor.floorname}">${floor.buildingname.enterprisename.cityname}
										> ${floor.buildingname.enterprisename} > ${floor.buildingname}
										> ${floor.floorname}</option>
								</c:forEach>
							</select>
							<div class="form-group">
								<label for="name">Space Name</label> <input type="text"
									name="spacename" id="spacename-text" class="form-control"
									required />
							</div>
							<div class="radio">
								<label> <input type="radio" name="canReserve"
									id="optionsRadios1" value="1" checked> This space can be reserved.
								</label>
							</div>
							<div class="radio">
								<label> <input type="radio" name="canReserve"
									 value="0" > This space can not be reserved.
								</label>
							</div>
							<div class="errormsg">This space has been added</div>
							<button type="submit" id="addspacebtn" class="btn btn-default">Add</button>
						</div>
					</form>
					<button id="add-success-btn" type="button"
						class="btn btn-md btn-green" data-dismiss="modal"
						data-toggle="modal" data-target="#add-success"></button>
				</div>
			</div>
			<!-- /.modal-content -->
		</div>
		<!-- /.modal-dialog -->
	</div>

	<div class="modal fade" tabindex="-1" role="dialog" id="add-success">
		<div class="modal-dialog">
			<div class="modal-content action-success">


				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h3 class="modal-title">Create Space Succefully!</h3>
				</div>

				<div class="modal-footer">
					<button type="button" class="btn btn-md btn-default"
						data-dismiss="modal">Close</button>
				</div>
			</div>
			<!-- /.modal-content -->
		</div>
		<!-- /.modal-dialog -->
	</div>
	<!-- /.modal -->

	<script src="resources/js/user-home.js"></script>
	<script src="resources/js/sysadmin.js"></script>
</body>

</html>