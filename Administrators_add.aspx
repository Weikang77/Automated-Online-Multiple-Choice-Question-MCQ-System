<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Administrators_add.aspx.cs" Inherits="Administrators_add" %>
<%@ Import Namespace="app.Dbs" %>
<%@ Import Namespace="app.Util" %>

<% Server.Execute("Head.aspx"); %>
<script src="js/jquery.validate.js"></script>
<div style="padding: 10px">
<div class="container">
<div class="panel panel-default">
        <div class="panel-heading">
            Add administrator:
        </div>
        <div class="panel-body">
            <form action="Administrators_add.aspx?f=f" method="post" name="form1" id="form1">
    <div class="form-group">
    <div class="row">
        <label style="width: 120px;min-height:18px;text-align: right" class="col-sm-2">Username<span style="color: red;">*</span></label>
        <div class="col-sm-8">
            <input type="text" class="form-control" style="width:150px;" data-rule-required="true" data-msg-required="Please enter your username" remote="action.ashx?a=checkno&checktype=insert&table=administrators&col=username" data-msg-remote="Content is repeated" id="username" name="username" value=""/></div>
    </div>
</div><div class="form-group">
    <div class="row">
        <label style="width: 120px;min-height:18px;text-align: right" class="col-sm-2">Password<span style="color: red;">*</span></label>
        <div class="col-sm-8">
            <input type="password" class="form-control" style="width:150px;" data-rule-required="true" data-msg-required="Please fill in the password" id="pwd" name="pwd" value=""/></div>
    </div>
</div><div class="form-group">
    <div class="row">
        <label style="width: 120px;min-height:18px;text-align: right" class="col-sm-2"> </label>
        <div class="col-sm-8">
            <button type="submit" class="btn btn-primary" name="Submit">
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
