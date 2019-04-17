<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <title>Create an account</title>
    <link href="${contextPath}/resources/css/bootstrap.min.css" rel="stylesheet">
	<link href="/css/main.css" rel="stylesheet">
</head>
<body id = "top">"
     <header class="s-header header">

        <div class="header__logo">
            <a class="logo">
				Online Survey
<!--				<img src="images/logo.svg" alt="Homepage">-->
           
			</a>
        </div> <!-- end header__logo -->

        

        <a class="header__toggle-menu" href="#0" title="Menu"><span>Menu</span></a>
        <nav class="header__nav-wrap">

            <h2 class="header__nav-heading h6">Navigate to</h2>

            <ul class="header__nav">
            
                <li><a href="http://localhost:8080/${pageContext.request.userPrincipal.name}/create" title="">Create Survey</a></li>
				 <li><a href="http://localhost:8080/" title="">Home</a></li
            </ul> <!-- end header__nav -->
            <a href="#0" title="Close Menu" class="header__overlay-close close-mobile-menu">Close</a>

        </nav> <!-- end header__nav-wrap -->

    </header> <!-- s-header -->

    <section class="s-content s-content--top-padding s-content--narrow">
		
		
        <div class="row">
            <div class="col-full s-content__main">
    <c:if test="${pageContext.request.userPrincipal.name != null}">
        <h2>Surveys for ${pageContext.request.userPrincipal.name}</h2>
    </c:if>  
    <c:forEach items="${surv}" var="survey">
            <li class = "ls"><a href='http://localhost:8080/${pageContext.request.userPrincipal.name}/surveys/${survey.surveyID}'> ${survey.title} </a></li>
    </c:forEach>
  </div>
  </div>
  </section>
      <footer class="s-footer">

        <div class="s-footer__main">
            <div class="row">
<!--                
                <div class="col-six tab-full s-footer__about">
                        
                    <h4>About Wordsmith</h4>


                </div> 
			--><!-- end s-footer__about -->

<!--                <div class="col-six tab-full s-footer__subscribe">

                        
                    <h4>Our Newsletter</h4>
-->

                   

<!--
                    <div class="subscribe-form">
                        <form id="mc-form" class="group" novalidate="true">

                            <input type="email" value="" name="EMAIL" class="email" id="mc-email" placeholder="Email Address" required="">
                
                            <input type="submit" name="subscribe" value="Send">
                
                            <label for="mc-email" class="subscribe-message"></label>
                
                        </form>
                    </div>


                </div> <!-- end s-footer__subscribe -->

            </div>
        </div> <!-- end s-footer__main -->

        <div class="s-footer__bottom">
            <div class="row">
<!--
                <div class="col-six">
                    <ul class="footer-social">
                        <li>
                            <a href="#0"><i class="fab fa-facebook"></i></a>
                        </li>
                        <li>
                            <a href="#0"><i class="fab fa-twitter"></i></a>
                        </li>
                        <li>
                            <a href="#0"><i class="fab fa-instagram"></i></a>
                        </li>
                        <li>
                            <a href="#0"><i class="fab fa-youtube"></i></a>
                        </li>
                        <li>
                            <a href="#0"><i class="fab fa-pinterest"></i></a>
                        </li>
                    </ul>
                </div>
-->

                <div class="col-six">
                    <div class="s-footer__copyright">
                        <span><!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
Copyright &copy;<script>document.write(new Date().getFullYear());</script> All rights reserved | Online Survey <i class="fa fa-heart" aria-hidden="true"></i> by <a href="#" target="_blank">Answer</a>
<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
</span>
						
                    </div>
                </div>
                
            </div>
        </div> <!-- end s-footer__bottom -->

        <div class="go-top">
            <a class="smoothscroll" title="Back to Top" href="#top"></a>
        </div>

    </footer> <!-- end s-footer -->

  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
  <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
</body>
</html>