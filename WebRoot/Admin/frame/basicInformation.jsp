<%@ page language="java" contentType="text/html; UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>网站管理基本信息</title>
<link href="../css/style.css" rel="stylesheet" type="text/css" />
	<script type="text/javascript" src="../js/jquery.min.js"></script>
	<script type="text/javascript" src="../js/AdminIndex.js"></script>
<script type="text/javascript" src="../js/jscharts.js"></script>
</head>

<body>
    <div id="wrap">
    <div class="content-box"><!-- Start Content Box -->
				
				<div class="content-box-header">
					
					<h3>网站概况</h3>
<h5 style="float:right; padding:12px 20px 0 0">
上次更新 — 13:34:45 (2 秒 前)
下次更新 — 13:34:45</h5>
					
					
					<div class="clear"></div>
					
				</div> <!-- End .content-box-header -->
				
				<div class="content-box-content" style="display: block; ">
					
					<!--<div class="tab-content default-tab" id="tab1" style="display: block; "> <!-- This is the target div. id must match the href of this div's tab -->
						<!--
						<div class="notification attention png_bg">
							<a href="#" class="close"><img src="../images/cross_grey_small.png" title="Close this notification" alt="close"></a>
							<div>
								This is a Content Box. You can put whatever you want in it. By the way, you can close this notification with the top-right cross.
							</div>
						</div>-->
						
						<table>
							
							<thead>
								<tr>
								   <th></th>
								   <th>今天</th>
								   <th>预计</th>
								   <th>昨天</th>
								   <th>7天</th>
								   <th>周平均</th>
								   <th>30天</th>
								   <th>12 月</th>	
								   <th>总计</th>							
								</tr>
								
							</thead>
						 
							<tfoot>
								<tr>
									<td colspan="8">
										
										<div class="pagination">
											<a href="#" title="First Page">« 首页</a><a href="#" title="Previous Page">« 上一页</a>
											<a href="#" class="number" title="1">1</a>
											<a href="#" class="number" title="2">2</a>
											<a href="#" class="number current" title="3">3</a>
											<a href="#" class="number" title="4">4</a>
											<a href="#" title="Next Page">下一页 »</a><a href="#" title="Last Page">最后一页 »</a>
										</div> <!-- End .pagination -->
										<div class="clear"></div>
									</td>
								</tr>
							</tfoot>
						 
							<tbody>
								<tr class="alt-row">
									<th>PV(浏览量)</th>
									<td>527</td>
									<td>946</td>
									<td>1092</td>
									<td>8497</td>
									<td>1328</td>
									<td>43803</td>
									<td>705881</td>
									<td>8593714</td>
								</tr>
								<tr>
									<th>IP数</th>								
									<td>112</td>
									<td>201</td>
									<td>272</td>
									<td>1874</td>
									<td>293</td>
									<td>10303</td>
									<td>112483</td>
									<td>2886528</td>
								</tr>
								<tr>
									<th>UV(访客数)</th>								
									<td>112</td>
									<td>201</td>
									<td>272</td>
									<td>1874</td>
									<td>293</td>
									<td>10303</td>
									<td>112483</td>
									<td>2886528</td>
								</tr>
								<tr>
									<th>独立 Session</th>								
									<td>112</td>
									<td>201</td>
									<td>272</td>
									<td>1874</td>
									<td>293</td>
									<td>10303</td>
									<td>112483</td>
									<td>2886528</td>
								</tr>
								<tr>
									<th>回头客总量</th>								
									<td>112</td>
									<td>201</td>
									<td>272</td>
									<td>1874</td>
									<td>293</td>
									<td>10303</td>
									<td>112483</td>
									<td>2886528</td>
								</tr>
								<tr>
									<th>跳出次数</th>								
									<td>112</td>
									<td>201</td>
									<td>272</td>
									<td>1874</td>
									<td>293</td>
									<td>10303</td>
									<td>112483</td>
									<td>2886528</td>
								</tr>
								<tr>
									<th>跳出率</th>		
									<td>52.6%</td>
									<td>52.2%</td>
									<td>58.5%</td>
									<td>58.0%</td>
									<td>58.3%</td>
									<td>55.5%</td>
									<td>54.7%</td>
									<td>54.7%</td>
								</tr>
								<tr>
									<th>平均浏览量</th>								
									<td>112</td>
									<td>201</td>
									<td>272</td>
									<td>1874</td>
									<td>293</td>
									<td>10303</td>
									<td>112483</td>
									<td>2886528</td>
								</tr>
								<tr>
									<th>UV(访客数)</th>								
									<td>112</td>
									<td>201</td>
									<td>272</td>
									<td>1874</td>
									<td>293</td>
									<td>10303</td>
									<td>112483</td>
									<td>2886528</td>
								</tr>
								<tr>
									<th>平均 Session</th>								
									<td>112</td>
									<td>201</td>
									<td>272</td>
									<td>1874</td>
									<td>293</td>
									<td>10303</td>
									<td>112483</td>
									<td>2886528</td>
								</tr>
								<tr>
									<th>平均 IP 访客数</th>								
									<td>112</td>
									<td>201</td>
									<td>272</td>
									<td>1874</td>
									<td>293</td>
									<td>10303</td>
									<td>112483</td>
									<td>2886528</td>
								</tr>
								
							</tbody>
							
						</table>
						
					</div> <!-- End #tab1 -->
					
					
					
				</div> <!-- End .content-box-content -->
				
		<div id="graph">Loading graph...</div>

<script type="text/javascript">
	var myData = new Array([1, 780], [2, 480], [3, 650], [4, 610], [5, 440], [6, 580], [7, 400], [8, 850], [9, 890], [10, 920],[11, 780], [12, 480], [13, 650], [14, 610], [15, 440], [16, 580], [17, 400], [18, 850], [19, 890], [20, 920],[21, 780], [22, 480], [23, 650], [24, 610], [25, 440], [26, 580], [27, 400], [28, 850], [29, 890], [30, 920]);
	var myChart = new JSChart('graph', 'line');
	myChart.setDataArray(myData);
	myChart.setTitle('过去 30 天访问人数');
	myChart.setTitleColor('#000');
	myChart.setTitleFontSize(30);
	myChart.setAxisNameX('');
	myChart.setAxisNameY('');
	myChart.setAxisColor('#8420CA');
	myChart.setAxisValuesColor('#949494');
	myChart.setAxisPaddingLeft(100);
	myChart.setAxisPaddingRight(120);
	myChart.setAxisPaddingTop(50);
	myChart.setAxisPaddingBottom(40);
	myChart.setAxisValuesDecimals(3);
	myChart.setAxisValuesNumberX(30);
	myChart.setShowXValues(false);
	myChart.setGridColor('#C5A2DE');
	myChart.setLineColor('#BBBBBB');
	myChart.setLineWidth(2);
	myChart.setFlagColor('#9D12FD');
	myChart.setFlagRadius(4);
	var i=0;
	for(i=0;i<30;i++){

	myChart.setTooltip([i+1, myData[i][1]+'人']);
	}
	for(i=0;i<30;i++){

	myChart.setLabelX([i+1, i+1]);
	}
	myChart.setSize(800, 400);
	myChart.draw();
</script>
			</div>
    
			


    
</body>
</html>
