<!doctype html>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
        
        <!-- Alert error message handling -->
    	<c:if test="${error_string_warning != null}">
		<div class="alert alert-warning alert-dismissible fade show text-center fixed-top" role="alert">
  			${error_string_warning }
  			<button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
		</div>
		<script>
			setTimeout(function() {
        		bootstrap.Alert.getOrCreateInstance(document.querySelector(".alert")).close();
    		}, 3000);
		</script>
		</c:if>
		<c:if test="${error_string_success != null}">
		<div class="alert alert-success alert-dismissible fade show text-center fixed-top" role="alert">
  			${error_string_success }
  			<button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
		</div>
		<script>
			setTimeout(function() {
        		bootstrap.Alert.getOrCreateInstance(document.querySelector(".alert")).close();
    		}, 3000);
		</script>
		</c:if>
        
        <section>
        	<div class="container mt-3 text-center">
        		<a href="/newJob" class="btn btn-success">
        			<i class="fa-solid fa-briefcase"></i>
        			Post a new job!
        		</a>
        		<a href="/manageJob" class="btn btn-info">Manage your posts</a>
        	</div>
        </section>
        
        <section>
        	<div class="container mt-3">
					<c:url var="search_url" value="/dashboard" />
					<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
                    <form:form role="search" action="${search_url}" method="post">
                        <div class="text-center">
                            	<input class="form-control" name="keyword" type="search" placeholder="Search" aria-label="Search" style="margin-bottom:25px;">
                            	<button class="btn btn-primary me-2" type="submit">Search</button>
                        </div>
                    </form:form>
            </div>
        </section>

        <section>
            <div class="container py-4 mb-5" style="margin: auto;">
        
                <div class="row justify-content-center" style="margin-top: 20px;">
                
                <c:if test="${empty jobs}">
                	<div class="container">
                		<p>No jobs opportunities found.</p>
                	</div>
                </c:if>
                
                <c:if test="${not empty jobs}">
                <c:forEach var="job" items="${jobs}" varStatus="row">
                <div class="card col-lg-4 mb-3 me-2" style="width: 18rem;">
                	<div class="card-body">
                		<p class="position-relative">
                			<span class="position-absolute top-0 start-0 translate-middle badge text-bg-light">#${row.index+1 }</span>
                			
                			<c:if test="${job.status == true}">
                			<span class="position-absolute top-0 start-100 translate-middle p-2 bg-success border border-light rounded-circle">
                			</c:if>
                			<c:if test="${job.status == false}">
                			<span class="position-absolute top-0 start-100 translate-middle p-2 bg-danger border border-light rounded-circle">
                			</c:if>
                		</p>
                		
                		<h5 class="card-title pt-2">${job.position}</h5>
                		<h6 class="card-subtitle text-muted">${job.company}</h6>
                		<p class="card-text"></p>
                	</div>
                	<div class="card-footer" style="background-color: transparent; border-top: 0;">
                		
                		<div class="row">
                			<div class="col-2 me-1">
                				<a href="/edit-post?id=${job.id}" class="btn btn-secondary btn-sm">Edit</a>
                			</div>
                			<div class="col-4">
    							<button type="button" class="btn btn-danger btn-sm" data-bs-toggle="modal" data-bs-target="#delete${job.id}Modal">Delete</button>
								
    							<!-- Modal -->
								<div class="modal fade" id="delete${job.id}Modal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
								  <div class="modal-dialog">
								    <div class="modal-content">
								      <div class="modal-header">	
								        <h1 class="modal-title fs-5" id="exampleModalLabel">Delete this post?</h1>
								        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
								      </div>
								      <div class="modal-body">
								      	<h5 class="card-title pt-2">${job.position}</h5>
                						<h6 class="card-subtitle text-muted">${job.company }</h6>
								      </div>
								      <div class="modal-footer">
								        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
								        
								        <form:form action="/delete-post?id=${job.id}" method="post">
								        <button type="submit" class="btn btn-danger">Delete</button>
								        </form:form>
								      </div>
								    </div>
								  </div>
								</div>
                			</div>
                		</div>

                	</div>
                </div>
                </c:forEach>
                </c:if>          

                </div>
              </div>
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