<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Wrongtopic_add.aspx.cs" Inherits="Wrongtopic_add" %>
<%@ Import Namespace="app.Dbs" %>
<%@ Import Namespace="app.Util" %>

<% Server.Execute("Head.aspx"); %>
<script src="js/jquery.validate.js"></script>

<div style="padding: 10px">



<div class="container">
<div class="panel panel-default">
        <div class="panel-heading">
            Add wrong question:
        </div>
        <div class="panel-body">
            <form action="Wrongtopic_add.aspx?f=f" method="post" name="form1" id="form1">
    <div class="form-group">
    <div class="row">
        <label style="width: 120px;min-height:18px;text-align: right" class="col-sm-2">Cours number</label>
        <div class="col-sm-8">
            
                                                    <%= readMap["courseId"] %><input type="hidden" id="courseId" name="courseId" value="<%= Info.html(readMap["courseId"]) %>"/></div>
    </div>
</div><div class="form-group">
    <div class="row">
        <label style="width: 120px;min-height:18px;text-align: right" class="col-sm-2">Cours name</label>
        <div class="col-sm-8">
            
                                                    <%= readMap["coursename"] %><input type="hidden" id="coursename" name="coursename" value="<%= Info.html(readMap["coursename"]) %>"/></div>
    </div>
</div><div class="form-group">
    <div class="row">
        <label style="width: 120px;min-height:18px;text-align: right" class="col-sm-2">Publisher</label>
        <div class="col-sm-8">
            
                                                    <%= readMap["publisher"] %><input type="hidden" id="publisher" name="publisher" value="<%= Info.html(readMap["publisher"]) %>"/></div>
    </div>
</div><div class="form-group">
    <div class="row">
        <label style="width: 120px;min-height:18px;text-align: right" class="col-sm-2">Exam questions</label>
        <div class="col-sm-8">
            <input type="text" class="form-control" style="width:250px;" id="question" name="question" value=""/></div>
    </div>
</div><div class="form-group">
    <div class="row">
        <label style="width: 120px;min-height:18px;text-align: right" class="col-sm-2">Answer</label>
        <div class="col-sm-8">
            <input type="text" class="form-control" style="width:150px;" id="answer" name="answer" value=""/></div>
    </div>
</div><div class="form-group">
    <div class="row">
        <label style="width: 120px;min-height:18px;text-align: right" class="col-sm-2">Score</label>
        <div class="col-sm-8">
            <input type="number" class="form-control" style="width:150px;" number="true" data-msg-number="Enter a valid number" id="score" name="score" value=""/></div>
    </div>
</div><div class="form-group">
    <div class="row">
        <label style="width: 120px;min-height:18px;text-align: right" class="col-sm-2">Submitted options</label>
        <div class="col-sm-8">
            <input type="text" class="form-control" style="width:150px;" id="letter" name="letter" value=""/></div>
    </div>
</div><div class="form-group">
    <div class="row">
        <label style="width: 120px;min-height:18px;text-align: right" class="col-sm-2">Examiner</label>
        <div class="col-sm-8">
            <input type="text" class="form-control" style="width:150px;" readonly="readonly" id="examiners" name="examiners" value="<%= Session["username"] %>"/></div>
    </div>
</div><div class="form-group">
    <div class="row">
        <label style="width: 120px;min-height:18px;text-align: right" class="col-sm-2"> </label>
        <div class="col-sm-8">
            <input type="hidden" name="subjectid" value="<%= Request["id"] %>"/><input name="referer" value="<%= Request.Headers["referer"] %>" type="hidden"/><button type="submit" class="btn btn-primary" name="Submit">
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
