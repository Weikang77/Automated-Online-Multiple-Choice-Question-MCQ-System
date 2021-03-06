using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using app.Util;
using app.Dbs;

public partial class Student_list : AppContent
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
        if(!Req.get("name").Equals("")) {
            where += " AND name LIKE '%"+Req.get("name")+"%' ";
        }
        if(!Req.get("sex").Equals("")) {
            where += " AND sex ='"+Req.get("sex")+"' ";
        }
            if(!Req.get("phonenumber").Equals("")) {
            where += " AND phonenumber LIKE '%"+Req.get("phonenumber")+"%' ";
        }
        if(!Req.get("idnumbe").Equals("")) {
            where += " AND idnumbe LIKE '%"+Req.get("idnumbe")+"%' ";
        }
        return where;
    }

    public object getList()
    {
        where   =  getWhere();
        orderby =  Req.get("order" , "id");
        sort    =  Req.get("sort" , "desc");

                        var     query = Db.name("student").@where(where).order(orderby,sort);
        list    = query.page(12);

        
        return fastJSON.JSON.ToJSON(list);
    }

    // GET student_list.aspx?a=delete
    //delete data
    public void delete()
    {
        string id = Request["id"];
        string sql = "DELETE FROM student WHERE id='"+id+"'";
        var dmap = Db.name("student").find(id);
                Dao.execute(sql);
                showSuccess("successfully deleted");
    }

    
    }
