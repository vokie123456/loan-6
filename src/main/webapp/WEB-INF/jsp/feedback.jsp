<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="common/commonTag.jsp" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'feedback.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
	<script type='text/javascript' src='/loan/dwr/interface/DwrPush.js'></script>

  </head>
  
  <body>
  	<%@ include file="common/navbar.jsp" %>
  	  	 <div class="container-fluid-full">
		<div class="row-fluid">
			<%@include file="common/sidebar.jsp" %>
			<div id="content" class="span10">
			<ul class="breadcrumb">
				<li>
					<i class="icon-home"></i>
					借贷系统 
					<i class="icon-angle-right"></i>
				</li>
				<li>
					<a href="index/toIndex">首页 </a>
					<i class="icon-angle-right"></i>
				</li>
				<li>意见反馈</li>
			</ul>
			<div class="row-fluid sortable ui-sortable">
				<div class="box span7">
					<div class="box-header" data-original-title="">
						<h2><i class="halflings-icon user"></i><span class="break"></span>
							信息反馈
						</h2>
						<div class="box-icon">
							<a class="btn-close" href="#"><i class="halflings-icon white remove"></i></a>
						</div>
					</div>
					<div class="box-content">
						    输入反馈意见:<input type="text" id="data" name='data' />&nbsp;&nbsp;&nbsp;&nbsp;
							<input type='button' id="button" value="publish">
					</div>
				</div>
				
				
			<div class="span5 noMarginLeft">
					
				<div class="dark">
					
					<h1>反馈</h1>
					
					<div class="timeline">
						
					    <div class="timeslot" style="height: 150px;">
							<div class="task">
					    		<span>
									<span class="details">
										填写反馈信息
									</span>
								</span>
								<div class="arrow"></div>
							</div>							
							<div class="icon">
								<i class="icon-map-marker"></i>
							</div>
							<div class="time">
								3:43 PM
							</div>	
					    </div>
					
						<div class="clearfix"></div>
						
						<div class="timeslot alt" style="height: 150px;">
					    	
							<div class="task">
					    		<span>
									<span class="details">
										消息将推送至管理员
									</span>
								</span>
								<div class="arrow"></div>
							</div>
							<div class="icon">
								<i class="icon-phone"></i>
							</div>
							<div class="time">
								3:43 PM
							</div>	
								
					    </div>
					
						<div class="timeslot" style="height: 300px;">
					    	
							<div class="task">
					    		<span>
									<span class="details">
										可在【反馈中心】查看反馈记录与管理员的回复
									</span>
								</span>
								<div class="arrow"></div>
							</div>
							<div class="icon">
								<i class="icon-envelope"></i>
							</div>
							<div class="time">
								3:43 PM
							</div>	
								
					    </div>
					</div>
				</div>
				
			</div>
			</div>
			</div>
		</div>
		</div>
  </body>
    <script type="text/javascript">
  	$("#button").click(function() {
		var data = $("#data").val();
		var sendRole = "admin";
		alert(123);
		$.ajax({
			type:"post",
			url:"feedback/addFeedback",
			async:true,
			data:{feedbackContent:data},
			success:function(result){
				if(result.isSuccess){
					layer.alert("反馈成功!");
					DwrPush.FeedbackSend(sendRole,data); // 发送服务器推送，此类即为根据java文件生成的js文件
				}else{
					layer.alert(result.errorMessage);
				}
			}
		});
		//保存反馈信息
	});
	
  </script>
</html>
