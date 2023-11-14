<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
            HttpSession currentSession = request.getSession(false);
            if(currentSession.getAttribute("sessionActivation")==null){
            	 response.sendRedirect(request.getContextPath() + "/home.jsp");
            	 return;
            }
%>


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
     <link rel="stylesheet" href="${pageContext.request.contextPath}/css/inside.css">
      <title>Document</title>
</head>
<body>
		    <div class="container">
		        
			        <form action="Password/Changing" id="restaurationForm" method="POST" enctype="multipart/form-data"> 
			
			        <!-- Form Header -->
			        <div class="form-header">
			                    <h1>Reset Password</h1>
			        </div>
			       <!-- End Form Header -->
		
		       <!--  Form Body-->
		        <div class="form-body">
		        
        		 <!-- Confirmation alerts-->
		            <div id="alerts-container"> 
		            
			            
		             </div>
		                   
		           <!-- End  Confirmation alerts--> 

                <div class="form-floating">
                     <input type="hidden" id="id" name="id" value="${sessionScope.id}" required>                   
                    <input type="password" id="password" name="password" class="form-control" placeholder="*******" required>
                    <label for="log-pwd">New Password</label>
               </div>   
            
                <div class="form-floating">
                    <input type="password" id="password-cf" class="form-control" placeholder="*******" required>
                    <label for="log-pwd">Confirm Password</label>
               </div> 

               <div class="form-group">
                <div class="row">
                    
                    <div class="col-12 d-flex justify-content-center">
                        <button class="btn btn-outline-success">Confirm Changes</button>
                    </div>
                </div>
               
           </div>             
           <!-- End Form Body-->
           
        </div>

        <div class="form-footer">
            <small>
                <a href="${pageContext.request.contextPath}/home.jsp">
                    <i class="fa-solid fa-angles-left"></i> Back to Login Page ?
                </a>
            </small>
        </div>
    </form>
    
     <div id="loading-spinner" class="modal" tabindex="-1" role="dialog">
	    <div class="modal-dialog modal-dialog-centered modal-sm" >
	          <div class="spinner-border" id="loading-spinner" role="status">
	              <span class="sr-only">Loading...</span>
	          </div>
       </div>
    </div>
    
    </div>
    
   <script type="text/javascript">
   $(document).ready(function(){
	   $(document).ajaxStart(function(){
   		$("#loading-spinner").modal("show");
   	});
   	$(document).ajaxStop(function(){
   		$("#loading-spinner").modal("hide");
   	}); 
   	
   	console.log("SESSION ID "+${sessionScope.id});
   	
   	function checkMatchingPasswords(){
   		var pwd=$("#password").val();
   		var pwdCf=$("#password-cf").val();
   		return pwd.localeCompare(pwdCf);
   	};
   	
   	$("#restaurationForm").submit(function(event){
   		event.preventDefault();
   	 var errorAlert=' <div class="alert alert-danger" style="transition: all 1s ease-out;" role="alert">\
        The passwords are not matched! \
        </div>';     
        if(checkMatchingPasswords()!==0){
           $("#alerts-container").html(errorAlert);
        return;
        }
        var formData = new FormData(this);
	    var action = $(this).attr("action");
	    var method = $(this).attr("method");
	    $.ajax({
	        url: action,
	        type: method,
	        data: formData,
	        processData: false,
	        contentType: false,
	        success: function(response, textStatus, jqXHR){
	        	document.location.href="home.jsp"
	        },
	        error: function(response, textStatus, jqXHR){
	        	 var errorAlert=' <div class="alert alert-danger" style="transition: all 1s ease-out;" role="alert">\
                     Something Went Wrong Please Try Again later! \
                    </div>';
	        	 $("#alerts-container").html(errorAlert);
	        },            
	    });
   	});
   	
   	
   });
   </script>
</body>
</html>

