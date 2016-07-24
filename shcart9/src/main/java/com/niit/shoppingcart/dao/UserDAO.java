package com.niit.shoppingcart.dao;

import java.util.List;

import com.niit.shoppingcart.model.CustomerModel;
import com.niit.shoppingcart.model.User;
import com.niit.shoppingcart.model.UserDetails;

public interface UserDAO {
public List<User> list();
public User get(String id);
public void saveOrUpdate(CustomerModel cd);
public void saveOrUpdate(UserDetails userDetails);
public void delete(String id);
public boolean isValidUser(String id,String name, boolean isAdmin);

}
