using app.Dbs;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Login : AppContent
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if( Request["ac"] != null )
        {
            string username = Request.Form["username"];
            string password = Request.Form["pwd"];
            string cx       = Request.Form["cx"];
            authLoginUser(Request["ac"].Equals("adminlogin") , username , password , cx );
        }
    }

    protected void authLoginUser(bool isAdmin, string username, string pwd, string cx)
    {
        if (string.IsNullOrEmpty(username))
        {
            showMessage("Account cannot be empty");
        }

        if (string.IsNullOrEmpty(pwd))
        {
            showError("Password cannot be empty");
        }

        if (string.IsNullOrEmpty(cx))
        {
            showError("Please select login type");
        }

        object random = Session["random"];
        string pagerandom = Request.Form["pagerandom"];
        string captch = Request.Params["captch"];
        if (!string.IsNullOrEmpty(captch))
        {
            if (string.IsNullOrEmpty(pagerandom))
            {
                showError("Please fill in the verification code");
            }
            if (!pagerandom.Equals(random))
            {
                showError("Incorrect verification code");
            }
        }

        Db db = new Db();
        bool issh = false;
        bool iscx = false;
        string usernameField = "username";

        if(cx.Equals("Administrator"))
        {
                        usernameField = "username";
            db.setName("administrators").@where("username", username).@where("pwd", pwd);
                                }
        if(cx.Equals("Student"))
        {
                        usernameField = "username";
            db.setName("student").@where("username", username).@where("pwd", pwd);
                                }
        if(cx.Equals("Teacher"))
        {
                        usernameField = "username";
            db.setName("teacher").@where("username", username).@where("pwd", pwd);
                                }

        Hashtable data = db.find();
        if (data.Count == 0)
        {
            showError("Account or password incorrect");
        }
        if (issh && !data["issh"].Equals("Yes"))
        {
            showError("Account is being reviewed, please contact the administrator for review");
        }

        Session.Clear();
        Session["username"] = data[usernameField];
        Session["cx"] = iscx ? data["cx"] : cx;
        Session["login"] = cx;
        foreach (var key in data.Keys)
        {
            string k = (string)key;
            Session[k] = data[key];
        }
        if (isAdmin)
        {
            showSuccess("Login successful", "main.aspx");
        }
        var referer = Request.Params["referer"] != null ? Request.Params["referer"] : "./";
        showSuccess("Login successful", referer);
    }

}