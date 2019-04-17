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
@Table(name = "tQuestion")
public class TextQuestion implements Serializable {
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
   
   
    @ElementCollection(targetClass=String.class)
    private List<String> textAnswer;

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

    public Survey getSurvey() {
        return survey;
    }

    public void setSurvey(Survey survey) {
        this.survey = survey;
    }

    public List<String> getTextAnswer() {
        return textAnswer;
    }

    public void setTextAnswer(List<String> textAnswer) {
        this.textAnswer = textAnswer;
    }
    

   
    
    
}
