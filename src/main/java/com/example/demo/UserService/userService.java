package com.example.demo.UserService;

import java.io.UnsupportedEncodingException;
import java.util.Collection;
import java.util.List;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;
import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import com.example.demo.entity.User;
import com.example.demo.UserRepository.userRepository;

import net.bytebuddy.utility.RandomString;

@Service
@Transactional
public class userService {

	@Autowired
	private userRepository userRepository;
	
	// save, update user object
	public void saveUser(User user) {
		userRepository.save(user);
	}
	
	public long countRegisteredUser() {
		return userRepository.count();
	}
	
	public User getUserByUsername(String username) {
		return userRepository.findUserByUsername(username);
	}
	
	public User getUserById(Integer id) {
		return userRepository.findById(id).get();
	}
	
	 // return all user information
	public List<User> retrieveAllUserProfile() {
		return userRepository.findAll();
	}
	
	public List<User> search(String keyword) {
		return userRepository.search(keyword);
	}
	
	
	
	@Autowired
	private JavaMailSender mailSender;
	
	
	public void register(User user, String siteURL)
			throws UnsupportedEncodingException, MessagingException {
		
		// check if username already exist!
		
		BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
		String encodedPassword = passwordEncoder.encode(user.getPassword());
	    user.setPassword(encodedPassword);
	     
	    String randomCode = RandomString.make(64);
	    user.setVerificationCode(randomCode);
	    user.setEnabled(false);
	     
	    userRepository.save(user);
	     
	    sendVerificationEmail(user, siteURL);
	}
	
	public void sendVerificationEmail(User user, String siteURL)
			throws UnsupportedEncodingException, MessagingException {
		
		String toAddress = user.getEmail();
	    String fromAddress = "linkedmein.project@gmail.com";
	    String senderName = "LinkedMeIn Team";
	    String subject = "Please verify your registration";
	    String content = "Dear [[name]],<br>"
	            + "Please click the link below to verify your registration:<br>"
	            + "<h3><a href=\"[[URL]]\" target=\"_self\">VERIFY</a></h3>"
	            + "Thank you,<br>"
	            + "LinkedMeIn Team.";
	    
	    MimeMessage message = mailSender.createMimeMessage();
	    MimeMessageHelper helper = new MimeMessageHelper(message);
	    
	    helper.setFrom(fromAddress, senderName);
	    helper.setTo(toAddress);
	    helper.setSubject(subject);
	    
	    content = content.replace("[[name]]", user.getUsername());
	    String verifyURL = siteURL + "/verify?code=" + user.getVerificationCode();
	     
	    content = content.replace("[[URL]]", verifyURL);
	     
	    helper.setText(content, true);
	     
	    mailSender.send(message);
	}
	
	public boolean verify(String verificationCode) {
	    User user = userRepository.findByVerificationCode(verificationCode);
	     
	    if (user == null || user.isEnabled()) {
	        return false;
	    } else {
	        user.setVerificationCode(null);
	        user.setEnabled(true);
	        userRepository.save(user);
	        return true;
	    }    
	}
		
	public void updateProfile(User tmp) {

		User user = userRepository.findById(tmp.getId()).get();
		
		// start update user profile information
		user.setUsername(tmp.getUsername());
		user.setEmail(tmp.getEmail());
		user.setFirstname(tmp.getFirstname());
		user.setLastname(tmp.getLastname());
		user.setCity(tmp.getCity());
		user.setCompany(tmp.getCompany());
		user.setCountry(tmp.getCountry());
	}
	
	public User getUserByEmail(String email) {
		return userRepository.findUserByEmail(email);
	}
	
	// if user exists, generate reset password token
	public void generateResetPasswordToken(String email, String siteURL) 
			throws UnsupportedEncodingException, MessagingException {
		String token = RandomString.make(6); // generate 6 characters of token
		User user = userRepository.findUserByEmail(email);
		user.setResetPasswordToken(token);
		userRepository.save(user);
		
		sendVerificationForgotPassword(user, siteURL);
	}
	
	public void sendVerificationForgotPassword(User user, String siteURL)
			throws UnsupportedEncodingException, MessagingException {
		
		String toAddress = user.getEmail();
	    String fromAddress = "linkedmein.project@gmail.com";
	    String senderName = "LinkedMeIn Team";
	    String subject = "Please verify your forgot password token";
	    String content = "Dear [[name]],<br>"
	            + "Please click the link below to verify your reset password token:<br>"
	            + "<h3><a href=\"[[URL]]\" target=\"_self\">VERIFY</a></h3>"
	            + "Thank you,<br>"
	            + "LinkedMeIn Team.";
	    
	    MimeMessage message = mailSender.createMimeMessage();
	    MimeMessageHelper helper = new MimeMessageHelper(message);
	    
	    helper.setFrom(fromAddress, senderName);
	    helper.setTo(toAddress);
	    helper.setSubject(subject);
	    
	    content = content.replace("[[name]]", user.getUsername());
	    String verifyURL = siteURL + "/verify-reset-password?code=" + user.getResetPasswordToken();
	     
	    content = content.replace("[[URL]]", verifyURL);
	     
	    helper.setText(content, true);
	     
	    mailSender.send(message);
	}
	
	// if user is verified, reset token, allows user to update password
	public User getUserByResetPasswordToken(String code) {
		return userRepository.findUserByResetPasswordToken(code);
	}
	
	
	public void resetPasswordToken(String code) {
		User user = userRepository.findUserByResetPasswordToken(code);
		user.setResetPasswordToken(null);
		userRepository.save(user);
	}
	
	// user update new password
	public void updatePassword(String email, String password) {
		BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
		String encodedPassword = passwordEncoder.encode(password);
		
		User user = userRepository.findUserByEmail(email);
		user.setPassword(encodedPassword);
		
		userRepository.save(user);
	}
}