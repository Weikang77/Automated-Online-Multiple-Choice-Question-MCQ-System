﻿﻿<%@ WebHandler Language="C#" Class="Tiku_insert" %>

using System;
using System.Collections;
using System.Web;
using System.Web.SessionState;
using app.Common;
using app.Util;
using app.Dbs;
using System.Collections.Generic;
using fastJSON;

public class Tiku_insert : ActionBase
{
    override public void processInit(HttpContext context)
    {
        
    }

    public void insert()
    {
        if (Session["username"] == null || "".Equals(Session["username"]))
        {
            Response.Write("{\"code\":1,\"msg\":\"Not logged in\"}");
            Response.End();
            return;
        }
        
        string jsonstr = Request["JSON"];
        //JSONParser parser= new JSONParser();
        List<object> json = (List<object>) JSON.Parse(jsonstr);
        //JSONArray json = JSONArray.fromObject(JSON);
        String id = Request["id"];
        Hashtable data = new Hashtable();
        
        string courseId = Info.getID();
        data["courseId"] = courseId;
        data["examiners"] =  Session["username"];
        data["addtime"] =  Info.getDateStr();
        
        var m = new Hashtable();
        for (int i = 0; i < json.Count; i++)
        {
            Dictionary<string, object> obj = (Dictionary<string, object>)json[i];
            copyextend(obj , data );
            
            obj.Remove("id");
            obj["score"] = obj["defen"];
            obj["letter"] = obj["zimu"];
            copyextend(m,obj);
            
            
            
            int defen = Convert.ToInt32(obj["defen"]);
            if (defen != -1)
            {
                int success = Convert.ToInt32(obj["success"]);
                if (success == 0 && Request["wrongtopic"] == null)
                {
                    // 插入错题
                    Db.name("wrongtopic").insert(m);
                }
                else
                {
                    // 删除错题
                }
            }
            Db.name("result").insert(m);
        }
        
        
        var leixingdefen = (Dictionary<string, object>)JSON.Parse(Request["leixingdefen"]);
        
        
        Hashtable post = new Hashtable();
        HashtableUtil.extend(true, post, m);
        
        double total = Convert.ToDouble(Request["zongdefen"]);
        post["courseId"]= courseId;
        post["MultipleChoiceScore"]= !leixingdefen.ContainsKey("Single topic selection") ? 0 : leixingdefen["Single topic selection"];
        post["MultipleChoiceQuestionScore"] = !leixingdefen.ContainsKey("Multiple choice") ? 0 : leixingdefen["Multiple choice"];
        post["TotalScore"] =  total;

        long insertId = Db.name("testresult").insert(post);
        Response.Write("{\"code\":0,\"data\":" + insertId + "}");
        Response.End();
        
    }
    
    
    protected void copyextend(Dictionary<string, object> target, Hashtable source)
    {
        foreach (var key in source.Keys)
        {
            target[key.ToString()] = source[key];
        }
    }
    
    protected void copyextend(Hashtable target, Dictionary<string, object> source)
    {
        foreach (var key in source.Keys)
        {
            target[key] = source[key];
        }
    }
    
}