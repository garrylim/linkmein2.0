<!doctype html>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
          <ul class="navbar-nav me-2 my-2 my-lg-0 navbar-nav-scroll" style="--bs-scroll-height: 100px;">
            <li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" 
                  aria-expanded="false" modelattribute="username">
                    @${username}
                  </a>
                  <ul class="dropdown-menu dropdown-menu-lg-end" >
                    <li>
                      <a class="dropdown-item" href="/profile?id=${user_id}" modelattribute="user_id">
                        Profile
                      </a>
                    </li>
                      <li><hr class="dropdown-divider"></li>
                      <li><a class="dropdown-item" href="/settings">Settings</a></li>
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
      </div>
    </nav>

           
    <!--Main-->
    <section class="container col-lg-4" style="margin-top: 100px;">
      <h2 class="fw-light text-center">Edit Profile</h2>
      
        <form class="form-group" action="/update-profile" method="post" modelattribute="user">
      	<input type="hidden" name="${_csrf.parameterName}"
						value="${_csrf.token}" />
      	
          <div class="mb-3">
            <label class="form-label">ID: </label>
            <input class="form-control" name="id" value="${user.id }" aria-label="Store ID" readonly="true" />
          </div>

          <div class="mb-3">
            <label class="form-label">*Username: </label>
            <input type="text" class="form-control" name="username" id="username" value="${user.username }" aria-label="username" required />
          </div>
  
          <div class="mb-3">
            <label class="form-label">*Email: </label>
            <input type="email" class="form-control" name="email" id="email" value="${user.email }" aria-label="email" required />
          </div>
  
          <div class="mb-3">
            <label class="form-label">*First Name: </label>
            <input class="form-control" name="firstname" id="firstname" value="${user.firstname }" aria-label="first name" required />
          </div>
  
          <div class="mb-3">
            <label class="form-label">*Last Name: </label>
            <input class="form-control" name="lastname" id="lastname" value="${user.lastname }" aria-label="last name" required />
          </div>
  
          <div class="mb-3">
            <label class="form-label">*Company: </label>
            <input class="form-control" name="company" id="company" value="${user.company }" aria-label="company" required />
          </div>

          <div class="mb-3">
            <label class="form-label">*City: </label>
            <input class="form-control" name="city" id="city" value="${user.city }" aria-label="country" required />
          </div>

          <div class="mb-3">
            <label class="form-label">*Country: </label>
            <input class="form-control" name="country" id="country" value="${user.country }" aria-label="country" required />
          </div>
          
          <div class="mb-3">
            <label class="form-label" for="customFile">Profile photo</label>
            <input type="file" name="img" class="form-control" id="customFile" value="" />
          </div>
          
          <div class="py-5">
            <a href="/dashboard" class="btn btn-danger">Cancel</a>
            <button type="submit" class="btn btn-success">Update</button>
          </div>
        </form>

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
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-A3rJD856KowSb7dwlZdYEkO39Gagi7vIsF0jrRAoQmDKKtQBHUuLZ9AsSv4jD4Xa" crossorigin="anonymous"></script>
  </body>
</html>