package com.foodapp.dao;

import com.foodapp.model.User;

public interface UserDAO {

    void registerUser(User user);

    User loginUser(String email, String password);
    
    void updateUser(User user);

}