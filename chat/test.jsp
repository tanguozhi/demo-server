<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>精美的表格样式</title>
<style type="text/css">
<!--
body,table{
    font-size:12px;
}
table{
    table-layout:fixed;
    empty-cells:show; 
    border-collapse: collapse;
    margin:0 auto;
}
/*这个是借鉴一个论坛的样式*/
table.t1{
    border:1px solid #cad9ea;
    color:#666;
}
table.t1 th {
    background-image: url(th_bg1.gif);
    background-repeat::repeat-x;
    height:30px;
}
table.t1 td,table.t1 th{
    border:1px solid #cad9ea;
    padding:0 1em 0;
}
table.t1 tr.a1{
    background-color:#f5fafe;
}


-->
</style>
<script type="text/javascript">
    function ApplyStyle(s){
        document.getElementById("mytab").className=s.innerText;
    }
</script>
</head>

<body>
<table width="90%" id="mytab"  border="1" class="t1">
  <thead>
    <th width="10%">网名</th>
    <th width="30%">博客</th>
    <th width="20%">电邮</th>
    <th width="30%">网络硬盘</th>
    <th width="10%">QQ</th>
  </thead>
  <tr class="a1">
    <td>wallimn</td>
    <td>http://blog.csdn.net/wallimn</td>
    <td>wallimn@tom.com</td>
    <td>http://wallimn.ys168.com</td>
    <td>54871876</td>
  </tr>
  <tr>
    <td>长三江</td>
    <td>村在</td>
    <td>北京天安门</td>
    <td>东四十条</td>
    <td>21345678</td>
  </tr>
  <tr class="a1">
    <td>长三江</td>
    <td>村在</td>
    <td>北京天安门</td>
    <td>东四十条</td>
    <td>21345678</td>
  </tr>
  <tr>
    <td>长三江</td>
    <td>村在</td>
    <td>北京天安门</td>
    <td>东四十条</td>
    <td>21345678</td>
  </tr>
  <tr class="a1">
    <td>wallimn</td>
    <td>http://blog.csdn.net/wallimn</td>
    <td>wallimn@tom.com</td>
    <td>http://wallimn.ys168.com</td>
    <td>54871876</td>
  </tr>
  <tr>
    <td>长三江</td>
    <td>村在</td>
    <td>北京天安门</td>
    <td>东四十条</td>
    <td>21345678</td>
  </tr>
  <tr class="a1">
    <td>长三江</td>
    <td>村在</td>
    <td>北京天安门</td>
    <td>东四十条</td>
    <td>21345678</td>
  </tr>
  <tr>
    <td>长三江</td>
    <td>村在</td>
    <td>北京天安门</td>
    <td>东四十条</td>
    <td>21345678</td>
  </tr>
</table>

</body>
</html>
