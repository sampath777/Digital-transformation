<%@include file="/includes/Head.jsp"%>

<nav class="navbar navbar-inverse">
	<div class="container-fluid">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle" data-toggle="collapse"
				data-target="#myNavbar">
				<span class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
			</button>
			<a class="navbar-brand" href="#">Logo</a>
		</div>
		<div class="collapse navbar-collapse" id="myNavbar">
			<ul class="nav navbar-nav">
				<li><a href="">Home</a></li>
				<li><a href="products">Products</a></li>
				<li class="active"><a href="categories">categories</a></li>
				<li><a href="suppliers">suppliers</a></li>
				<li><a href="Contact">Contact</a></li>
			</ul>
			<ul class="nav navbar-nav navbar-right">
				<li><a href="<c:url value="j_spring_security_logout" />"><span
						class="glyphicon glyphicon-log-out"></span> LOGOUT</a></li>
			</ul>

		</div>
	</div>
</nav>

<h1 align="center">Add a Category</h1>

<c:url var="addAction" value="/category/add"></c:url>

<form:form action="${addAction}" commandName="category">
	<table align="center" class="table table-striped table-hover">
		<tr>
			<td align="center"><form:label path="id">
					<spring:message text="ID" />
				</form:label></td>
			<c:choose>
				<c:when test="${!empty category.id}">
					<td ><form:input path="id" disabled="true" readonly="true" class="form-control" />
					</td>
				</c:when>

				<c:otherwise>
					<td ><form:input path="id" pattern=".{6,7}" required="true" class="form-control"
							title="id should contains 6 to 7 characters" /></td>
				</c:otherwise>
			</c:choose>
		<tr>
			<form:input path="id" hidden="true" />
			<td align="center"><form:label path="name">
					<spring:message text="Name" />
				</form:label></td>
			<td><form:input path="name" required="true" class="form-control" /></td>
		</tr>
		<tr>
			<td align="center"><form:label path="description">
					<spring:message text="Description" />
				</form:label></td>
			<td><form:input path="description" class="form-control" required="true" /></td>
		</tr>
		<tr>
			<td colspan="2" align="center"><c:if test="${!empty category.name}">
					<input type="submit" class="btn btn-primary" value="<spring:message text="Edit Category"/>" />
				</c:if> <c:if test="${empty category.name}">
					<input type="submit" class="btn btn-primary" value="<spring:message text="Add Category"/>" />
				</c:if></td>
		</tr>
	</table>
</form:form>
<br>
<h3 align="center">Category List</h3>
<c:if test="${!empty categoryList}">
	<table  align="center" class="table table-striped table-hover">
		<tr class="bg-success">
			<th width="80">Category ID</th>
			<th width="120">Category Name</th>
			<th width="120">Category Description</th>
			<th width="60">Edit</th>
			<th width="60">Delete</th>
		</tr>
		<c:forEach items="${categoryList}" var="category">
			<tr>
				<td>${category.id}</td>
				<td>${category.name}</td>
				<td>${category.description}</td>
				<td><a href="<c:url value='category/edit/${category.id}' />">Edit</a></td>
				<td><a href="<c:url value='category/remove/${category.id}' />">Delete</a></td>
			</tr>
		</c:forEach>
	</table>
</c:if>
<%@include file="/includes/Fotter.jsp"%>
