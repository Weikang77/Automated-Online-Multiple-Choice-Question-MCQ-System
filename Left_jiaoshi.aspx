<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Left_jiaoshi.aspx.cs" Inherits="Left_jiaoshi" %>
<%@ Import Namespace="app.Dbs" %>
<%@ Import Namespace="app.Util" %>

<li class="sidebar-list-item">
    <a href="javascript:;" data-toggle="collapse" data-target="#pages0" aria-expanded="false" aria-controls="pages" class="sidebar-link text-muted">
        <span>Subject management</span>
    </a>
    <div id="pages0" class="collapse">
        <ul class="sidebar-menu list-unstyled border-left border-primary border-thick">
            <li class="sidebar-list-item">
                <a href="Subject_add.aspx" target="main" class="sidebar-link text-muted pl-lg-5">Add exam subjects</a>
            </li>
            <li class="sidebar-list-item">
                <a href="Subject_list_publisher.aspx" target="main" class="sidebar-link text-muted pl-lg-5">Query exam subjects</a>
            </li>
            <li class="sidebar-list-item">
                <a href="QuestionInfo_list_publisher.aspx" target="main" class="sidebar-link text-muted pl-lg-5">Query question bank</a>
            </li>
        </ul>
    </div>
</li>
<li class="sidebar-list-item">
    <a href="javascript:;" data-toggle="collapse" data-target="#pages1" aria-expanded="false" aria-controls="pages" class="sidebar-link text-muted">
        <span>Examination result management</span>
    </a>
    <div id="pages1" class="collapse">
        <ul class="sidebar-menu list-unstyled border-left border-primary border-thick">
            <li class="sidebar-list-item">
                <a href="Result_list_publisher.aspx" target="main" class="sidebar-link text-muted pl-lg-5">Query test results</a>
            </li>
            <li class="sidebar-list-item">
                <a href="wrongtopic_list_publisher.aspx" target="main" class="sidebar-link text-muted pl-lg-5">Query wrong question</a>
            </li>
        </ul>
    </div>
</li>
<li class="sidebar-list-item">
    <a href="javascript:;" data-toggle="collapse" data-target="#pages2" aria-expanded="false" aria-controls="pages" class="sidebar-link text-muted">
        <span>Test score management</span>
    </a>
    <div id="pages2" class="collapse">
        <ul class="sidebar-menu list-unstyled border-left border-primary border-thick">
            <li class="sidebar-list-item">
                <a href="Testresult_list_publisher.aspx" target="main" class="sidebar-link text-muted pl-lg-5">Query exam score</a>
            </li>
        </ul>
    </div>
</li>
<li class="sidebar-list-item">
    <a href="javascript:;" data-toggle="collapse" data-target="#pages3" aria-expanded="false" aria-controls="pages" class="sidebar-link text-muted">
        <span>Personal center</span>
    </a>
    <div id="pages3" class="collapse">
        <ul class="sidebar-menu list-unstyled border-left border-primary border-thick">
            <li class="sidebar-list-item">
                <a href="Teacher_updtself.aspx" target="main" class="sidebar-link text-muted pl-lg-5">Modify personal Information</a>
            </li>
            <li class="sidebar-list-item">
                <a href="ChangePassword.aspx" target="main" class="sidebar-link text-muted pl-lg-5">Change password</a>
            </li>
        </ul>
    </div>
</li>