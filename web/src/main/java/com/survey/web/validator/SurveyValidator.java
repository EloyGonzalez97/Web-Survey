/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.survey.web.validator;

import com.survey.web.model.Survey;
import com.survey.web.service.SurveyService;
import java.util.Date;
import org.apache.commons.lang3.time.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

@Component
public class SurveyValidator implements Validator {
    @Autowired
    private SurveyService surveyService;

    @Override
    public void validate(Object o, Errors errors) {
        Survey survey = (Survey) o;

        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "title", "NotEmpty");
        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "description", "NotEmpty");
        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "emails[0].email_address", "NotEmpty");
        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "ratingQuestions[0].questionText", "NotEmpty");
        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "textQuestions[0].questionText", "NotEmpty");
        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "startDate", "NotEmpty");
        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "endDate", "NotEmpty");
        if(survey != null && survey.getEmails().isEmpty()){
            errors.rejectValue("emails[0].email_address", "Size.surveyForm.emails");
        }else{
            for(int i = 0; i < survey.getEmails().size(); i++ ){
                survey.getEmails().get(i).setSurvey(survey);
                if(survey.getEmails().get(i).getEmail_address().isEmpty()){
                    errors.rejectValue("emails[" + i + "].email_address", "NotEmpty");
                }
            }
        }
        if(survey != null && survey.getRatingQuestions().isEmpty()){
            errors.rejectValue("ratingQuestions", "Size.surveyForm.ratingQuestions[0].questionText");
        }else{
            for(int i = 0; i < survey.getRatingQuestions().size(); i++ ){
                survey.getRatingQuestions().get(i).setSurvey(survey);
                if(survey.getRatingQuestions().get(i).getQuestionText().isEmpty()){
                    errors.rejectValue("ratingQuestions[" + i + "].questionText", "NotEmpty");
                }
            }
        }
        if(survey != null && survey.getTextQuestions().isEmpty()){
            errors.rejectValue("textQuestions", "Size.surveyForm.textQuestions[0].questionText");
        }else{
            for(int i = 0; i < survey.getTextQuestions().size(); i++ ){
                survey.getTextQuestions().get(i).setSurvey(survey);
                if(survey.getTextQuestions().get(i).getQuestionText().isEmpty()){
                    errors.rejectValue("textQuestions[" + i + "].questionText", "NotEmpty");
                }
            }
        }
        if(survey != null && survey.getStartDate() == null){
            errors.rejectValue("startDate", "Size.surveyForm.startDate");
        }else{
            Date newDate = DateUtils.addHours(survey.getStartDate(), 4);
            survey.setStartDate(newDate);
        }
        if(survey != null && survey.getEndDate() == null){
            errors.rejectValue("endDate", "Size.surveyForm.endDate");
        }else{
            Date newDate = DateUtils.addHours(survey.getEndDate(), 28);
            survey.setEndDate(newDate);
        }
    }

    @Override
    public boolean supports(Class<?> aClass) {
        return Survey.class.equals(aClass);    
    }
}
