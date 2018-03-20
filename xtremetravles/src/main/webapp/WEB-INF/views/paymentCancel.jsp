<p><h1>Transaction Canceled
You booked flight seats ${flightSeatList }

You booked bus seats ${busSeatList }

</h1></p>

Yor flight is ${flight }
Yor bus is ${bus }
Your cab is ${cab }


<br><br>
Transaction ID:<%=request.getParameter("txnid") %><br>
Status:<%=request.getParameter("status") %><br>
PayumoneyId:<%=request.getParameter("payuMoneyId") %><br>
Firstname:<%=request.getParameter("firstname") %><br>
Email:<%=request.getParameter("email") %><br>
Phone:<%=request.getParameter("phone") %><br>
Amount:<%=request.getParameter("amount") %><br>
ProductInfo:<%=request.getParameter("productinfo") %>
