<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Student_list.aspx.cs" Inherits="Student_list" %>
<%@ Import Namespace="app.Dbs" %>
<%@ Import Namespace="app.Util" %>

<% Server.Execute("Head.aspx"); %>

<div style="padding: 10px">
<div class="panel panel-default">
    <div class="panel-heading">
        <span class="module-name">
            Student        </span>
        <span>list</span>
    </div>
    <div class="panel-body">
        <div class="pa10 bg-warning">
            <form class="form-inline" action="?">
    <div class="form-group">
    
    <i class="glyphicon glyphicon-search"></i>
                </div><div class="form-group">
    Username
    <input type="text" class="form-control" style="" name="username" value="<%= Request["username"] %>"/></div><div class="form-group">
    Name
    <input type="text" class="form-control" style="" name="name" value="<%= Request["name"] %>"/></div><div class="form-group">
    Gender
    <select class="form-control class_sex1" data-value="<%= Request["sex"] %>" id="sex" name="sex"><option value="">Please choose</option><option value="male">male</option><option value="female">female</option></select><script>
$(".class_sex1").val($(".class_sex1").attr("data-value"))</script></div><div class="form-group">
    Phone number
    <input type="text" class="form-control" style="" name="phonenumber" value="<%= Request["phonenumber"] %>"/></div><div class="form-group">
    Student ID
    <input type="text" class="form-control" style="" name="idnumbe" value="<%= Request["idnumbe"] %>"/></div><select class="form-control" name="order" id="orderby"><option value="id">By release time</option></select><select class="form-control" name="sort" id="sort"><option value="desc">Descending order</option><option value="asc">Ascending order</option></select><script>$("#orderby").val("<%= orderby %>");$("#sort").val("<%= sort %>");</script><button type="submit" class="btn btn-default">
    Search</button></form></div>



        

                    <div class="">
                <table width="100%" border="1" class="table table-list table-bordered table-hover"><thead><tr align="center"><th width="60" data-field="item">Serial number</th>
                <th> Username </th>
                <th> Password </th>
                <th> Name </th>
                <th> Gender </th>
                <th> Phone number </th>
                <th> Date of birth </th>
                <th> Email </th>
                <th> Student ID </th>
                <th> Address </th>
                    <th width="180" data-field="addtime">Added time</th>
                    <th width="220" data-field="handler">Operation</th>
                    </tr></thead><tbody>
                    <% 
                int i=0;
                foreach(Hashtable map in list) 
 { 

                i++;
                 %>
                    <tr id="<%= map["id"] %>" pid=""><td width="30" align="center">
                            <label>
                                                                <%= i %>
                            </label>
                        </td>
                        <td> <%= map["username"] %> </td>
<td> <%= map["pwd"] %> </td>
<td> <%= map["name"] %> </td>
<td> <%= map["sex"] %> </td>
<td> <%= map["phonenumber"] %> </td>
<td> <%= map["birth"] %> </td>
<td> <%= map["email"] %> </td>
<td> <%= map["idnumbe"] %> </td>
<td> <%= map["addr"] %> </td>
                                                                        <td align="center"><%= map["addtime"] %></td>
                        <td align="center">
                            
                                                                                    <a href="Student_updt.aspx?id=<%= map["id"] %>">Modify</a>
                            <a href="?a=delete&id=<%= map["id"] %>" onclick="return confirm('You sure you want to delete it???')">Delete</a>
                            <!--qiatnalijne-->
                        </td>
                    </tr>
                    <% } %>
                    </tbody></table></div>
            
        <%= list.reader() %>
        


    </div>



</div>








</div>
<% Server.Execute("Foot.aspx"); %>
