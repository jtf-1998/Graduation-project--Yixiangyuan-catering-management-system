<%--
  Created by IntelliJ IDEA.
  User: LQ
  Date: 2021-01-09
  Time: 22:25
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <title>溢香园火锅店消费管理系统</title>
  <meta charset="utf-8">
  <link rel="stylesheet" href="css/bootstrap.min.css">
  <link rel="stylesheet" href="css/style.css">
</head>
<body>
<section class="probootstrap-cover">
  <div>
    <div class="row probootstrap-vh-100 align-items-center text-center">
      <div class="col-sm">
        <div class="probootstrap-text">
          <h1 class="probootstrap-heading text-white mb-4">溢香园火锅店消费管理系统</h1>
          <div class="probootstrap-subheading mb-5">
            <p class="h4 font-weight-normal">Yixiangyuan hot pot restaurant consumption management system</p>
          </div>
          <p>
            <br>
            <a href="javascript:location.replace(location.href='${pageContext.request.contextPath}/comsume/index.jsp?admin_ID=${param.admin}');" class="btn btn-primary mr-2 mb-2">订餐消费子系统</a>
            <a href="javascript:location.replace(location.href='${pageContext.request.contextPath}/rest/index.jsp?admin_ID=${param.admin}');" class="btn btn-primary mr-2 mb-2">餐厅信息管理子系统</a>
            <a href="javascript:location.replace(location.href='${pageContext.request.contextPath}/analyze/index.jsp?admin_ID=${param.admin}');" class="btn btn-primary mr-2 mb-2">经营分析子系统</a>
          </p>
        </div>
      </div>
    </div>
  </div>
</section>
</body>
</html>