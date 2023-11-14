<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script src="https://code.jquery.com/jquery-3.7.0.min.js" 
    integrity="sha256-2Pmvv0kuTBOenSvLm6bvfBSSHrUJ+3A7x6P5Ebd07/g=" 
    crossorigin="anonymous"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>
  
       <link  type="text/css" href="${pageContext.request.contextPath}/css/style.css">
       <link  type="text/css" href="${pageContext.request.contextPath}/Assets/icons/css/all.css">
      
    <title>Document</title>
</head>
<body>
    <div class="container">
        
        <form method="POST">

        <!-- Form Header -->
        <div class="form-header">
                    <h1>Login</h1>
        </div>
       <!-- End Form Header -->

       <!--  Form Body-->
        <div class="form-body">
            <div id="message">
				<c:if test="${param.error != null}">
	 			       <div class="alert alert-danger" style="transition: all 1s ease-out;" role="alert">
				            Bad Credentials!
				        </div>
				</c:if>
			</div>
                <div class="form-floating">
                     <input type="email" id="log-email" name="username" class="form-control" placeholder="Enter Your Email here" required >
                     <label for="log-email">Email/Username</label>
                </div>

                <div class="form-floating">
                    <input type="password" id="log-pwd" name="password" class="form-control" placeholder="*******" required>
                    <label for="log-pwd">Password</label>
                    <small>
                        <a href="${pageContext.request.contextPath}/index">
                           Password Forgotten!
                        </a>
                    </small>
               </div>    

               <div class="form-group">
                <div class="row">
                    
                    <div class="col-12 d-flex justify-content-center">
                        <button class="btn btn-dark">Login</button>
                    </div>
                </div>
               
           </div>             
           <!-- End Form Body-->
           
        </div>

        <div class="form-footer">
            <small>
                Don't have an account ?
                <a href="#">
                    Create One!
                </a>
            </small>
        </div>
    </form>
    </div>
 
</body>
</html>