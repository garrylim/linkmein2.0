package com.example.demo.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import com.example.demo.UserService.CustomUserDetails;
import com.example.demo.UserService.PostService;
import com.example.demo.UserService.userService;
import com.example.demo.entity.User;
import com.example.demo.entity.post;


@Controller
public class PostController {
	
	@Autowired
	private userService userService;
	
	@Autowired
	private PostService postService;
	
	@GetMapping("/job")
	public String getJobPost(Model model, @AuthenticationPrincipal CustomUserDetails loggedinUser) {
		User user = userService.getUserByUsername(loggedinUser.getUsername());
		model.addAttribute("username", loggedinUser.getUsername());
		model.addAttribute("user_id", user.getId());
		
		List<post> jobs = postService.getAllOpeningJobs();
		if(jobs == null) {
			model.addAttribute("error_string_warning", "No jobs opportunities found.");
			return "job";
			
		} else {
			model.addAttribute("error_string_success", "Got jobs opening!");
			model.addAttribute("count", jobs.size());
			model.addAttribute("jobs", jobs);
			return "job";
		}
	}
	
	@GetMapping("/newJob")
	public String getNewPost(Model model, @AuthenticationPrincipal CustomUserDetails loggedinUser) {
		User user = userService.getUserByUsername(loggedinUser.getUsername());
		model.addAttribute("username", loggedinUser.getUsername());
		model.addAttribute("user_id", user.getId());
		
		return "new-post";
	}
	
	@PostMapping("/newJob")
	public String createNewPost(Model model, @ModelAttribute("post") post post,
			@AuthenticationPrincipal CustomUserDetails loggedinUser) {
		
		if(post.getPosition() != null && post.getSalary() != null &&
				post.getContent() != null && post.getCompany() != null && 
				post.getCity() != null && post.getCountry() != null) {
			
			User user = userService.getUserByUsername(loggedinUser.getUsername());
			postService.createPost(post, user);
			return "redirect:job";
			
		} else {
			model.addAttribute("error_string_warning", "Cannot post job. Check your post and try again.");
			return "new-post";
		}
		
	}
	
	@GetMapping("/manageJob")
	public String getManageJob(Model model, @AuthenticationPrincipal CustomUserDetails loggedinUser) {
		User user = userService.getUserByUsername(loggedinUser.getUsername());
		model.addAttribute("username", loggedinUser.getUsername());
		model.addAttribute("user_id", user.getId());
		List<post> jobs = postService.findAllPostByUserId(user.getId());
		
		if(jobs == null) {
			model.addAttribute("error_string_warning", "No posts found.");
			return "manage-post";
		} else {
			model.addAttribute("error_string_success", "(" + jobs.size() + ") posts found.");
			model.addAttribute("jobs", jobs);
			return "manage-post";
		}
	}
	
	@PostMapping("/delete-post")
	public String deletePost(Model model, HttpServletRequest request) {
		String post_id = request.getParameter("id");
		System.out.println("post_id = " + post_id); // debugging purposes
		
		if(post_id == null) {
			model.addAttribute("error_string_warning", "Cannot delete post. Please try again");
			return "manage-post";
		} else {
			model.addAttribute("error_string_success", "Post deleted successfully.");
			postService.deletePost(Integer.parseInt(post_id));
			return "redirect:manageJob";
		}
	}
	
	
	@GetMapping("/edit-post")
	public String editPost(Model model, HttpServletRequest request,
			@AuthenticationPrincipal CustomUserDetails loggedinUser) {
		User user = userService.getUserByUsername(loggedinUser.getUsername());
		model.addAttribute("username", loggedinUser.getUsername());
		model.addAttribute("user_id", user.getId());
		
		String post_id = request.getParameter("id");
		post post = postService.getPostById(Integer.parseInt(post_id));
		
		model.addAttribute("job", post);
		return "edit-post";
	}
	
	@PostMapping("/update-post")
	public String updatePost(Model model, HttpServletRequest request,
			@ModelAttribute("job") post post) {
		String post_id = request.getParameter("id");
		String status = request.getParameter("status");
		
		postService.updatePost(Integer.parseInt(post_id), post);
		return "redirect:manageJob";
	}
	
}
