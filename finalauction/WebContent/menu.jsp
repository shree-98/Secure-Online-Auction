<div class="banner" id="home">
<div class="navigation-w3ls">
		<button id="trigger-overlay" type="button"><i class="fa fa-bars" aria-hidden="true"></i></button>
		<div class="overlay overlay-door">
			<button type="button" class="overlay-close">Close</button>
			<nav>
				<ul>
					<li><a href="index.jsp">Home</a></li>
				<%
				try
				{

					if(session.getAttribute("uid")==null)
					{
					%>
					<li><a href="register.jsp" >Register</a></li>
					<li><a href="login.jsp">login</a></li>
					<%
					}
					else
					{
							if(session.getAttribute("uid")!=null)
						{
					%>
					
					<li><a href="logout.jsp">Logout</a></li>
					<li><a href="addproduct.jsp">Add Product</a></li>
					<li><a href="test.jsp">Show Product</a></li>
					<li><a href="complaint.jsp">Fill Complaints</a></li>
					<%
						}

					}
			}
			catch(Exception ex)
			{
				out.println("Hello");
					%>

					<%

					}
					%>
					
				</ul>
			</nav>
		</div>
	</div>			