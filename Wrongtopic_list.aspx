<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Wrongtopic_list.aspx.cs" Inherits="Wrongtopic_list" %>
<%@ Import Namespace="app.Dbs" %>
<%@ Import Namespace="app.Util" %>

<% Server.Execute("Head.aspx"); %>

<div style="padding: 10px">




<div class="panel panel-default">
    <div class="panel-heading">
        <span class="module-name">
            Wrong question        </span>
        <span>list</span>
    </div>
    <div class="panel-body">
        <div class="pa10 bg-warning">
            <form class="form-inline" action="?">
    <div class="form-group">
    
    <i class="glyphicon glyphicon-search"></i>
                </div><div class="form-group">
    Cours number
    <input type="text" class="form-control" style="" name="courseId" value="<%= Request["courseId"] %>"/></div><div class="form-group">
    Cours name
    <input type="text" class="form-control" style="" name="coursename" value="<%= Request["coursename"] %>"/></div><div class="form-group">
    Exam questions
    <input type="text" class="form-control" style="" name="question" value="<%= Request["question"] %>"/></div><div class="form-group">
    Answer
    <input type="text" class="form-control" style="" name="answer" value="<%= Request["answer"] %>"/></div><select class="form-control" name="order" id="orderby"><option value="id">By release time</option></select><select class="form-control" name="sort" id="sort"><option value="desc">Descending order</option><option value="asc">Ascending order</option></select><script>$("#orderby").val("<%= orderby %>");$("#sort").val("<%= sort %>");</script><button type="submit" class="btn btn-default">
    Search</button></form></div>



        

                    <div class="">
                <table width="100%" border="1" class="table table-list table-bordered table-hover"><thead><tr align="center"><th width="60" data-field="item">Serial number</th>
<th> Cours number </th>
<th> Cours name </th>
<th> Publisher </th>
<th> Exam questions </th>
<th> Submitted options </th>
<th> Score </th>
<th> Examiner </th>
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
                        <td> <%= map["courseId"] %> </td>
<td> <%= map["coursename"] %> </td>
<td> <%= map["publisher"] %> </td>
<td> <%= map["question"] %> </td>
<td> <%= map["answer"] %> </td>
<td> <%= map["score"] %> </td>
<td> <%= map["examiners"] %> </td>
                                                                        <td align="center"><%= map["addtime"] %></td>
                        <td align="center">
                            
                            <a href="Wrongtopic_updt.aspx?id=<%= map["id"] %>">Modify</a>
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
