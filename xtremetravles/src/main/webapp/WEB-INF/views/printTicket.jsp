<script type="text/javascript">

var gAutoPrint = true;

function processPrint(){

if (document.getElementById != null){

var html = '<html>\n<head>\n';

if (document.getElementsByTagName != null){

var headTags = document.getElementsByTagName("head");

if (headTags.length > 0) html += headTags[0].innerHTML;

}

html += '\n</head>\n<body>\n';

var printReadyElem = document.getElementById("printarea");

if (printReadyElem != null) html += printReadyElem.innerHTML;

else{

alert("Error, no contents.");

return;

}

html += '\n</body>\n</html>';

var printWin = window.open("","processPrint");

printWin.document.open();

printWin.document.write(html);

printWin.document.close();

if (gAutoPrint) printWin.print();

} else alert("Browser not supported.");

}


</script> 
<style type="text/css" media="print" >
body
{
font-size:12px;
}
#btnPrint
{
	display:none;
	}
</style> 

<style>
table, th, td {
    border: 1px solid black;
}

th, td {
    padding: 5px;
    text-align: left;
}

</style>


<script type="text/javascript">
	window.contextRoot = '${contextRoot}'
</script>
<br><br><br><br><br>
<div class="container">
<div id="row"> 
<div id="col-sm-7"> 
<div id="printarea">


<table style="width:50%; border:2px solid gray; padding:5px;" border="0">
  <tr>
    <th colspan="2" align="Center" style="border-bottom: 2px solid gray; padding-bottom:5px"><img id="img1" alt="logo.jpg" src="${images}/logo.jpg" height="58px" width="105px"></th>
    
    <td align="left" colspan="2" style="color: Blue;border-bottom: 2px solid gray; padding-bottom: 5px">
                                    H.O :- Xtreme Travels,Chembur,Mumbai ||
                                    Ph  :- 9773565937
                                    <br />
                                    B.O :- Xtreme Travels,Santacurz,Mumbai ||
                                    Ph  :- 9773565937
                                </td>
  </tr>
  <tr>
    <td style="padding: 5px; text-align: left; border: 1px solid black;">Ticket Number:</td>
     
    <td style="padding: 5px; text-align: left; border: 1px solid black;">${pnr }</td>
    

    <td style="padding: 5px; text-align: left; border: 1px solid black;">Transaction Id:</td>
    <td style="padding: 5px; text-align: left; border: 1px solid black;">${txnid }</td>

  </tr>
  <tr>
    <td style="padding: 5px; text-align: left; border: 1px solid black;">Name:</td>
    <td style="padding: 5px; text-align: left; border: 1px solid black;"><p>${fname }</p></td>
    
    <td style="padding: 5px; text-align: left; border: 1px solid black;">Phone:</td>
    <td style="padding: 5px; text-align: left; border: 1px solid black;"><p>${phone }</p></td>
    
  </tr>
  
   <tr>
    <td style="padding: 5px; text-align: left; border: 1px solid black;">Source:</td>
						<td style="padding: 5px; text-align: left; border: 1px solid black;"><p>
								<c:if test="${bus != null}"> 
                                              ${bus.boardPoint }</c:if>
								<c:if test="${flight != null}">
                                              ${flight.boardPoint }
                                              </c:if>
								<c:if test="${cab != null}}">
                                              ${cab.boardPoint }
                                              </c:if>
							</p></td>

						<td style="padding: 5px; text-align: left; border: 1px solid black;">Destination:</td>
						<td style="padding: 5px; text-align: left; border: 1px solid black;"><p>

								<c:if test="${bus != null}"> 
                                              ${bus.dropPoint }</c:if>
								<c:if test="${flight != null}">
                                              ${flight.dropPoint }
                                              </c:if>
								<c:if test="${cab != null}}">
                                              ${cab.dropPoint }
                                              </c:if>
							</p></td>

					</tr>
					
					<tr>
    <td style="padding: 5px; text-align: left; border: 1px solid black;">Journey Date:</td>
    <td style="padding: 5px; text-align: left; border: 1px solid black;"><p>
    <c:if test="${bus != null}"> 
                                              ${bus.date }</c:if>
								<c:if test="${flight != null}">
                                              ${flight.date }
                                              </c:if>
								<c:if test="${cab != null}}">
                                              ${cab.date }
                                              </c:if>
    
    </p></td>
    
    <td style="padding: 5px; text-align: left; border: 1px solid black;">Journey Time:</td>
    <td style="padding: 5px; text-align: left; border: 1px solid black;"><p>
<c:if test="${bus != null}"> 
                                              ${bus.boardTime }</c:if> 
                                              <c:if test="${flight != null}">
                                              ${flight.boardTime }
                                              </c:if> 
                                              <c:if test="${cab != null}}">
                                             
                                              </c:if>
</p></td>
    
  </tr>
 
 <tr>
    <td style="padding: 5px; text-align: left; border: 1px solid black;">Seat Nos:</td>
    <td style="padding: 5px; text-align: left; border: 1px solid black;"><p>${seatNo}</p></td>
    
    <td style="padding: 5px; text-align: left; border: 1px solid black;">No of Passengers:</td>
    <td style="padding: 5px; text-align: left; border: 1px solid black;"><p>4</p></td>
    
  </tr>
  
  
  <tr>
    <td style="padding: 5px; text-align: left; border: 1px solid black;">Boarding Point:</td>
    <td style="padding: 5px; text-align: left; border: 1px solid black;"><p>
<c:if test="${bus != null}"> 
                                              ${bus.boardPoint }</c:if> 
                                              <c:if test="${flight != null}">
                                              ${flight.boardPoint }
                                              </c:if> 
                                              <c:if test="${cab != null}}">
                                              ${cab.boardPoint }
                                              </c:if>
</p></td>
    
    <td style="padding: 5px; text-align: left; border: 1px solid black;">Bus Number:</td>
    <td style="padding: 5px; text-align: left; border: 1px solid black;"><p>

<c:if test="${bus != null}"> 
                                              ${bus.busRegNo }</c:if> 
                                              <c:if test="${flight != null}">
                                              ${flight.flightNo }
                                              </c:if> 
                                              <c:if test="${cab != null}}">
                                              ${cab.cabNo }
                                              </c:if>
</p></td>
    
  </tr>
               
               
                 <tr>
    <td style="padding: 5px; text-align: left; border: 1px solid black;">Booking Date:</td>
    <td style="padding: 5px; text-align: left; border: 1px solid black;"><p>${bkdate}
</p></td>
    
    <td style="padding: 5px; text-align: left; border: 1px solid black;">Ticket Fare:</td>
    <td style="padding: 5px; text-align: left; border: 1px solid black;"><p>${fare}</p></td>
    
   </tr>
   
   <tr>
    <td style="padding: 5px; text-align: left; border: 1px solid black;">Payment Status:</td>
    <td style="padding: 5px; text-align: left; border: 1px solid black;"><p>${paystatus }</p></td>
    
    <td style="padding: 5px; text-align: left; border: 1px solid black;">Ticket Status:</td>
    <td style="padding: 5px; text-align: left; border: 1px solid black;"><p>${status}</p></td>
    
  </tr>
  
</table>

</div>
</div>
<div class="col-sm-4">
<br><br><br>
<button type="button" class="btn btn-info btn-lg" onclick="javascript:void(processPrint());" id="btnPrint">
          <span class="glyphicon glyphicon-print"></span> Print
        </button>


</div>

</div>

      </div>
              
      