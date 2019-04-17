/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.survey.web.validator;

import com.survey.web.model.Answer;
import com.survey.web.model.RatingQuestion;
import com.survey.web.model.TextQuestion;
import com.survey.web.service.SurveyService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

@Component
public class AnswerValidator implements Validator {
    @Autowired
    private SurveyService surveyService;

    @Override
    public void validate(Object o, Errors errors) {
        Answer question = (Answer) o;

        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "rAnswers[0]", "NotEmpty");

        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "tAnswers[0]", "NotEmpty");
        if(question != null && question.gettAnswers().isEmpty()){
            errors.rejectValue("tAnswers[0]", "NotEmpty");
        }else{
            for(int i = 0; i < question.gettAnswers().size(); i++ ){
                
                if(question.gettAnswers().get(i).isEmpty()){
                    errors.rejectValue("tAnswers[" + i + "]", "NotEmpty");
                }
            }
        }
    }

    @Override
    public boolean supports(Class<?> aClass) {
        return Answer.class.equals(aClass);    
    }
}
