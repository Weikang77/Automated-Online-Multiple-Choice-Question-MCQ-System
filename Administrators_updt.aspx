<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Administrators_updt.aspx.cs" Inherits="Administrators_updt" %>
<%@ Import Namespace="app.Dbs" %>
<%@ Import Namespace="app.Util" %>

<% Server.Execute("Head.aspx"); %>
<script src="js/jquery.validate.js"></script>

<div style="padding: 10px">



<div class="container">
<div class="panel panel-default">
        <div class="panel-heading">
            Modify administrator information:
        </div>
        <div class="panel-body">
            <form action="Administrators_updt.aspx?f=f" method="post" name="form1" id="form1">
    <div class="form-group">
    <div class="row">
        <label style="width: 120px;min-height:18px;text-align: right" class="col-sm-2">Username<span style="color: red;">*</span></label>
        <div class="col-sm-8">
            <input type="text" class="form-control" style="width:150px;" data-rule-required="true" data-msg-required="Please fill in the username" remote="action.ashx?a=checkno&checktype=update&id=<%= mmm["id"] %>&table=administrators&col=username" data-msg-remote="Content is repeated" id="username" name="username" value="<%= Info.html(mmm["username"]) %>"/></div>
    </div>
</div><div class="form-group">
    <div class="row">
        <label style="width: 120px;min-height:18px;text-align: right" class="col-sm-2"> </label>
        <div class="col-sm-8">
            <input name="id" value="<%= mmm["id"] %>" type="hidden"/><input name="referer" value="<%= Request.Headers["referer"] %>" type="hidden"/><input name="updtself" value="<%= updtself %>" type="hidden"/><button type="submit" class="btn btn-primary" name="Submit">
    Submit</button><button type="reset" class="btn btn-default" name="Submit2">
    Reset</button></div>
    </div>
</div></form></div>
    </div>
</div>
<script>
    $(function () {
        $('#form1').validate();
    });
</script></div>
<% Server.Execute("Foot.aspx"); %>
