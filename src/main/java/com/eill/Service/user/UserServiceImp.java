package com.eill.Service.user;

import com.eill.Pojo.User;
import com.eill.Repository.user.UserDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.transaction.Transactional;

@Service("userService")
@Transactional
public class UserServiceImp implements UserService {
    @Autowired
    private UserDao userDao;
    @Override
    public void registerUser(User user) {
        userDao.save(user);
    }

    @Override
    public User checkUserName(String username) {
      return  userDao.findUserByUsername(username);
    }

    @Override
    public User findByUsernameId(String username) {
        return  userDao.findByUsername(username);
    }

    public void updateUser(String phonenumber,String address,String userid){
        userDao.updateUser(phonenumber,address,userid);
    }

    @Override
    public void saveUser(User user) {
        userDao.saveAndFlush(user);
    }
}
