<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
  <jsp:include page="/include/base.jsp" />
  <head>
  <script type="text/javascript">
  function addType(){
  	 	var type_name=document.getElementById("type_name").value;
  	 	var type_status=document.getElementById("type_status").value;
  	 	if(type_name==null || ''==type_name){
  	 		alert("类型名称不能为空！");
  	 		return;
  	 	}
  	 	if(type_name.length>15){
  	 		alert("类型名称长度不能超过15");
  	 		return;
  	 	}
  	 	
  	 	var but=document.getElementById('close');
		but.disabled=true;
		but.value='添加中...';
		$.ajax({
             type: "post",
             url: "<%=basePath%>resourcetype/doinsertresourcetype",
             data: {
             		'type_name':type_name,
             		'type_status':type_status
             	   },
             dataType: "json",
             async:	false,
             success: function(data,textStatus){
	             	var msg=data.res;
	             	alert(msg);
             },
             error: function(XMLHttpRequest, textStatus, errorThrown){
             	alert("异常:"+errorThrown);
             }
         });
       but.disabled=false;
	   but.value=' 添 加 ';
				
  }
  </script>
  </head>
  
  <body>
  <!-- 页面位置 -->
    <div class="place">
    <span>位置：</span>
    <ul class="placeul">
	    <li><a href="<%=basePath%>index.jsp">首页</a></li>
	   <li>资源管理</li>
	    <li>资源类型添加</li>
	</ul>
    </div>
    <!-- 页面位置 -->
    
    <div class="rightinfo">
   	<div class="itab">
	  	<ul> 
	    <li><a href="<%=basePath%>resourcetype/toresourcetypelist">资源类型查询</a></li> 
	    <li><a href="<%=basePath%>resourcetype/toinsertresourcetype" class="selected">资源类型添加</a></li> 
	  	</ul>
	</div> 
	
	<div id="tab1" class="tabson">
	    <ul class="forminfo">
	    	<li><label>类型名称：<b>*</b></label><input type="text" id="type_name" name="type_name" value="" maxlength="15"  class="dfinput150" /></li>
		    <li><label>状态：<b>*</b></label>
		    <select id="type_status" name="type_status" class="select select151">
		    	<option value="1" selected="selected">对外</option>
				<option value="0">对内</option>
				<option value="9">作废</option>
		    </select>
		    </li>
		    <li><label><b></b></label>
		    	<input type="button" value=" 添 加 " name="close" id="close" onclick="addType();" class="btn"/>&nbsp;&nbsp;
		    	<span id="msg"></span></li>
		    
	    </ul>
	</div>
	</div>
  </body>
</html>

