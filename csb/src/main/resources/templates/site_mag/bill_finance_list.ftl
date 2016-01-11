<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="/mag/style/idialog.css" rel="stylesheet" id="lhgdialoglink">
<title>财务处理</title>
<script type="text/javascript" src="/mag/js/jquery-1.10.2.min.js"></script>
<script type="text/javascript" src="/mag/js/lhgdialog.js"></script>
<script type="text/javascript" src="/mag/js/layout.js"></script>
<link href="/mag/style/pagination.css" rel="stylesheet" type="text/css">
<link href="/mag/style/style.css" rel="stylesheet" type="text/css">
</head>

<body class="mainbody"><div class="" style="left: 0px; top: 0px; visibility: hidden; position: absolute;"><table class="ui_border"><tbody><tr><td class="ui_lt"></td><td class="ui_t"></td><td class="ui_rt"></td></tr><tr><td class="ui_l"></td><td class="ui_c"><div class="ui_inner"><table class="ui_dialog"><tbody><tr><td colspan="2"><div class="ui_title_bar"><div class="ui_title" unselectable="on" style="cursor: move;"></div><div class="ui_title_buttons"><a class="ui_min" href="javascript:void(0);" title="最小化" style="display: inline-block;"><b class="ui_min_b"></b></a><a class="ui_max" href="javascript:void(0);" title="最大化" style="display: inline-block;"><b class="ui_max_b"></b></a><a class="ui_res" href="javascript:void(0);" title="还原"><b class="ui_res_b"></b><b class="ui_res_t"></b></a><a class="ui_close" href="javascript:void(0);" title="关闭(esc键)" style="display: inline-block;">×</a></div></div></td></tr><tr><td class="ui_icon" style="display: none;"></td><td class="ui_main" style="width: auto; height: auto;"><div class="ui_content" style="padding: 10px;"></div></td></tr><tr><td colspan="2"><div class="ui_buttons" style="display: none;"></div></td></tr></tbody></table></div></td><td class="ui_r"></td></tr><tr><td class="ui_lb"></td><td class="ui_b"></td><td class="ui_rb" style="cursor: se-resize;"></td></tr></tbody></table></div>
<form name="form1" method="post" action="/Verwalter/bill/user/list" id="form1">
<div>
<input type="hidden" name="__EVENTTARGET" id="__EVENTTARGET" value="${__EVENTTARGET!""}">
<input type="hidden" name="__EVENTARGUMENT" id="__EVENTARGUMENT" value="${__EVENTARGUMENT!""}">
<input type="hidden" name="__VIEWSTATE" id="__VIEWSTATE" value="${__VIEWSTATE!""}" >
</div>

<script type="text/javascript">
var theForm = document.forms['form1'];
    if (!theForm) {
        theForm = document.form1;
    }
    function __doPostBack(eventTarget, eventArgument) {
        if (!theForm.onsubmit || (theForm.onsubmit() != false)) {
            theForm.__EVENTTARGET.value = eventTarget;
            theForm.__EVENTARGUMENT.value = eventArgument;
            theForm.submit();
        }
    }

   document.onkeydown = function(event){
        if((event.keyCode || event.which) == 13){
            location.href="javascript:__doPostBack('btnSearch','')";
        }
   }
</script>
<!--导航栏-->
<div class="location" style="position: static; top: 0px;">
  <a href="javascript:history.back(-1);" class="back"><i></i><span>返回上一页</span></a>
  <a href="/Verwalter/center" class="home"><i></i><span>首页</span></a>
  <i class="arrow"></i>
  <span>票据整理</span>
  <i class="arrow"></i>
  <span>企业列表</span>  
</div>
<!--/导航栏-->

<!--工具栏-->
<div class="toolbar-wrap">
  <div id="floatHead" class="toolbar" style="position: static; top: 42px;">
      <div class="l-list">
      <ul class="icon-list">
        <li><a class="all" href="javascript:;" onclick="checkAll(this);"><i></i><span>全选</span></a></li>
        <li><a class="del" href="javascript:__doPostBack('btnDownload','')"><i></i><span>批量下载未处理票据</span></a></li>
        <#--<li><a onclick="return ExePostBack('btnDelete');" id="btnDelete" class="del" href="javascript:__doPostBack('btnDelete','')"><i></i><span>删除</span></a></li>-->
      </ul>
    </div>
    <div class="r-list">
      <input name="keywords" type="text" class="keyword" value="${keywords!""}">
      <a id="lbtnSearch" class="btn-search" href="javascript:__doPostBack('btnSearch','')">查询</a>
    </div>
  </div>
</div>
<!--/工具栏-->

<!--列表-->

<table width="100%" border="0" cellspacing="0" cellpadding="0" class="ltable">
  <tbody>
  <tr class="odd_bg">
    <th width="4%">选择</th>
    <th width="6%">编号</th>
    <th width="6%">头像</th>
    <th align="left" width="12%">用户名</th>
    <th align="center" width="15%">公司名称</th>
    <th align="center" width="6%">公司类型</th>
    <th width="6%">票据总计</th>
    <th width="6%">未处理票据</th>
    <th width="6%">未缴费</th>
    <th width="12%">操作</th>
  </tr>

    <#if user_page??>
        <#list user_page.content as user>
            <tr>
                <td align="center">
                    <span class="checkall" style="vertical-align:middle;">
                        <input id="listChkId" type="checkbox" name="listChkId" value="${user_index}" >
                    </span>
                    <input type="hidden" name="listId" id="listId" value="${user.id}">
                </td>
                <td align="center">${user.number!''}</td>
                <#--<td width="64">
                  <a href="/Verwalter/user/edit?id=${user.id}">
                    <img width="64" height="64" src="${user.headImageUri!"/mag/style/user_avatar.png"}">
                  </a>
                </td>-->
                <td align="center"><img src="<#if user.headImageUrl??&&user.headImageUrl != "">${user.headImageUrl!""} <#else>/client/images/default.jpg</#if>" width=50 height=50 /></td>
                <td>
                  <div class="user-box" style="padding-left:0;">
                    <h4><a href="/Verwalter/bill/finance/edit?userId=${user.id}"><b>${user.username!""}</b></a></h4>
                    <i>注册时间：${user.registerTime!""}</i>
                    <#--
                    <span>
                      <a class="amount" href="/Verwalter/user/point/list?userId=${user.id}" title="粮草">粮草</a>
                      <a class="point" href="/Verwalter/user/collect/list?userId=${user.id}" title="收藏商品">收藏商品</a>
                      <a class="msg" href="/Verwalter/user/recent/list?userId=${user.id}" title="浏览历史">浏览历史</a>
                      <#if user.roleId?? && user.roleId==1>
                          <a class="sms" href="/Verwalter/user/reward/list?userId=${user.id}" title="返现记录">返现记录</a>
                      </#if>
                    </span>
                    -->
                  </div>
                </td>
                <td align="center">${user.enterName!"&nbsp;"}</td>
                <td align="center">${user.enterType!''}</td>
                <td align="center">
                <#if ("billAmount_"+user.id)?eval??>
                    <#assign billAmount=("billAmount_"+user.id)?eval >
                    ${billAmount!''}
                <#else>
                0   
                </#if>        
                </td>
                <td align="center">
                <#if ("todo_"+user.id)?eval??>
                    <#assign todo=("todo_"+user.id)?eval>
                    ${todo!''}
                <#else>
                0   
                </#if> 
                </td>
                <td align="center">
                <#if ("pay_"+user.id)?eval??>
                    <#assign pay=("pay_"+user.id)?eval>
                    ${pay!''}
                <#else>
                0    
                </#if>
                </td>

                <#--<td align="center"><#if user.statusId??><#if user.statusId==0>待审核<#elseif user.statusId==1>正常</#if></#if></td>-->
                <td align="center">
					<a href="/Verwalter/bill/user/billList/${user.id}">票据列表</a>&nbsp;| 
                    <a href="/Verwalter/bill/finance/edit?userId=${user.id}">处理财务</a>&nbsp;| 
                    <a href="/Verwalter/user/pay?id=${user.id}">税费扣缴</a></td>
                    <#--<a href="/Verwalter/user/role?id=${user.id}">进入</a></td>-->
              </tr>
        </#list>
    </#if>
     
</tbody>
</table>

<!--/列表-->

<!--内容底部-->
<#assign PAGE_DATA=user_page />
<#include "/site_mag/list_footer.ftl" />
<!--/内容底部-->
</form>


</body></html>