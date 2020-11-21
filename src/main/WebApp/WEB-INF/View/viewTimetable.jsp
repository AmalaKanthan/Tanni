<!DOCTYPE html >
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<head>
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <title>View Timetable</title>
    <meta content='width=device-width, initial-scale=1.0, shrink-to-fit=no' name='viewport' />
    <link rel="icon" href="../assets/img/icon.ico" type="image/x-icon"/>

    <!-- Fonts and icons -->
    <script src="../assets/js/plugin/webfont/webfont.min.js"></script>
    <script>
        WebFont.load({
            google: {"families":["Lato:300,400,700,900"]},
            custom: {"families":["Flaticon", "Font Awesome 5 Solid", "Font Awesome 5 Regular", "Font Awesome 5 Brands", "simple-line-icons"], urls: ['../assets/css/fonts.min.css']},
            active: function() {
                sessionStorage.fonts = true;
            }
        });
    </script>

    <!-- CSS Files -->
    <link rel="stylesheet" href="../assets/css/bootstrap.min.css">
    <link rel="stylesheet" href="../assets/css/atlantis.min.css">

    <!-- CSS Just for demo purpose, don't include it in your project -->
    <link rel="stylesheet" href="../assets/css/demo.css">
</head>
<body>

<div class="wrapper">
    <jsp:include page="Standard Themes/TopAndSidePanel.jsp" />
    <!-- End Sidebar -->

    <div class="main-panel">
        <div class="content">
            <div class="panel-header bg-primary-gradient">
                <div class="page-inner py-5">
                    <div class="d-flex align-items-left align-items-md-center flex-column flex-md-row">
                        <div>
                            <h2 class="text-white pb-2 fw-bold">Timetables</h2>
                            <h5 class="text-white op-7 mb-2">Please select the required filters</h5>
                        </div>
                        <form:form modelAttribute="timetableSession" method="post" action="/view-timetable">

                            <div class="ml-md-auto py-2 py-md-0">
                                <div class="form-group">
                                    <h5 class="text-white op-7 mb-2">Select Filter</h5>
                                    <form:select path="day" onchange="yesnoCheck(this)" class="form-control form-control-lg" id="largeSelect">
                                        <form:option value=""></form:option>
                                        <form:option value="Batch">Batch</form:option>
                                        <form:option value="Lecturer">Lecturer</form:option>
                                        <form:option value="Subject">Subject</form:option>
                                        <form:option value="Classroom">Classroom</form:option>
                                    </form:select>
                                </div>

                                <div id="batchYes" style="display: none;">
                                    <div class="form-group">
                                        <h5 class="text-white op-7 mb-2">Select Batch</h5>
                                        <form:select onchange="MySelectFunction();" path="batchNumber" class="form-control form-control-lg" id="largeSelect1">
                                            <form:option value="Batchname"></form:option>
                                            <c:forEach var="batch" items="${batches }">
                                                <form:option value="${batch.getBatchName()}">${batch.getBatchName()}</form:option>
                                            </c:forEach>
                                        </form:select>
                                    </div>
                                </div>

                                <div id="lecturerYes" style="display: none;">
                                    <div class="form-group">
                                        <h5 class="text-white op-7 mb-2">Select Lecturer</h5>
                                        <form:select path="lecturer" onchange="MySelectFunction();" class="form-control form-control-lg" id="largeSelect2">
                                            <option value="Batchname"></option>
                                            <c:forEach var="lecturer" items="${lecturers }">
                                                <form:option value="${lecturer.getEmail()}">${lecturer.getEmail()}</form:option>
                                            </c:forEach>
                                        </form:select>
                                    </div>
                                </div>

                                <div id="subjectYes" style="display: none;">
                                    <div class="form-group">
                                        <h5 class="text-white op-7 mb-2">Select Subject</h5>
                                        <form:select path="subject" onchange="MySelectFunction();" class="form-control form-control-lg" id="largeSelect3">
                                            <option value="Batchname"></option>
                                            <c:forEach var="subject" items="${subjects }">
                                                <form:option value="${subject.getSubjectname()}">${subject.getSubjectname()}</form:option>
                                            </c:forEach>
                                        </form:select>
                                    </div>
                                </div>

                                <div id="classroomYes" style="display: none;">
                                    <div class="form-group">
                                        <h5 class="text-white op-7 mb-2">Select Classroom</h5>
                                        <form:select path="classroom" onchange="MySelectFunction();" class="form-control form-control-lg" id="largeSelect4">
                                            <option value="Batchname"></option>
                                            <c:forEach var="classroom" items="${classrooms }">
                                                <form:option value="${classroom.getClassroomName()}">${classroom.getClassroomName()}</form:option>
                                            </c:forEach>
                                        </form:select>
                                    </div>
                                </div>
                                <div style="display: none">
                                    <form:button id="viewButton"></form:button>
                                </div>

                            </div>
                        </form:form>

                    </div>
                </div>
            </div>
            <div class="page-inner mt--5">
                <div class="card">
                    <div class="card-body">
                        <div class="table-responsive">
                            <table class="table table-bordered">
                                <thead>
                                <tr>
                                    <th>Time</th>
                                    <th>Monday</th>
                                    <th>Tuesday</th>
                                    <th>Wednesday</th>
                                    <th>Thursday</th>
                                    <th>Friday</th>
                                </tr>
                                <%--                        8.30-9.30 --%>
                                <tr>
                                    <td><b>08:30 AM - 09.30 AM</b></td>

                                    <c:set var="availability" value="false"/>
                                    <c:forEach var="session" items="${subjectSessions}" varStatus="loop">
                                        <c:choose>
                                            <c:when test="${session.day=='Monday' && session.time == '08:30 AM - 09.30 AM'}">
                                                <td>Subject: ${session.subject}<br>Lecturer: ${session.lecturer}<br>Venue: ${session.classroom}<br>Batch: ${session.batchNumber}</td>
                                                <c:set var="availability" value="true"/>
                                            </c:when>
                                            <c:when test="${not availability && loop.last}">
                                                <td>-</td>
                                            </c:when>
                                        </c:choose>
                                    </c:forEach>

                                    <c:set var="availability" value="false"/>
                                    <c:forEach var="session" items="${subjectSessions}" varStatus="loop">
                                        <c:choose>
                                            <c:when test="${session.day=='Tuesday' && session.time == '08:30 AM - 09.30 AM'}">
                                                <td>Subject: ${session.subject}<br>Lecturer: ${session.lecturer}<br>Venue: ${session.classroom}<br>Batch: ${session.batchNumber}</td>
                                                <c:set var="availability" value="true"/>
                                            </c:when>
                                            <c:when test="${not availability && loop.last}">
                                                <td>-</td>
                                            </c:when>
                                        </c:choose>
                                    </c:forEach>

                                    <c:set var="availability" value="false"/>
                                    <c:forEach var="session" items="${subjectSessions}" varStatus="loop">
                                        <c:choose>
                                            <c:when test="${session.day=='Wednesday' && session.time == '08:30 AM - 09.30 AM'}">
                                                <td>Subject: ${session.subject}<br>Lecturer: ${session.lecturer}<br>Venue: ${session.classroom}<br>Batch: ${session.batchNumber}</td>
                                                <c:set var="availability" value="true"/>
                                            </c:when>
                                            <c:when test="${not availability && loop.last}">
                                                <td>-</td>
                                            </c:when>
                                        </c:choose>
                                    </c:forEach>

                                    <c:set var="availability" value="false"/>
                                    <c:forEach var="session" items="${subjectSessions}" varStatus="loop">
                                        <c:choose>
                                            <c:when test="${session.day=='Thursday' && session.time == '08:30 AM - 09.30 AM'}">
                                                <td>Subject: ${session.subject}<br>Lecturer: ${session.lecturer}<br>Venue: ${session.classroom}<br>Batch: ${session.batchNumber}</td>
                                                <c:set var="availability" value="true"/>
                                            </c:when>
                                            <c:when test="${not availability && loop.last}">
                                                <td>-</td>
                                            </c:when>
                                        </c:choose>
                                    </c:forEach>

                                    <c:set var="availability" value="false"/>
                                    <c:forEach var="session" items="${subjectSessions}" varStatus="loop">
                                        <c:choose>
                                            <c:when test="${session.day=='Friday' && session.time == '08:30 AM - 09.30 AM'}">
                                                <td>Subject: ${session.subject}<br>Lecturer: ${session.lecturer}<br>Venue: ${session.classroom}<br>Batch: ${session.batchNumber}</td>
                                                <c:set var="availability" value="true"/>
                                            </c:when>
                                            <c:when test="${not availability && loop.last}">
                                                <td>-</td>
                                            </c:when>
                                        </c:choose>
                                    </c:forEach>

                                </tr>
                                <%--                        9.30-10.30 --%>
                                <tr>
                                    <td><b>09:30 AM - 10.30 AM</b></td>

                                    <c:set var="availability" value="false"/>
                                    <c:forEach var="session" items="${subjectSessions}" varStatus="loop">
                                        <c:choose>
                                            <c:when test="${session.day=='Monday' && session.time == '09:30 AM - 10.30 AM'}">
                                                <td>Subject: ${session.subject}<br>Lecturer: ${session.lecturer}<br>Venue: ${session.classroom}<br>Batch: ${session.batchNumber}</td>
                                                <c:set var="availability" value="true"/>
                                            </c:when>
                                            <c:when test="${not availability && loop.last}">
                                                <td>-</td>
                                            </c:when>
                                        </c:choose>
                                    </c:forEach>

                                    <c:set var="availability" value="false"/>
                                    <c:forEach var="session" items="${subjectSessions}" varStatus="loop">
                                        <c:choose>
                                            <c:when test="${session.day=='Tuesday' && session.time == '09:30 AM - 10.30 AM'}">
                                                <td>Subject: ${session.subject}<br>Lecturer: ${session.lecturer}<br>Venue: ${session.classroom}<br>Batch: ${session.batchNumber}</td>
                                                <c:set var="availability" value="true"/>
                                            </c:when>
                                            <c:when test="${not availability && loop.last}">
                                                <td>-</td>
                                            </c:when>
                                        </c:choose>
                                    </c:forEach>

                                    <c:set var="availability" value="false"/>
                                    <c:forEach var="session" items="${subjectSessions}" varStatus="loop">
                                        <c:choose>
                                            <c:when test="${session.day=='Wednesday' && session.time == '09:30 AM - 10.30 AM'}">
                                                <td>Subject: ${session.subject}<br>Lecturer: ${session.lecturer}<br>Venue: ${session.classroom}<br>Batch: ${session.batchNumber}</td>
                                                <c:set var="availability" value="true"/>
                                            </c:when>
                                            <c:when test="${not availability && loop.last}">
                                                <td>-</td>
                                            </c:when>
                                        </c:choose>
                                    </c:forEach>

                                    <c:set var="availability" value="false"/>
                                    <c:forEach var="session" items="${subjectSessions}" varStatus="loop">
                                        <c:choose>
                                            <c:when test="${session.day=='Thursday' && session.time == '09:30 AM - 10.30 AM'}">
                                                <td>Subject: ${session.subject}<br>Lecturer: ${session.lecturer}<br>Venue: ${session.classroom}<br>Batch: ${session.batchNumber}</td>
                                                <c:set var="availability" value="true"/>
                                            </c:when>
                                            <c:when test="${not availability && loop.last}">
                                                <td>-</td>
                                            </c:when>
                                        </c:choose>
                                    </c:forEach>

                                    <c:set var="availability" value="false"/>
                                    <c:forEach var="session" items="${subjectSessions}" varStatus="loop">
                                        <c:choose>
                                            <c:when test="${session.day=='Friday' && session.time == '09:30 AM - 10.30 AM'}">
                                                <td>Subject: ${session.subject}<br>Lecturer: ${session.lecturer}<br>Venue: ${session.classroom}<br>Batch: ${session.batchNumber}</td>
                                                <c:set var="availability" value="true"/>
                                            </c:when>
                                            <c:when test="${not availability && loop.last}">
                                                <td>-</td>
                                            </c:when>
                                        </c:choose>
                                    </c:forEach>
                                </tr>
                                <%--                        10.30-11.30 --%>
                                <tr>
                                    <td><b>10:30 AM - 11.30 AM</b></td>

                                    <c:set var="availability" value="false"/>
                                    <c:forEach var="session" items="${subjectSessions}" varStatus="loop">
                                        <c:choose>
                                            <c:when test="${session.day=='Monday' && session.time == '10:30 AM - 11.30 AM'}">
                                                <td>Subject: ${session.subject}<br>Lecturer: ${session.lecturer}<br>Venue: ${session.classroom}<br>Batch: ${session.batchNumber}</td>
                                                <c:set var="availability" value="true"/>
                                            </c:when>
                                            <c:when test="${not availability && loop.last}">
                                                <td>-</td>
                                            </c:when>
                                        </c:choose>
                                    </c:forEach>

                                    <c:set var="availability" value="false"/>
                                    <c:forEach var="session" items="${subjectSessions}" varStatus="loop">
                                        <c:choose>
                                            <c:when test="${session.day=='Tuesday' && session.time == '10:30 AM - 11.30 AM'}">
                                                <td>Subject: ${session.subject}<br>Lecturer: ${session.lecturer}<br>Venue: ${session.classroom}<br>Batch: ${session.batchNumber}</td>
                                                <c:set var="availability" value="true"/>
                                            </c:when>
                                            <c:when test="${not availability && loop.last}">
                                                <td>-</td>
                                            </c:when>
                                        </c:choose>
                                    </c:forEach>

                                    <c:set var="availability" value="false"/>
                                    <c:forEach var="session" items="${subjectSessions}" varStatus="loop">
                                        <c:choose>
                                            <c:when test="${session.day=='Wednesday' && session.time == '10:30 AM - 11.30 AM'}">
                                                <td>Subject: ${session.subject}<br>Lecturer: ${session.lecturer}<br>Venue: ${session.classroom}<br>Batch: ${session.batchNumber}</td>
                                                <c:set var="availability" value="true"/>
                                            </c:when>
                                            <c:when test="${not availability && loop.last}">
                                                <td>-</td>
                                            </c:when>
                                        </c:choose>
                                    </c:forEach>

                                    <c:set var="availability" value="false"/>
                                    <c:forEach var="session" items="${subjectSessions}" varStatus="loop">
                                        <c:choose>
                                            <c:when test="${session.day=='Thursday' && session.time == '10:30 AM - 11.30 AM'}">
                                                <td>Subject: ${session.subject}<br>Lecturer: ${session.lecturer}<br>Venue: ${session.classroom}<br>Batch: ${session.batchNumber}</td>
                                                <c:set var="availability" value="true"/>
                                            </c:when>
                                            <c:when test="${not availability && loop.last}">
                                                <td>-</td>
                                            </c:when>
                                        </c:choose>
                                    </c:forEach>

                                    <c:set var="availability" value="false"/>
                                    <c:forEach var="session" items="${subjectSessions}" varStatus="loop">
                                        <c:choose>
                                            <c:when test="${session.day=='Friday' && session.time == '10:30 AM - 11.30 AM'}">
                                                <td>Subject: ${session.subject}<br>Lecturer: ${session.lecturer}<br>Venue: ${session.classroom}<br>Batch: ${session.batchNumber}</td>
                                                <c:set var="availability" value="true"/>
                                            </c:when>
                                            <c:when test="${not availability && loop.last}">
                                                <td>-</td>
                                            </c:when>
                                        </c:choose>
                                    </c:forEach>
                                </tr>
                                <%--                        11.30-12.30 --%>
                                <tr>
                                    <td><b>11:30 AM - 12.30 PM</b></td>

                                    <c:set var="availability" value="false"/>
                                    <c:forEach var="session" items="${subjectSessions}" varStatus="loop">
                                        <c:choose>
                                            <c:when test="${session.day=='Monday' && session.time == '11:30 AM - 12.30 PM'}">
                                                <td>Subject: ${session.subject}<br>Lecturer: ${session.lecturer}<br>Venue: ${session.classroom}<br>Batch: ${session.batchNumber}</td>
                                                <c:set var="availability" value="true"/>
                                            </c:when>
                                            <c:when test="${not availability && loop.last}">
                                                <td>-</td>
                                            </c:when>
                                        </c:choose>
                                    </c:forEach>

                                    <c:set var="availability" value="false"/>
                                    <c:forEach var="session" items="${subjectSessions}" varStatus="loop">
                                        <c:choose>
                                            <c:when test="${session.day=='Tuesday' && session.time == '11:30 AM - 12.30 PM'}">
                                                <td>Subject: ${session.subject}<br>Lecturer: ${session.lecturer}<br>Venue: ${session.classroom}<br>Batch: ${session.batchNumber}</td>
                                                <c:set var="availability" value="true"/>
                                            </c:when>
                                            <c:when test="${not availability && loop.last}">
                                                <td>-</td>
                                            </c:when>
                                        </c:choose>
                                    </c:forEach>

                                    <c:set var="availability" value="false"/>
                                    <c:forEach var="session" items="${subjectSessions}" varStatus="loop">
                                        <c:choose>
                                            <c:when test="${session.day=='Wednesday' && session.time == '11:30 AM - 12.30 PM'}">
                                                <td>Subject: ${session.subject}<br>Lecturer: ${session.lecturer}<br>Venue: ${session.classroom}<br>Batch: ${session.batchNumber}</td>
                                                <c:set var="availability" value="true"/>
                                            </c:when>
                                            <c:when test="${not availability && loop.last}">
                                                <td>-</td>
                                            </c:when>
                                        </c:choose>
                                    </c:forEach>

                                    <c:set var="availability" value="false"/>
                                    <c:forEach var="session" items="${subjectSessions}" varStatus="loop">
                                        <c:choose>
                                            <c:when test="${session.day=='Thursday' && session.time == '11:30 AM - 12.30 PM'}">
                                                <td>Subject: ${session.subject}<br>Lecturer: ${session.lecturer}<br>Venue: ${session.classroom}<br>Batch: ${session.batchNumber}</td>
                                                <c:set var="availability" value="true"/>
                                            </c:when>
                                            <c:when test="${not availability && loop.last}">
                                                <td>-</td>
                                            </c:when>
                                        </c:choose>
                                    </c:forEach>

                                    <c:set var="availability" value="false"/>
                                    <c:forEach var="session" items="${subjectSessions}" varStatus="loop">
                                        <c:choose>
                                            <c:when test="${session.day=='Friday' && session.time == '11:30 AM - 12.30 PM'}">
                                                <td>Subject: ${session.subject}<br>Lecturer: ${session.lecturer}<br>Venue: ${session.classroom}<br>Batch: ${session.batchNumber}</td>
                                                <c:set var="availability" value="true"/>
                                            </c:when>
                                            <c:when test="${not availability && loop.last}">
                                                <td>-</td>
                                            </c:when>
                                        </c:choose>
                                    </c:forEach>
                                </tr>
                                <%--                        12.30-1.30 --%>
                                <tr>
                                    <td><b>12:30 PM - 01.30 PM</b></td>

                                    <c:set var="availability" value="false"/>
                                    <c:forEach var="session" items="${subjectSessions}" varStatus="loop">
                                        <c:choose>
                                            <c:when test="${session.day=='Monday' && session.time == '12:30 PM - 01.30 PM'}">
                                                <td>Subject: ${session.subject}<br>Lecturer: ${session.lecturer}<br>Venue: ${session.classroom}<br>Batch: ${session.batchNumber}</td>
                                                <c:set var="availability" value="true"/>
                                            </c:when>
                                            <c:when test="${not availability && loop.last}">
                                                <td>-</td>
                                            </c:when>
                                        </c:choose>
                                    </c:forEach>

                                    <c:set var="availability" value="false"/>
                                    <c:forEach var="session" items="${subjectSessions}" varStatus="loop">
                                        <c:choose>
                                            <c:when test="${session.day=='Tuesday' && session.time == '12:30 PM - 01.30 PM'}">
                                                <td>Subject: ${session.subject}<br>Lecturer: ${session.lecturer}<br>Venue: ${session.classroom}<br>Batch: ${session.batchNumber}</td>
                                                <c:set var="availability" value="true"/>
                                            </c:when>
                                            <c:when test="${not availability && loop.last}">
                                                <td>-</td>
                                            </c:when>
                                        </c:choose>
                                    </c:forEach>

                                    <c:set var="availability" value="false"/>
                                    <c:forEach var="session" items="${subjectSessions}" varStatus="loop">
                                        <c:choose>
                                            <c:when test="${session.day=='Wednesday' && session.time == '12:30 PM - 01.30 PM'}">
                                                <td>Subject: ${session.subject}<br>Lecturer: ${session.lecturer}<br>Venue: ${session.classroom}<br>Batch: ${session.batchNumber}</td>
                                                <c:set var="availability" value="true"/>
                                            </c:when>
                                            <c:when test="${not availability && loop.last}">
                                                <td>-</td>
                                            </c:when>
                                        </c:choose>
                                    </c:forEach>

                                    <c:set var="availability" value="false"/>
                                    <c:forEach var="session" items="${subjectSessions}" varStatus="loop">
                                        <c:choose>
                                            <c:when test="${session.day=='Thursday' && session.time == '12:30 PM - 01.30 PM'}">
                                                <td>Subject: ${session.subject}<br>Lecturer: ${session.lecturer}<br>Venue: ${session.classroom}<br>Batch: ${session.batchNumber}</td>
                                                <c:set var="availability" value="true"/>
                                            </c:when>
                                            <c:when test="${not availability && loop.last}">
                                                <td>-</td>
                                            </c:when>
                                        </c:choose>
                                    </c:forEach>

                                    <c:set var="availability" value="false"/>
                                    <c:forEach var="session" items="${subjectSessions}" varStatus="loop">
                                        <c:choose>
                                            <c:when test="${session.day=='Friday' && session.time == '12:30 PM - 01.30 PM'}">
                                                <td>Subject: ${session.subject}<br>Lecturer: ${session.lecturer}<br>Venue: ${session.classroom}<br>Batch: ${session.batchNumber}</td>
                                                <c:set var="availability" value="true"/>
                                            </c:when>
                                            <c:when test="${not availability && loop.last}">
                                                <td>-</td>
                                            </c:when>
                                        </c:choose>
                                    </c:forEach>
                                </tr>
                                <%--                        1.30-2.30 --%>
                                <tr>
                                    <td><b>01:30 PM - 02.30 PM</b></td>

                                    <c:set var="availability" value="false"/>
                                    <c:forEach var="session" items="${subjectSessions}" varStatus="loop">
                                        <c:choose>
                                            <c:when test="${session.day=='Monday' && session.time == '01:30 PM - 02.30 PM'}">
                                                <td>Subject: ${session.subject}<br>Lecturer: ${session.lecturer}<br>Venue: ${session.classroom}<br>Batch: ${session.batchNumber}</td>
                                                <c:set var="availability" value="true"/>
                                            </c:when>
                                            <c:when test="${not availability && loop.last}">
                                                <td>-</td>
                                            </c:when>
                                        </c:choose>
                                    </c:forEach>

                                    <c:set var="availability" value="false"/>
                                    <c:forEach var="session" items="${subjectSessions}" varStatus="loop">
                                        <c:choose>
                                            <c:when test="${session.day=='Tuesday' && session.time == '01:30 PM - 02.30 PM'}">
                                                <td>Subject: ${session.subject}<br>Lecturer: ${session.lecturer}<br>Venue: ${session.classroom}<br>Batch: ${session.batchNumber}</td>
                                                <c:set var="availability" value="true"/>
                                            </c:when>
                                            <c:when test="${not availability && loop.last}">
                                                <td>-</td>
                                            </c:when>
                                        </c:choose>
                                    </c:forEach>

                                    <c:set var="availability" value="false"/>
                                    <c:forEach var="session" items="${subjectSessions}" varStatus="loop">
                                        <c:choose>
                                            <c:when test="${session.day=='Wednesday' && session.time == '01:30 PM - 02.30 PM'}">
                                                <td>Subject: ${session.subject}<br>Lecturer: ${session.lecturer}<br>Venue: ${session.classroom}<br>Batch: ${session.batchNumber}</td>
                                                <c:set var="availability" value="true"/>
                                            </c:when>
                                            <c:when test="${not availability && loop.last}">
                                                <td>-</td>
                                            </c:when>
                                        </c:choose>
                                    </c:forEach>

                                    <c:set var="availability" value="false"/>
                                    <c:forEach var="session" items="${subjectSessions}" varStatus="loop">
                                        <c:choose>
                                            <c:when test="${session.day=='Thursday' && session.time == '01:30 PM - 02.30 PM'}">
                                                <td>Subject: ${session.subject}<br>Lecturer: ${session.lecturer}<br>Venue: ${session.classroom}<br>Batch: ${session.batchNumber}</td>
                                                <c:set var="availability" value="true"/>
                                            </c:when>
                                            <c:when test="${not availability && loop.last}">
                                                <td>-</td>
                                            </c:when>
                                        </c:choose>
                                    </c:forEach>

                                    <c:set var="availability" value="false"/>
                                    <c:forEach var="session" items="${subjectSessions}" varStatus="loop">
                                        <c:choose>
                                            <c:when test="${session.day=='Friday' && session.time == '01:30 PM - 02.30 PM'}">
                                                <td>Subject: ${session.subject}<br>Lecturer: ${session.lecturer}<br>Venue: ${session.classroom}<br>Batch: ${session.batchNumber}</td>
                                                <c:set var="availability" value="true"/>
                                            </c:when>
                                            <c:when test="${not availability && loop.last}">
                                                <td>-</td>
                                            </c:when>
                                        </c:choose>
                                    </c:forEach>
                                </tr>
                                <%--                        2.30-3.30 --%>
                                <tr>
                                    <td><b>02:30 PM - 03.30 PM</b></td>

                                    <c:set var="availability" value="false"/>
                                    <c:forEach var="session" items="${subjectSessions}" varStatus="loop">
                                        <c:choose>
                                            <c:when test="${session.day=='Monday' && session.time == '02:30 PM - 03.30 PM'}">
                                                <td>Subject: ${session.subject}<br>Lecturer: ${session.lecturer}<br>Venue: ${session.classroom}<br>Batch: ${session.batchNumber}</td>
                                                <c:set var="availability" value="true"/>
                                            </c:when>
                                            <c:when test="${not availability && loop.last}">
                                                <td>-</td>
                                            </c:when>
                                        </c:choose>
                                    </c:forEach>

                                    <c:set var="availability" value="false"/>
                                    <c:forEach var="session" items="${subjectSessions}" varStatus="loop">
                                        <c:choose>
                                            <c:when test="${session.day=='Tuesday' && session.time == '02:30 PM - 03.30 PM'}">
                                                <td>Subject: ${session.subject}<br>Lecturer: ${session.lecturer}<br>Venue: ${session.classroom}<br>Batch: ${session.batchNumber}</td>
                                                <c:set var="availability" value="true"/>
                                            </c:when>
                                            <c:when test="${not availability && loop.last}">
                                                <td>-</td>
                                            </c:when>
                                        </c:choose>
                                    </c:forEach>

                                    <c:set var="availability" value="false"/>
                                    <c:forEach var="session" items="${subjectSessions}" varStatus="loop">
                                        <c:choose>
                                            <c:when test="${session.day=='Wednesday' && session.time == '02:30 PM - 03.30 PM'}">
                                                <td>Subject: ${session.subject}<br>Lecturer: ${session.lecturer}<br>Venue: ${session.classroom}<br>Batch: ${session.batchNumber}</td>
                                                <c:set var="availability" value="true"/>
                                            </c:when>
                                            <c:when test="${not availability && loop.last}">
                                                <td>-</td>
                                            </c:when>
                                        </c:choose>
                                    </c:forEach>

                                    <c:set var="availability" value="false"/>
                                    <c:forEach var="session" items="${subjectSessions}" varStatus="loop">
                                        <c:choose>
                                            <c:when test="${session.day=='Thursday' && session.time == '02:30 PM - 03.30 PM'}">
                                                <td>Subject: ${session.subject}<br>Lecturer: ${session.lecturer}<br>Venue: ${session.classroom}<br>Batch: ${session.batchNumber}</td>
                                                <c:set var="availability" value="true"/>
                                            </c:when>
                                            <c:when test="${not availability && loop.last}">
                                                <td>-</td>
                                            </c:when>
                                        </c:choose>
                                    </c:forEach>

                                    <c:set var="availability" value="false"/>
                                    <c:forEach var="session" items="${subjectSessions}" varStatus="loop">
                                        <c:choose>
                                            <c:when test="${session.day=='Friday' && session.time == '02:30 PM - 03.30 PM'}">
                                                <td>Subject: ${session.subject}<br>Lecturer: ${session.lecturer}<br>Venue: ${session.classroom}<br>Batch: ${session.batchNumber}</td>
                                                <c:set var="availability" value="true"/>
                                            </c:when>
                                            <c:when test="${not availability && loop.last}">
                                                <td>-</td>
                                            </c:when>
                                        </c:choose>
                                    </c:forEach>
                                </tr>
                                <%--                        3.30-4.30 --%>
                                <tr>
                                    <td><b>03:30 PM - 04.30 PM</b></td>

                                    <c:set var="availability" value="false"/>
                                    <c:forEach var="session" items="${subjectSessions}" varStatus="loop">
                                        <c:choose>
                                            <c:when test="${session.day=='Monday' && session.time == '03:30 PM - 04.30 PM'}">
                                                <td>Subject: ${session.subject}<br>Lecturer: ${session.lecturer}<br>Venue: ${session.classroom}<br>Batch: ${session.batchNumber}</td>
                                                <c:set var="availability" value="true"/>
                                            </c:when>
                                            <c:when test="${not availability && loop.last}">
                                                <td>-</td>
                                            </c:when>
                                        </c:choose>
                                    </c:forEach>

                                    <c:set var="availability" value="false"/>
                                    <c:forEach var="session" items="${subjectSessions}" varStatus="loop">
                                        <c:choose>
                                            <c:when test="${session.day=='Tuesday' && session.time == '03:30 PM - 04.30 PM'}">
                                                <td>Subject: ${session.subject}<br>Lecturer: ${session.lecturer}<br>Venue: ${session.classroom}<br>Batch: ${session.batchNumber}</td>
                                                <c:set var="availability" value="true"/>
                                            </c:when>
                                            <c:when test="${not availability && loop.last}">
                                                <td>-</td>
                                            </c:when>
                                        </c:choose>
                                    </c:forEach>

                                    <c:set var="availability" value="false"/>
                                    <c:forEach var="session" items="${subjectSessions}" varStatus="loop">
                                        <c:choose>
                                            <c:when test="${session.day=='Wednesday' && session.time == '03:30 PM - 04.30 PM'}">
                                                <td>Subject: ${session.subject}<br>Lecturer: ${session.lecturer}<br>Venue: ${session.classroom}<br>Batch: ${session.batchNumber}</td>
                                                <c:set var="availability" value="true"/>
                                            </c:when>
                                            <c:when test="${not availability && loop.last}">
                                                <td>-</td>
                                            </c:when>
                                        </c:choose>
                                    </c:forEach>

                                    <c:set var="availability" value="false"/>
                                    <c:forEach var="session" items="${subjectSessions}" varStatus="loop">
                                        <c:choose>
                                            <c:when test="${session.day=='Thursday' && session.time == '03:30 PM - 04.30 PM'}">
                                                <td>Subject: ${session.subject}<br>Lecturer: ${session.lecturer}<br>Venue: ${session.classroom}<br>Batch: ${session.batchNumber}</td>
                                                <c:set var="availability" value="true"/>
                                            </c:when>
                                            <c:when test="${not availability && loop.last}">
                                                <td>-</td>
                                            </c:when>
                                        </c:choose>
                                    </c:forEach>

                                    <c:set var="availability" value="false"/>
                                    <c:forEach var="session" items="${subjectSessions}" varStatus="loop">
                                        <c:choose>
                                            <c:when test="${session.day=='Friday' && session.time == '03:30 PM - 04.30 PM'}">
                                                <td>Subject: ${session.subject}<br>Lecturer: ${session.lecturer}<br>Venue: ${session.classroom}<br>Batch: ${session.batchNumber}</td>
                                                <c:set var="availability" value="true"/>
                                            </c:when>
                                            <c:when test="${not availability && loop.last}">
                                                <td>-</td>
                                            </c:when>
                                        </c:choose>
                                    </c:forEach>
                                </tr>
                                <%--                        4.30-5.30 --%>
                                <tr>
                                    <td><b>04:30 PM - 05.30 PM</b></td>

                                    <c:set var="availability" value="false"/>
                                    <c:forEach var="session" items="${subjectSessions}" varStatus="loop">
                                        <c:choose>
                                            <c:when test="${session.day=='Monday' && session.time == '04:30 PM - 05.30 PM'}">
                                                <td>Subject: ${session.subject}<br>Lecturer: ${session.lecturer}<br>Venue: ${session.classroom}<br>Batch: ${session.batchNumber}</td>
                                                <c:set var="availability" value="true"/>
                                            </c:when>
                                            <c:when test="${not availability && loop.last}">
                                                <td>-</td>
                                            </c:when>
                                        </c:choose>
                                    </c:forEach>

                                    <c:set var="availability" value="false"/>
                                    <c:forEach var="session" items="${subjectSessions}" varStatus="loop">
                                        <c:choose>
                                            <c:when test="${session.day=='Tuesday' && session.time == '04:30 PM - 05.30 PM'}">
                                                <td>Subject: ${session.subject}<br>Lecturer: ${session.lecturer}<br>Venue: ${session.classroom}<br>Batch: ${session.batchNumber}</td>
                                                <c:set var="availability" value="true"/>
                                            </c:when>
                                            <c:when test="${not availability && loop.last}">
                                                <td>-</td>
                                            </c:when>
                                        </c:choose>
                                    </c:forEach>

                                    <c:set var="availability" value="false"/>
                                    <c:forEach var="session" items="${subjectSessions}" varStatus="loop">
                                        <c:choose>
                                            <c:when test="${session.day=='Wednesday' && session.time == '04:30 PM - 05.30 PM'}">
                                                <td>Subject: ${session.subject}<br>Lecturer: ${session.lecturer}<br>Venue: ${session.classroom}<br>Batch: ${session.batchNumber}</td>
                                                <c:set var="availability" value="true"/>
                                            </c:when>
                                            <c:when test="${not availability && loop.last}">
                                                <td>-</td>
                                            </c:when>
                                        </c:choose>
                                    </c:forEach>

                                    <c:set var="availability" value="false"/>
                                    <c:forEach var="session" items="${subjectSessions}" varStatus="loop">
                                        <c:choose>
                                            <c:when test="${session.day=='Thursday' && session.time == '04:30 PM - 05.30 PM'}">
                                                <td>Subject: ${session.subject}<br>Lecturer: ${session.lecturer}<br>Venue: ${session.classroom}<br>Batch: ${session.batchNumber}</td>
                                                <c:set var="availability" value="true"/>
                                            </c:when>
                                            <c:when test="${not availability && loop.last}">
                                                <td>-</td>
                                            </c:when>
                                        </c:choose>
                                    </c:forEach>

                                    <c:set var="availability" value="false"/>
                                    <c:forEach var="session" items="${subjectSessions}" varStatus="loop">
                                        <c:choose>
                                            <c:when test="${session.day=='Friday' && session.time == '04:30 PM - 05.30 PM'}">
                                                <td>Subject: ${session.subject}<br>Lecturer: ${session.lecturer}<br>Venue: ${session.classroom}<br>Batch: ${session.batchNumber}</td>
                                                <c:set var="availability" value="true"/>
                                            </c:when>
                                            <c:when test="${not availability && loop.last}">
                                                <td>-</td>
                                            </c:when>
                                        </c:choose>
                                    </c:forEach>
                                </tr>

                                </thead>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <jsp:include page="Standard Themes/FooterPanel.jsp" />
    </div>

</div>

<script type="text/javascript">
    function yesnoCheck(that) {

        if (that.value == "Batch") {
            document.getElementById("batchYes").style.display = "block";
            document.getElementById("lecturerYes").style.display = "none";
            document.getElementById("subjectYes").style.display = "none";
            document.getElementById("classroomYes").style.display = "none";
        }else if(that.value == "Lecturer"){
            document.getElementById("batchYes").style.display = "none";
            document.getElementById("lecturerYes").style.display = "block";
            document.getElementById("subjectYes").style.display = "none";
            document.getElementById("classroomYes").style.display = "none";
        }else if(that.value == "Subject"){
            document.getElementById("batchYes").style.display = "none";
            document.getElementById("lecturerYes").style.display = "none";
            document.getElementById("subjectYes").style.display = "block";
            document.getElementById("classroomYes").style.display = "none";
        }else if(that.value == "Classroom"){
            document.getElementById("batchYes").style.display = "none";
            document.getElementById("lecturerYes").style.display = "none";
            document.getElementById("subjectYes").style.display = "none";
            document.getElementById("classroomYes").style.display = "block";
        }else{
            document.getElementById("batchYes").style.display = "none";
            document.getElementById("lecturerYes").style.display = "none";
            document.getElementById("subjectYes").style.display = "none";
            document.getElementById("classroomYes").style.display = "none";
        }
    }
    function MySelectFunction() {
        document.getElementById("viewButton").click()
    }
</script>
<!--   Core JS Files   -->
<script src="../assets/js/core/jquery.3.2.1.min.js"></script>
<script src="../assets/js/core/popper.min.js"></script>
<script src="../assets/js/core/bootstrap.min.js"></script>

<!-- jQuery UI -->
<script src="../assets/js/plugin/jquery-ui-1.12.1.custom/jquery-ui.min.js"></script>
<script src="../assets/js/plugin/jquery-ui-touch-punch/jquery.ui.touch-punch.min.js"></script>

<!-- jQuery Scrollbar -->
<script src="../assets/js/plugin/jquery-scrollbar/jquery.scrollbar.min.js"></script>


<!-- Chart JS -->
<script src="../assets/js/plugin/chart.js/chart.min.js"></script>

<!-- jQuery Sparkline -->
<script src="../assets/js/plugin/jquery.sparkline/jquery.sparkline.min.js"></script>

<!-- Chart Circle -->
<script src="../assets/js/plugin/chart-circle/circles.min.js"></script>

<!-- Datatables -->
<script src="../assets/js/plugin/datatables/datatables.min.js"></script>

<!-- Bootstrap Notify -->
<script src="../assets/js/plugin/bootstrap-notify/bootstrap-notify.min.js"></script>

<!-- jQuery Vector Maps -->
<script src="../assets/js/plugin/jqvmap/jquery.vmap.min.js"></script>
<script src="../assets/js/plugin/jqvmap/maps/jquery.vmap.world.js"></script>

<!-- Sweet Alert -->
<script src="../assets/js/plugin/sweetalert/sweetalert.min.js"></script>

<!-- Atlantis JS -->
<script src="../assets/js/atlantis.min.js"></script>

<!-- Atlantis DEMO methods, don't include it in your project! -->
<script src="../assets/js/setting-demo.js"></script>
<script src="../assets/js/demo.js"></script>
<script>
    Circles.create({
        id:'circles-1',
        radius:45,
        value:60,
        maxValue:100,
        width:7,
        text: 5,
        colors:['#f1f1f1', '#FF9E27'],
        duration:400,
        wrpClass:'circles-wrp',
        textClass:'circles-text',
        styleWrapper:true,
        styleText:true
    })

    Circles.create({
        id:'circles-2',
        radius:45,
        value:70,
        maxValue:100,
        width:7,
        text: 36,
        colors:['#f1f1f1', '#2BB930'],
        duration:400,
        wrpClass:'circles-wrp',
        textClass:'circles-text',
        styleWrapper:true,
        styleText:true
    })

    Circles.create({
        id:'circles-3',
        radius:45,
        value:40,
        maxValue:100,
        width:7,
        text: 12,
        colors:['#f1f1f1', '#F25961'],
        duration:400,
        wrpClass:'circles-wrp',
        textClass:'circles-text',
        styleWrapper:true,
        styleText:true
    })

    var totalIncomeChart = document.getElementById('totalIncomeChart').getContext('2d');

    var mytotalIncomeChart = new Chart(totalIncomeChart, {
        type: 'bar',
        data: {
            labels: ["S", "M", "T", "W", "T", "F", "S", "S", "M", "T"],
            datasets : [{
                label: "Total Income",
                backgroundColor: '#ff9e27',
                borderColor: 'rgb(23, 125, 255)',
                data: [6, 4, 9, 5, 4, 6, 4, 3, 8, 10],
            }],
        },
        options: {
            responsive: true,
            maintainAspectRatio: false,
            legend: {
                display: false,
            },
            scales: {
                yAxes: [{
                    ticks: {
                        display: false //this will remove only the label
                    },
                    gridLines : {
                        drawBorder: false,
                        display : false
                    }
                }],
                xAxes : [ {
                    gridLines : {
                        drawBorder: false,
                        display : false
                    }
                }]
            },
        }
    });

    $('#lineChart').sparkline([105,103,123,100,95,105,115], {
        type: 'line',
        height: '70',
        width: '100%',
        lineWidth: '2',
        lineColor: '#ffa534',
        fillColor: 'rgba(255, 165, 52, .14)'
    });
</script>
</body>
</html>