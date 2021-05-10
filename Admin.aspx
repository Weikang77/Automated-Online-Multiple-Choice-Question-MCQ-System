<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Admin.aspx.cs" Inherits="Admin" %>

<%@ Import Namespace="app.Dbs" %>
<%@ Import Namespace="app.Util" %>
<%@ Import Namespace="app.Common" %>
<%@ Import Namespace="app.Dbs.Collects" %>
<html>
<head>
    <title>Administrator user management</title>
    <link rel="stylesheet" href="css.css" type="text/css">
</head>
<body>
<form action="Admin.aspx?a=insert" method="post" name="f1" onsubmit="return checkform();">
    <table width="100%" border="1" align="center" cellpadding="3" cellspacing="1" bordercolor="#00FFFF"
           style="border-collapse:collapse">
        <tr>
            <td width="200">Username：</td>
            <td><input name="username" type="text" id="username" onblur='checkform()'/> <label id='clabelusername'></label>
                *
            </td>
        </tr>
        <tr>
            <td width="200">Password：</td>
            <td><input name="pwd" type="password" id="pwd" onblur='checkform()'/><label id='clabelpwd'></label>
                *
            </td>
        </tr>
        <tr>
            <td width="200">Confirm password：</td>
            <td><input name="pwd2" type="password" id="pwd2" onblur='checkform()'/> <label id='clabelpwd2'></label>
                *
            </td>
        </tr>
        <tr>
            <td width="200">&nbsp;</td>
            <td><input name="Submit" type="submit" value="submit"/>
                <input name="Submit2" type="reset" value="Reset"/></td>
        </tr>
    </table>
</form>

    <%
        string where = " 1=1 ";
        string order = Req.get("order", "id");
        string sort = Req.get("sort", "asc");
        Collect<Hashtable> list = Db.name("allusers").@where(where).order(order, sort).page(12);
        
         %>

<p>List of existing administrators：</p>
<table width="100%" class="table table-list">
    <tr>
        <td bgcolor="A4B6D7">Serial number</td>
        <td bgcolor="A4B6D7">Username</td>
        <td bgcolor="A4B6D7">Password</td>
        <td bgcolor="A4B6D7">Authority</td>
        <td bgcolor="A4B6D7">Add time</td>
        <td bgcolor="A4B6D7">Operation</td>
    </tr>
    <%
        int i = 0;
        foreach (Hashtable map in list) {
            i++;
    %>
    <tr>
        <td><%=i %>
        </td>
        <td><%=map["username"] %>
        </td>
        <td><%=map["pwd"] %>
        </td>
        <td><%=map["cx"] %>
        </td>
        <td><%=map["addtime"] %>
        </td>
        <td><a href="Admin.aspx?a=delete&id=<%=map["id"] %>" onClick="return confirm('Are you sure you want to delete？')">Delete</a></td>
    </tr>
    <%}%>
</table>

<%=list.reader()%>
<script src='js/ajax.js' type="text/javascript"></script>
<script type="text/javascript">

    function checkform() {
        var usernameobj = document.getElementById("username");
        if (usernameobj.value == "") {
            document.getElementById("clabelusername").innerHTML = "&nbsp;&nbsp;<font color=red>Please enter username</font>";
            return false;
        } else {
            document.getElementById("clabelusername").innerHTML = "  ";
        }

        var usernameobj = document.getElementById("username");
        if (usernameobj.value != "") {
            var ajax = new AJAX();
            ajax.post("action.ashx?a=checkno&table=allusers&col=username&username=" + usernameobj.value + "&checktype=insert&ttime=<%=Info.getDateStr()%>")
            var msg = ajax.getValue();
            if (msg.indexOf('false') > -1) {
                document.getElementById("clabelusername").innerHTML = "&nbsp;&nbsp;<font color=red>Username already exists</font>";
                return false;
            } else {
                document.getElementById("clabelusername").innerHTML = "  ";
            }
        }
        var pwdobj = document.getElementById("pwd");
        if (pwdobj.value == "") {
            document.getElementById("clabelpwd").innerHTML = "&nbsp;&nbsp;<font color=red>Please enter password</font>";
            return false;
        } else {
            document.getElementById("clabelpwd").innerHTML = "  ";
        }

        var pwd2obj = document.getElementById("pwd2");
        if (pwd2obj.value == "") {
            document.getElementById("clabelpwd2").innerHTML = "&nbsp;&nbsp;<font color=red>Please enter the password again</font>";
            return false;
        } else {
            document.getElementById("clabelpwd2").innerHTML = "  ";
        }

        if (pwd2obj.value != pwdobj.value) {
            document.getElementById("clabelpwd2").innerHTML = "&nbsp;&nbsp;<font color=red>Two password entries are inconsistent</font>";
            return false;
        } else {
            document.getElementById("clabelpwd2").innerHTML = "  ";
        }


        return true;
    }

    popheight = 450;
</script>


</body>
</html>