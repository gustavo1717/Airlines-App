package com.synergisticit.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.synergisticit.domain.User;

@Service
public interface UserService {

	public List<User> findAll();
	public User save(User u);
	public void deleteUserById(long uId);
	public User findByUserId(long uId);
	public User findByUserName(String userName);
	
}
