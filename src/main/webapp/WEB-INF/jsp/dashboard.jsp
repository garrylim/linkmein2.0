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
         <section>
              <div class="container">
              <c:url var="search_url" value="/dashboard" />
              <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
                        <form:form role="search" action="${search_url}" method="post">
                            <div class="input-group">
                                  <input class="form-control" name="keyword" type="search" placeholder="Search" aria-label="Search">
                                  <button class="btn btn-success me-2" type="submit">Search</button>
                            </div>
                        </form:form>
                </div>
            </section>
            <ul class="navbar-nav me-2 my-2 my-lg-0 navbar-nav-scroll" modelattribute="loggedinuser" style="--bs-scroll-height: 100px;">
              <li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                  @<c:out value="${pageContext.request.remoteUser}" />
                </a>
                <ul class="dropdown-menu dropdown-menu-lg-end" >
                  <li><a class="dropdown-item" href="/profile?id=${user_id}">Profile</a></li>
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

    </nav>
    
    <table class="table card-body text-center">
        <thead>
          <tr>
            <th scope="col">#</th>
            <th scope="col">Username</th>
            <th scope="col">Email</th>
          </tr>
        </thead>
        <tbody>
          <c:if test="${not empty users}">
          <c:forEach var="user" items="${users}">
          <tr>
            <th scope="row">${user.id}</th>
            <td>${user.username}</td>
            <td>${user.email}</td>
          </tr>
          </c:forEach>
          </c:if>
        </tbody>
      </table>

    <section>
      <div class="container" style="margin-top: 600px;"></div>
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
  </body>
</html>