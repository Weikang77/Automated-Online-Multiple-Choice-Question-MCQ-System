<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Wrongtopic_updt.aspx.cs" Inherits="Wrongtopic_updt" %>
<%@ Import Namespace="app.Dbs" %>
<%@ Import Namespace="app.Util" %>

<% Server.Execute("Head.aspx"); %>
<script src="js/jquery.validate.js"></script>

<div style="padding: 10px">



<div class="container">
<div class="panel panel-default">
        <div class="panel-heading">
            Edit wrong question:
        </div>
        <div class="panel-body">
            <form action="Wrongtopic_updt.aspx?f=f" method="post" name="form1" id="form1">
    <div class="form-group">
    <div class="row">
        <label style="width: 120px;min-height:18px;text-align: right" class="col-sm-2">Cours number</label>
        <div class="col-sm-8">
            
                                                    <%= mmm["courseId"] %><input type="hidden" id="courseId" name="courseId" value="<%= Info.html(mmm["courseId"]) %>"/></div>
    </div>
</div><div class="form-group">
    <div class="row">
        <label style="width: 120px;min-height:18px;text-align: right" class="col-sm-2">Cours name</label>
        <div class="col-sm-8">
            
                                                    <%= mmm["coursename"] %><input type="hidden" id="coursename" name="coursename" value="<%= Info.html(mmm["coursename"]) %>"/></div>
    </div>
</div><div class="form-group">
    <div class="row">
        <label style="width: 120px;min-height:18px;text-align: right" class="col-sm-2">Publisher</label>
        <div class="col-sm-8">
            
                                                    <%= mmm["publisher"] %><input type="hidden" id="publisher" name="publisher" value="<%= Info.html(mmm["publisher"]) %>"/></div>
    </div>
</div><div class="form-group">
    <div class="row">
        <label style="width: 120px;min-height:18px;text-align: right" class="col-sm-2">Exam questions</label>
        <div class="col-sm-8">
            <input type="text" class="form-control" style="width:250px;" id="question" name="question" value="<%= Info.html(mmm["question"]) %>"/></div>
    </div>
</div><div class="form-group">
    <div class="row">
        <label style="width: 120px;min-height:18px;text-align: right" class="col-sm-2">Submitted options</label>
        <div class="col-sm-8">
            <input type="text" class="form-control" style="width:150px;" id="answer" name="answer" value="<%= Info.html(mmm["answer"]) %>"/></div>
    </div>
</div><div class="form-group">
    <div class="row">
        <label style="width: 120px;min-height:18px;text-align: right" class="col-sm-2">Score</label>
        <div class="col-sm-8">
            <input type="number" class="form-control" style="width:150px;" number="true" data-msg-number="Enter a valid number" id="score" name="score" value="<%= Info.html(mmm["score"]) %>"/></div>
    </div>

</div><div class="form-group">
    <div class="row">
        <label style="width: 120px;min-height:18px;text-align: right" class="col-sm-2">Examiner</label>
        <div class="col-sm-8">
            <input type="text" class="form-control" style="width:150px;" readonly="readonly" id="examiners" name="examiners" value="<%= mmm["examiners"] %>"/></div>
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
