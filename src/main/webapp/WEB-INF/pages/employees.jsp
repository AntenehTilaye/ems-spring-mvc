<%-- 
    Document   : employees
    Created on : May 14, 2023, 10:40:00 AM
    Author     : ABlackY
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
            <div class="table-responsive">
                <div class="table-wrapper">
                    <div class="table-title">
                        <div class="row">
                            <div class="col-sm-6">
                                <h2>Manage <b>Employees</b></h2>
                            </div>
                            <div class="col-sm-6">
                                <a href="../add" class="btn btn-success"><i class="material-icons">&#xE147;</i> <span>Add New Employee</span></a>
                            </div>
                        </div>
                    </div>
                    <table class="table table-striped table-hover">
                        <thead>
                            <tr>
                                <th>
                                    <span class="custom-checkbox">
                                        <input type="checkbox" id="selectAll">
                                        <label for="selectAll"></label>
                                    </span>
                                </th>
                                <th>Name</th>
                                <th>Position</th>
                                <th>salary</th>
                                <th>Actions</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="employee" items="${employees}">
                                <tr>
                                    <td>
                                        <span class="custom-checkbox">
                                            <input type="checkbox" id="checkbox1" name="options[]" value="1">
                                            <label for="checkbox1"></label>
                                        </span>
                                    </td>
                                    <td><c:out value="${employee.name}" /></td>
                                    <td><c:out value="${employee.position}" /></td>
                                    <td><c:out value="${employee.salary}" /></td>
                                    <td>
                                        <a href="../edit/<c:out value="${employee.id}" />" class="edit" ><i class="material-icons" data-toggle="tooltip" title="Edit">&#xE254;</i></a>
                                        <a href="../confirm_remove/<c:out value="${employee.id}" />" class="delete"><i class="material-icons" data-toggle="tooltip" title="Delete">&#xE872;</i></a>

                                        <!--                                        <a href="#editEmployeeModal" class="edit" data-toggle="modal"><i class="material-icons" data-toggle="tooltip" title="Edit">&#xE254;</i></a>
                                                                                <a href="#deleteEmployeeModal" class="delete" data-toggle="modal"><i class="material-icons" data-toggle="tooltip" title="Delete">&#xE872;</i></a>-->
                                    </td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                    <div class="clearfix">
                        <div class="hint-text">Showing <b><c:out value="${showing}" /></b> out of <b><c:out value="${total}" /></b> entries</div>
                        <ul class="pagination">
                            <c:forEach begin="1" end="${numOfPages}" varStatus="pageN">
                                <li class="page-item <c:out value="${pageN.index eq pageId ? 'active': ''}"/>">
                                    <a href="<c:out value="${pageN.index}" />" class="page-link">
                                        <c:out value="${pageN.index}" />
                                    </a>
                                </li>
                            </c:forEach>
                            <!--                            <li class="page-item disabled"><a href="#">Previous</a></li>
                                                        <li class="page-item"><a href="#" class="page-link">1</a></li>
                                                        <li class="page-item"><a href="#" class="page-link">2</a></li>
                                                        <li class="page-item active"><a href="#" class="page-link">3</a></li>
                                                        <li class="page-item"><a href="#" class="page-link">4</a></li>
                                                        <li class="page-item"><a href="#" class="page-link">5</a></li>
                                                        <li class="page-item"><a href="#" class="page-link">Next</a></li>-->
                        </ul>
                    </div>
                </div>
            </div>        
        </div>
        <!-- Edit Modal HTML -->
        <div id="editEmployeeModal" class="modal fade">
            <div class="modal-dialog">
                <div class="modal-content">
                    <form>
                        <div class="modal-header">						
                            <h4 class="modal-title">Edit Employee</h4>
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        </div>
                        <div class="modal-body">					
                            <div class="form-group">
                                <label>Name</label>
                                <input type="text" class="form-control" required>
                            </div>
                            <div class="form-group">
                                <label>Email</label>
                                <input type="email" class="form-control" required>
                            </div>
                            <div class="form-group">
                                <label>Address</label>
                                <textarea class="form-control" required></textarea>
                            </div>
                            <div class="form-group">
                                <label>Phone</label>
                                <input type="text" class="form-control" required>
                            </div>					
                        </div>
                        <div class="modal-footer">
                            <input type="button" class="btn btn-default" data-dismiss="modal" value="Cancel">
                            <input type="submit" class="btn btn-info" value="Save">
                        </div>
                    </form>
                </div>
            </div>
        </div>
        <!-- Delete Modal HTML -->

    </body>
</html>