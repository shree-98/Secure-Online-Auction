<%@ page import="java.util.*" %>
<%@ page import="com.google.gson.Gson"%>
<%@ page import="com.google.gson.JsonObject"%>

<%@include file="head.jsp" %>
<%@include file="../mylib2.jsp" %>

<%
mylib2 l2=new mylib2(); 
%>

<div class="wthree_agile_admin_info">
			<!-- //nav -->
			
	
		<div class="clearfix"></div>
		<!-- //w3_agileits_top_nav-->
		<!-- /inner_content-->
				<div class="inner_content">
				    <!-- /inner_content_w3_agile_info-->
					<div class="inner_content_w3_agile_info">
					<!-- /agile_top_w3_grids-->
					   <div class="agile_top_w3_grids">
					          <ul class="ca-menu">
									<li>
										<a href="showuser.jsp">
											
											<i class="fa fa-building-o" aria-hidden="true"></i>
											<div class="ca-content">
											<%l1.conOpen();
											int c=l2.countlabel("select count(*) as abc from tbluser","abc");
											%>
												<h4 class="ca-main"><%out.println(c); %></h4>
												<h3 class="ca-sub">User</h3>
											</div>
										</a>
									</li>
									<li>
										<a href="showsell.jsp">
										  <i class="fa fa-user" aria-hidden="true"></i>
											<div class="ca-content">
											<%l1.conOpen();
											int d=l2.countlabel("select count(*) as abc from(select distinct tbluser.uid from tbluser,tblproduct where tbluser.uid=tblproduct.uid) as abc","abc");
										
											%>
												<h4 class="ca-main one"><%out.println(d); %></h4>
												<h3 class="ca-sub one">Seller</h3>
											</div>
										</a>
									</li>
									<li>
										<a href="showproduct.jsp">
											<i class="fa fa-database" aria-hidden="true"></i>
											<div class="ca-content">
											<%l1.conOpen();
											int e=l2.countlabel("select count(*) as abc from tblproduct","abc");
											%>
											
											<h4 class="ca-main two"><%out.println(e); %></h4>
												<h3 class="ca-sub two">Product</h3>
											</div>
										</a>
									</li>
									<li>
										<a href="allcategory.jsp">
											<i class="fa fa-tasks" aria-hidden="true"></i>
											<div class="ca-content">
											<%l1.conOpen();
											int f=l2.countlabel("select count(*) as abc from tblcategory","abc");
											%>
											
												<h4 class="ca-main three"><%out.println(f); %></h4>
												<h3 class="ca-sub three">All Categories</h3>
											</div>
										</a>
									</li>
										<li>
										<a href="viewcomplaint.jsp">
											<i class="fa fa-clone" aria-hidden="true"></i>
											<div class="ca-content">
											<%l1.conOpen();
											int g=l2.countlabel("select count(*) as abc from tblcomplaint","abc");
											%>
											
												<h4 class="ca-main four"><%out.println(g); %></h4>
												<h3 class="ca-sub four">All Complaints</h3>
											</div>
										</a>
									</li>
									<div class="clearfix"></div>
								</ul>
					   </div>
					 <!-- //agile_top_w3_grids-->
						<!-- /agile_top_w3_post_sections-->
							<div class="agile_top_w3_post_sections">
							       <div class="col-md-12 agile_top_w3_post agile_info_shadow">
										   
									<%

Gson gsonObj = new Gson();
Map<Object,Object> map = null;
List<Map<Object,Object>> list = new ArrayList<Map<Object,Object>>();
try
{
l1.conOpen();
l1.rs=l1.stmt.executeQuery("select * from tblproduct");
int a,b;
while(l1.rs.next())
{
 		
	 a=l1.rs.getInt("pid");
	
b=l2.countlabel("select max(qty) as abc from tblcart1 where pid="+a,"abc");

String pname=l2.filllabel("select * from tblproduct where pid="+a, "pname");
map = new HashMap<Object,Object>(); map.put("label", pname+""); map.put("y", b); map.put("exploded", true); list.add(map);
 
 }
l1.conClose();
}
catch(Exception ex)
{
	
}
String dataPoints = gsonObj.toJson(list);

%>
<script type="text/javascript">
window.onload = function() { 
 
var chart = new CanvasJS.Chart("chartContainer", {
	theme: "light2",
	animationEnabled: true,
	exportFileName: "New Year Resolutions",
	exportEnabled: true,
	title:{
		text: "Maximum Bid to Each Product"
	},
	data: [{
		type: "pie",
		showInLegend: true,
		legendText: "{label}",
		toolTipContent: "{label}: <strong>{y}%</strong>",
		indexLabel: "{label} {y}%",
		dataPoints : <%out.print(dataPoints);%>
	}]
});
 
chart.render();
 
}
</script>

<div id="chartContainer" style="height: 370px; width: 100%;"></div>
<script src="https://canvasjs.com/assets/script/canvasjs.min.js"></script>
										   
										     
											</div>
									   </div>
								       <div class="clearfix"></div>
							     </div>
								   
						<!-- //agile_top_w3_post_sections-->
							<!-- /w3ls_agile_circle_progress-->
						<!-- //weather_w3_agile_info-->
						<!-- /social_media-->
						  
						<!-- //social_media-->
				    </div>
					<!-- //inner_content_w3_agile_info-->
				</div>
		<!-- //inner_content-->
	</div>
<!-- banner -->
<!--copy rights start here-->