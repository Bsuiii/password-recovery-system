<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
   <link rel="stylesheet" href="${pageContext.request.contextPath}/Assets/icons/css/all.css">
    <title>Document</title>
    
    <style type="text/css">
    #continue-button a{
    text-decoration:none;
    color:white;
    }
    </style>
</head>
<body>
    <div class="container">
        
        <form  action="Email/Exists" method="POST" id="emailForm" enctype="multipart/form-data">

		        <!-- Form Header -->
		        <div class="form-header">
		                    <h1>Email Verification</h1>
		        </div>
		       <!-- End Form Header -->
		
		       <!--  Form Body-->
		        <div class="form-body">
		
		            <!-- Confirmation alerts-->
		            <div id="alerts-container"> 
		            
			            
		             </div>
		                   
		            <!-- End  Confirmation alerts-->        
		                <div class="form-floating">
		                     <input type="email" name="user-email" id="log-email" class="form-control" placeholder="Enter Your Email here" required >
		                     <label for="log-email">Email/Username</label>
		                </div>
		
		               <div class="form-group">
		                    <div class="row">
		                        
		                        <div class="col-12 d-flex justify-content-center">
		                         
		                                <button class="btn btn-dark" id="confirm-button">Confirm</button>
		                                
		                                <button class="btn btn-success" style="display:none" id="continue-button">
		                                   <a href="#">Continue</a>
		                                </button>
		                         
		                            
		                        </div>
		                    </div>
		               
		                </div>             
		           <!-- End Form Body-->
		           
		        </div>
		      <!--   Form footer -->
		            <div class="form-footer">
		                <small>
		                    <a href="${pageContext.request.contextPath}/home.jsp">
		                        <i class="fa-solid fa-angles-left"></i> Back to Login Page ?
		                    </a>
		                </small>
		            </div>
		     <!--   Form footer -->

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
    	
    	$("#emailForm").submit(function(event){
    	    event.preventDefault();
    	    var email=$("#log-email").val();
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
    	        	 var errorAlert=' <div class="alert alert-danger" style="transition: all 1s ease-out;" role="alert">\
				                         This email does not exists. Please enter an valid email! \
				                        </div>';            
    	        	var successAlert='<div class="alert alert-success" style="transition: all 1s ease-out;" role="alert">\
                                         We have Sent you a recuperation code to '+email+' \
                                       </div>';
                   if(response==-1)
                	   $("#alerts-container").html(errorAlert);
                   else{
                	   $("#alerts-container").html(successAlert);
                	   $("#confirm-button").hide();
                	   $("#continue-button").show();
                	  $("#continue-button a").attr("href","codeVerification?id="+response);
                       } 
    	            
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