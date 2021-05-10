<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Subject_detail.aspx.cs" Inherits="Subject_detail" %>
<%@ Import Namespace="app.Dbs" %>
<%@ Import Namespace="app.Util" %>
<%@ Import Namespace="fastJSON" %>

<% Server.Execute("Head.aspx"); %>

<link rel="stylesheet" href="js/layer/theme/default/layer.css">
<script src="js/layer/layer.js"></script>

<div style="padding: 10px">


    <style>
    .admin-detail {
        display: flex;
        flex-wrap: wrap;
    }
    .admin-detail .detail {
        width: 50%;
        padding: 5px;
        display: flex;
        margin-bottom: 10px;
        border-bottom: 1px solid #DEDEDE;
    }
    .admin-detail .detail .detail-title {
        width: 120px;
        text-align: right;
    }
    .admin-detail .detail .detail-content {
        flex-grow: 1;
    }
    .admin-detail .detail.detail-editor {
        width: 100%;
        flex-wrap: wrap;
    }
    .admin-detail .detail.detail-editor .detail-title {
        width: 100%;
        padding: 10px;
        margin-top: 10px;
        background: #9a0606;
        color: #ffffff;
        text-align: left;
    }
    .admin-detail .detail.detail-editor .detail-content{
        padding: 10px;
    }

</style>
    <div class="panel panel-default">
        <div class="panel-heading">
            Online exam
        </div>
        <div class="panel-body">

            <div class="admin-detail clearfix">
                <div class="detail detail-text">
                    <div class="detail-title">
                        Cours number：
                    </div>
                    <div class="detail-content">
                        <%= map["courseId"] %>
                    </div>
                </div>
                <div class="detail detail-longtext">
                    <div class="detail-title">
                        Cours name：
                    </div>
                    <div class="detail-content">
                        <%= map["coursename"] %>
                    </div>
                </div>
                <div class="detail detail-textuser">
                    <div class="detail-title">
                        Publisher：
                    </div>
                    <div class="detail-content">
                        <%= map["publisher"] %>
                    </div>
                </div>
            </div>

            <link rel="stylesheet" href="js/layer/theme/default/layer.css">
                    <script src="js/layer/layer.js"></script>
                    <script src="js/paper.js"></script>
                    <style>
                        #zhangjielianxi {
                            padding: 20px;
                            background: #f2f2f2;
                        }
                
                        #zhangjielianxi div {
                            padding: 20px;
                        }
                
                        #zhangjielianxi div h3 {
                            margin-bottom: 8px;
                        }
                        .shuxiang #zhangjielianxi .daan label{
                            display: block;
                        }
                        .tiku-message-zhengque,.tiku-message-jiexi{
                            padding: 10px;
                            padding-left: 100px;
                            margin-top: 10px;
                            background: #cdcdcd;
                
                            display: none;
                        }
                        .tiku-message-zhengque:before{
                            content: 'correct answer：';
                            display: inline;
                            float: left;
                        }
                        .tiku-message-jiexi:before{
                            content: "analyze：";
                            display: inline;
                            float: left;
                        }
                    </style>
            
            
<%
            // LIMIT 题目数
            List<Hashtable> wenda = Db.name("questionInfo").where("subjectid",map["id"]).where("type" ,"Single topic selection").order("rand()").limit(5).select();
            wenda.AddRange(Db.name("questionInfo").where("subjectid",map["id"]).where("type" ,"Multiple choice").order("rand()").limit(5).select());
%>
        <div id="shijuan"></div>
            
            
        <script>
            window.isKaoshi = false;
            (function (){
                new paper('#shijuan' , {
                    list:<%=JSON.ToJSON(wenda)%>,
                    daan:'answer',//设置答案字段
                    leixing:'type', // 设置类型字段
                    danxuanti:'Single topic selection',  // 设置单选类型
                    duoxuanti:'Multiple choice',  // 设置多选类型
                    biaoti:'question',    // 设置标题字段
                    isShuxiang:true, // false 横向摆放、true 一行一个选项
                    //jiexi:'daanjieshi', // 设置解析字段 没有就去掉
                    //zhengquedaan:'zhengquedaan', // 设置正确答案字段
                    kaoshishichang: 30, // 设置考试时长，没有则去掉
                    isRequired:true, // 是否所有的题目都要选择后才可以提交
                    submit:function (result,zongdefen,leixingdefen,time){
                        var index = layer.load(0, {
                            shade: [0.5, '#000'] //0.1透明度的白色背景
                        });
                        //设置提交考试结果地址
                        $.post("Tiku_insert.ashx?a=insert", {
                            JSON: JSON.stringify(result),
                            zongdefen:zongdefen,
                            leixingdefen:JSON.stringify(leixingdefen),
                            time:time,
                            id:<%=Request["id"]%>
                        }, function (res) {
                            layer.close(index);
                            var re = eval("(" + res + ")");
                            if (re.code == 0) {
                                layer.alert("Submitted successfully", function () {
                                    window.isKaoshi = false;
                                    //设置提交完成后跳转地址
                                    location.href = 'testresult_detail.aspx?id=' + re.data;
                                });
                            } else {
                                layer.alert(re.msg);
                            }
    
                        });
                    }
                });
                window.addEventListener('beforeunload', function (e) {
                    if (window.isKaoshi) {
                        var confirmationMessage = 'You are currently taking an exam, are you sure to leave?';
                        (e || window.event).returnValue = confirmationMessage; // compatible Gecko + IE
                        return confirmationMessage; // compatible Gecko + Webkit, Safari, Chrome
                    }
                })
            })();
        </script>
       
        </div>
    </div>


</div>
<% Server.Execute("Foot.aspx"); %>