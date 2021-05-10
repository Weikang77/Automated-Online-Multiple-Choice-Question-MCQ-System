using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using app.Util;
using app.Dbs;

public partial class Teacher_list : AppContent
{
    protected string where = "";
    protected string orderby = "";
    protected string sort = "";
        protected Collect<Hashtable> list = null;
        
    protected void Page_Load(object sender, EventArgs e)
    {
                InvokeAction();
        getList();
    }

    public string getWhere()
    {
        string where = " 1=1 ";
                if(!Req.get("username").Equals("")) {
            where += " AND username LIKE '%"+Req.get("username")+"%' ";
        }
        return where;
    }

    public object getList()
    {
        where   =  getWhere();
        orderby =  Req.get("order" , "id");
        sort    =  Req.get("sort" , "desc");

                        var     query = Db.name("teacher").@where(where).order(orderby,sort);
        list    = query.page(12);

        
        return fastJSON.JSON.ToJSON(list);
    }

    // GET teacher_list.aspx?a=delete
    // delete data
    public void delete()
    {
        string id = Request["id"];
        string sql = "DELETE FROM teacher WHERE id='"+id+"'";
        var dmap = Db.name("teacher").find(id);
                Dao.execute(sql);
                showSuccess("Successfully deleted");
    }

    
    }
