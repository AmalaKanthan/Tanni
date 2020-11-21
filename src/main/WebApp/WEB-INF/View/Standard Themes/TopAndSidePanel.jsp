<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="main-header">
    <!-- Logo Header -->
    <div class="logo-header" data-background-color="blue">

        <a href="home" class="logo">
            <img src="../assets/img/logo.svg" alt="navbar brand" class="navbar-brand">
        </a>
        <button class="navbar-toggler sidenav-toggler ml-auto" type="button" data-toggle="collapse" data-target="collapse" aria-expanded="false" aria-label="Toggle navigation">
					<span class="navbar-toggler-icon">
						<i class="icon-menu"></i>
					</span>
        </button>
        <button class="topbar-toggler more"><i class="icon-options-vertical"></i></button>
        <div class="nav-toggle">
            <button class="btn btn-toggle toggle-sidebar">
                <i class="icon-menu"></i>
            </button>
        </div>
    </div>
    <!-- End Logo Header -->

    <!-- Navbar Header -->
    <nav class="navbar navbar-header navbar-expand-lg" data-background-color="blue2">

        <div class="container-fluid">
            <ul class="navbar-nav topbar-nav ml-md-auto align-items-center">

                <li class="nav-item dropdown hidden-caret">
                    <a class="dropdown-toggle profile-pic" data-toggle="dropdown" href="#" aria-expanded="false">
                        <div class="avatar-sm">
                            <img src="../assets/img/businessman.png" alt="..." class="avatar-img rounded-circle">
                        </div>
                    </a>
                    <ul class="dropdown-menu dropdown-user animated fadeIn">
                        <div class="dropdown-user-scroll scrollbar-outer">
                            <li>
                                <div class="user-box">
                                    <div class="avatar-lg"><img src="../assets/img/profile_template.png" alt="image profile" class="avatar-img rounded"></div>
                                    <div class="u-text">
                                        <h4>${user.firstname.toUpperCase()}</h4>
                                        <p class="text-muted">${user.email}</p>
                                        <p class="text-muted">${user.type}</p>
                                    </div>
                                </div>
                            </li>
                            <li>
                                <div class="dropdown-divider"></div>
                                <a class="dropdown-item" href="#">My Profile</a>
                                <a class="dropdown-item" href="/signOut">Logout</a>
                            </li>
                        </div>
                    </ul>
                </li>
            </ul>
        </div>
    </nav>
    <!-- End Navbar -->
</div>

<!-- Sidebar -->
<div class="sidebar sidebar-style-2">
    <div class="sidebar-wrapper scrollbar scrollbar-inner">
        <div class="sidebar-content">

            <ul class="nav nav-primary">
                <a href="home"><li href="home" class="nav-item">
                    <a href="home" data-toggle="collapse" class="collapsed" aria-expanded="false">
                        <i class="fas fa-home"></i>
                        <p>Home</p>
                    </a>
                </li></a>


                <c:if test="${user.type == 'admin' or user.type == 'Lecturer'}">
                    <li class="nav-item">
                        <a data-toggle="collapse" href="#submenu" class="collapsed" aria-expanded="false">
                            <i class="fas fa-user"></i>
                            <p>Users</p>
                            <span class="caret"></span>
                        </a>
                        <div class="collapse" id="submenu" style="">
                            <ul class="nav nav-collapse">
                                <c:if test="${user.type == 'admin'}">
                                    <li>
                                        <a data-toggle="collapse" href="#subnav1">
                                            <span class="sub-item">Manage Users</span>
                                            <span class="caret"></span>
                                        </a>
                                        <div class="collapse" id="subnav1">
                                            <ul class="nav nav-collapse subnav">
                                                <li>
                                                    <a href="add-user">
                                                        <span class="sub-item">Add New User</span>
                                                    </a>
                                                </li>
                                                <li>
                                                    <a href="remove-user">
                                                        <span class="sub-item">Remove Existing Users</span>
                                                    </a>
                                                </li>
                                                <li>
                                                    <a href="edit-user">
                                                        <span class="sub-item">Edit Existing Users</span>
                                                    </a>
                                                </li>
                                            </ul>
                                        </div>
                                    </li>
                                </c:if>
                                <li>
                                    <a href="view-all-users">
                                        <span class="sub-item">View All Existing Users</span>
                                    </a>
                                </li>
                            </ul>
                        </div>
                    </li>
                </c:if>


                <li class="nav-item">
                    <a data-toggle="collapse" href="#submenu1" class="collapsed" aria-expanded="false">
                        <i class="fas fa-graduation-cap"></i>
                        <p>Batches</p>
                        <span class="caret"></span>
                    </a>
                    <div class="collapse" id="submenu1" style="">
                        <ul class="nav nav-collapse">
                            <c:if test="${user.type == 'admin'}">
                                <li>
                                    <a data-toggle="collapse" href="#subnav2">
                                        <span class="sub-item">Manage Batches</span>
                                        <span class="caret"></span>
                                    </a>
                                    <div class="collapse" id="subnav2">
                                        <ul class="nav nav-collapse subnav">
                                            <li>
                                                <a href="add-batch">
                                                    <span class="sub-item">Add New Batch</span>
                                                </a>
                                            </li>
                                            <li>
                                                <a href="remove-batch">
                                                    <span class="sub-item">Remove Existing Batch</span>
                                                </a>
                                            </li>
                                            <li>
                                                <a href="edit-batch">
                                                    <span class="sub-item">Edit Existing Batch</span>
                                                </a>
                                            </li>
                                        </ul>
                                    </div>
                                </li>
                            </c:if>
                            <li>
                                <a href="view-all-batches">
                                    <span class="sub-item">View All Existing Batches</span>
                                </a>
                            </li>
                        </ul>
                    </div>
                </li>

                <li class="nav-item">
                    <a data-toggle="collapse" href="#submenu2" class="collapsed" aria-expanded="false">
                        <i class="fas fa-table"></i>
                        <p>Timetables</p>
                        <span class="caret"></span>
                    </a>
                    <div class="collapse" id="submenu2" style="">
                        <ul class="nav nav-collapse">
                            <c:if test="${user.type == 'admin'}">
                                <li>
                                    <a data-toggle="collapse" href="#subnav3">
                                        <span class="sub-item">Manage Timetables</span>
                                        <span class="caret"></span>
                                    </a>
                                    <div class="collapse" id="subnav3">
                                        <ul class="nav nav-collapse subnav">
                                            <li>
                                                <a href="add-timetable">
                                                    <span class="sub-item">Add New Timetable</span>
                                                </a>
                                            </li>
                                            <li>
                                                <a href="remove-timetable">
                                                    <span class="sub-item">Remove Existing Timetable</span>
                                                </a>
                                            </li>
                                            <li>
                                                <a href="edit-timetable">
                                                    <span class="sub-item">Edit Existing Timetable</span>
                                                </a>
                                            </li>
                                        </ul>
                                    </div>
                                </li>
                            </c:if>

                            <li>
                                <a href="view-timetable">
                                    <span class="sub-item">View Timetables</span>
                                </a>
                            </li>
                        </ul>
                    </div>
                </li>

                <li class="nav-item">
                    <a data-toggle="collapse" href="#submenu3" class="collapsed" aria-expanded="false">
                        <i class="fas fa-user-friends"></i>
                        <p>Classrooms</p>
                        <span class="caret"></span>
                    </a>
                    <div class="collapse" id="submenu3" style="">
                        <ul class="nav nav-collapse">
                            <c:if test="${user.type == 'admin'}">
                                <li>
                                    <a data-toggle="collapse" href="#subnav4">
                                        <span class="sub-item">Manage Classroom</span>
                                        <span class="caret"></span>
                                    </a>
                                    <div class="collapse" id="subnav4">
                                        <ul class="nav nav-collapse subnav">
                                            <li>
                                                <a href="add-classroom">
                                                    <span class="sub-item">Add New Classroom</span>
                                                </a>
                                            </li>
                                            <li>
                                                <a href="remove-classroom">
                                                    <span class="sub-item">Remove Existing Classroom</span>
                                                </a>
                                            </li>
                                            <li>
                                                <a href="edit-classroom">
                                                    <span class="sub-item">Edit Existing Classroom</span>
                                                </a>
                                            </li>
                                        </ul>
                                    </div>
                                </li>
                            </c:if>


                            <li>
                                <a href="view-all-classrooms">
                                    <span class="sub-item">View All Existing Classrooms</span>
                                </a>
                            </li>
                        </ul>
                    </div>
                </li>

                <li class="nav-item">
                    <a data-toggle="collapse" href="#submenu4" class="collapsed" aria-expanded="false">
                        <i class="fas fa-book-open"></i>
                        <p>Subjects</p>
                        <span class="caret"></span>
                    </a>
                    <div class="collapse" id="submenu4" style="">
                        <ul class="nav nav-collapse">
                            <c:if test="${user.type == 'admin'}">
                                <li>
                                    <a data-toggle="collapse" href="#subnav5">
                                        <span class="sub-item">Manage Subject</span>
                                        <span class="caret"></span>
                                    </a>
                                    <div class="collapse" id="subnav5">
                                        <ul class="nav nav-collapse subnav">
                                            <li>
                                                <a href="add-subject">
                                                    <span class="sub-item">Add New Subject</span>
                                                </a>
                                            </li>
                                            <li>
                                                <a href="remove-subject">
                                                    <span class="sub-item">Remove Existing Subject</span>
                                                </a>
                                            </li>
                                            <li>
                                                <a href="edit-subject">
                                                    <span class="sub-item">Edit Existing Subject</span>
                                                </a>
                                            </li>
                                        </ul>
                                    </div>
                                </li>
                            </c:if>

                            <li>
                                <a href="view-all-subjects">
                                    <span class="sub-item">View All Existing Subjects</span>
                                </a>
                            </li>
                        </ul>
                    </div>
                </li>

            </ul>
        </div>
    </div>
</div>