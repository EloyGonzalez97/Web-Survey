/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.survey.web.service;

import com.survey.web.model.Survey;
import com.survey.web.model.Email;
//import com.survey.web.model.User;
import com.survey.web.repository.SurveyRepository;
import com.survey.web.repository.UserRepository;
import com.survey.web.EmailConfig;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Pageable;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.stereotype.Service;

/**
 *
 * @author olive
 */
@Service
public class SurveyService {
    @Autowired
    private UserService userService;
    @Autowired
    private UserRepository userRepository;
    @Autowired
    private SurveyRepository surveyRepository;
    @Autowired
    private EmailConfig emailConfig;
    
    public List<Survey> getAllSurveys(String username){
        return userRepository.findByUsername(username).getSurveys();
        //return surveyRepository.findByUsername(username, pageable).getContent();
    }
    
    public Survey getSurvey(String username, long id){
        return userRepository.findByUsername(username).getSurveys().stream().filter(s -> s.getSurveyID() == id).findFirst().get();//surveyRepository.findById(id).get();
        //return user.getSurveys().stream().filter(s -> s.getSurveyID() == id).findFirst().get();  
    }
    
    public void save(String username,Survey survey) {
        survey.setUser(userRepository.findByUsername(username));
        List<Survey> surv = userRepository.findByUsername(username).getSurveys();
        boolean changed = false;
        for(Survey s: surv){
            if(s.getSurveyID() == survey.getSurveyID()){
                int index = surv.indexOf(s);
                surv.set(index, survey);
                changed = true;
            }
        }
        if(!changed){
            surv.add(survey);
            System.out.println("Survey id: "+survey.getSurveyID());
        }
        userRepository.findByUsername(username).setSurveys(surv);
        userRepository.save(userRepository.findByUsername(username));
        Survey s = userRepository.findByUsername(username).getSurveys().get(userRepository.findByUsername(username).getSurveys().size()-1);
        String url = "http://localhost:8080/answer/"+username+"/"+s.getSurveyID();
        sendEmail(s.getEmails(), url);
    }
    public void delete(String username, long id) {
        Survey survey = userRepository.findByUsername(username).getSurveys().stream().filter(s -> s.getSurveyID() == id).findFirst().get();
        survey.setUser(null);
        List<Survey> surv = userRepository.findByUsername(username).getSurveys();
        System.out.println("Size before:"+ surv.size());
        surv.remove(survey);
        System.out.println("Size after:"+ surv.size());
        userRepository.findByUsername(username).setSurveys(surv);
        userRepository.save(userRepository.findByUsername(username));
    }
    
    private void sendEmail(List<Email> emails, String url) {
        
        JavaMailSenderImpl mailSender = new JavaMailSenderImpl();
        mailSender.setHost(emailConfig.getHost());
        mailSender.setPort(emailConfig.getPort());
        mailSender.setUsername(emailConfig.getUsername());
        mailSender.setPassword(emailConfig.getPassword());

        for(Email e: emails){
            SimpleMailMessage mailMessage = new SimpleMailMessage();
            mailMessage.setFrom("eloygonzalez07@gmail.com");
            mailMessage.setTo(e.getEmail_address());
            mailMessage.setSubject("Submit Survey");
            mailMessage.setText(url);

            // Send mail
            mailSender.send(mailMessage);
        }
   }
    
}
