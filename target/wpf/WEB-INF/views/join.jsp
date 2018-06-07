<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="IE=edge">

<title>Register page | Nifty - Admin Template</title>


<!--STYLESHEET-->
<!--=================================================-->

<!--Open Sans Font [ OPTIONAL ]-->
<link
	href='https://fonts.googleapis.com/css?family=Open+Sans:400,300,600,700'
	rel='stylesheet' type='text/css'>

<!--Bootstrap Stylesheet [ REQUIRED ]-->
<link href="<c:url value='/resources/css/bootstrap.min.css'/>"
	rel="stylesheet">

<!--Nifty Stylesheet [ REQUIRED ]-->
<link href="<c:url value='/resources/css/nifty.min.css'/>"
	rel="stylesheet">

<!--Nifty Premium Icon [ DEMONSTRATION ]-->
<link
	href="<c:url value='/resources/css/demo/nifty-demo-icons.min.css'/>"
	rel="stylesheet">

<!--=================================================-->
<!--Pace - Page Load Progress Par [OPTIONAL]-->
<link href="<c:url value='/resources/plugins/pace/pace.min.css'/>"
	rel="stylesheet">
<script src="<c:url value='/resources/plugins/pace/pace.min.js'/>"></script>

<!--Demo [ DEMONSTRATION ]-->
<link href="<c:url value='/resources/css/demo/nifty-demo.min.css'/>"
	rel="stylesheet">
<!--=================================================

    REQUIRED
    You must include this in your project.


    RECOMMENDED
    This category must be included but you may modify which plugins or components which should be included in your project.


    OPTIONAL
    Optional plugins. You may choose whether to include it in your project or not.


    DEMONSTRATION
    This is to be removed, used for demonstration purposes only. This category must not be included in your project.


    SAMPLE
    Some script samples which explain how to initialize plugins or components. This category should not be included in your project.


    Detailed information and more samples can be found in the document.

    =================================================-->

<!--JAVASCRIPT-->
<!--=================================================-->

<!--jQuery [ REQUIRED ]-->
<script src="<c:url value='/resources/js/jquery.min.js'/>"></script>

<!--BootstrapJS [ RECOMMENDED ]-->
<script src="<c:url value='/resources/js/bootstrap.min.js'/>"></script>

<!--NiftyJS [ RECOMMENDED ]-->
<script src="<c:url value='/resources/js/nifty.min.js'/>"></script>

<!--=================================================-->

<!--Background Image [ DEMONSTRATION ]-->
<script src="<c:url value='/resources/js/demo/bg-images.js'/>"></script>

<script type="text/javascript">
	function dojoin() {

		var regExp = /^[A-Za-z0-9+]{4,12}$/;

		var reg = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;

		var fullName = $('#name').val();
		if (fullName == '') {
			$('#warn').text("필수항목입니다");

		} else {
			$('#warn').text("");
		}
		var email = $('#email').val();
		if (email == '') {
			$('#ware').text("필수항목입니다");
			return;

		} else {
			$('#ware').text("");
		}
		if (!reg.test(email)) {
			$('#ware').text("형식이 맞지않습니다")
		} else {
			$('#ware').text("");
		}

		var password = $('#password').val();
		if (password == '') {
			$('#warp').text("필수항목입니다");

		} else {
			$('#warp').text("");
		}

		var userName = $('#username').val();
		if (userName == '') {
			$('#waru').text("필수항목입니다");
		} else {
			$('#waru').text("");
		}

		if (!regExp.test(userName)) {
			$('#waru').text("형식이 맞지않습니다");
		
		} else {
			$.ajax({

				url : '/wpf/chkId.do',

				type : "post",
				//  키         값
				data : {
					'userName' : userName
				},
				// callback 함수 결과가 돌아옴
				success : function(result, textStatus, jqXHR) {
					// result 는 controller에서 보내주는값
					if (result == 0) {
						var frm = $('form[name=joinForm]')[0];
						frm.action = "<c:url value="join.do"/>"
						frm.method = "POST";
						frm.submit();

					} else {
						$('#waru').text("중복입니다");
						return;
					}
				},
				error : function(jqXHR, textStatus, errorThrown) {
					console.log(jqXHR);
					console.log(textStatus);
					console.log(errorThrown);
				}
			});
		}
	}
</script>
</head>

<!--TIPS-->
<!--You may remove all ID or Class names which contain "demo-", they are only used for demonstration. -->

<body>
	<div id="container" class="cls-container">


		<!-- BACKGROUND IMAGE -->
		<!--===================================================-->
		<div id="bg-overlay"></div>


		<!-- REGISTRATION FORM -->
		<!--===================================================-->
		<div class="cls-content">
			<div class="cls-content-lg panel">
				<div class="panel-body">
					<div class="mar-ver pad-btm">
						<h1 class="h3">Create a New Account</h1>
						<p>Come join the Nifty community! Let's set up your account.</p>
					</div>
					<form name="joinForm">
						<div class="row">

							<div class="col-sm-6">

								<div class="form-group">
									<div>
										<font id="warn" color="red"></font>
									</div>
									<input type="text" class="form-control" placeholder="Full name"
										name="name" id="name">
								</div>
								<div class="form-group">
									<div>
										<font id="ware" color="red"></font>
									</div>

									<input type="text" class="form-control" placeholder="E-mail"
										name="email" id="email">
								</div>
							</div>
							<div class="col-sm-6">
								<div class="form-group">
									<div>
										<font id="waru" color="red"></font>
									</div>

									<input type="text" class="form-control" placeholder="Username"
										name="username" id="username">
								</div>
								<div class="form-group">
									<div>
										<font id="warp" color="red"></font>
									</div>

									<input type="password" class="form-control"
										placeholder="Password" name="password" id="password">
								</div>
							</div>
						</div>
						<div class="checkbox pad-btm text-left">
							<input id="demo-form-checkbox" class="magic-checkbox"
								type="checkbox"> <label for="demo-form-checkbox">I
								agree with the <a href="#" class="btn-link text-bold">Terms
									and Conditions</a>
							</label>
						</div>
						<button class="btn btn-primary btn-lg btn-block"
							onclick="dojoin()" type="button">Register</button>
					</form>
				</div>
				<div class="pad-all">
					Already have an account ? <a href="<c:url value='/loginPage.do'/>"
						class="btn-link mar-rgt text-bold">Sign In</a>

					<div class="media pad-top bord-top">
						<div class="pull-right">
							<a href="#" class="pad-rgt"><i
								class="demo-psi-facebook icon-lg text-primary"></i></a> <a href="#"
								class="pad-rgt"><i
								class="demo-psi-twitter icon-lg text-info"></i></a> <a href="#"
								class="pad-rgt"><i
								class="demo-psi-google-plus icon-lg text-danger"></i></a>
						</div>
						<div class="media-body text-left text-main text-bold">Sign
							Up with</div>
					</div>
				</div>
			</div>
		</div>
		<!--===================================================-->


		<!-- DEMO PURPOSE ONLY -->
		<!--===================================================-->
		<div class="demo-bg">
			<div id="demo-bg-list">
				<div class="demo-loading">
					<i class="psi-repeat-2"></i>
				</div>
				<img class="demo-chg-bg bg-trans "
					src="<c:url value='/resources/img/bg-img/thumbs/bg-trns.jpg'/>"
					alt="Background Image"> <img class="demo-chg-bg active"
					src="<c:url value='/resources/img/bg-img/thumbs/bg-img-1.jpg'/>"
					alt="Background Image"> <img class="demo-chg-bg"
					src="<c:url value='/resources/img/bg-img/thumbs/bg-img-2.jpg'/>"
					alt="Background Image"> <img class="demo-chg-bg"
					src="<c:url value='/resources/img/bg-img/thumbs/bg-img-3.jpg'/>"
					alt="Background Image"> <img class="demo-chg-bg"
					src="<c:url value='/resources/img/bg-img/thumbs/bg-img-4.jpg'/>"
					alt="Background Image"> <img class="demo-chg-bg"
					src="<c:url value='/resources/img/bg-img/thumbs/bg-img-5.jpg'/>"
					alt="Background Image"> <img class="demo-chg-bg"
					src="<c:url value='/resources/img/bg-img/thumbs/bg-img-6.jpg'/>"
					alt="Background Image"> <img class="demo-chg-bg"
					src="<c:url value='/resources/img/bg-img/thumbs/bg-img-7.jpg'/>"
					alt="Background Image">
			</div>
		</div>
		<!--===================================================-->



	</div>
	<!--===================================================-->
	<!-- END OF CONTAINER -->

</body>
</html>
