/*
 * ==========================================================================================
 * =                   JAHIA'S DUAL LICENSING - IMPORTANT INFORMATION                       =
 * ==========================================================================================
 *
 *                                 http://www.jahia.com
 *
 *     Copyright (C) 2002-2020 Jahia Solutions Group SA. All rights reserved.
 *
 *     THIS FILE IS AVAILABLE UNDER TWO DIFFERENT LICENSES:
 *     1/GPL OR 2/JSEL
 *
 *     1/ GPL
 *     ==================================================================================
 *
 *     IF YOU DECIDE TO CHOOSE THE GPL LICENSE, YOU MUST COMPLY WITH THE FOLLOWING TERMS:
 *
 *     This program is free software: you can redistribute it and/or modify
 *     it under the terms of the GNU General Public License as published by
 *     the Free Software Foundation, either version 3 of the License, or
 *     (at your option) any later version.
 *
 *     This program is distributed in the hope that it will be useful,
 *     but WITHOUT ANY WARRANTY; without even the implied warranty of
 *     MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
 *     GNU General Public License for more details.
 *
 *     You should have received a copy of the GNU General Public License
 *     along with this program. If not, see <http://www.gnu.org/licenses/>.
 *
 *
 *     2/ JSEL - Commercial and Supported Versions of the program
 *     ===================================================================================
 *
 *     IF YOU DECIDE TO CHOOSE THE JSEL LICENSE, YOU MUST COMPLY WITH THE FOLLOWING TERMS:
 *
 *     Alternatively, commercial and supported versions of the program - also known as
 *     Enterprise Distributions - must be used in accordance with the terms and conditions
 *     contained in a separate written agreement between you and Jahia Solutions Group SA.
 *
 *     If you are unsure which license is appropriate for your use,
 *     please contact the sales department at sales@jahia.com.
 */
package org.jahia.modules.widgets.services;

import org.drools.core.spi.KnowledgeHelper;
import org.jahia.services.content.JCRNodeWrapper;
import org.jahia.services.content.rules.AddedNodeFact;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import javax.jcr.RepositoryException;
import java.io.*;
import java.net.URL;
import java.nio.charset.Charset;

public class LocationService {

    private String locationIQApiKey;
    private static final Logger logger = LoggerFactory.getLogger(LocationService.class);

    public void geocodeAddress(AddedNodeFact node, KnowledgeHelper drools) throws RepositoryException,IOException, JSONException {
        
        logger.info("Starting GEOCODING");

        JCRNodeWrapper nodeWrapper = node.getNode();
        String json;

        StringBuilder address = new StringBuilder();
        if (nodeWrapper.hasProperty("street")) {
            address.append(nodeWrapper.getProperty("street").getString());
        }
        if (nodeWrapper.hasProperty("zipCode")) {
            address.append(", ").append(nodeWrapper.getProperty("zipCode").getString());
        }
        if (nodeWrapper.hasProperty("town")) {
            address.append(", ").append(nodeWrapper.getProperty("town").getString());
        }
        if (nodeWrapper.hasProperty("country")) {
            address.append(", ").append(nodeWrapper.getProperty("country").getValue());
        }

        if (address.length() > 0) {

            logger.info("Address to GEOCODE: " + address.toString());

            try {
                json = readJsonFromUrl("https://eu1.locationiq.com/v1/search.php?key="+ locationIQApiKey +"&q=" + address.toString() + "&format=json");
                logger.info("JSON returned: " + json);


                JSONArray jsonArray = new JSONArray(json);
                for (int count = 0; count<1; count++){
                    JSONObject jsonObject = jsonArray.getJSONObject(count);
                    nodeWrapper.setProperty("latitude", jsonObject.get("lat").toString());
                    nodeWrapper.setProperty("longitude", jsonObject.get("lon").toString());
                    nodeWrapper.setProperty("displayName", jsonObject.get("display_name").toString());
                }
            } catch (JSONException e) {
                e.printStackTrace();
            }

        }
    }

    private static String readAll(Reader rd) throws IOException {
        StringBuilder sb = new StringBuilder();
        int cp;
        while ((cp = rd.read()) != -1) {
            sb.append((char) cp);
        }
        return sb.toString();
    }

    public static String readJsonFromUrl(String url) throws IOException, JSONException {
        InputStream is = new URL(url).openStream();
        try {
            BufferedReader rd = new BufferedReader(new InputStreamReader(is, Charset.forName("UTF-8")));
            String jsonText = readAll(rd);
          //  JSONObject json = new JSONObject(jsonText);
            return jsonText;
        } finally {
            is.close();
        }
    }
    public void setLocationIQApiKey(Object locationIQApiKey) {
        this.locationIQApiKey = (String) locationIQApiKey;
    }

}
