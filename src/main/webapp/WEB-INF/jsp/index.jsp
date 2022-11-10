<!DOCTYPE html>
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
      </nav>

      <!--left nav-->
      <div class="nav-contact">
        <ul class="nav-contact">
          <li><a href="#"><i class="fab fa-facebook-f"></i><span>Facebook</span></a></li>
          <li><a href="#"><i class="fab fa-twitter"></i><span>Twitter</span></a></li>
          <li><a href="#"><i class="fab fa-instagram"></i><span>Instagram</span></a></li>
          <li><a href="#"><i class="fab fa-linkedin-in"></i><span>Linkedin</span></a></li>
          <li><a href="#"><i class="fab fa-github"></i><span>Github</span></a></li>
          <li><a href="#"><i class="fab fa-youtube"></i><span>Youtube</span></a></li>
          </ul>
      </div>

      <!--Main-->
      <main>
        <section class="py-5 text-center container">
            <div class="row py-lg-5">
                <div class="col-lg-6 mx-auto">
                    <img class="img-fluid mb-3" src="assets/images/job.png" alt="welcome">
                    <h1 class="fw-light mb-2">Welcome to LinkedMeIn Portal</h1>
                    <p class="lead text-muted">We are a talents platform with the mission to growth software developers talents and enterprises in the digital economy.</p>

                    <!--right pop out-->
                    <button class="btn btn-primary" type="button" data-bs-toggle="offcanvas" data-bs-target="#offcanvasExample" aria-controls="offcanvasExample">
                      Join us now!
                    </button>
                    <div class="offcanvas offcanvas-end" tabindex="-1" id="offcanvasExample" aria-labelledby="offcanvasExampleLabel">
                      <div class="offcanvas-header">
                        <h5 class="offcanvas-title" id="offcanvasExampleLabel">LinkmeIn</h5>
                        <button type="button" class="btn-close text-reset" data-bs-dismiss="offcanvas" aria-label="Close"></button>
                      </div>
                      <div class="offcanvas-body">
                        <div>
                          Welcome back if you have account please Sign In
                        </div>
                        <form class="card mt-5" style="width: 90%; margin: auto;" action="/login" method="post">
                          <input type="hidden" name="${_csrf.parameterName}"
                          value="${_csrf.token}" />
                          <div class="card-body text-center">
                            <div class="form-group">
                              <label class="form-label mb-2">Sign In</label>
                              <div class="form-floating mb-3">
                                <input type="email" class="form-control" name="email" id="email" placeholder="name@example.com">
                                <label for="floatingInput">Email address</label>
                              </div>
                              <div class="form-floating">
                                <input type="password" class="form-control" name="password" id="password" placeholder="Password">
                                <label for="floatingPassword">Password</label>
                              </div>
                              <div>
                              <button type="submit" class="btn btn-primary mt-4">Log In</button>
                              </div>
                              <div>
                              <a href="/forgot-password" class="btn btn-link">Forgotten Password?</a>
                              </div>
                            </div>
                          </div>
                        </form>
                        <a class="btn btn-primary mt-4" href="/signup">Create New account</a>
                      </div>
                </div>
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
 