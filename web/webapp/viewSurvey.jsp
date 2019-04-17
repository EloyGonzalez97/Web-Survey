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
			</a>
        </div> <!-- end header__logo -->

        

        <a class="header__toggle-menu" href="#0" title="Menu"><span>Menu</span></a>
        <nav class="header__nav-wrap">

            <h2 class="header__nav-heading h6">Navigate to</h2>

            <ul class="header__nav">
				<li><a href="http://localhost:8080/${pageContext.request.userPrincipal.name}/surveys" title="">View Surveys</a></li>
                <li><a href="http://localhost:8080/${pageContext.request.userPrincipal.name}/create" title="">Create Survey</a></li>
				 <li><a href="http://localhost:8080/" title="">Home</a></li
            </ul> <!-- end header__nav -->
            <a href="#0" title="Close Menu" class="header__overlay-close close-mobile-menu">Close</a>

        </nav> <!-- end header__nav-wrap -->

    </header> <!-- s-header -->

    <section class="s-content s-content--top-padding s-content--narrow">
		
		
        <div class="row">
            <div class="col-full s-content__main">
  <div id ="print">    
     <h2 id = "title">Title: ${survey.title}</h2>
     <h3 id = "description">Description: ${survey.description}</h3>
    <c:forEach items="${survey.emails}" var="email">
            <li class = "ls" name = "emails">Email: ${email.email_address}</li>
    </c:forEach>
    <h3 id = "sDate">Start Date: ${survey.startDate}</h3>
    <h3 id = "eDate">End Date: ${survey.endDate}</h3>
	<h1> Questions </h1>
    <c:forEach items="${survey.ratingQuestions}" var="rating">
        <div>
			
            <h2 name = "rQuestions">${rating.questionText}</h2>
            <c:forEach items="${rating.ratingAnswer}" var="ans">
                <li class = "ls" name = "rAnswers">${ans}</li>
            </c:forEach>
        </div>
    </c:forEach>
    <c:forEach items="${survey.textQuestions}" var="text">
            <div>
            <h2 name = "tQuestions">${text.questionText}</h2>
            <c:forEach items="${text.textAnswer}" var="ans">
                <li class = "ls" name = "tAnswers">${ans}</li>
            </c:forEach>
        </div>
    </c:forEach> 
  </div>
  </div>
    <button class="btn btn-lg btn-primary btn-block" onclick="deleteSurvey()" type="submit">Delete</button>
    <button class="btn btn-lg btn-primary btn-block" onclick="window.print()" type="submit">Print</button>
    <button class="btn btn-lg btn-primary btn-block" onclick="saveSurvey()" type="submit">Save</button>
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

  <script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/1.5.3/jspdf.debug.js" integrity="sha384-NaWTHo/8YCBYJ59830LTz/P4aQZK1sS0SneOgAvhsIl3zBu8r9RevNg5lHCHAuQ/" crossorigin="anonymous"></script>
  <script src="https://github.com/MrRio/jsPDF/tree/master/dist/jspdf.min.js"></script>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
  <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
  <script>
    function deleteSurvey(){
        var url = window.location.href;
        $.ajax({
        type : 'DELETE',
        url : url,
        contentType: 'text/html',
        data : "string"
        });
		window.location.href = "http://localhost:8080/${pageContext.request.userPrincipal.name}/surveys";
    }
    function saveSurvey(){
	var title = document.getElementById("title").innerText;
	var description = document.getElementById("description").innerText;
	var startDate = document.getElementById("sDate").innerText;
	var endDate = document.getElementById("eDate").innerText;
	var rAnswers = document.getElementsByName("rAnswers");
	var tAnswers = document.getElementsByName("tAnswers");
	var rQuestions = document.getElementsByName("rQuestions");
	var tQuestions = document.getElementsByName("tQuestions");
	var emails = document.getElementsByName("emails");
		
		var rAnswersString = '';
		var rQuestionsString = '';
		var tAnswersString = '';
		var tQuestionsString = '';
		var emailsString = '';
		
		for(i = 0; i < emails.length; i++){
			console.log(emails[i].innerText);
			
			 emailsString += emails[i].innerText+'\n';
		}

		for (i = 0; i < rQuestions.length; i++)
		{			
			rQuestionsString += 'Q: '+rQuestions[i].innerText + '\n';

			for(j = 0 ; j < emails.length; j++)
			{
				if(j < rAnswers.length){
					rQuestionsString += 'A: '+rAnswers[i+j].innerText +'\n';
				}
			}
		}
		
		
		for (i = 0; i < tQuestions.length; i++)
		{			
			tQuestionsString += 'Q: '+tQuestions[i].innerText + '\n';
			for(j = 0 ; j < emails.length; j++)
			{
				if(j < tAnswers.length){
					tQuestionsString += 'A: '+tAnswers[i+j].innerText +'\n';
				}
			}
		}
		
		console.log(rQuestions);
		console.log(rQuestionsString);
		console.log(tQuestionsString);
		console.log(rAnswersString);
		console.log(tAnswersString);
        var doc = new jsPDF();

		doc.text(10,10, 'Survey Title:\n' + title + '\n\nSurvey Description: \n' + description + 
		'\n\nEmails: \n' + emailsString +
		'\n' + startDate + 
		'\n' + endDate  +
		'\n\nRating Questions and Answers:\n' + rQuestionsString +
		'\n\nText Questions and Answers:\n' + tQuestionsString
		);
        //doc.text(40,40, 'Hello whats up');
        doc.save('survey.pdf');
    }
  </script>
</body>
</html>