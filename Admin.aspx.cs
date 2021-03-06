using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using app.Dbs;
using app.Util;

public partial class Admin : AdminContent
{
    protected void Page_Load(object sender, EventArgs e)
    {
        InvokeAction();
    }
    
    public void insert()
    {
        var post = getRequestForm();
        post["addtime"] = Info.getDateStr();
        post["cx"] = "Ordinary administrator";
        Db.name("allusers").insert(post);
        showSuccess("Added successfully", Request.Headers["referer"]);
    }
    
    public void delete()
    {
        string id = Request["id"];
        string sql = "DELETE FROM allusers WHERE id='"+id+"'";
        app.Dbs.Dao.execute(sql);
        showSuccess("Successfully deleted", Request.Headers["referer"]);
    }



}