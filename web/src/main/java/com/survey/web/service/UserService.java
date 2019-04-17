/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.survey.web.service;

import com.survey.web.model.User;

public interface UserService {
    void save(User user1);

    User findByUsername(String username);
}
