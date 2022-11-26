<!doctype html>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
	<head>
		<title>Linkmein</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<link rel="stylesheet" href="assets/css/bootstrap.css" /> 
		<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-timeago/1.6.7/jquery.timeago.min.js" type="text/javascript"></script>
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


      <!--main-->
      <main>

        <section>
        	<div class="container mt-3 text-center">
        		<a href="/newJob" class="btn btn-success">
        			<i class="fa-solid fa-briefcase"></i>
        			Post a new job!
        		</a>
        		<a href="/manageJob" class="btn btn-info">Manage your posts</a>
        	</div>
        </section>

        <!--Search tab-->
        <section>
        	<div class="container mt-3">
					<c:url var="search_url" value="/dashboard" />
					<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
                    <form:form role="search" action="${search_url}" method="post">
                        <div class="text-center">
                            	<input class="form-control" name="keyword" type="search" placeholder="Search" aria-label="Search" style="margin-bottom: 25px;">
                            	<button class="btn btn-primary me-2" type="submit">Search</button>
                        </div>
                    </form:form>
            </div>
        </section>

      <!--Job Posted-->
      <section>
        <div class="container py-4 mb-5">

            <h2>(<span modelattribute="count">${count}</span>) jobs available</h2>
    
            <div class="row" style="margin-top: 20px;">

            <!--This is to test if there is any job-->
            <c:if test="${empty jobs}"> 
              <div class="container">
                <p>No jobs opportunities found.</p>
              </div>
            </c:if>
            
            <c:if test="${not empty jobs}">
            <c:forEach var="job" items="${jobs}" varStatus="row">
              <div class="col-lg-4">
                <div class="card">
                  <div class="card-body text-center">
                    <h4 class="card-title">${job.position}
                      <a href=""><i class="fa-solid fa-circle-check" title="verified"></i></a>
                    </h4>
                      
                    <div class="row">
                            <p class="card-text">*Salary (MYR): ${job.salary}</p>
                    </div>

                    <p><i class="fa-sharp fa-solid fa-building"></i> ${job.company}<br> 
                      ${job.city} ${job.country}
                    </p>
                        
                    <form class="text-center">
                            <a href="#" class="btn btn-outline-primary">Apply</a>
                            <a href="#" class="btn btn-outline-info" data-bs-toggle="modal" data-bs-target="#modal${row.index}">Details</a>
                        </form>
                  </div>
                  
          <!-- Modal -->
          <div class="modal fade" id="modal${row.index}" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
              <div class="modal-dialog modal-dialog-centered">
                <div class="modal-content">
                    <div class="modal-header">
                      <h1 class="modal-title fs-5" id="exampleModalLabel">${job.position}, at ${job.company}</h1>
                      <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                    <textarea row="100" class="form-control" style="height: 300px; display: block;">${job.content }</textarea>
                    </div>
                    <div class="modal-footer">
                    </div>
                </div>
              </div>
          </div>
          <!-- endof Modal -->
          
          <div class="card-footer text-center text-muted">
            <small>Last updated: <time class="timeago" datetime=${job.updatedOn }></time></small>
          </div>
                    
                </div>
              </div>
            </c:forEach>
            </c:if>

            </div>
          </div>
    </section>
  </main>

  <!--Footer-->
  <footer class="py-5 bg-light text-muted">
    <div class="container">
        <div class="row">
            <div class="col-8">
                <div class="d-flex justify-content-start">
                    <span>&copy; 2022 By. <a href="https://github.com/garrylim/linkmein2.0">LinkMeIn</a> portal.<br/>
                        Made by <span class="text-info">Garry</span><br>In <span class="text-danger">Wawasan Open University Penang.</span><br/>
                        <i class="fa-brands fa-github"></i>
                        <a href="https://github.com/garrylim/linkmein2.0"> linkmein</a>
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
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-timeago/1.6.7/jquery.timeago.min.js" type="text/javascript"></script>
    <script>
      jQuery(document).ready(function() {
        jQuery("time.timeago").timeago();
      });
    </script>
    
</html>
