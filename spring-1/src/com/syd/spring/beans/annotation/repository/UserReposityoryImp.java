 package com.syd.spring.beans.annotation.repository;

import org.springframework.stereotype.Repository;

@Repository
public class UserReposityoryImp implements UserRepository{

	@Override
	public void save() {
		System.out.println("save");
	}
	

}
