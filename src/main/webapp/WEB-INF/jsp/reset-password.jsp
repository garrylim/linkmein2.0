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
  <body>
  
    <form class="mt-5" action="/reset-password" method="post">
      <input type="hidden" name="${_csrf.parameterName}"
              value="${_csrf.token}" />
      
          <div class="card" style="width: 20rem; margin: auto;">
              <div class="card-body text-center">
                  <h4 class="mb-4">Reset Password</h4>
                  <p modelattribute="email">Your email (${email}) is verified. Please enter your new password.<p>
                  <input type="hidden" name="email" value="${email}">
                  <div class="form-group mt-2 mb-2">
                      <label for="password" class="visually-hidden">password</label>
                      <input type="password" name="password" id="password" class="form-control" placeholder="password" required autofocus>
                  </div>
                  <div class="form-group mb-4">
                      <label for="cpassword" class="visually-hidden">confirmed password</label>
                      <input type="password" name="cpassword" id="cpassword" class="form-control" placeholder="confirm password" required autofocus>
                  </div>
                  
                  <div class="form-group d-grid gap-2 mb-3">
                      <button type="submit" class="btn btn-primary w-100"> Send</button>
                      
                      <c:if test="${error_warning != null}">
                      <div class="alert alert-warning" role="alert">
                ${error_warning}
            </div>
            </c:if>
                  </div>
     
                <footer class="mt-5 text-muted">
                  <span>&copy; 2022 By. <a href="/">LinkMeIn</a> portal.<br/>
                      Made by <span class="text-info">Garry</span><br>In <span class="text-danger">Wawasan Open <br/>University Penang.</span><br/>
                      <i class="fa-brands fa-github"></i>
                      <a href="https://github.com/garrylim/linkmein"> linkmein</a>
                  </span>
              </div>
          </form>
        </footer>

    <script src="https://kit.fontawesome.com/e19fcdf015.js" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-A3rJD856KowSb7dwlZdYEkO39Gagi7vIsF0jrRAoQmDKKtQBHUuLZ9AsSv4jD4Xa" crossorigin="anonymous"></script>
  </body>
</html>