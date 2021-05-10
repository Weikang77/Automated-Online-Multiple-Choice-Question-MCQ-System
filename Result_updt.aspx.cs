using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using app.Util;
using app.Dbs;
using System.Collections;


public partial class Result_updt : AppContent
{
    protected Hashtable mmm = null;
    protected int updtself = 0;

    protected void Page_Load(object sender, EventArgs e)
    {
        if(Request["f"] != null){
            handler();
            return;
        }
        var id = Req.get("id");
        mmm = Db.name("result").find(id);
    }

    protected void handler()
    {
        var post = getRequestForm();

                Db.name("result").update(post);
        var charuid = post["id"];
            showSuccess("Successfully saved", Req.get("referer").Equals("") ? Request.Headers["referer"] : Req.get("referer"));

    }

}