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
    <script
            src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js">
    </script>
</head>
<body id = "top">"
     <header class="s-header header">

        <div class="header__logo">
            <a class="logo">
				Online Survey
           
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
     <h2>${survey.title}</h2>
     <h3>${survey.description}</h3>
    <form:form method="POST" modelAttribute="answerForm"class="form-signin">
        <c:forEach items="${survey.ratingQuestions}" var="rating">

            <h2 name = "ratingQ" >${rating.questionText}</h2>

            <spring:bind path="answerForm.rAnswers">
                <div id = "rAnswer" class="form-group ${status.error ? 'has-error' : ''}">
                    <select type="number" name = "ratingA" path="answerForm.rAnswers[${rating.ratingAnswer.size()}]" class="form-control" placeholder="Answer from 1 to 5">
                        <option value = "1">1</option>
                        <option value = "2">2</option>
                        <option value = "3">3</option>
                        <option value = "4">4</option>
                        <option value = "5">5</option>
                    </select>
                    <form:errors path="answerForm.rAnswers[${rating.ratingAnswer.size()}]"></form:errors>
                </div>
            </spring:bind>

        </c:forEach>
        <c:forEach items="${survey.textQuestions}" var="text">

            <h2 name = "textQ" >${text.questionText}</h2>

            <spring:bind path="answerForm.tAnswers">
                <div id = "tAnswer" class="form-group ${status.error ? 'has-error' : ''}">
                    <textarea type="text" name = "textA" path="answerForm.tAnswers[${text.textAnswer.size()}]" class="form-control" placeholder="Write your response in less than 200 words" style="width:200px;height:150px"></textarea>
                    <form:errors path="answerForm.tAnswers[${text.textAnswer.size()}]"></form:errors>
                </div>
            </spring:bind>


        </c:forEach> 
         <input type="email" id = "email" placeholder="Enter email address survey was sent to">  
        <button class="btn btn-lg btn-primary btn-block" onclick="submitSurvey()" type="submit">Submit</button>
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
  <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
  <script>
      function submitSurvey(){
            
            var rAnswers = document.getElementsByName("ratingA");
            var tAnswers = document.getElementsByName("textA");
            var email = document.getElementById("email").value;
            var rating = [];
            var text = [];
            var error = "";
            for (var i = 0 ; i < rAnswers.length; i++) {
                rating[i] = parseInt(rAnswers[i].value);
            }
            if(email === ""){
                error = "Email is empty";
            }
            if(error !== ""){
                alert(error);
            }else{
                for (var i = 0 ; i < tAnswers.length; i++) {
                    if(typeof tAnswers[i] === 'undefined'){
                        console.log(tAnswers[i]);
                        error = "Missing answer";
                        break;
                    }
                    text[i] = tAnswers[i].value;
                }
                if(error !== ""){
                    alert(error);
                }
                else{
                    var ratingJSON = JSON.stringify(rating);
                    var textJSON = JSON.stringify(text);
                    
                    var jsonObj = {
                            "rAnswers":JSON.parse(ratingJSON),
                            "tAnswers":JSON.parse(textJSON),
                            "email":{
                                "email_address":email
                            } 
                    };
                    var finalJSON = JSON.stringify(jsonObj)
                    console.log(finalJSON);
                    var url = window.location.href;
                    console.log(url);
                    $.ajax({
                        type : 'POST',
                        url : url,
                        contentType: 'application/json',
                        data : finalJSON,
                        success : function(data, status, xhr){
                            console.log(data);
                            alert(data)
                        },
                        error: function(xhr, status, error){
                          console.log(error);
                        }
                    });
                }
             }
        }
        function check_words(e) {
            var BACKSPACE   = 8;
            var DELETE      = 46;
            var MAX_WORDS   = 199;
            var valid_keys  = [BACKSPACE, DELETE];
            var words       = this.value.split(' ');

            if (words.length >= 199 && valid_keys.indexOf(e.keyCode) == -1) {
                e.preventDefault();
                words.length = 199;
                this.value = words.join(' ');
            }
        }

        var textarea = document.getElementsByName("textA");
        console.log(textarea);
        for(var i = 0; i < textarea.length; i++){
            textarea[i].addEventListener('keydown', check_words);
            textarea[i].addEventListener('keyup', check_words);
        }
  </script>
</body>
</html>