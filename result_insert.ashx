﻿<%@ WebHandler Language="C#" Class="action" %>

using System;
using System.Collections;
using System.Web;
using System.Web.SessionState;
using app.Common;
using app.Util;
using app.Dbs;
using System.Collections.Generic;
using fastJSON;

public class action : ActionBase
{
    override public void processInit(HttpContext context)
    {
    }

    public void insert()
    {
        if (Session["username"] == null || "".Equals(Session["username"]))
        {
            Response.Write("{\"code\":1,\"msg\":\"You are not logged in\"}");
            Response.End();
            return;
        }
        
        string jsonstr = Request["JSON"];
        //JSONParser parser= new JSONParser();
        List<object> json = (List<object>) JSON.Parse(jsonstr);
        //JSONArray json = JSONArray.fromObject(JSON);
        String id = Request["kechengxinxiid"];
        Hashtable data = new Hashtable();
        Hashtable readMap = Dao.find("SELECT id subjectid,courseId,coursename,publisher FROM subject WHERE  id = " + id + "");
        HashtableUtil.extend(true, data, readMap);
        //copyextend(data, readMap);

        string kaishibianhao = Info.getID();
            //data.putAll(readMap);
        data["kaoshibianhao"] = kaishibianhao;
        data["examiners"] =  Session["username"];
        data["addtime"] =  Info.getDateStr();
        int total = 0;
        int danxuanti = 0;
        int panduanti = 0;
        
        Dictionary<string , int> typePoint = new Dictionary<string, int>(2);
        
        typePoint["Single topic selection"] = 0;
        typePoint["Multiple choice"] = 0;
        
        for (int i = 0; i < json.Count; i++)
        {
            Dictionary<string, object> obj = (Dictionary<string, object>)json[i];
            copyextend(data , obj);
            //data.putAll(obj);
            int defen = Convert.ToInt32(obj["score"]);
            typePoint[obj["type"].ToString()] += defen;
            total += defen;  //Integer.valueOf(String.valueOf(obj.get("defen")));
            
            if (defen == 0) {
                Db.name("wrongtopic").insert(data);
            }
            
            Db.name("result").insert(data);
        }
        
        Hashtable post = new Hashtable();
        HashtableUtil.extend(true, post, readMap);
     
        post["MultipleChoiceScore"] = typePoint["Single topic selection"];
        post["MultipleChoiceQuestionScore"] = typePoint["Multiple choice"];
        
        //post["kaoshibianhao"] = kaishibianhao;
        post["TotalScore"] =  total;
        /*post["pingyu"] = neirongContent;*/
        post["examiners"] = Session["username"];
        post["addtime"] = Info.getDateStr();
        //post["issh"] = "No";
        
        long insertId = Db.name("testresult").insert(post);
        Response.Write("{\"code\":0,\"data\":" + insertId + "}");
        Response.End();
        
    }
    
    
    protected void copyextend(Hashtable table, Dictionary<string, object> data)
    {
        foreach (var pair in data)
        {
            table[pair.Key] = pair.Value;
        }
    }
    
}