<%@ WebHandler Language="C#" Class="Collect" %>

using System;
using System.Web;
using app.Util;
using app.Dbs;

public class Collect : ActionBase
{
    public override void processInit(HttpContext context) {
        if (!checkLogin())
        {
            showError("Not logged in, please log in and operate");
        }

        System.Collections.Hashtable row = new System.Collections.Hashtable();
        row["xwid"] = Req.get("id");
        row["biao"] = Req.get("biao");
        row["ziduan"] = Req.get("ziduan");
        row["biaoti"] = Db.name(Req.get("biao")).@where("id", Req.get("id")).value(Req.get("ziduan"));
        row["url"] = Request.Headers["referer"];
        row["addtime"] = Info.getDateStr();
        row["username"] = Session["username"];
        Db.name("shoucangjilu").insert(row);
        showSuccess("Collection success", Request.Headers["referer"]);
    }
}