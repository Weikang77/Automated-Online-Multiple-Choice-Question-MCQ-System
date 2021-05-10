<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Left_guanliyuan.aspx.cs" Inherits="Left_guanliyuan" %>
<%@ Import Namespace="app.Dbs" %>
<%@ Import Namespace="app.Util" %>

<li class="sidebar-list-item">
    <a href="javascript:;" data-toggle="collapse" data-target="#pages0" aria-expanded="false" aria-controls="pages" class="sidebar-link text-muted">
        <span>Account management</span>
    </a>
    <div id="pages0" class="collapse">
        <ul class="sidebar-menu list-unstyled border-left border-primary border-thick">
            <li class="sidebar-list-item">
                <a href="Administrators_add.aspx" target="main" class="sidebar-link text-muted pl-lg-5">Add administrator account</a>
            </li>
            <li class="sidebar-list-item">
                <a href="Administrators_list.aspx" target="main" class="sidebar-link text-muted pl-lg-5">Administrator account management</a>
            </li>
            <li class="sidebar-list-item">
                <a href="ChangePassword.aspx" target="main" class="sidebar-link text-muted pl-lg-5">Change password</a>
            </li>
        </ul>
    </div>
</li>
<li class="sidebar-list-item">
    <a href="javascript:;" data-toggle="collapse" data-target="#pages1" aria-expanded="false" aria-controls="pages" class="sidebar-link text-muted">
        <span>Student Management</span>
    </a>
    <div id="pages1" class="collapse">
        <ul class="sidebar-menu list-unstyled border-left border-primary border-thick">
            <li class="sidebar-list-item">
                <a href="Student_add.aspx" target="main" class="sidebar-link text-muted pl-lg-5">Add Student</a>
            </li>
            <li class="sidebar-list-item">
                <a href="Student_list.aspx" target="main" class="sidebar-link text-muted pl-lg-5">Query student</a>
            </li>
        </ul>
    </div>
</li>
<li class="sidebar-list-item">
    <a href="javascript:;" data-toggle="collapse" data-target="#pages2" aria-expanded="false" aria-controls="pages" class="sidebar-link text-muted">
        <span>Teacher management</span>
    </a>
    <div id="pages2" class="collapse">
        <ul class="sidebar-menu list-unstyled border-left border-primary border-thick">
            <li class="sidebar-list-item">
                <a href="Teacher_add.aspx" target="main" class="sidebar-link text-muted pl-lg-5">Add teacher</a>
            </li>
            <li class="sidebar-list-item">
                <a href="Teacher_list.aspx" target="main" class="sidebar-link text-muted pl-lg-5">Query teacher</a>
            </li>
        </ul>
    </div>
</li>
<li class="sidebar-list-item">
    <a href="javascript:;" data-toggle="collapse" data-target="#pages3" aria-expanded="false" aria-controls="pages" class="sidebar-link text-muted">
        <span>Subject management</span>
    </a>
    <div id="pages3" class="collapse">
        <ul class="sidebar-menu list-unstyled border-left border-primary border-thick">
            <li class="sidebar-list-item">
                <a href="Subject_list.aspx" target="main" class="sidebar-link text-muted pl-lg-5">Query subject</a>
            </li>
        </ul>
    </div>
</li>
<li class="sidebar-list-item">
    <a href="javascript:;" data-toggle="collapse" data-target="#pages4" aria-expanded="false" aria-controls="pages" class="sidebar-link text-muted">
        <span>Question bank management</span>
    </a>
    <div id="pages4" class="collapse">
        <ul class="sidebar-menu list-unstyled border-left border-primary border-thick">
            <li class="sidebar-list-item">
                <a href="QuestionInfo_list.aspx" target="main" class="sidebar-link text-muted pl-lg-5">Query question bank</a>
            </li>
        </ul>
    </div>
</li>
<li class="sidebar-list-item">
    <a href="javascript:;" data-toggle="collapse" data-target="#pages5" aria-expanded="false" aria-controls="pages" class="sidebar-link text-muted">
        <span>Exam result management</span>
    </a>
    <div id="pages5" class="collapse">
        <ul class="sidebar-menu list-unstyled border-left border-primary border-thick">
            <li class="sidebar-list-item">
                <a href="Result_list.aspx" target="main" class="sidebar-link text-muted pl-lg-5">Check exam details</a>
            </li>
            <li class="sidebar-list-item">
                <a href="Testresult_list.aspx" target="main" class="sidebar-link text-muted pl-lg-5">Check student test scores</a>
            </li>
            <li class="sidebar-list-item">
                <a href="Wrongtopic_list.aspx" target="main" class="sidebar-link text-muted pl-lg-5">Query wrong question</a>
            </li>
        </ul>
    </div>
</li>