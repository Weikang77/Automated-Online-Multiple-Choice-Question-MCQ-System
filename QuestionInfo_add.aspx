<%@ Page Language="C#" AutoEventWireup="true" CodeFile="QuestionInfo_add.aspx.cs" Inherits="QuestionInfo_add" %>
<%@ Import Namespace="app.Dbs" %>
<%@ Import Namespace="app.Util" %>

<% Server.Execute("Head.aspx"); %>
<script src="js/jquery.validate.js"></script>

<div style="padding: 10px">



<div class="container">
<div class="panel panel-default">
        <div class="panel-heading">
            Add question bank:
        </div>
        <div class="panel-body">
            <form action="QuestionInfo_add.aspx?f=f" method="post" name="form1" id="form1">
    <div class="form-group">
    <div class="row">
        <label style="width: 120px;min-height:18px;text-align: right" class="col-sm-2">Cours number</label>
        <div class="col-sm-8">
            
                                                    <%= readMap["courseId"] %><input type="hidden" id="courseId" name="courseId" value="<%= Info.html(readMap["courseId"]) %>"/></div>
    </div>
</div><div class="form-group">
    <div class="row">
        <label style="width: 120px;min-height:18px;text-align: right" class="col-sm-2">Cours name</label>
        <div class="col-sm-8">
            
                                                    <%= readMap["coursename"] %><input type="hidden" id="coursename" name="coursename" value="<%= Info.html(readMap["coursename"]) %>"/></div>
    </div>
</div><div class="form-group">
    <div class="row">
        <label style="width: 120px;min-height:18px;text-align: right" class="col-sm-2">Publisher</label>
        <div class="col-sm-8">
            
                                                    <%= readMap["publisher"] %><input type="hidden" id="publisher" name="publisher" value="<%= Info.html(readMap["publisher"]) %>"/></div>
    </div>
</div><div class="form-group">
    <div class="row">
        <label style="width: 120px;min-height:18px;text-align: right" class="col-sm-2">Exam questions<span style="color: red;">*</span></label>
        <div class="col-sm-8">
            <input type="text" class="form-control" style="width:250px;" data-rule-required="true" data-msg-required="Please fill in the examination questions" id="question" name="question" value=""/></div>
    </div>
</div><div class="form-group">
    <div class="row">
        <label style="width: 120px;min-height:18px;text-align: right" class="col-sm-2">Type</label>
        <div class="col-sm-8">
            <select class="form-control class_type3" data-value="" id="type" name="type" style="width:250px"><option value="Single topic selection">Single topic selection</option><option value="Multiple choice">Multiple choice</option></select></div>
    </div>
</div><div class="form-group">
    <div class="row">
        <label style="width: 120px;min-height:18px;text-align: right" class="col-sm-2">Options</label>
        <div class="col-sm-8">
            <div id="TypeFieldabc">
                    <div style="border: 1px solid #ededed; border-radius: 5px; padding: 10px; background: #F2F2F2;">
                        <table class="table table-hover"><thead><tr><th width="80"> </th>
                                <th>Options</th>
                                <!--<th width="80">Redirect serial number</th>-->
                                <th width="60">Score</th>
                            </tr></thead><tbody id="field_box"></tbody></table></div>
                    <button type="button" class="btn btn-default btn-sm" id="add_btn">Add the answer</button>
                </div>
                <input type="hidden" id="answer" name="answer"/><script>
    function selectType(obj)
    {
        var v = $(obj).val();
        if(v=='Single topic selection' || v=='Multiple choice'){
            $('#TypeFieldabc').show();
        }else{
            $('#TypeFieldabc').hide();
        }
    }
    
    function updateZimu()
    {
        var zimu = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
        var index = $("#field_box").find("tr").each(function(index){
            $(this).find('td:eq(0)').find('input').val(zimu.substr(index,1));
        });
    }
    
    function addFieldItem(wx){
        wx=wx||{};
        var str = [];
        str.push('<tr><td align="center" valign="middle">');
        str.push('<input type="text" readonly="readonly" style="width: 40px;" data-id="zimu" class="form-control" value="" />');
        str.push('</td><td>');
        str.push('<input type="text" style="width:100%" onblur="updateData()" data-id="title" class="form-control" value="'+(wx.title||'')+'" />');
        str.push('</td><td>');
        
        str.push('<input type="number" step="1" style="width: 60px;" onblur="updateData()" data-id="point" class="form-control" value="'+(wx.point||'0')+'" />');
        str.push('</td><td>');
        
        str.push('<button onclick="delItem(this);" type="button" class="btn btn-default">Delete</button>');
        str.push('</td></tr>');
        var html = str.join('');
        $('#field_box').append(html);
        updateZimu();
    }
    
    function delItem(obj){
        if(confirm('This operation will not be recoverable, you are sure to delete？')){
            $(obj).parent().parent().remove();
        }
        updateZimu();
    }
    $(function(){
        var __fields = [];
        if(__fields.length>0){
            $.each(__fields , function(){
                addFieldItem(this);
            });
        }else{
            addFieldItem();
        }
    });

    function updateData()
    {
        var result = [];
        $('#field_box').find('tr').each(function () {
            var obj = {};
            $(this).find('[data-id]').each(function () {
                if($(this).attr('type') == 'checkbox') {
                    obj[$(this).attr('data-id')] = $(this).attr('checked')
                }else{
                    obj[$(this).attr('data-id')] = $.trim($(this).val());
                }
            });
            if(obj.title != '' && obj.point != ''){
                result.push(obj);
            }
        });
        $('#answer').val(JSON.stringify(result));
    }
    
    $('#TypeFieldabc').on('input,checkbox' , 'blur,change' , function (e) {
        console.log(e);
    })
    
    $('#add_btn').click(addFieldItem);
    $('#form1').submit(function () {
        updateData();
        return true;
    })

</script></div>
    </div>
</div><div class="form-group">
    <div class="row">
        <label style="width: 120px;min-height:18px;text-align: right" class="col-sm-2"> </label>
        <div class="col-sm-8">
            <input type="hidden" name="subjectid" value="<%= Request["id"] %>"/><input name="referer" value="<%= Request.Headers["referer"] %>" type="hidden"/><button type="submit" class="btn btn-primary" name="Submit">
    Submit</button><button type="reset" class="btn btn-default" name="Submit2">
    Reset</button></div>
    </div>
</div></form></div>
    </div>
</div>
<script>
    $(function () {
        $('#form1').validate();
    });
</script></div>
<% Server.Execute("Foot.aspx"); %>
