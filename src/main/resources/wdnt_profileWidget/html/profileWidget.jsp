<%@ taglib prefix="jcr" uri="http://www.jahia.org/tags/jcr" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="template" uri="http://www.jahia.org/tags/templateLib" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%--@elvariable id="currentNode" type="org.jahia.services.content.JCRNodeWrapper"--%>
<%--@elvariable id="renderContext" type="org.jahia.services.render.RenderContext"--%>

<template:addResources type="javascript" resources="vendor/handlebars.runtime.min.js"/>
<template:addResources type="javascript" resources="templates/userinfo.precompiled.js"/>
<template:addResources type="javascript" resources="userdata.js"/>
<template:addResources type="css" resources="userdata.css"/>


<script type="text/javascript">
    $(function() {
        // Handlebars.registerHelper("formatDate", (dateAsString) => {
        //     var date = new Date(dateAsString);
        //     return (date.getMonth()+1) + "/" + date.getDate() + "/" + date.getFullYear();
        // });

        $(".profile-loaded-subscriber").bind("profileLoaded", (e, data) => {
            var target = $(".profile-loaded-subscriber > .profile-data");
            var template = Handlebars.templates.userinfo;
            target.html(template(data.profileProperties));
        });
    });
</script>


<div class="navbar-nav ml-auto profile-loaded-subscriber">
    <div class="container profile-data">
        <%--        <div class="col-4">--%>
        <%--            <img src="/modules/jexperience/images/default-profile.jpg" class="user-avatar img-fluid">--%>
        <%--        </div>--%>
        <%--        <div class="col-8 text-muted">--%>
        <%--            <div class="row">--%>
        <%--                <div class="col text-uppercase">--%>
        <%--                    Alan Richards--%>
        <%--                </div>--%>
        <%--            </div>--%>
        <%--            <div class="row">--%>
        <%--                <div class="col">--%>
        <%--                    Pension ID: MEM12345678--%>
        <%--                </div>--%>
        <%--            </div>--%>
        <%--            <div class="row">--%>
        <%--                <div class="col">--%>
        <%--                    Last logged in: Today--%>
        <%--                </div>--%>
        <%--            </div>--%>
        <%--        </div>--%>
    </div>
</div>