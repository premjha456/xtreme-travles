<%@ page import="java.util.*" %>
<%@ page import="java.security.*" %>

<%!
public boolean empty(String s)
	{
		if(s== null || s.trim().equals(""))
			return true;
		else
			return false;
	}
%>
<%!
	public String hashCal(String type,String str){
		byte[] hashseq=str.getBytes();
		StringBuffer hexString = new StringBuffer();
		try{
		MessageDigest algorithm = MessageDigest.getInstance(type);
		algorithm.reset();
		algorithm.update(hashseq);
		byte messageDigest[] = algorithm.digest();
            
		

		for (int i=0;i<messageDigest.length;i++) {
			String hex=Integer.toHexString(0xFF & messageDigest[i]);
			if(hex.length()==1) hexString.append("0");
			hexString.append(hex);
		}
			
		}catch(NoSuchAlgorithmException nsae){ }
		
		return hexString.toString();


	}
%>
<% 	
	String merchant_key="4BK3yI9F";
	String salt="yhBmbct1EM";
	String action1 ="";
	String base_url="https://sandboxsecure.payu.in";
	int error=0;
	String hashString="";
	
 

	
	Enumeration paramNames = request.getParameterNames();
	Map<String,String> params= new HashMap<String,String>();
    	while(paramNames.hasMoreElements()) 
	{
      		String paramName = (String)paramNames.nextElement();
      
      		String paramValue = request.getParameter(paramName);

		params.put(paramName,paramValue);
	}
	String txnid ="";
	if(empty(params.get("txnid"))){
		Random rand = new Random();
		String rndm = Integer.toString(rand.nextInt())+(System.currentTimeMillis() / 1000L);
		txnid=hashCal("SHA-256",rndm).substring(0,20);
	}
	else
		txnid=params.get("txnid");
     String udf2 = txnid;
	String txn="abcd";
	String hash="";
	String hashSequence = "key|txnid|amount|productinfo|firstname|email|udf1|udf2|udf3|udf4|udf5|udf6|udf7|udf8|udf9|udf10";
	if(empty(params.get("hash")) && params.size()>0)
	{
		if( empty(params.get("key"))
			|| empty(params.get("txnid"))
			|| empty(params.get("amount"))
			|| empty(params.get("firstname"))
			|| empty(params.get("email"))
			|| empty(params.get("phone"))
			|| empty(params.get("productinfo"))
			|| empty(params.get("surl"))
			|| empty(params.get("furl"))
			|| empty(params.get("service_provider"))
	)
			
			error=1;
		else{
			String[] hashVarSeq=hashSequence.split("\\|");
			
			for(String part : hashVarSeq)
			{
				hashString= (empty(params.get(part)))?hashString.concat(""):hashString.concat(params.get(part));
				hashString=hashString.concat("|");
			}
			hashString=hashString.concat(salt);
			

			 hash=hashCal("SHA-512",hashString);
			action1=base_url.concat("/_payment");
		}
	}
	else if(!empty(params.get("hash")))
	{
		hash=params.get("hash");
		action1=base_url.concat("/_payment");
	}
		

%>
<html>

<script>
var hash='<%= hash %>';
function submitPayuForm() {
	
	if (hash == '')
		return;

      var payuForm = document.forms.payuForm;
      payuForm.submit();
    }
</script>

<body onload="submitPayuForm();">
 
<div class="container">
<br>
  <div class="col-sm-11">
    <div class="well well-sm">
 <h4><span class="label label-default">&nbsp;&nbsp;1&nbsp;&nbsp;</span>&nbsp;&nbsp;Final Booking Conformation</h4>
 
  </div>
  </div>
    <div class="col-sm-7">
  <div class="panel panel-default">
  
  
  <c:if test="${clickedConfirmBusBooking == true }">
       <div class="panel-heading"><h3>Bus Details</h3></div>
</c:if>

  <c:if test="${clickedConfirmCabBooking == true }">
       <div class="panel-heading"><h3>Cab Details</h3></div>
</c:if>
 
  <c:if test="${clickedConfirmFlightBooking == true }">
       <div class="panel-heading"><h3>Flight Details</h3></div>
</c:if>
        
   <c:if test="${clickedConfirmBusBooking == true }">
 <div class="panel-body">
      <h5><span class="label label-default">DEPART</span></h5>
      <br>
      <div class="container">
      
    <div class="col-sm-2">
   

 <p>${bus.boardPoint}</p>
    
    <h2><b><p>${bus.boardTime}</p></b></h2>
        <p><b>${bus.boardPoint}</b></p>
    </div>
    
     <div class="col-sm-2">
						<img src="${images}/buslogo.JPG" class="img-rounded" alt=""
							width="170" height="20">
					</div>

     <div class="col-sm-2">
    <p>${bus.dropPoint}</p>
    
    <h2><b><p>${bus.dropTime}</p></b></h2>
        <p><b>${bus.dropPoint}</b></p>
    </div>
    </div>
      
    </div>
    <!-- panel body finish -->
      <div class="panel-footer">
      
      <div class="container">
    <div class="col-sm-2">
    <p>Opreator:</p>
    
    <b><p>${bus.busName}</p></b>
        <p><b>${bus.busType}</b></p>
    </div>
    
     <div class="col-sm-2">
    <p>Boarding Point & Time</p>
    
    <b><p>${bus.boardPoint}</p></b>
        <p><b>${bus.boardTime}</b></p>
    </div>
    
     <div class="col-sm-2">
    <p>Seat No(s):</p>
    
    <c:forEach items="${busSeatList}" var="se">
         			<b><p>${se}</p></b>
                     
                 </c:forEach>
              </div>
    </div>
    
      
      </div>
          <!-- panel body  2 finish -->
      

</c:if>
  
   <c:if test="${clickedConfirmCabBooking == true }">
<div class="panel-body">
      <h5><span class="label label-default">DEPART</span></h5>
      <br>
      <div class="container">
      
    <div class="col-sm-2">
   

 <p>${cab.boardPoint}</p>
    
    <h2><b><p>${cab.boardPoint}</p></b></h2>
        <p><b>${cab.boardPoint}</b></p>
    </div>
    
     <div class="col-sm-2">
						<img src="${images}/cab.png" class="img-rounded"
							alt="" width="170" height="20">
					</div>

     <div class="col-sm-2">
    <p>${cab.dropPoint}</p>
    
    <h2><b><p>${cab.dropPoint}</p></b></h2>
        <p><b>${cab.dropPoint}</b></p>
    </div>
    </div>
      
    </div>
    <!-- panel body finish -->
      <div class="panel-footer">
      
      <div class="container">
    <div class="col-sm-2">
    <p>Opreator:</p>
    
                 <b><p>${cab.cabServiceProvider}</p></b>
						<p>
							<b>${cab.cabType}</b>
						</p>
    </div>
    
     <div class="col-sm-2">
    <p>Boarding Point & Time</p>
    
    <b><p>${cab.boardPoint}</p></b>
						<p>
							<b>${cabPickup}</b>
						</p>
    </div>
    
     <div class="col-sm-2">
    <p>Cab Details:</p>

						<b><p>${cab.cabName}</p></b>
						<p>
							<b>${cab.aminities}</b>
						</p>
</div>
    </div>
    
      
      </div>
          <!-- panel body  2 finish -->
 </c:if>
 
  <c:if test="${clickedConfirmFlightBooking == true }">
<div class="panel-body">
      <h5><span class="label label-default">DEPART</span></h5>
      <br>
      <div class="container">
      
    <div class="col-sm-2">
   

 <p>${flight.boardPoint}</p>
    
    <h2><b><p>${flight.boardTime}</p></b></h2>
        <p><b>${flight.boardPoint}</b></p>
    </div>
    
     <div class="col-sm-2">
   <img src="${images}/fly.JPG" class="img-rounded"
							alt="" width="170" height="40">
    </div>
    
     <div class="col-sm-2">
    <p>${flight.dropPoint}</p>
    
    <h2><b><p>${flight.dropTime}</p></b></h2>
        <p><b>${flight.dropPoint}</b></p>
    </div>
    </div>
      
    </div>
    <!-- panel body finish -->
      <div class="panel-footer">
      
      <div class="container">
    <div class="col-sm-2">
    <p>Opreator:</p>
    
    <b><p>${flight.flightName}</p></b>
						<p>
							<b>${flight.flightType}</b>
						</p></div>
    
     <div class="col-sm-2">
    <p>Boarding Point & Time</p>
    
    <b><p>${flight.boardPoint}</p></b>
						<p>
							<b>${flight.boardTime}</b>
						</p></div>
    
     <div class="col-sm-2">
    <p>Seat No(s):</p>
    <c:forEach items="${flightSeatList}" var="se">
                        <b><p>${se}</p></b>
                    
                                 </c:forEach>
    </div>
    </div>
    
      
      </div>
          <!-- panel body  2 finish -->
 </c:if>
   
  </div>
    
  </div>
  
     <div class="col-sm-4">
  <div class="panel panel-default">
    <div class="panel-heading"><h3>Fare Details</h3></div>
    <div class="panel-body">
    <div class="col-sm-3">
    <c:if test="${clickedConfirmBusBooking == true }">
   <h4><p>GrandTotal:&nbsp;&nbsp;&nbsp;&#8377;&nbsp;${busFare}</p></h4> 
</c:if>

  <c:if test="${clickedConfirmCabBooking == true }">
   <h4><p>GrandTotal:&nbsp;&nbsp;&nbsp;&#8377;&nbsp;${cabFare }</p></h4> 
</c:if>
 
  <c:if test="${clickedConfirmFlightBooking == true }">
   <h4><p>GrandTotal:&nbsp;&nbsp;&nbsp;&#8377;&nbsp;${flightFare}</p></h4> 
</c:if>
    
           </div>
    
    </div>
    <div class="panel-footer">
    
      <form action="<%= action1 %>" method="post" name="payuForm" class="form-inline">
<input type="hidden" name="key" value="<%= merchant_key %>" />
      <input type="hidden" name="hash" value="<%= hash %>"/>
      <input type="hidden" name="txnid" value="<%= txnid %>" />
      <input type="hidden" name="udf2" value="<%= txnid %>" />
	  <input type="hidden" name="service_provider" value="payu_paisa" />
	   <c:if test="${clickedConfirmBusBooking == true }">
           <input type="hidden" name="amount" value="${busFare}" /> 
</c:if>

  <c:if test="${clickedConfirmCabBooking == true }">
           <input type="hidden" name="amount" value="${cabFare }" /> 
</c:if>
 
  <c:if test="${clickedConfirmFlightBooking == true }">
           <input type="hidden" name="amount" value="${flightFare}" /> 
</c:if>
	  
           <input type="hidden" name="firstname" id="firstname" value="${name }" /> 
           <input type="hidden" name="email" id="email" value="<%= (empty(params.get("email"))) ? "" : params.get("email") %>" /> 
           <input type="hidden" name="phone" value="${phone }" /> 
          <input type="hidden" name="productinfo" value="${productInfo }" size="64" /> 
          <input type="hidden" name="surl" value="${surl}" size="64" /> 
          <input type="hidden" name="furl" value="${furl}" size="64" /> 
          
          
           <input type="hidden" name="lastname" id="lastname" value="<%= (empty(params.get("lastname"))) ? "" : params.get("lastname") %>" /> 
           <input type="hidden" name="curl" value="${curl }" /> 
           <input type="hidden" name="address1" value="<%= (empty(params.get("address1"))) ? "" : params.get("address1") %>" /> 
           <input type="hidden" name="address2" value="<%= (empty(params.get("address2"))) ? "" : params.get("address2") %>" /> 
           <input type="hidden" name="city" value="<%= (empty(params.get("city"))) ? "" : params.get("city") %>" /> 
           <input type="hidden" name="state" value="<%= (empty(params.get("state"))) ? "" : params.get("state") %>" /> 
           <input type="hidden" name="country" value="<%= (empty(params.get("country"))) ? "" : params.get("country") %>" /> 
           <input type="hidden" name="zipcode" value="<%= (empty(params.get("zipcode"))) ? "" : params.get("zipcode") %>" /> 
           <input type="hidden" name="udf1" value="<%= (empty(params.get("udf1"))) ? "" : params.get("udf1") %>" /> 
          
           <input type="hidden" name="udf3" value="<%= (empty(params.get("udf3"))) ? "" : params.get("udf3") %>" /> 
           <input type="hidden" name="udf4" value="<%= (empty(params.get("udf4"))) ? "" : params.get("udf4") %>" /> 
           <input type="hidden" name="udf5" value="<%= (empty(params.get("udf5"))) ? "" : params.get("udf5") %>" /> 
           <input type="hidden" name="pg" value="<%= (empty(params.get("pg"))) ? "" : params.get("pg") %>" /> 
          <% if(empty(hash)){ %>
           <c:if test="${clickedConfirmBusBooking == true }">
            <input class="btn btn-lg btn-primary" type="submit" value="&nbsp;&nbsp;&nbsp;Pay&nbsp;&nbsp;&#8377;&nbsp;${busFare}&nbsp;&nbsp;&nbsp;   " /> 
</c:if>

  <c:if test="${clickedConfirmCabBooking == true }">
            <input class="btn btn-lg btn-primary" type="submit" value="&nbsp;&nbsp;&nbsp;Pay&nbsp;&nbsp;&#8377;&nbsp;${cabFare }&nbsp;&nbsp;&nbsp;   " /> 
</c:if>
 
  <c:if test="${clickedConfirmFlightBooking == true }">
            <input class="btn btn-lg btn-primary" type="submit" value="&nbsp;&nbsp;&nbsp;Pay&nbsp;&nbsp;&#8377;&nbsp;${flightFare}&nbsp;&nbsp;&nbsp;   " /> 
</c:if>
          <% } %>
    </form>
         
          
    </div>
    
    </div>
  </div>
  
  
   <div class="col-sm-10">
  <div class="panel panel-default">
    <div class="panel-heading"><h3>Traveller's Info</h3></div>
    <div class="panel-body">
    
    <form class="form-inline">          
       <div class="form-group">
        <label for="ext">Traveller Name</label>
      </div>
      
       <div class="form-group">   
      <input type="text" class="form-control" id="name" placeholder="Enter Name" name="name" value="Name: ${name }" disabled="disabled">
      </div>
      
       <div class="form-group">
      <input type="text" class="form-control" id="gender" value="Gender: ${gender }" disabled="disabled">
      </div>
      
      
       <div class="form-group">
       <input type="text" class="form-control" id="age" placeholder="Age" name="age" value="Age: ${age }" disabled="disabled">
       </div>
       <div class="form-group">
 
 <c:if test="${clickedConfirmBusBooking == true }">

<h4>Seat No: <c:forEach items="${busSeatList}" var="se">
         			           <span class="badge"> <b><p>${se}</p></b></span>
                                 </c:forEach></h4> 
  
</c:if>
 
<c:if test="${clickedConfirmFlightBooking == true }">

<h4>Seat No: <c:forEach items="${flightSeatList}" var="se">
         			           <span class="badge"> <b><p>${se}</p></b></span>
                                 </c:forEach></h4> 
  
</c:if>

    </div>
    <br><br>
     <div class="form-group">
         <label for="email">Email:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
           <input type="email" class="form-control" id="email" placeholder="" name="email" value="${email }" disabled="disabled" height="30%" width="30%">
     </div>
<br><br>
<div class="form-group">
         <label for="email">Mobile Number:&nbsp;&nbsp;</label>
           <input type="text" class="form-control" id="phone" placeholder="" name="phone" value="${phone }" disabled="disabled">
     <br><br>
      </div>     
       <c:if test="${clickedConfirmBusBooking == true }">
                      <input type="hidden" name="id" value="${bus.id }" />
                      
</c:if>

  <c:if test="${clickedConfirmCabBooking == true }">
                      <input type="hidden" name="id" value="${cab.id }" />
</c:if>
 
  <c:if test="${clickedConfirmFlightBooking == true }">
                      <input type="hidden" name="id" value="${flight.id }" />
                      
</c:if>
      
      	
    </form>
    </div>
    </div>
  </div>
 
</div>



</body>
</html>