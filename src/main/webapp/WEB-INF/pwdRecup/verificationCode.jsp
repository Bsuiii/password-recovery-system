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
  
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/v-code.css">
    <title>Document</title>
</head>
<body>
    <div class="container">
        
        <form action="Code/Verfication" id="code-form" method="POST" enctype="multipart/form-data">

        <!-- Form Header -->
        <div class="form-header">
                    <h1>Verification Code</h1>
        </div>
       <!-- End Form Header -->

       <!--  Form Body-->
        <div class="form-body">
            <h5>
            Enter the verification code <br>
                we've sent you at       
            </h5>  
                
            <span id="email-container">
            </span>

             <div id="alerts-container"> 
		            
			            
		             </div>

            <div class="code-container">
                <ul>
                    <li> <input type="hidden" value="${param.id}"></li>
                    <li> <input type="number" id="C1" class="form-control"  inputmode="numeric" min="0" max="9"></li>
                    <li> <input type="number" id="C2" class="form-control"  inputmode="numeric" min="0" max="9"></li>
                    <li> <input type="number" id="C3" class="form-control"  inputmode="numeric" min="0" max="9"></li>
                    <li> <input type="number" id="C4" class="form-control"  inputmode="numeric" min="0" max="9"></li>                   
                </ul>
            </div>    

            <div class="form-group">
                <div class="row">
                    
                    <div class="col-12 d-flex justify-content-center">
                        <button class="btn btn-outline-primary">Confirm</button>
                    </div>
                </div>
           
            </div>      
        </div>

        <!-- End Form Body-->

        <!--   Form footer -->
            <div class="form-footer">
                <small>
                    <a href="#">
                        Resend Code <i class="fa-solid fa-rotate-right fa-beat-fade" style="color: #1e3050;"></i>
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
    	
    	$('input[type="number"]').on('keyup', function(event) {
    	    var inputValue = $(this).val();
    	    if (inputValue.length >= 1) {
    	      var currentIndex = $('input[type="number"]').index(this);  	      
    	      var nextInput = $('input[type="number"]').eq(currentIndex + 1);
    	      if (nextInput.length > 0) {
    	        nextInput.focus();
    	      }
    	    }
    	  });
    	  
    	function retrieveInfo(){
    		 $.ajax({
     	        url: "User/Details?id="+${param.id},
     	        type: "GET",
     	        dataType: "json",
     	        success: function(response, textStatus, jqXHR){
     	        	$("#email-container").html(response.email);
     	            
     	        },
     	        error: function(response, textStatus, jqXHR){
     	       	$("#email-container").html("error");
     	        },            
     	    });
    	}
    	
    	retrieveInfo();
    	
    	function openSession(id){
   		 document.location.href="Authority/Granting?id="+id;
   	}

    	
    	$("#code-form").submit(function(event){
    	    event.preventDefault();
    	    var id=${param.id};
    	    $.ajax({
    	    	url: "User/Details?id="+id,
       	        type: "GET",
       	        dataType: "json",
    	        success: function(response, textStatus, jqXHR){
    	        	 var errorAlert=' <div class="alert alert-danger" style="transition: all 1s ease-out;" role="alert">\
				                       Your verification code is not valid! \
				                        </div>';            
    	        	var c1=$("#C1").val();
    	        	var c2=$("#C2").val();
    	        	var c3=$("#C3").val();
    	        	var c4=$("#C4").val();
    	        	var code =c1+c2+c3+c4;
                   if(code==response.repCode){
                	   openSession(id);
                   }
                   else
                	   $("#alerts-container").html(errorAlert);
    	            
    	        },
    	        error: function(response, textStatus, jqXHR){
    	        	 var errorAlert=' <div class="alert alert-danger" style="transition: all 1s ease-out;" role="alert">\
                         The Entered Code is not valid! \
                        </div>';
    	        	 $("#alerts-container").html(errorAlert);
    	        },            
    	    });
    	});


    	
    });
    </script>
</body>
</html>