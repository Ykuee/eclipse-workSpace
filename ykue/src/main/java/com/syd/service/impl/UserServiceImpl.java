package com.syd.service.impl;  
  
import javax.annotation.Resource;  
  
import org.springframework.stereotype.Service;  
  
import com.syd.controller.IUserDAO;
import com.syd.pojo.User;
import com.syd.service.IUserService;
  
@Service("userService")  
public class UserServiceImpl implements IUserService { 
    @Resource  
    private IUserDAO userDao;  
 
    public User getUserById(int userId) {  
        // TODO Auto-generated method stub  
        return this.userDao.selectByPrimaryKey(userId);  
    }
}