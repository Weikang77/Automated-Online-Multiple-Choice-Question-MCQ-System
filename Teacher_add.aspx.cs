using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using app.Util;
using app.Dbs;
using System.Collections;


public partial class Teacher_add : AppContent
{

    protected void Page_Load(object sender, EventArgs e)
    {
        if(Request["f"] != null){
            handler();
            return;
        }
    }

    protected void handler()
    {
        var post = getRequestForm();

                post["addtime"] = Info.getDateStr();
                var charuid = Db.name("teacher").insert(post);
            showSuccess("Successfully saved", Req.get("referer").Equals("") ? Request.Headers["referer"] : Req.get("referer"));

    }

}