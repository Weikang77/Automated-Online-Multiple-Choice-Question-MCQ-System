using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using app.Util;
using app.Dbs;

public partial class QuestionInfo_list : AppContent
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
                if(Req.getInt("subjectid")>0){
            where += " AND subjectid='"+Req.getInt("subjectid")+"' ";
        }
                if(!Req.get("courseId").Equals("")) {
            where += " AND courseId LIKE '%"+Req.get("courseId")+"%' ";
        }
        if(!Req.get("coursename").Equals("")) {
            where += " AND coursename LIKE '%"+Req.get("coursename")+"%' ";
        }
        if(!Req.get("question").Equals("")) {
            where += " AND question LIKE '%"+Req.get("question")+"%' ";
        }
        if(!Req.get("type").Equals("")) {
            where += " AND type ='"+Req.get("type")+"' ";
        }
            return where;
    }

    public object getList()
    {
        where   =  getWhere();
        orderby =  Req.get("order" , "id");
        sort    =  Req.get("sort" , "desc");

                        var     query = Db.name("questionInfo").@where(where).order(orderby,sort);
        list    = query.page(12);

        
        return fastJSON.JSON.ToJSON(list);
    }

    // GET questionInfo_list.aspx?a=delete
    // delete data
    public void delete()
    {
        string id = Request["id"];
        string sql = "DELETE FROM questionInfo WHERE id='"+id+"'";
        var dmap = Db.name("questionInfo").find(id);
                Dao.execute(sql);
                showSuccess("Successfully deleted");
    }

    
    }
