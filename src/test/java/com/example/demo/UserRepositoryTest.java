package com.example.demo;

import static org.assertj.core.api.Assertions.assertThat;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.jdbc.AutoConfigureTestDatabase;
import org.springframework.boot.test.autoconfigure.jdbc.AutoConfigureTestDatabase.Replace;
import org.springframework.boot.test.autoconfigure.orm.jpa.DataJpaTest;
import org.springframework.boot.test.autoconfigure.orm.jpa.TestEntityManager;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.test.annotation.Rollback;

import com.example.demo.entity.User;
import com.example.demo.UserRepository.userRepository;

@DataJpaTest
@AutoConfigureTestDatabase(replace = Replace.NONE)
@Rollback(true)
public class UserRepositoryTest {
	
	@Autowired
	private userRepository userRepository;
	
	@Autowired
	private TestEntityManager em;
	
	@Test
	public void test_user_creation() {
		User user = new User();
		user.setUsername("test");
		user.setEmail("test@example.com");

		BCryptPasswordEncoder pe = new BCryptPasswordEncoder();
		user.setPassword(pe.encode("password"));
		
		User savedUser = userRepository.save(user);
		User existUser = em.find(User.class, savedUser.getId());
		
		assertThat(existUser.getId()).isEqualTo(savedUser.getId());
	}
	
	@Test
	public void test_get_user_by_email() {
		User user = new User();
		user.setUsername("test");
		user.setEmail("test@example.com");

		BCryptPasswordEncoder pe = new BCryptPasswordEncoder();
		user.setPassword(pe.encode("password"));
		
		User savedUser = userRepository.save(user);
		User existedUser = userRepository.findUserByEmail("test@example.com");
		
		assertThat(existedUser.getEmail()).isEqualTo(savedUser.getEmail());
	}
	
	@Test
	public void test_get_user_by_username() {
		User user = new User();
		user.setUsername("test");
		user.setEmail("test@example.com");

		BCryptPasswordEncoder pe = new BCryptPasswordEncoder();
		user.setPassword(pe.encode("password"));
		
		User savedUser = userRepository.save(user);
		User existedUser = userRepository.findUserByUsername("test");
		
		assertThat(existedUser.getUsername()).isEqualTo(savedUser.getUsername());
	}
	
	@Test
    public void testNumberRegisteredUsers() {
        long count = userRepository.count();
        System.err.println("size: " + count);
        assertThat(count).isEqualTo(userRepository.findAll().size());
    }
	
	@Test
    public void testDeleteUserById() {
        User user = userRepository.findUserByUsername("garry");
        userRepository.deleteById(user.getId()); 
        
        User deletedUser = userRepository.findUserByUsername("garry");

        assertThat(deletedUser).isEqualTo(null);
    }
}