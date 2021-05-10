<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Student_updt.aspx.cs" Inherits="Student_updt" %>
<%@ Import Namespace="app.Dbs" %>
<%@ Import Namespace="app.Util" %>

<% Server.Execute("Head.aspx"); %>
<script src="js/jquery.validate.js"></script>
<script src="js/datepicker/WdatePicker.js"></script>

<div style="padding: 10px">



<div class="container">
<div class="panel panel-default">
        <div class="panel-heading">
            Modify student information:
        </div>
        <div class="panel-body">
            <form action="Student_updt.aspx?f=f" method="post" name="form1" id="form1">
    <div class="form-group">
    <div class="row">
        <label style="width: 120px;min-height:18px;text-align: right" class="col-sm-2">Username<span style="color: red;">*</span></label>
        <div class="col-sm-8">
            <input type="text" class="form-control" style="width:150px;" data-rule-required="true" data-msg-required="Please fill in the username" remote="action.ashx?a=checkno&checktype=update&id=<%= mmm["id"] %>&table=student&col=username" data-msg-remote="Content is repeated" id="username" name="username" value="<%= Info.html(mmm["username"]) %>"/></div>
    </div>
</div><div class="form-group">
    <div class="row">
        <label style="width: 120px;min-height:18px;text-align: right" class="col-sm-2">Name<span style="color: red;">*</span></label>
        <div class="col-sm-8">
            <input type="text" class="form-control" style="width:150px;" data-rule-required="true" data-msg-required="Please fill in the name" id="name" name="name" value="<%= Info.html(mmm["name"]) %>"/></div>
    </div>
</div><div class="form-group">
    <div class="row">
        <label style="width: 120px;min-height:18px;text-align: right" class="col-sm-2">Gender</label>
        <div class="col-sm-8">
            <select class="form-control class_sex4" data-value="<%= Info.html(mmm["sex"]) %>" id="sex" name="sex" style="width:250px"><option value="male">male</option><option value="female">female</option></select><script>
$(".class_sex4").val($(".class_sex4").attr("data-value"))</script></div>
    </div>
</div><div class="form-group">
    <div class="row">
        <label style="width: 120px;min-height:18px;text-align: right" class="col-sm-2">Phone number</label>
        <div class="col-sm-8">
            <input type="text" class="form-control" style="width:150px;" phone="true" data-msg-phone="Please enter a correct phone number" id="phonenumber" name="phonenumber" value="<%= Info.html(mmm["phonenumber"]) %>"/></div>
    </div>
</div><div class="form-group">
    <div class="row">
        <label style="width: 120px;min-height:18px;text-align: right" class="col-sm-2">Date of birth</label>
        <div class="col-sm-8">
            <input type="text" class="form-control" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd',lang:'zh-cn'})" style="width:120px;" id="birth" name="birth" readonly="readonly" value="<%= Info.html(mmm["birth"]) %>"/></div>
    </div>
</div><div class="form-group">
    <div class="row">
        <label style="width: 120px;min-height:18px;text-align: right" class="col-sm-2">Email</label>
        <div class="col-sm-8">
            <input type="text" class="form-control" style="width:150px;" email="true" data-msg-email="Please enter a valid email address" id="email" name="email" value="<%= Info.html(mmm["email"]) %>"/></div>
    </div>
</div><div class="form-group">
    <div class="row">
        <label style="width: 120px;min-height:18px;text-align: right" class="col-sm-2">Student ID</label>
        <div class="col-sm-8">
            <input type="text" class="form-control" style="width:150px;" data-msg-email="Please enter a valid ID number" id="idnumbe" name="idnumbe" value="<%= Info.html(mmm["idnumbe"]) %>"/></div>
    </div>
</div><div class="form-group">
    <div class="row">
        <label style="width: 120px;min-height:18px;text-align: right" class="col-sm-2">Address</label>
        <div class="col-sm-8">
            <input type="text" class="form-control" style="width:250px;" id="addr" name="addr" value="<%= Info.html(mmm["addr"]) %>"/></div>
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
