/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.survey.web.model;

import java.io.Serializable;
import java.util.List;
import javax.persistence.*;
import javax.validation.constraints.*;

/**
 *
 * @author olive
 */
@Entity
@Table(name = "rQuestion")
public class RatingQuestion implements Serializable {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "questionID")
    private long id;
    
    @JoinColumn(name="surveyID")
    @ManyToOne(cascade=CascadeType.ALL)
    private Survey survey;
    
    @NotNull
    @NotEmpty
    private String questionText;
   
   
    @ElementCollection(targetClass=Integer.class)
    private List<Integer> ratingAnswer;

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public String getQuestionText() {
        return questionText;
    }

    public void setQuestionText(String questionText) {
        this.questionText = questionText;
    }

    public List<Integer> getRatingAnswer() {
        return ratingAnswer;
    }

    public void setRatingAnswer(List<Integer> ratingAnswer) {
        this.ratingAnswer = ratingAnswer;
    }

    public Survey getSurvey() {
        return survey;
    }

    public void setSurvey(Survey survey) {
        this.survey = survey;
    }
    
   
    
    
}
