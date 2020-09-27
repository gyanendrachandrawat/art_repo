<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%><html>
<title>Connect</title>
<body>
	<form:form action="/dashboard/connect" modelAttribute="connectModel"
		method="post">
		<div class="form-group">
			<form:input class="form-control user" id="name" path="name"
				placeholder="User Name" />
		</div>

		<div class="form-group">
			<form:input class="form-control user" id="mobile" path="mobile"
				placeholder="123-456-7890" />
		</div>

		<div class="form-group">
			<button type="submit" id="sendBtn" class="btn btn-dark">Send</button>
		</div>

	</form:form>
</body>

</html>