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

<div class="widget-edit">
    <div class="box-1">
        <template:tokenizedForm>
            <form action="<c:url value="${url.base}${currentNode.path}"/>" method="POST" class="form-horizontal">
                <input type="hidden" name="jcrRedirectTo" value="<c:url value='${url.base}${renderContext.mainResource.node.path}'/>"/>
                <input type="hidden" name="jcrNodeType" value="${currentNode.primaryNodeTypeName}"/>


                <div class="form-group">
                    <label for="inputTitle" class="col-lg-2 control-label"><fmt:message key="title"/></label>
                    <div class="col-lg-10">
                        <input type="text" name="jcr:title" class="form-control" id="inputTitle" value="${currentNode.properties['jcr:title'].string}">
                    </div>
                </div>

                <div class="form-group">
                    <label for="inputstock" class="col-lg-2 control-label"><fmt:message key="jdnt_stockWidget.stock"/></label>
                    <div class="col-lg-10">
                        <input type="text" name="stock" class="form-control" id="inputstock" value="${currentNode.properties['stock'].string}">
                    </div>
                </div>
                <div class="form-group">
                    <div class="col-lg-offset-2 col-lg-10">
                        <button class="btn btn-primary" type="submit">
                            <fmt:message key="save"/>
                        </button>
                    </div>
                </div>
            </form>
        </template:tokenizedForm>
    </div>
</div>