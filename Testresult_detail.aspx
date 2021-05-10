<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Testresult_detail.aspx.cs" Inherits="Testresult_detail" %>
<%@ Import Namespace="app.Dbs" %>
<%@ Import Namespace="app.Util" %>

<% Server.Execute("Head.aspx"); %>

<div style="padding: 10px">




<style>
    .admin-detail {
        display: flex;
        flex-wrap: wrap;
    }
    .admin-detail .detail {
        width: 50%;
        padding: 5px;
        display: flex;
        margin-bottom: 10px;
        border-bottom: 1px solid #DEDEDE;
    }
    .admin-detail .detail .detail-title {
        width: 120px;
        text-align: right;
    }
    .admin-detail .detail .detail-content {
        flex-grow: 1;
    }
    .admin-detail .detail.detail-editor {
        width: 100%;
        flex-wrap: wrap;
    }
    .admin-detail .detail.detail-editor .detail-title {
        width: 100%;
        padding: 10px;
        margin-top: 10px;
        background: #9a0606;
        color: #ffffff;
        text-align: left;
    }
    .admin-detail .detail.detail-editor .detail-content{
        padding: 10px;
    }

</style>
<div class="panel panel-default">
    <div class="panel-heading">
        Exam result details
    </div>
    <div class="panel-body">

        <div class="admin-detail clearfix">
                            <div class="detail detail-text">
                    <div class="detail-title">
                        Cours number：
                    </div>
                    <div class="detail-content">
                        <%= map["courseId"] %>                    </div>
                </div>
                            <div class="detail detail-longtext">
                    <div class="detail-title">
                        Cours name：
                    </div>
                    <div class="detail-content">
                        <%= map["coursename"] %>                    </div>
                </div>
                            <div class="detail detail-textuser">
                    <div class="detail-title">
                        Publisher：
                    </div>
                    <div class="detail-content">
                        <%= map["publisher"] %>                    </div>
                </div>
                            <div class="detail detail-number">
                    <div class="detail-title">
                        Single choice score：
                    </div>
                    <div class="detail-content">
                        <%= map["MultipleChoiceScore"] %>                    </div>
                </div>
                            <div class="detail detail-number">
                    <div class="detail-title">
                        Multiple choice score：
                    </div>
                    <div class="detail-content">
                        <%= map["MultipleChoiceQuestionScore"] %>                    </div>
                </div>
                            <div class="detail detail-number">
                    <div class="detail-title">
                        Total Score：
                    </div>
                    <div class="detail-content">
                        <%= map["TotalScore"] %>                    </div>
                </div>
                            <div class="detail detail-textuser">
                    <div class="detail-title">
                        Examiner：
                    </div>
                    <div class="detail-content">
                        <%= map["examiners"] %>                    </div>
                </div>
                    </div>

        <div class="button-list mt10">
            <div class="">
                <button type="button" class="btn btn-default" onclick="history.go(-1);">
    Return
                </button><button type="button" class="btn btn-default" onclick="window.print()">
    Print this page
                </button></div>
        </div>

    </div>
</div>







</div>
<% Server.Execute("Foot.aspx"); %>
