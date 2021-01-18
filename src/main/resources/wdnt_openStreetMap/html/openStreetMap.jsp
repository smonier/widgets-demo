<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="jcr" uri="http://www.jahia.org/tags/jcr" %>
<%@ taglib prefix="template" uri="http://www.jahia.org/tags/templateLib" %>
<%@ taglib prefix="functions" uri="http://www.jahia.org/tags/functions" %>
<%@ taglib prefix="ui" uri="http://www.jahia.org/tags/uiComponentsLib" %>

<link rel="stylesheet" href="https://unpkg.com/leaflet@1.7.1/dist/leaflet.css"
      integrity="sha512-xodZBNTC5n17Xt2atTPuE1HxjVMSvLVW9ocqUKLsCC5CXdbqCmblAshOMAS6/keqq/sMZMZ19scR4PsZChSR7A=="
      crossorigin=""/>
<script src="https://unpkg.com/leaflet@1.7.1/dist/leaflet.js"
        integrity="sha512-XQoYMqMTK8LvdxXYG3nZ448hOEQiglfqkJs1NOQV44cWnUrBc8PkAOcXy20w0vlaXaVUearIOBhiXZ5V3ynxwA=="
        crossorigin=""></script>
<c:set var="displayName" value="${currentNode.properties['displayName'].string}"/>
<c:set var="uuid" value="${currentNode.UUID}"/>
<c:set var="props" value="${currentNode.propertiesAsString}"/>

<c:if test="${not empty props['zoom'] && props['zoom'] != 'auto'}">
    <c:set var="zoom" value="${props['zoom']}"/>
</c:if>
<c:set var="size" value="${props['width']}x${props['height']}"/>
<c:if test="${not empty props['mapType']}">
    <c:set var="maptype" value="${props['mapType']}"/>
</c:if>
<c:set var="language" value="${currentResource.locale.language}"/>
<c:choose>
    <c:when test="${not empty props['j:latitude'] && not empty props['j:longitude']}">
        <c:set var="location" value="${props['j:latitude']},${props['j:longitude']}"/>
    </c:when>
    <c:otherwise>
        <c:set var="location" value="${props['street']}"/>
        <c:set var="location" value="${location}${not empty location ? ',' : ''}${props['zipCode']}"/>
        <c:set var="location" value="${location}${not empty location ? ',' : ''}${props['town']}"/>
        <c:set var="location" value="${location}${not empty location ? ',' : ''}${props['country']}"/>
    </c:otherwise>
</c:choose>

<style>
    #mapid-${uuid} {
        height: ${props['height']}px;
        /*  width:

    ${props['width']}  px;*/
    }

    #mapid-${uuid} img {
        max-width: none;
        min-width: 0px;
        height: auto;
    }
</style>

<div id="mapid-${uuid}" class="mt-3"></div>

<script type="text/javascript">
    console.log("${props['country']}");
    var mymap = L.map('mapid-${uuid}').setView([${location}], ${props['zoom']});
    L.tileLayer('https://api.mapbox.com/styles/v1/{id}/tiles/{z}/{x}/{y}?access_token={accessToken}', {
        attribution: 'Map data &copy; <a href="https://www.openstreetmap.org/">OpenStreetMap</a> contributors, <a href="https://creativecommons.org/licenses/by-sa/2.0/">CC-BY-SA</a>, Imagery &copy; <a href="https://www.mapbox.com/">Mapbox</a>',
        maxZoom: 21,
        id: 'mapbox/${props['mapType']}',
        tileSize: 512,
        zoomOffset: -1,
        accessToken: '${mapBoxToken}'
    }).addTo(mymap);

    var marker = L.marker([${location}]).addTo(mymap);
    marker.bindPopup("${displayName}").openPopup();

</script>


