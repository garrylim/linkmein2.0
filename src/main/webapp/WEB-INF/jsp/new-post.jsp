<!doctype html>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html>
	<head>
		<title>Linkmein</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<link rel="stylesheet" href="assets/css/bootstrap.css" />
		<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.5/dist/umd/popper.min.js" integrity="sha384-Xe+8cL9oJa6tN/veChSP7q+mnSPaj5Bcu9mPX5F5xIGE0DVittaqT5lorf0EI7Vk" crossorigin="anonymous"></script>
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.min.js" integrity="sha384-ODmDIVzN+pFdexxHEHFBQH3/9/vQ9uori45z4JjnFsRydbmQbmL5t1tQ0culUzyK" crossorigin="anonymous"></script>
    <link href="assets/css/main.css" rel="stylesheet">
    </head>
  <body>

    <!-- nav -->
    <nav class="navbar navbar-expand-lg navbar-dark bg-primary">
      <div class="container">
        <a class="navbar-brand" href="#"><span class="text-info">Link</span>Me<span class="text-success">In</span></a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarColor01" aria-controls="navbarColor01" aria-expanded="false" aria-label="Toggle navigation">
          <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarColor01">
          <ul class="navbar-nav me-auto">
            <li class="nav-item">
              <a class="nav-link active" href="/dashboard">Home
                <span class="visually-hidden">(current)</span>
              </a>
            </li>
            <li class="nav-item">
              <a class="nav-link active" href="#">About Us</a>
            </li>
            <li class="nav-item">
              <a class="nav-link active" href="#">Privacy Policy</a>
            </li>
            <li class="nav-item">
              <a class="nav-link active" href="#">Contact Us</a>
            </li>
              </div>
            </li>
          </ul>
        </div>
            <ul class="navbar-nav me-2 my-2 my-lg-0 navbar-nav-scroll" modelattribute="loggedinuser" style="--bs-scroll-height: 100px;">
              <li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                  @<c:out value="${pageContext.request.remoteUser}" />
                </a>
                <ul class="dropdown-menu dropdown-menu-lg-end" >
                  <li><a class="dropdown-item" href="/profile?id=${user_id}">Profile</a></li>
                  <li><hr class="dropdown-divider"></li>
                  <li><a class="dropdown-item" href="/job">Job Posting</a></li>
                  <li><a class="dropdown-item" href="/dashboard">Dashboard</a></li>
                </ul>
              </li>
      </ul>
            <form action="/logout" method="post">
            <input type="hidden" name="${_csrf.parameterName}"
						value="${_csrf.token}" />
            	<button type="submit" class="btn btn-danger">Logout</button>
	    </form>
        </div>

    </nav>
                
    <section class="container mb-5" style="margin-top: 30px;">
          
      <form:form action="/newJob" method="post" modelattribute="post">
      	<div class="card px-5 py-5" style="max-width: 100vw !important;">
  			<div class="card-body">
    		<h3 class="card-title text-center mb-5">Post Free Job Listing</h3>
    		<h6 class="card-subtitle mb-2 text-muted text-center">New Job Post</h6>
    		<p class="card-text text-center text-muted">Create a job post available at your company or some awesome places and find the right applicants for your open role  to recruit talent through LinkedMeIn Portal.</p>
    		
    		<div class="form-group mb-3">
    			<label for="inputPosition">*Position:</label>
    			<input type="text" class="form-control" name="position" id="position" aria-describedby="positionHelp" required autofocus>
    			<small id="positionHelp" class="form-text text-muted">Describe job position.</small>
    		</div>
    		
    		<div class="form-group mb-3">
    			<label for="inputSalary">*Salary (MYR):</label>
    			<input type="text" class="form-control" name="salary" id="salary" aria-describedby="salaryHelp" required>
    			<small id=""salaryHelp"" class="form-text text-muted">Describe actual or indicative salary (MYR) for the job position.</small>
    		</div>
    		
    		<div class="form-group mb-3">
    			<label for="inputContent">*Content:</label>
    			<textarea class="form-control" name="content" id="content" rows="10" aria-describedby="countryHelp" required></textarea>
    			<small id="countryHelp" class="form-text text-muted">Describe or explain the job roles, description, requirements, etc; here.</small>
    		</div>
    		
    		<div class="form-group mb-3">
    			<label for="inputCompany">*Company Name:</label>
    			<input type="text" class="form-control" name="company" id="company" aria-describedby="companyHelp" required>
    			<small id="companyHelp" class="form-text text-muted">Type the name of the company that offer the job.</small>
    		</div>
    		
    		<div class="form-group mb-3">
    			<label for="inputCity">*City:</label>
    			<input type="text" class="form-control" name="city" id="city" aria-describedby="cityHelp" required>
    			<small id="cityHelp" class="form-text text-muted">Type the name of city of the company's location.</small>
    		</div>
    		
    		<div class="form-group mb-3">
    			<label for="inputCountry">*Country:</label>
    			<input type="text" class="form-control" name="country" id="country" aria-describedby="countryHelp" required>
    			<small id="countryHelp" class="form-text text-muted">Type the name of country of the company's location.</small>
    		</div>
    		
    		<div class="form-check mt-5">
  				<input class="form-check-input" type="checkbox" value="#" id="checkbox1">
  				<label class="form-check-label" for="flexCheckDefault">
    				<small class="form-text text-muted">I hereby declare that the information provided is true and correct. I also understand that any 
    				willful dishonesty may render immediate removal of this job post and lawful consideration by LinkedMeIn Company.</small>
  				</label>
			</div>
			<div class="form-check">
				<input class="form-check-input" type="checkbox" value="" id="checkbox2">
  				<label class="form-check-label" for="flexCheckDefault">
    				<small class="form-text text-muted">I agree to the terms and conditions as set out by the user agreement and our terms of service.</small>
  				</label>
			</div>
    		
    		<div class="d-grid gap-2 mt-4">
  				<a href="/job" class="btn btn-danger">Cancel</a>
  				<button type="submit" name="submit" id="submit" class="btn btn-success">Submit</button>
			</div>
  			</div>
		</div>
      </form:form>
    </section>
  
  	<!--Footer-->
    <footer class="py-5 bg-light text-muted">
      <div class="container">
          <div class="row">
              <div class="col-8">
                  <div class="d-flex justify-content-start">
                      <span>&copy; 2022 By. <a href="/">LinkMeIn</a> portal.<br/>
                          Made by <span class="text-info">Garry</span><br>In <span class="text-danger">Wawasan Open University Penang.</span><br/>
                          <i class="fa-brands fa-github"></i>
                          <a href="https://github.com/garrylim/linkmein"> linkmein</a>
                      </span>
                  </div>
                  
              </div>
              <div class="col-4">
                  <div class="d-flex justify-content-end">
                      <a class="me-2" href="#">Sitemap</a>
                      <a href="#top">Back to top</a>
                  </div>
              </div>
          </div>
      </div>
  </footer>

    <script src="https://kit.fontawesome.com/e19fcdf015.js" crossorigin="anonymous"></script>
    </html>