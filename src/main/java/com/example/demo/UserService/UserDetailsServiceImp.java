package com.example.demo.UserService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;

import com.example.demo.UserRepository.userRepository;
import com.example.demo.entity.User;

public class UserDetailsServiceImp implements UserDetailsService {
	
	@Autowired
	private userRepository userRepository;

	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		User user = userRepository.findUserByEmail(username);
		
		if(user == null) {
			throw new UsernameNotFoundException("user not found.");
		}
		
		return new CustomUserDetails(user);
	}
}
