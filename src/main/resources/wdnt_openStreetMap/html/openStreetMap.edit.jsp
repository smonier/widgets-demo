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

<template:tokenizedForm>
    <form action="<c:url value='${url.base}${currentNode.path}'/>" method="post" class="form-horizontal">

        <div class="form-group">
            <label for="inputTitle" class="col-lg-2 control-label">Title</label>
            <div class="col-lg-10">
                <input type="text" name="jcr:title" class="form-control" id="inputTitle"
                       value="${currentNode.properties['jcr:title'].string}">
            </div>
        </div>
        <div class="form-group">
            <label for="mapType" class="col-lg-2 control-label">mapType</label>
            <div class="col-lg-10">
                <select class="form-control" name="mapType" id="mapType">
                    <option value="streets-v11" ${currentNode.properties.mapType.string == 'streets-v11' ? 'selected' : ''}>
                        Street View
                    </option>
                    <option value="light-v10" ${currentNode.properties.mapType.string == 'light-v10' ? 'selected' : ''}>
                        Light Color Street View
                    </option>
                    <option value="dark-v10" ${currentNode.properties.mapType.string == 'dark-v10' ? 'selected' : ''}>
                        Dark Color Street View
                    </option>
                    <option value="outdoors-v11" ${currentNode.properties.mapType.string == 'outdoors-v11' ? 'selected' : ''}>
                        Outdoor View
                    </option>
                    <option value="satellite-v9" ${currentNode.properties.mapType.string == 'satellite-v9' ? 'selected' : ''}>
                        Satellite View
                    </option>
                </select>
            </div>
        </div>
        <div class="form-group">
            <label for="height" class="col-lg-2 control-label">Height</label>
            <div class="col-lg-10">
                <input type="text" name="height" class="form-control" id="height"
                       value="${currentNode.properties['height'].string}">
            </div>
        </div>
        <div class="form-group">
            <label for="latitude" class="col-lg-2 control-label">latitude</label>
            <div class="col-lg-10">
                <input type="text" name="latitude" class="form-control" id="latitude"
                       value="${currentNode.properties['latitude'].string}">
            </div>
        </div>
        <div class="form-group">
            <label for="longitude" class="col-lg-2 control-label">longitude</label>
            <div class="col-lg-10">
                <input type="text" name="longitude" class="form-control" id="longitude"
                       value="${currentNode.properties['longitude'].string}">
            </div>
        </div>
        <input type="hidden" name="jcrRedirectTo"
               value="<c:url value='${url.base}${renderContext.mainResource.node.path}'/>"/>
            <%-- Define the output format for the newly created node by default html or by redirectTo--%>
        <input type="hidden" name="jcrNewNodeOutputFormat" value="html"/>
        <input type="hidden" name="jcrMethodToCall" value="PUT"/>

        <div class="form-group">
            <div class="col-lg-offset-2 col-lg-10">
                <button class="btn btn-primary" type="submit">
                    <fmt:message key="save"/>
                </button>
            </div>
        </div>
    </form>
</template:tokenizedForm>
