<%@page import="com.main.model.LeadStates"%>
<%@page import="com.main.model.LeadForm"%>
<%@page import="com.main.model.CustomerStates"%>
<%@page import="org.hibernate.usertype.UserType"%>
<%@page import="com.main.model.CrmUser"%>
<%@page import="com.main.configs.enums.UserTypes"%>
<%@page import="java.util.List"%>
<%@page import="com.main.model.Customer"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.*" %>
  <jsp:include page="../static/header.jsp"></jsp:include>

<!DOCTYPE html>
<html>
<head>


<style type="text/css">


.topDiv{
    height: 10px;
    width:100%px;

    display: flex;
    flex-direction: row;
    gap:100px;

    justify-content: flex-start;
    align-items: center;

    padding: 20px;
    background-color: #f0f0f0;
    border-bottom: 2px solid white;
}
.LeadStage{
    height: 30px;
    width:100%px;


    display: flex;
    gap: 20px;
    justify-content: flex-start;
    align-items: center;
    padding: 20px;
    background-color: #f0f0f0;
}
.flex-item
{
color: grey;
text-align: center;
font-family: Noto Sans;
font-size: 14px;
font-weight: 500;
}

#Dropdown{
    color:grey;
    font-size: 14px;
    border-color: grey;
    font-family:Noto Sans;
    border:0.5px grey solid;
    width:120px;
    margin-left:10px;
}

select > option{
    color:grey;
    font-size:14px;
    font-family:Noto Sans;
    background-color: whitesmoke;
}

.SecDiv{
    height: 10px;
    width:100%px;


    display: flex;
    gap: 20px;
    justify-content: space-evenly;
    align-items: center;
    padding: 20px;
    background-color: #f0f0f0;
    border: 1px solid #ddd;
    background: radial-gradient(circle, #fff, #ddd);
    border-bottom:2px solid white;

}

.ThirdDiv{

    width: 100%;
    height: 100%;
    background:radial-gradient(circle, #fff, #ddd);


    display: flex;

}

.item1{
    flex-basis:330px;
    border-right:2px solid #ddd;
}

.item2{
    flex-basis:200px;
    border-right:2px solid #ddd;
}
.item3{
    flex-basis:220px;
    border-right:2px solid #ddd;
}

.item4{
    flex-basis:200px;
    border-right:2px solid #ddd;
}


.item5{
    flex-basis:230px;
    border-right:2px solid #ddd;
}


.name
{
margin-left=10px;
}

</style>


</head>
<body>
<%

    List<LeadForm> leadList = (List<LeadForm>)request.getAttribute("LeadList");
	List<LeadStates> leadStatusList  = (List<LeadStates>)request.getAttribute("leadStatusList");
   
	List<CrmUser> agents = (List<CrmUser>)request.getAttribute("Agents");
	String userType = (String)request.getAttribute("userType");
	boolean adm_man = userType.equalsIgnoreCase(UserTypes.ROLE_MANAGER.toString()) || userType.equalsIgnoreCase(UserTypes.ROLE_AGENT.toString());

%>

 
	<div class="card-header page-top">
		<div class="row">
			<div class="col-md-3">
				<h5>Leads List</h5>
			</div>
				<div class="col-md-9 ">
					<ol class="breadcrumb">
						<li class="breadcrumb-item ml-auto"><a href="Dashboard.htm"><i class=" fa-solid fa-house-chimney fa-sm"></i> Home</a></li>
						<li class="breadcrumb-item active " aria-current="page">Leads List</li>
					</ol>
				</div>
			</div>
	</div>	
	<div class="page card dashboard-card">
	
	<div class="card-body" >
	
	
	<div align="center">
		<%String ses=(String)request.getParameter("result"); 
		String ses1=(String)request.getParameter("resultfail");
		if(ses1!=null){ %>
			<div class="alert alert-danger" role="alert">
				<%=ses1 %>
			</div>
			
		<%}if(ses!=null){ %>
			
			<div class="alert alert-success" role="alert">
				<%=ses %>
			</div>
		<%} %>
	</div>

		<form action="LeadList.htm" method="get">
		    <div class="LeadStage">
		        <div class="flex-item" >Lead Stage
		            <select id="Dropdown">
		                <option value="activity1">All Selected</option>
		                <option value="activity2">Activity 2</option>
		                <option value="activity3">Activity 3</option>
		             </select>
		        </div>
		
		        <div class="flex-item"> Lead Source
		            <select id="Dropdown">
		                <option value="activity1">All Selected</option>
		                <option value="activity2">Activity 2</option>
		                <option value="activity3">Activity 3</option>
		             </select>
		
		        </div>
		
		        <div class="flex-item">Owner
		            <select id="Dropdown" name="userId" onchange="this.form.submit()">
		            	<option value="" selected="selected" disabled>Select..</option>
		            	<%if(userType.equalsIgnoreCase(UserTypes.ROLE_MANAGER.toString())){ %>
		            		<option value="UnAssigned" style="color: red">UnAssigned</option>
		            	<%} %>
		                <%for(CrmUser agent : agents ){ %>
		                <option value="<%=agent.getUserId()%>"><%=agent.getUserName() %></option>
		                <%} %>
		             </select>
		        </div>
		
		        <div class="flex-item">Date Range
		            <select id="Dropdown">
		                <option value="activity1">Created On</option>
		                <option value="activity2">Activity 2</option>
		                <option value="activity3">Activity 3</option>
		             </select>
		
		             <select id="Dropdown">
		                <option value="activity1">All Time</option>
		                <option value="activity2">Activity 2</option>
		                <option value="activity3">Activity 3</option>
		             </select>
		
		        </div>
		    </div>
		
		    <div class="ThirdDiv">
		        <div class="flex-child item1"></div>
		        <div class="flex-child item2"></div>
		        <div class="flex-child item3"></div>
		        <div class="flex-child item4"></div>
		        <div class="flex-child item5"></div>
		        <div class="flex-child item6"></div>
		    </div>
		<table class="table table-striped">
		
		  <tr>
		  		<th>SN</th>
		  		<th>App. No</th>
		        <th>Name</th>
		        <th>Email</th>
		        <th>Phone No</th>
		        <th>Lead Status</th>
		         <%if(adm_man){ %>
		        	<th>Owner <i class='fa fa-user' style="color:skyblue"></i> </th>
		        <%} %>
	
		        
		       
		        <th>Actions <i class='fa fa-lock' style="color:skyblue"></i> </th>
		        <th>Update</th>
		        <th>Delete</th>
		    <tr>
		    
		    
		    <% 
			int i=1;
			for(LeadForm lead : leadList)
			{
				%>
				


				
				<tr>
				 	<td><%=i++ %></td>
				 	<td><%=lead.getLeadId()%></td>
					<td><%=lead.getLeadName()%></td>
					<td><%=lead.getLeadEmail()%></td>
					<td><%=lead.getLeadPhoneNo()%></td>
						<td>
						<% LeadStates lStatus = leadStatusList.stream()
						  .filter(status -> lead.getLeadAcqCode().equals(status.getLeadStatus()))
						  .findAny()
						  .orElse(null); 
						  %>
						  <%= lStatus!=null ? lStatus.getLeadStatus(): "-" %>
					</td>
					<%if(adm_man){ %>
		        	<td>
		        		<select id="lead-<%=lead.getLeadId() %>" name="userId" onchange="updateAgentForLead('<%=lead.getLeadId()%>',this.value);">
			            	<%if(userType.equalsIgnoreCase(UserTypes.ROLE_AGENT.toString())){ %>
			            		<option value="" <%if(lead.getUserId()==null){%> <%} %>style="color: red">UnAssigned</option>
			            	<%} %>
			                <%for(CrmUser agent : agents ){ %>
			                	<option value="<%=agent.getUserId()%>" <%if(agent.getUserId().equalsIgnoreCase(lead.getUserId())){%> selected<% }%>><%=agent.getUserName() %></option>
			                	
			                <%} %>
		             	</select>
		        	</td>
		        	<%} %>
		        	
		        	
					
		      
					
					<td><button type="submit" name="leadId" value="<%=lead.getLeadId() %>" formmethod="get" formaction="RedirectCustomerDetailsView.htm" >Info</button></td>
					<%-- 
					<td><button type="submit" name="leadId" value="<%=lead.getId()%>" formmethod="get" formaction="updatingLead.htm" >Update</button></td>
					<td><a href="editing.htm?id=<%=lead.getId()%>">Update</a></td>
					--%>
					
					
					<td><button type="submit" name="id" value="<%=lead.getId()%>" formmethod="get" formaction="updatingLead.htm" >Update</button></td>
					
					<td><button type="submit" name="leadId" value="<%=lead.getId()%>" formmethod="get" formaction="deleteLead.htm" >Delete</button></td>
					
					
					
		             
				</tr>
			<%}%>
		
			
			
			
		</table>
		
		
		
		
		</form>
		
		<%if(userType.equalsIgnoreCase(UserTypes.ROLE_MANAGER.toString()) || userType.equalsIgnoreCase(UserTypes.ROLE_ADMIN.toString())|| userType.equalsIgnoreCase(UserTypes.ROLE_AGENT.toString())){ %>
		
		<form action="Lead.htm" method="get">
              <input type="submit" value="ADD">
        </form>
		
		<% } %>
		
		
	</div>

</div>
<script type="text/javascript">


function generateLeadId() {
	  
	  const randomNumber = Math.floor(Math.random() * 1000000);
	  const timestamp = new Date().getTime();
	  const leadId = `${timestamp}${randomNumber}`;

	  return leadId;
	}




function updateAgentForLead(($appNo,$agentId){
	
	if(confirm('Are you Sure to update the owner for this customer?')){
		
		$.ajax({

			type : "POST",
			url : "UpdateAgentForLead.htm",
			data : {
					
				appNo : $appNo ,
				agentId : $agentId ,
				
			},
			datatype : 'json',
			success : function(result) {
				alert(result);
			}
		});
		
	}
	
	
}

</script>

</body>
</html>