package com.example.demo.controller;

import java.io.UnsupportedEncodingException;
import java.util.List;
import javax.mail.MessagingException;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.repository.query.Param;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.core.annotation.CurrentSecurityContext;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.demo.UserRepository.userRepository;
import com.example.demo.entity.User;

import net.bytebuddy.utility.RandomString;

import com.example.demo.UserService.CustomUserDetails;
import com.example.demo.UserService.userService;

@Controller
public class CommonController {
	
	@Autowired
	private userService userService;
	
	//Index page
	@GetMapping("/")
	public String getHomePage(Model model, @CurrentSecurityContext(expression = "authentication?.name") String username) {
		User loggedInUser = userService.getUserByUsername(username);
		model.addAttribute("person", loggedInUser);
		return "index";
	}
	//About Page
	@GetMapping("/about")
	public String getAboutPage(Model model, @CurrentSecurityContext(expression = "authentication?.name") String username) {
		User loggedInUser = userService.getUserByUsername(username);
		model.addAttribute("person", loggedInUser);
		return "about";
	}
	
	//Contact Page
	@GetMapping("/contact")
	public String getContactPage(Model model, @CurrentSecurityContext(expression = "authentication?.name") String username) {
		User loggedInUser = userService.getUserByUsername(username);
		model.addAttribute("person", loggedInUser);
		return "contact";
	}
	
	//sign up page
	@GetMapping("/signup")
	public String signUp() {
		return "signup";
	}

	// register new user
		@PostMapping("/process_signup")
		public String registerNewUser(Model model, @ModelAttribute("user") User user, HttpServletRequest request) 
				throws UnsupportedEncodingException, MessagingException {
			
			// check if username/email already exists
			if(userService.getUserByUsername(user.getUsername()) != null) {
				model.addAttribute("error_string", "Username already exists!");
				return "signup";
			} else if(userService.getUserByEmail(user.getEmail()) != null) {
				String error_string = "Email already exists!";
				model.addAttribute("error_string", error_string);
				return "signup";
			}
			
			userService.register(user, getSiteURL(request));
			return "/";
		}
		
		// retrieve site url
		private String getSiteURL(HttpServletRequest request) {
			String siteURL = request.getRequestURL().toString();
			return siteURL.replace(request.getServletPath(), "");
		}
		
		// verify user
		@GetMapping("/verify")
		public String verifyUser(@Param("code") String code) {
			if(userService.verify(code)) {
				return "verify_success";
			} else {
				return "verify_fail";
			}
		}
	
		// get dashboard page
		@GetMapping("/dashboard")
		public String getDashboardPage(Model model, @AuthenticationPrincipal CustomUserDetails loggedinUser) {
			model.addAttribute("username", loggedinUser.getUsername());
			
			User user = userService.getUserByUsername(loggedinUser.getUsername());
			model.addAttribute("user_id", user.getId());
			
			List<User> users = userService.retrieveAllUserProfile();
			model.addAttribute("users", users);	
			
			long count = userService.countRegisteredUser();
			model.addAttribute("count", count);
			
			return "dashboard";
		}
		
		// get profile page
		@GetMapping("/profile")
		public String getProfilePage(Model model, @RequestParam("id") Integer user_id) {
			User user = userService.getUserById(user_id); //this should link to your service file
			model.addAttribute("user", user);
			return "profile";
			}
		
		@PostMapping("/update-profile")  
	    public String updateUserProfile(Model model, @ModelAttribute("user") User tmp, @RequestParam("id") Integer user_id) {
	        User user = userService.getUserById(user_id);

	        user.setFirstname(tmp.getFirstname());
	        user.setLastname(tmp.getLastname());
	        user.setCompany(tmp.getCompany());
	        user.setCity(tmp.getCity());
	        user.setCountry(tmp.getCountry());

	        userService.saveUser(user);

	        return "dashboard";  //back to the page you want
	    }
		
		
		@GetMapping("/forgot-password")
		public String forgotPasswordPage() {
			// show forgot password page, ask user to 
			// enter verified registered email
			return "forgot-password";
		}
		
		@PostMapping("/forgot-password")
		public String processForgotPassword(Model model, HttpServletRequest request) 
				throws UnsupportedEncodingException, MessagingException {
			
			String email = request.getParameter("email");
			
			if(userService.getUserByEmail(email) != null) {
				
				userService.generateResetPasswordToken(email, getSiteURL(request));
				model.addAttribute("error_success", "We have sent you a reset password link to your email. Please check.");
			} else {
				model.addAttribute("error_warning", "Opss!! user not found!");
			}
			
			return "forgot-password";
		}
		
		// reset password page
		@GetMapping("/reset-password")
		public String showResetPasswordPage(@Param(value = "token") String token, Model model) {
			
			User user = userService.getUserByResetPasswordToken(token);
			model.addAttribute("token", token);
			
			if(user == null) {
				model.addAttribute("message", "Invalid token");
				return "message";
			} else {
				model.addAttribute("email", user.getEmail());
			}
			
			return "reset-password";
		}
		
		//reset password method
		@PostMapping("/reset-password")
		public String processResetPassword(Model model, HttpServletRequest request) {
			
			String password = request.getParameter("password");
			String cpassword = request.getParameter("cpassword");
			String email = request.getParameter("email");
			
			if(password.equals(cpassword)) { // true, reset password
				System.out.println("email = " + email); // debugging purposes
				userService.updatePassword(email, cpassword);
				
				return "redirect:/";
				
			} else { // false
				model.addAttribute("error_warning", 
						"hey!! password not match!! Try again.");
				return "reset-password";
			}
		}
		
		@GetMapping("/verify-reset-password")
		public String verifyResetPasswordToken(@Param("code") String code) {
			User user = userService.getUserByResetPasswordToken(code);
			// if user exists, means verified user
		    if (user != null) {
		    	userService.resetPasswordToken(code);
		    	String url = "redirect:reset-password?email=" + user.getEmail();
		        return url;
		    } else {
		        return "redirect:verify-fail";
		    }
		}
		
		@GetMapping("/verify_fail")
		public String verifyFailPage() {
			return "verify_fail";
		}
		
		// search public profile by keyword
		@PostMapping("/dashboard")
		public String search(Model model, HttpServletRequest request, @AuthenticationPrincipal CustomUserDetails loggedinUser) {
			model.addAttribute("username", loggedinUser.getUsername());
			
			CustomUserDetails user = (CustomUserDetails) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
			User person = userService.getUserByUsername(user.getUsername());
			model.addAttribute("user_id", person.getId());
			
			String keyword = request.getParameter("keyword");
			List<User> users = userService.search(keyword);
			Integer count = users.size();
			
			model.addAttribute("count", count);
			model.addAttribute("users", users);
			return "dashboard";
		}
}