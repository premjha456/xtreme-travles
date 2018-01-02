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
	String base_url="https://secure.payu.in";
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
    <div class="panel-heading"><h3>Bus Details</h3></div>
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
    <p>${bus.dropPoint}</p>
    
    <h2><b><p>${bus.dropTime}</p></b></h2>
        <p><b>${bus.dropPoint}</b></p>
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
    
    <b><p>${bus.busType}</p></b>
        <p><b>${bus.boardTime}</b></p>
    </div>
    
     <div class="col-sm-2">
    <p>Seat No(s):</p>
    
    <b><p>${seatNo}</p></b>
    </div>
    </div>
    
      
      </div>
          <!-- panel body  2 finish -->
      
  
    
  </div>
    
  </div>
  
     <div class="col-sm-4">
  <div class="panel panel-default">
    <div class="panel-heading"><h3>Fare Details</h3></div>
    <div class="panel-body">
    <div class="col-sm-3">
   <h4><p>GrandTotal:&nbsp;&nbsp;&nbsp;&#8377;&nbsp;${bus.price }</p></h4> 
           </div>
    
    </div>
    <div class="panel-footer">
    
      <form action="<%= action1 %>" method="post" name="payuForm" class="form-inline">
<input type="hidden" name="key" value="<%= merchant_key %>" />
      <input type="hidden" name="hash" value="<%= hash %>"/>
      <input type="hidden" name="txnid" value="<%= txnid %>" />
      <input type="hidden" name="udf2" value="<%= txnid %>" />
	  <input type="hidden" name="service_provider" value="payu_paisa" />
           <input type="hidden" name="amount" value="${bus.price }" /> 
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
            <input class="btn btn-lg btn-primary" type="submit" value="&nbsp;&nbsp;&nbsp;Pay&nbsp;&nbsp;&#8377;&nbsp;${bus.price }&nbsp;&nbsp;&nbsp;   " /> 
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
       <div class="col-xs-2">
        <label for="ext">Traveller 1 Name</label>
      </div>
      
       <div class="col-xs-4">   
      <input type="text" class="form-control" id="name" placeholder="Enter Name" name="name" value="Name: ${name }" disabled="disabled">
      </div>
      
       <div class="col-xs-3">
      <input type="text" class="form-control" id="gender" value="Gender: ${gender }" disabled="disabled">
      </div>
      
      
       <div class="col-xs-2">
       <input type="text" class="form-control" id="age" placeholder="Age" name="age" value="Age: ${age }" disabled="disabled">
       </div>
       <br>
            <div class="form-group">
 
  <h4>Seat No: <span class="badge">${seatNo }</span></h4> 
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
                      <input type="hidden" name="id" value="${bus.id }" />
           <input type="hidden" name="seatNo" value="${(bus.maxSeats-bus.seatsAvailable)+1}" />
      	
    </form>
    </div>
    </div>
  </div>
 
</div>



</body>
</html>