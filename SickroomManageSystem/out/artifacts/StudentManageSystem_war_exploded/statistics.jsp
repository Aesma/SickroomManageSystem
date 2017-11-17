<%--
  Created by IntelliJ IDEA.
  User: Rengar
  Date: 2017/6/17
  Time: 4:56
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="org.jfree.data.general.*"%>
<%@ page import="org.jfree.chart.*"%>
<%@ page import="org.jfree.chart.plot.*"%>
<%@ page import="org.jfree.chart.*"%>
<%@ page import="org.jfree.chart.servlet.*"%>
<%@ page import="org.jfree.chart.entity.*"%>
<%@ page import="org.jfree.chart.*"%>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Iterator" %>
<%@ page import="service.StudentService" %>
<html>
<head>
    <title>学生信息管理系统</title>
</head>
<body>
<jsp:useBean id = "stuservice" class = "service.StudentService"></jsp:useBean>
<%
    //院系扇形图
    request.setCharacterEncoding("utf-8");
    List facultyList = stuservice.statisticsByFaculty();
    Iterator iter = facultyList.iterator();
    DefaultPieDataset data = new DefaultPieDataset();
    while(iter.hasNext()){
        StudentService.Faculty faculty = (StudentService.Faculty)iter.next();
        data.setValue(faculty.faculty, faculty.count);
    }
    PiePlot plot = new PiePlot(data);
    JFreeChart chart = new JFreeChart("", JFreeChart.DEFAULT_TITLE_FONT, plot, true);
    chart.setBackgroundPaint(java.awt.Color.white);
    chart.setTitle("院系扇形图");
    ChartRenderingInfo info = new ChartRenderingInfo(new StandardEntityCollection());
    String filename = ServletUtilities.saveChartAsPNG(chart, 800, 500, info, session);
    String graphURL = request.getContextPath() + "/DisplayChart?filename=" + filename;
%>
<%
    //专业扇形图
    List majorList = stuservice.statisticsByMajor();
    Iterator iterator = majorList.iterator();
    DefaultPieDataset dpd = new DefaultPieDataset();
    while(iterator.hasNext()){
        StudentService.Major major = (StudentService.Major)iterator.next();
        dpd.setValue(major.major, major.count);
    }
    PiePlot pp = new PiePlot(dpd);
    JFreeChart jfc = new JFreeChart("", JFreeChart.DEFAULT_TITLE_FONT, pp, true);
    jfc.setBackgroundPaint(java.awt.Color.white);
    jfc.setTitle("专业扇形图");
    ChartRenderingInfo chartRenderingInfo = new ChartRenderingInfo(new StandardEntityCollection());
    String file = ServletUtilities.saveChartAsPNG(jfc, 800, 500, chartRenderingInfo, session);
    String URL = request.getContextPath() + "/DisplayChart?filename=" + file;
%>
<p align="center">
<img src="<%= graphURL %>" width=800 height=500 border=0 usemap="#<%= filename %>">
<img src="<%= URL %>" width=800 height=500 border=0 usemap="#<%= file %>">
</p>
</body>
</html>
