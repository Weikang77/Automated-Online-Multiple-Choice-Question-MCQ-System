<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ChangePassword.aspx.cs" Inherits="ChangePassword" %>


<html>
  <head>
    <title>Change password</title>
      <link rel="stylesheet" href="css.css" type="text/css">
      <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
      <script>
          function check() {
              if (document.form1.ymm.value == "") {
                  alert("Please enter the original password");
                  document.form1.ymm.focus();
                  return false;
              }
              if (document.form1.xmm1.value == "") {
                  alert("Please enter a new password");
                  document.form1.xmm1.focus();
                  return false;
              }
              if (document.form1.xmm2.value == "") {
                  alert("Please enter confirm password");
                  document.form1.xmm2.focus();
                  return false;
              }
              if (document.form1.xmm1.value != document.form1.xmm2.value) {
                  alert("Sorry, the two passwords are different, please re-enter");
                  document.form1.xmm1.value = "";
                  document.form1.xmm2.value = "";
                  document.form1.xmm1.focus();
                  return false;
              }
              return true;
          }
</script>
  </head>
  <body>

    <form runat="server" id="form1" name="form1" method="post">
    <table width="32%" height="126" border="1" align="center" cellpadding="0" cellspacing="0" bordercolor="9DC9FF" style="border-collapse:collapse">
    <tr>
      <td colspan="2"><div align="center">Change password</div></td>
    </tr>
    <tr>
      <td>Original password：</td>
      <td><input name="ymm" type="text" id="ymm" /></td>
    </tr>
    <tr>
      <td>New password：</td>
      <td><input name="xmm1" type="password" id="xmm1" /></td>
    </tr>
    <tr>
      <td>Confirm password：</td>
      <td><input name="xmm2" type="password" id="xmm2" /></td>
    </tr>
    <tr>
      <td colspan="2" align="center">
          <asp:Button ID="Button1" runat="server" Text="Confirm" OnClientClick="return check()" onclick="Button1_Click" />
          <input name="Submit2" type="reset" value="Reset" /></td>
      </tr>
  </table>
  </form>
  </body>
</html>
