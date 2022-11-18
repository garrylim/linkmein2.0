<!doctype html>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html lang="en">
  <head>
		<title>Linkmein</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<link rel="stylesheet" href="assets/css/bootstrap.css" />
		<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.5/dist/umd/popper.min.js" integrity="sha384-Xe+8cL9oJa6tN/veChSP7q+mnSPaj5Bcu9mPX5F5xIGE0DVittaqT5lorf0EI7Vk" crossorigin="anonymous"></script>
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.min.js" integrity="sha384-ODmDIVzN+pFdexxHEHFBQH3/9/vQ9uori45z4JjnFsRydbmQbmL5t1tQ0culUzyK" crossorigin="anonymous"></script>
    <link href="assets/css/main.css" rel="stylesheet">
    </head>
    
    <!--Nav Bar-->
    <nav class="navbar navbar-expand-lg navbar-dark bg-primary">
        <div class="container">
          <a class="navbar-brand" href="#"><span class="text-info">Link</span>Me<span class="text-success">In</span></a>
          <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarColor01" aria-controls="navbarColor01" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
          </button>
          <div class="collapse navbar-collapse" id="navbarColor01">
            <ul class="navbar-nav me-auto">
              <li class="nav-item">
                <a class="nav-link active" href="#">Home
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
        </div>
      </nav>
  <body>
    <form class="mt-5" action="/forgot-password" method="post">
      <input type="hidden" name="${_csrf.parameterName}"
              value="${_csrf.token}" />
      
          <div class="card" style="width: 20rem; margin: auto;">
              <div class="card-body text-center">
              <span class="text-info">Link</span>Me<span class="text-success">In</span>
                  <h4 class="mb-4">Forgot Password</h4>
                  <p>Please enter your registered email.<p>
                  <div class="form-group mt-2 mb-4">
                      <label for="email" class="visually-hidden">email</label>
                      <input type="email" name="email" id="email" class="form-control" placeholder="Email" required autofocus>
                  </div>
                  
                  <div class="form-group d-grid gap-2 mb-3">
                      <button type="submit" class="btn btn-primary w-100"> Send</button>
                      
                      <c:if test="${error_success != null}">
                      <div class="alert alert-success" role="alert">
                ${error_success}
            </div>
            </c:if>
            <c:if test="${error_warning != null}">
                      <div class="alert alert-warning" role="alert">
                ${error_warning}
            </div>
            </c:if>
                  </div>
     
                <footer class="mt-5 text-muted">
                  <span>&copy; 2022 By. <a href="https://github.com/garrylim/linkmein2.0">LinkMeIn</a> portal.<br/>
                      Made by <span class="text-info">Garry</span><br>In <span class="text-danger">Wawasan Open University Penang.</span><br/>
                      <i class="fa-brands fa-github"></i>
                      <a href="https://github.com/garrylim/linkmein2.0"> linkmein</a>
                  </span>
              </div>
              </footer>
            </div>
        </div>
    </form>
<body>
    <script src="https://kit.fontawesome.com/e19fcdf015.js" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-A3rJD856KowSb7dwlZdYEkO39Gagi7vIsF0jrRAoQmDKKtQBHUuLZ9AsSv4jD4Xa" crossorigin="anonymous"></script>
  </body>
</html>