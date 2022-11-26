package com.example.demo.UserService;

import java.time.LocalDateTime;
import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.entity.post;
import com.example.demo.entity.User;
import com.example.demo.UserRepository.PostRepository;

@Service
@Transactional
public class PostService {
	
	@Autowired
	private PostRepository postRepository;
	
	// default constructor
	public PostService(PostRepository postRepository) {
		this.postRepository = postRepository;
	}
	
	public List<post> getAllJobs() {
		return postRepository.findAll();
	}
	
	public List<post> getAllOpeningJobs() {
		return postRepository.findAllOpeningJobs();
	}
	
	public void createPost(post post, User user) {
		post.setCreatedOn(LocalDateTime.now());
		post.setUpdatedOn(LocalDateTime.now());
		post.setUser(user);
		post.setStatus(true);
		
		postRepository.save(post);
	}
	
	public post savePost(post post, User user) {
		post.setCreatedOn(LocalDateTime.now());
		post.setUpdatedOn(LocalDateTime.now());
		post.setUser(user);
		post.setStatus(true);
		
		return postRepository.save(post);
	}
	
	public List<post> findAllPostByUserId(Integer user_id) {
		return postRepository.findAllPostsByUserId(user_id);
	}
	
	public void deletePost(Integer post_id) {
		postRepository.deleteById(post_id);
	}
	
	public post getPostById(Integer post_id) {
		return postRepository.findById(post_id).get();
	}
	
	public void updatePost(Integer post_id, post tmp) {
		post post = postRepository.findById(post_id).get();
		
		post.setPosition(tmp.getPosition());
		post.setSalary(tmp.getSalary());
		post.setContent(tmp.getContent());
		post.setCompany(tmp.getCompany());
		post.setCity(tmp.getCity());
		post.setCountry(tmp.getCountry());
		post.setStatus(tmp.getStatus());
		
		post.setUpdatedOn(LocalDateTime.now());
		postRepository.save(post);
	}

}