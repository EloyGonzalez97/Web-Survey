<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html lang="en">
  <head>
      <meta charset="utf-8">
      <title>Create an account</title>

      <link href="${contextPath}/resources/css/bootstrap.min.css" rel="stylesheet">
      <link href="${contextPath}/resources/css/common.css" rel="stylesheet">
	  <link href="/css/main.css" rel="stylesheet">
  </head>

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
            
                <li><a href="http://localhost:8080/${pageContext.request.userPrincipal.name}/surveys" title="">View Surveys</a></li>
				 <li><a href="http://localhost:8080/" title="">Home</a></li
            </ul> <!-- end header__nav -->
            <a href="#0" title="Close Menu" class="header__overlay-close close-mobile-menu">Close</a>

        </nav> <!-- end header__nav-wrap -->

    </header> <!-- s-header -->

    <section class="s-content s-content--top-padding s-content--narrow">
		
		
        <div class="row">
            <div class="col-full s-content__main">
        <form:form method="POST" modelAttribute="surveyForm" class="form-signin">
            <h2 class="form-signin-heading">Create your Survey</h2>
            <spring:bind path="title">
                <div class="form-group ${status.error ? 'has-error' : ''}">
                    <form:input type="text" path="title" class="form-control" placeholder="Survey Title"
                                autofocus="true"></form:input>
                    <form:errors path="title"></form:errors>
                </div>
            </spring:bind>

            <spring:bind path="description">
                <div class="form-group ${status.error ? 'has-error' : ''}">
                    <form:input type="text" path="description" class="form-control" placeholder="Survey Description"></form:input>
                    <form:errors path="description"></form:errors>
                </div>
            </spring:bind>
            <spring:bind path="emails">
                <div id = "eList" class="form-group ${status.error ? 'has-error' : ''}">
                    <form:input type="text" path="emails[0].email_address" class="form-control" placeholder="Email Recipient"></form:input>
                    <form:errors path="emails"></form:errors>
                </div>
                <button onclick="addEmailAddress()" name="addEmail" class="btn btn-default" type="button"><span> Add Email Address</span></button>
            </spring:bind>
            <spring:bind path="startDate">
                <div class="form-group ${status.error ? 'has-error' : ''}">
                    <form:input type="date" path="startDate" class="form-control" placeholder="Start Date: (Ex: 2018-04-10)"></form:input>
                    <form:errors path="startDate"></form:errors>
                </div>
            </spring:bind>
            <spring:bind path="endDate">
                <div class="form-group ${status.error ? 'has-error' : ''}">
                    <form:input type="date" path="endDate" class="form-control" placeholder="End Date: (Ex: 2018-04-20)"></form:input>
                    <form:errors path="endDate"></form:errors>
                </div>
            </spring:bind>
            <spring:bind path="ratingQuestions">
                <div id = "rList" class="form-group ${status.error ? 'has-error' : ''}">
                    <form:input type="text" path="ratingQuestions[0].questionText" class="form-control" placeholder="Example: From 1 to 5, how would you rate your experience?"></form:input>
                    <form:errors path="ratingQuestions"></form:errors>
                </div>
                <button onclick="addType1Question()" name="addType1" class="btn btn-default" type="button"><span> Add Another Type 1 Question</span></button>
            </spring:bind>
            <spring:bind path="textQuestions">
                <div id = "tList" class="form-group ${status.error ? 'has-error' : ''}">
                    <form:input type="text" path="textQuestions[0].questionText" class="form-control" placeholder="Example: How did you find your experience?"></form:input>
                    <form:errors path="textQuestions"></form:errors>
                </div>
                <button onclick="addType2Question()" name="addType2" class="btn btn-default" type="button"><span> Add Another Type 2 Question</span></button>
            </spring:bind>    
            <button class="btn btn-lg btn-primary btn-block" type="submit">Submit</button>
        </form:form>

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
    <script src=https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
    <script>
        index = 0;
        function addEmailAddress() {
                var node = document.createElement("input"); 
                index++;
                var str = "emails["+index+"].email_address";
                var id = "emails"+index+".email_address";
                node.setAttribute("id", id);
                node.setAttribute("path", str);
                node.setAttribute("name", str);
                node.setAttribute("placeholder", "Email recipient");
                node.setAttribute("type", "text");
                node.setAttribute("class", "form-control");
                console.log(node);
                console.log(index);
                document.getElementById("eList").appendChild(node); 
                
        }
        rIndex = 0;
        function addType1Question() {
                var node = document.createElement("input"); 
                rIndex++;
                var str = "ratingQuestions["+rIndex+"].questionText";
                var id = "ratingQuestions"+rIndex+".questionText";
                node.setAttribute("id", id);
                node.setAttribute("path", str);
                node.setAttribute("name", str);
                node.setAttribute("placeholder", "Example: From 1 to 5, how would you rate your experience?");
                node.setAttribute("type", "text");
                node.setAttribute("class", "form-control");
                document.getElementById("rList").appendChild(node); 
                
        }
        tIndex = 0;
        function addType2Question() {
                var node = document.createElement("input"); 
                tIndex++;
                var str = "textQuestions["+tIndex+"].questionText";
                var id = "textQuestions"+tIndex+".questionText";
                node.setAttribute("id", id);
                node.setAttribute("path", str);
                node.setAttribute("name", str);
                node.setAttribute("placeholder", "Example: How did you find your experience?");
                node.setAttribute("type", "text");
                node.setAttribute("class", "form-control");
                document.getElementById("tList").appendChild(node); 
                
        }
</script>
  </body>
</html>
