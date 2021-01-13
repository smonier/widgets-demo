<%@ page language="java" contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="template" uri="http://www.jahia.org/tags/templateLib" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="jcr" uri="http://www.jahia.org/tags/jcr" %>
<%@ taglib prefix="ui" uri="http://www.jahia.org/tags/uiComponentsLib" %>
<%@ taglib prefix="functions" uri="http://www.jahia.org/tags/functions" %>
<%@ taglib prefix="query" uri="http://www.jahia.org/tags/queryLib" %>
<%@ taglib prefix="utility" uri="http://www.jahia.org/tags/utilityLib" %>
<%@ taglib prefix="s" uri="http://www.jahia.org/tags/search" %>
<%--@elvariable id="currentNode" type="org.jahia.services.content.JCRNodeWrapper"--%>
<%--@elvariable id="out" type="java.io.PrintWriter"--%>
<%--@elvariable id="script" type="org.jahia.services.render.scripting.Script"--%>
<%--@elvariable id="scriptInfo" type="java.lang.String"--%>
<%--@elvariable id="workspace" type="java.lang.String"--%>
<%--@elvariable id="renderContext" type="org.jahia.services.render.RenderContext"--%>
<%--@elvariable id="currentResource" type="org.jahia.services.render.Resource"--%>
<%--@elvariable id="url" type="org.jahia.services.render.URLGenerator"--%>
<template:addResources type="css" resources="datatables/css/bootstrap-theme.css"/>
<template:addResources type="css" resources="typeahead.css"/>

<template:addResources type="javascript" resources="jquery.min.js"/>
<template:addResources type="javascript" resources="jquery-ui.min.js,jquery.blockUI.js,workInProgress.js"/>
<template:addResources type="javascript"
                       resources="datatables/jquery.dataTables.min.js,datatables/dataTables.bootstrap-ext.js,i18n/jquery.dataTables-${currentResource.locale}.js,datatables/dataTables.i18n-sorting-ext.js,settings/dataTables.initializer.js"/>
<template:addResources type="javascript" resources="bootbox.min.js"/>
<template:addResources type="javascript" resources="underscore.min.js"/>
<template:addResources type="javascript" resources="typeahead.min.js"/>
<template:addResources type="javascript" resources="widgetsadmin.js"/>
<c:set var="jsonURL" value="${currentNode.properties['j:jsonUrl'].string}"/>
<c:set var="nodeUUID" value="${currentNode.UUID}"/>


<table class="table table-bordered table-striped" id="jsontable-${nodeUUID}">

</table>


<script>
    $(document).ready(function () {

        //callback function that configures and initializes DataTables
        function renderTable(xhrdata) {
            var cols = [];

            var exampleRecord = JSON.parse(xhrdata);
            var keys = Object.keys(exampleRecord.items[0]);

            keys.forEach(function (k) {
                cols.push({
                    title: k,
                    data: k
                    //optionally do some type detection here for render function
                });
            });

            var table = $('#jsontable-${nodeUUID}').DataTable({
                columns: cols,
                paging: false,
                searching: false,
                scrollY: 300
            });

            table.rows.add(exampleRecord.items).draw();
        }

        //xhr call to retrieve data
        var xhrcall = $.ajax('${jsonURL}');

        //promise syntax to render after xhr completes
        xhrcall.done(renderTable);
    });

</script>