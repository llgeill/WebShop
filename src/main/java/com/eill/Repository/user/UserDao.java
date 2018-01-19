package com.eill.Repository.user;

import com.eill.Pojo.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;

import java.util.List;


public interface UserDao extends JpaRepository<User,String> {
    public User findByUsername(String username);
    public User findUserByUsername(String username);
    @Modifying
    @Query("update User u set u.phonenumber=?1,u.address=?2 where u.id=?3")
    public void updateUser(String phonenumber,String address,String userid);
}
