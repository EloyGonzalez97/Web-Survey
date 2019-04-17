/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.survey.web.controller;

import com.survey.web.service.SurveyService;
import com.survey.web.model.Survey;
import com.survey.web.model.Answer;
import com.survey.web.model.Email;
import com.survey.web.validator.SurveyValidator;
import com.survey.web.validator.AnswerValidator;
import com.survey.web.EmailConfig;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import org.apache.commons.lang3.time.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

/**
 *
 * @author olive
 */
@Controller
public class SurveyController {
  
    @Autowired
    private SurveyService surveyService;
    
    @Autowired
    private SurveyValidator surveyValidator;
    @Autowired
    private AnswerValidator answerValidator;
    
    @GetMapping("/{name}/surveys")
    public String getAllSurveys(ModelMap model, @PathVariable (value = "name") String name){

        //surveyService.SurveyService(username);
        model.put("surv", surveyService.getAllSurveys(name));
        return "surveys";
    }
    @GetMapping("/{name}/surveys/{surveyID}")
    public String getSurvey(@PathVariable (value = "name") String name, ModelMap model, @PathVariable long surveyID){
        model.put("survey", surveyService.getSurvey(name, surveyID));
        return "viewSurvey";
    }
    @DeleteMapping("/{name}/surveys/{surveyID}")
    @ResponseBody
    public String deleteSurvey(@PathVariable (value = "name") String name, ModelMap model, @PathVariable long surveyID, @RequestBody String string){
        System.out.println("in delete");
        surveyService.delete(name, surveyID);
        return "redirect:/{name}/surveys";
    }
    @GetMapping("/{name}/create")
    public String createSurvey(Model model){
        model.addAttribute("surveyForm", new Survey());
        return "createSurvey";
    }
    @PostMapping("/{name}/create")
    public String addSurvey(@PathVariable (value = "name") String name, @ModelAttribute("surveyForm") Survey surveyForm, BindingResult bindingResult){
        surveyValidator.validate(surveyForm, bindingResult);
        
        if (bindingResult.hasErrors()) {
            return "createSurvey";
        }
        
        surveyService.save(name, surveyForm);
        System.out.println("Survey id: "+surveyForm.getSurveyID());
        return "redirect:/{name}/surveys";
    }
    @GetMapping("/answer/{name}/{surveyID}")
    public String showSurvey(@PathVariable (value = "name") String name, ModelMap model, @PathVariable long surveyID){
        Survey surv =surveyService.getSurvey(name, surveyID);
        Date today = DateUtils.truncate(new Date(), Calendar.DAY_OF_MONTH);
        if(surv == null){
            model.put("error", "Survey does not exist");
            return "error";
        }
        else if(surv.getStartDate().compareTo(today) > 0){
            model.put("error", "Survey has not started.");
            return "error";
        }
        else if(surv.getEndDate().compareTo(today) < 0){
            model.put("error", "Survey has concluded.");
            return "error";
        }
        else{
            model.put("survey", surv);
            model.put("answerForm", new Answer());
            return "answerSurvey";
        }
    }
    @PostMapping("/answer/{name}/{surveyID}")
    @ResponseBody
    public String editSurvey(@PathVariable (value = "name") String name, @PathVariable long surveyID, @RequestBody Answer answer, BindingResult bindingResult, ModelMap model){
        Survey surv = surveyService.getSurvey(name, surveyID);
        List<Integer> rAnswers = answer.getrAnswers();
        List<String> tAnswers = answer.gettAnswers();
        for(int i = 0; i < surv.getRatingQuestions().size(); i++){
            List<Integer> answers = surv.getRatingQuestions().get(i).getRatingAnswer();
            answers.add(rAnswers.get(i));
            surv.getRatingQuestions().get(i).setRatingAnswer(answers);
        }
        for(int i = 0; i < surv.getTextQuestions().size(); i++){
            List<String> answers = surv.getTextQuestions().get(i).getTextAnswer();
            answers.add(tAnswers.get(i));
            surv.getTextQuestions().get(i).setTextAnswer(answers);
        }
        boolean found = false;
        for(Email e: surv.getEmails()) {
			console.log(answer.getEmail().getEmail_address());
            if(e.getEmail_address().equalsIgnoreCase(answer.getEmail().getEmail_address())){
                found = true;
                int index  = surv.getEmails().indexOf(e);
                if(surv.getEmails().get(index).getCompleted()){
                    return "You have already submitted this survey!";
                }else{
                    surv.getEmails().get(index).setCompleted(true);
                }
            }
        }
        if(!found){
            System.out.println("email not found");
            return "Re-enter the correct email the survey was sent to.";
        }
        surveyService.save(name, surv);
        return "You have successfully submitted the survey.";
    }
    @GetMapping("/error")
    public String error(){
        return "error";
    }
   
}
