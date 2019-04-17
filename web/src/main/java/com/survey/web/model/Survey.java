/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.survey.web.model;

import com.survey.web.model.RatingQuestion;
import java.io.Serializable;
import java.time.LocalDate;
import java.time.Period;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import javax.persistence.*;
import org.hibernate.annotations.OnDelete;
import org.hibernate.annotations.OnDeleteAction;
import static org.hibernate.engine.internal.Cascade.cascade;
import org.springframework.format.annotation.DateTimeFormat;

/**
 *
 * @author olive
 */
@Entity
@Table(name = "survey")
public class Survey implements Serializable {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "surveyID")
    private long surveyID;
    
    private String title;
    
    @OneToMany(mappedBy="survey", cascade=CascadeType.ALL)
    //@JoinColumn(name = "emailID")
    private List<Email> emails = new ArrayList<>();
    
    private String description;
    @DateTimeFormat(iso = DateTimeFormat.ISO.DATE)
    private Date startDate;
     @DateTimeFormat(iso = DateTimeFormat.ISO.DATE)
    private Date endDate;
    //private Period period = Period.between(startDate, endDate);
    
    @OneToMany(mappedBy="survey", cascade=CascadeType.ALL) 
    //@JoinColumn(name = "questionID")
    private List<RatingQuestion> ratingQuestions  = new ArrayList<>();
    
    @OneToMany(mappedBy="survey", cascade=CascadeType.ALL) 
    //@JoinColumn(name = "questionID")
    private List<TextQuestion> textQuestions  = new ArrayList<>();
    
    @ManyToOne
    @JoinColumn
    private User user1;
    
    public Survey(){
    }

    public Survey(String title, String description) {
        this.title = title;
        this.description = description;
    }

    public long getSurveyID() {
        return surveyID;
    }

    public void setSurveyID(long surveyID) {
        this.surveyID = surveyID;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public List<Email> getEmails() {
        return emails;
    }

    public void setEmails(List<Email> emails) {
        this.emails = emails;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public Date getStartDate() {
        return startDate;
    }

    public void setStartDate(Date startDate) {
        this.startDate = startDate;
    }

    public Date getEndDate() {
        return endDate;
    }

    public void setEndDate(Date endDate) {
        this.endDate = endDate;
    }

    public List<RatingQuestion> getRatingQuestions() {
        return ratingQuestions;
    }

    public void setRatingQuestions(List<RatingQuestion> ratingQuestions) {
        this.ratingQuestions = ratingQuestions;
    }

    public List<TextQuestion> getTextQuestions() {
        return textQuestions;
    }

    public void setTextQuestions(List<TextQuestion> textQuestions) {
        this.textQuestions = textQuestions;
    }

    public User getUser() {
        return user1;
    }
    public void setUser(User user1) {
        this.user1 = user1;
    }
    
    
    
}
