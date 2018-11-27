<%--
  Created by IntelliJ IDEA.
  User: chenmo
  Date: 2018/11/21
  Time: 9:20 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head>
    <title>$Title$</title>

    <style type="text/css">

      #mydiv{
        position: absolute;
        left: 50%;
        top: 50%;
        margin-left: -200px;
        margin-top: -50px;
      }
      .mouseOver{
        background: #708090;
        color: #FFFAFA;
      }
      .mouseOut{
        background: #FFFAFA;
        color: #000000;
      }

    </style>
    <script type="text/javascript">
      var xmlHttp;
      function getMore() {
          //1 获得用户输入
          var  content = document.getElementById("keyword");
          if (content.value == ""){
              clearcontent();
              return;
          }
          // 然后要给服务器发送用户输入的内容 因为我们采用ajax异步发送数据
          //所以我们要使用一个对象 XMLHttp
          xmlHttp = createXMLHttp();
          //给服务器发送数据
          var url = "search?keyword=" + escape(content.value);
          //true 表示js脚本会在send 方法之后执行 而不会等待来自服务器的响应
          xmlHttp.open("GET",url,true);
          // xmlHttp 绑定回调方法 这个回调方法会在xmlhttp状态改变的时候被调用
          //xmlHttp 状态 0-4  我们只关心4  表示完成  当完成之后再调用回调方法
          //xmlHttp.onreadystatechange = callback(); 这样写 state == 1  错误  坑
          xmlHttp.onreadystatechange = callback;
          xmlHttp.send(null);
      }
      //获得HTTPXML对象
      function createXMLHttp() {
          // 对于大多数的浏览器都适用
          var xmlHttp;
          if (window.XMLHttpRequest){
              xmlHttp = new XMLHttpRequest();
          }
          //要考虑到浏览器的兼容性
          if (window.ActiveXObject) {
              xmlHttp = new ActiveXObject("Microsoft.XMLHTTP");
              if (!xmlHttp){
                  xmlHttp = new ActiveXObject("Msxml2.XMLHTTP");
              }
          }
          return xmlHttp;
      }
      function callback() {
         if (xmlHttp.readyState == 4){
             if (xmlHttp.status == 200){
                  //获取成功 获得相应数据
                  var result = xmlHttp.responseText;
                  //获得解析数据
                  var json = eval("(" + result+")");
                  //动态显示数据 展示到输入框下面
                  // alert(json);
                   setContent(json);
             }
          }
      }
      //设置关联数据展示
      function setContent(contents) {
          clearcontent();
          setLocation();
          var size = contents.length;
          for (var i = 0; i < size;i++){
              var nextNode = contents[i];
              var tr = document.createElement("tr");
              var td = document.createElement("td");
              td.setAttribute("border","0");
              td.setAttribute("bgcolor","#FFFAFA");
              td.onmouseover = function(){
                   this.className = 'mouseOver';
              };
              td.onmouseout = function(){
                  this.className = 'mouseOut';
              };
              td.onclick = function () {
                  //
              };
              var text = document.createTextNode(nextNode);
              td.append(text);
              tr.append(td);
              document.getElementById("content_table_body").appendChild(tr);
          }
      }
      //clear data function
      function  clearcontent() {
          var contentTablebody = document.getElementById("content_table_body");
          var size = contentTablebody.childNodes.length;
          for (var i = size-1; i> 0; i--){
              contentTablebody.removeChild(contentTablebody.childNodes[i]);
          }
          document.getElementById("popDiv").style.border = "none";
      }
      function keyWordBlur() {
          clearcontent();
      }
      function setLocation(){
          var content = document.getElementById("keyword");
          var width = content.offsetWidth;
          var left = content["offsetLeft"];
          var top = content["offsetTop"]+ content.offsetHeight;
          var popDiv = document.getElementById("popDiv");
          popDiv.style.border = "black 1px solid";
          popDiv.style.left = left + "px";
          popDiv.style.top = top + "px";
          popDiv.style.width = width + "px";
          document.getElementById("content_table").style.width = width + "px";
      }
    </script>
  </head>
  <body>
  <div id="mydiv">
    <input type="test" size="50" id="keyword" onkeyup="getMore()"onblur="keyWordBlur()" onfocus="getMore()"/>
    <input type="button" value="百度一下" width="50px"/>

    <div id="popDiv">
      <table id="content_table" bgcolor="#FFFAFA" border="0" cellspacing="0" cellpadding="0">
        <tbody id="content_table_body">
        </tbody>
      </table>
    </div>
  </div>
  </body>
</html>
