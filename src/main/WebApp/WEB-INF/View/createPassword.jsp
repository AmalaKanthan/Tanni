<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <title>Login</title>
    <meta content='width=device-width, initial-scale=1.0, shrink-to-fit=no' name='viewport' />
    <link rel="icon" href="../../assets/img/icon.ico" type="image/x-icon"/>

    <!-- Fonts and icons -->
    <script src="../../assets/js/plugin/webfont/webfont.min.js"></script>
    <script>
        WebFont.load({
            google: {"families":["Lato:300,400,700,900"]},
            custom: {"families":["Flaticon", "Font Awesome 5 Solid", "Font Awesome 5 Regular", "Font Awesome 5 Brands", "simple-line-icons"], urls: ['../../assets/css/fonts.min.css']},
            active: function() {
                sessionStorage.fonts = true;
            }
        });
    </script>

    <!-- CSS Files -->
    <link rel="stylesheet" href="../../assets/css/bootstrap.min.css">
    <link rel="stylesheet" href="../../assets/css/atlantis.min.css">
    <!-- CSS Just for demo purpose, don't include it in your project -->
    <link rel="stylesheet" href="../../assets/css/demo.css">
</head>
<body>
<div class="wrapper sidebar_minimize">


    <div class="main-panel">
        <div class="content">
            <div class="page-inner">
                <div class="row">
                    <div class="col-md-12">
                        <div class="card">
                            <div class="card-header">
                                <div class="card-title">Create Password</div>
                            </div>
                            <div class="card-body">
                                <div class="row">
                                    <div class="col-md-6 col-lg-4"></div>
                                    <div class="col-md-6 col-lg-4">
                                        <div align="center">Hi ${user1.firstname} ${user1.lastname}, Please enter a password</div>

                                            <form:form modelAttribute="user" method="post" action="/confirmPassword">

                                                <div class="form-group">
                                                    <label>Password</label>
                                                    <form:input path="password" id="passwrd" type="password" class="form-control" placeholder="Enter Password"></form:input>
                                                </div>
                                                <div class="form-group">
                                                    <label>Confirm Password</label>
                                                    <input id="confirmPasswrd"  type="password" name="pwd2" class="form-control" placeholder="Enter Password Again">
                                                </div>
                                                <div id="createPassswordButton" class="card-action" style="display: block">
                                                    <input type="submit" class="btn btn-success" value="Create Password"/>
                                                </div>

                                            </form:form>


                                        </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <jsp:include page="Standard Themes/FooterPanel.jsp" />
    </div>

    <!-- Custom template | don't include it in your project! -->

    <!-- End Custom template -->
</div>

<script type="text/javascript">

    function checkForm() {
        // if (document.getElementById("passwrd").value() == document.getElementById("confirmPasswrd").value(){
        //     document.getElementById("createPassswordButton").style.display = "block";
        // }
    }

</script>
<!--   Core JS Files   -->
<script src="../../assets/js/core/jquery.3.2.1.min.js"></script>
<script src="../../assets/js/core/popper.min.js"></script>
<script src="../../assets/js/core/bootstrap.min.js"></script>
<!-- jQuery UI -->
<script src="../../assets/js/plugin/jquery-ui-1.12.1.custom/jquery-ui.min.js"></script>
<script src="../../assets/js/plugin/jquery-ui-touch-punch/jquery.ui.touch-punch.min.js"></script>

<!-- jQuery Scrollbar -->
<script src="../../assets/js/plugin/jquery-scrollbar/jquery.scrollbar.min.js"></script>
<!-- Atlantis JS -->
<script src="../../assets/js/atlantis.min.js"></script>
<!-- Atlantis DEMO methods, don't include it in your project! -->
<script src="../../assets/js/setting-demo2.js"></script>
</body>
</html>