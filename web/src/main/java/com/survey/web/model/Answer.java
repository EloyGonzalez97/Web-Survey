/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.survey.web.model;

import java.util.List;

/**
 *
 * @author olive
 */
public class Answer {
    private List<Integer> rAnswers;
    private List<String> tAnswers;
    private Email email;

    public List<Integer> getrAnswers() {
        return rAnswers;
    }

    public void setrAnswers(List<Integer> rAnswers) {
        this.rAnswers = rAnswers;
    }

    public List<String> gettAnswers() {
        return tAnswers;
    }

    public void settAnswers(List<String> tAnswers) {
        this.tAnswers = tAnswers;
    }

    public Email getEmail() {
        return email;
    }

    public void setEmail(Email email) {
        this.email = email;
    }
    
}
