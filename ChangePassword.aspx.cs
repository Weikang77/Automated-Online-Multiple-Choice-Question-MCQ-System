using app.Dbs;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ChangePassword : AdminContent
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }


    protected void Button1_Click(object sender, EventArgs e)
    {
        string username = Session["username"].ToString();
        string cx = Session["login"].ToString();
        string oldPassword = Request["ymm"];
        string newPwd = Request["xmm1"];
        string newPwd2 = Request["xmm2"];

        if ( !newPwd.Equals(newPwd2) ) {
            showError("The two passwords entered are inconsistent");
        }

        else if (cx.Equals("Administrator"))
        {
                        Hashtable row = Db.name("administrators").@where("username" , username).@where("pwd" , oldPassword).find();
            if ( row.Count == 0 )
            {
                showError("Error in original password");
            }
                        row["pwd"] = newPwd;
            Db.name("administrators").update(row);
        }
        else if (cx.Equals("Student"))
        {
                        Hashtable row = Db.name("student").@where("username" , username).@where("pwd" , oldPassword).find();
            if ( row.Count == 0 )
            {
                showError("Error in original password");
            }
                        row["pwd"] = newPwd;
            Db.name("student").update(row);
        }
        else if (cx.Equals("Teacher"))
        {
                        Hashtable row = Db.name("teacher").@where("username" , username).@where("pwd" , oldPassword).find();
            if ( row.Count == 0 )
            {
                showError("Error in original password");
            }
                        row["pwd"] = newPwd;
            Db.name("teacher").update(row);
        }

        showSuccess("Password changed successfully", "./ChangePassword.aspx");
    }
}


