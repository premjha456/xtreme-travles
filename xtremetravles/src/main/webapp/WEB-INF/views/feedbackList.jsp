 <div>                   
	
 <h3>View Feedbacks</h3>   			
<table id="feed" style="    border: 1px solid black;" class="table  table-striped table-borderd">
					
					
						<thead>
						
							<tr>
								<th>Name</th>
								<th>Email</th>
							    <th>Message</th>
								</tr>
						
						</thead>
					
<tbody>
			       <c:forEach var="feed" items="${feedback}">
			       <tr>
			       
			           <td><c:out value="${feed.name}"/></td>
    			       <td><c:out value="${feed.email}"/></td>
    			       <td><c:out value="${feed.comment}"/></td>
      </tr>
</c:forEach>
				
								
						
</tbody>
						<tfoot>
						<tr>
								<th>Name</th>
								<th>Email</th>
							    <th>Message</th>
								</tr>
												</tfoot>
					</table>
							
				
					
				</div>