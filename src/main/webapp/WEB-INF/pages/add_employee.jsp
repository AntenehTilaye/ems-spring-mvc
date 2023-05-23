<%-- 
    Document   : add_employee
    Created on : May 14, 2023, 10:40:00 AM
    Author     : ABlackY
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <title>Employee Management System</title>
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
        <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
        <link rel="stylesheet" href="<c:url value="/resources/styles/main.js" />"/>
        <script src="<c:url value="/resources/javascript/main.js" />"></script>
    </head>
    <body>
        <div class="container-xl mt-5">
            <div class="modal-dialog">
                <div class="modal-content">
                    <form:form action="save" modelAttribute="employee">
                        <div class="modal-header">						
                            <h4 class="modal-title">Add Employee</h4>
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        </div>
                        <div class="modal-body">					
                            <div class="form-group">
                                <label>Name</label>
                                <form:input path="name" cssClass="form-control" />
                                <!--<input type="text" class="form-control" required>-->
                            </div>
                            <div class="form-group">
                                <label>Position</label>
                                <form:input path="position" cssClass="form-control" />
                                <!--<input type="email" class="form-control" required>-->
                            </div>
                            <div class="form-group">
                                <label>Salary</label>
                                <form:input path="salary" cssClass="form-control" />
                                <!--<textarea class="form-control" required></textarea>-->
                            </div>					
                        </div>
                        <div class="modal-footer">
                            <a href="employees" type="button" class="btn btn-default" >Cancel</a>
                            <input type="submit" class="btn btn-success" value="Add">
                        </div>
                    </form:form>
                </div>
            </div>
        </div>
    </body>
</html>