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
<c:set var="videoSize" value="${currentNode.properties.videoSize.string}"/>

<c:if test="${renderContext.editMode}">${currentNode.displayableName}</br></c:if>

<c:choose>
    <c:when test="${videoSize eq 'fixedSize'}">
     <iframe src="http://www.youtube.com/embed/?listType=user_uploads&list=${currentNode.properties.youtubeChannel.string}"
            width="${currentNode.properties.videoWidth.long}"
            height="${currentNode.properties.videoHeight.long}">
    </iframe>
    </c:when>
    <c:otherwise>
        <div class="embed-responsive embed-responsive-${currentNode.properties.aspectRatio.string}">
            <iframe class="embed-responsive-item" src="http://www.youtube.com/embed/?listType=user_uploads&list=${currentNode.properties.youtubeChannel.string}"></iframe>
        </div>
    </c:otherwise>

</c:choose>
