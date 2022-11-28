package com.example.demo.UserRepository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.example.demo.entity.post;

@Repository
public interface PostRepository extends JpaRepository<post, Integer> {
	@Query("SELECT p FROM post p WHERE p.user.id = :id")
	public List<post> findAllPostsByUserId(Integer id);
	
	@Query("SELECT p FROM post p WHERE p.status = TRUE")
	public List<post> findAllOpeningJobs();
}