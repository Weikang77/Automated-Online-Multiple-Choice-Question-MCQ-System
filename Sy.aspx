<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Sy.aspx.cs" Inherits="Sy" %>


<%@ Import Namespace="app.Dbs" %>
<%@ Import Namespace="app.Util" %>

<html>
<head>
    <title>Automated Online Multiple Choice Question System</title>
    <LINK href="images/style.css" type=text/css rel=stylesheet>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <style type="text/css">
        <!--
        body, td, th {
            font-size: 12px;
        }
        -->
    </style>
</head>
<BODY leftMargin=5 topMargin=5 rightMargin=5>
<table width="100%" height="210" border="1" align="center" cellpadding="3" cellspacing="1" bordercolor="#D9E9FF"
       style="border-collapse:collapse">
    <TBODY>
    <TR align="center" bgColor=#ffffff>
        <td colspan="4" bgColor=#CADCEA><strong>Basic system information</strong></td>
    </TR>
    <TR align="center"
        bgColor=#ffffff>
        <TD width="14%" align="left" valign="bottom">Current user：</TD>
        <TD width="37%" align="left" valign="bottom"><font class="t4"><%=Session["username"]%>
        </font></TD>
        <TD width="9%" align="left" valign="bottom">Your permissions：</TD>
        <TD width="40%" align="left" valign="bottom"><font class="t4"><%=Session["cx"]%>
        </font></TD>
    </TR>
    <TR align="center"
        bgColor=#ffffff>
        <TD height="38" align="left" valign="bottom">Current date：</TD>
        <TD align="left" valign="bottom"><%=Info.date("yyyy-MM-dd")%></TD>
        <TD align="left" valign="bottom">Your IP：</TD>
        <TD align="left" valign="bottom"><%=Request.UserHostAddress %>
        </TD>
    </TR>
    <TR align="center"
        bgColor=#ffffff>
        <TD align="left" valign="bottom">Browser version：</TD>
        <TD align="left" valign="bottom"><font class="t41"><%=Request.UserAgent%>
        </font></TD>
        <TD align="left" valign="bottom">Operating system：</TD>
        <TD align="left" valign="bottom"><font class="t41"><%=Environment.OSVersion%>
        </font></TD>
    </TR>
    <TR align="center"
        bgColor=#ffffff>
        <TD height="43" align="left" valign="bottom">Server port：</TD>
        <TD align="left" valign="bottom"><font class="t41"><%=Request.UserHostName%>
        </font></TD>
        <TD align="left" valign="bottom">Development date：</TD>
        <TD align="left" valign="bottom"><%=Info.date("yyyy-MM-dd")%></TD>
    </TR>
    </TBODY>
</TABLE>
<p>&nbsp;</p>
<table width="100%" height="193" border="1" align="center" cellpadding="3" cellspacing="1" bordercolor="#D9E9FF"
       style="border-collapse:collapse">
    <TBODY>
    <TR
            align="center" bgColor=#ffffff>
        <td colspan="2" bgColor=#CADCEA><strong>Automated Online Multiple Choice Question System</strong></td>
    </TR>
    <TR align="center"
        bgColor=#ffffff>
        <TD width="10%" align="left">System developer：</TD>
        <TD width="41%" align="left"><font class="t4">Weikang Xu</font></TD>
    </TR>
    <TR align="center"
        bgColor=#ffffff>
        <TD align="left">Supervisor：</TD>
        <TD align="left">Georgios Pissanidis</TD>
    </TR>
    <TR align="center"
        bgColor=#ffffff>
        <TD align="left">Email：</TD>
        <TD align="left"><font class="t41">xuwk2020@163.com</font></TD>
    </TR>
    </TBODY>
</TABLE>
<p>&nbsp;</p>
<P align=right>&nbsp;</P>
</BODY>
</html>




