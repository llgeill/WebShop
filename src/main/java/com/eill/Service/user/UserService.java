package com.eill.Service.user;

import com.eill.Pojo.User;

public interface UserService {
    public void registerUser(User user);
    public User checkUserName(String username);
    public User findByUsernameId(String username);
    public void updateUser(String phonenumber,String address,String userid);
    public void saveUser(User user);
}
