<%@ WebHandler Language="C#" Class="shoucangjilu" %>

using System;
using System.Web;

public class shoucangjilu : ActionBase {

    public void delete()
    {
        var id = app.Util.Req.get("id");
        app.Dbs.Db.name("shoucangjilu").@where("id", id).delete();
        showSuccess("Successfully deleted", Request.Headers["referer"]);
    }

}