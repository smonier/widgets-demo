package org.jahia.modules.widgets.actions;


import org.jahia.ajax.gwt.helper.ContentManagerHelper;
import org.jahia.bin.Action;
import org.jahia.bin.ActionResult;
import org.jahia.exceptions.JahiaException;
import org.jahia.services.content.JCRContentUtils;
import org.jahia.services.content.JCRNodeWrapper;
import org.jahia.services.content.JCRSessionFactory;
import org.jahia.services.content.JCRSessionWrapper;
import org.jahia.services.render.RenderContext;
import org.jahia.services.render.Resource;
import org.jahia.services.render.URLResolver;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import javax.jcr.PathNotFoundException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;
import java.util.Locale;
import java.util.Map;

/**
 * User: smo
 * Date: Feb , 2021
 * Time: 4:06:46 PM
 */
public class addProfilePreferencesAction  extends Action {

    private ContentManagerHelper contentManager;
    private static final String profilePrefPath = "profilePrefs";
    private static final Logger logger = LoggerFactory.getLogger(addProfilePreferencesAction.class);

    public void setContentManager(ContentManagerHelper contentManager) {
        this.contentManager = contentManager;
    }

    public ActionResult doExecute(HttpServletRequest req, RenderContext renderContext, Resource resource, JCRSessionWrapper session, Map<String, List<String>> parameters, URLResolver urlResolver) throws Exception {

        logger.info("****YEAH****");
        JCRSessionWrapper jcrSessionWrapper = JCRSessionFactory.getInstance().getCurrentUserSession(resource.getWorkspace(), resource.getLocale());
        JCRNodeWrapper userPortalPreferences = null;
        String userPath = renderContext.getUser().getLocalPath();
        JCRNodeWrapper node = jcrSessionWrapper.getNode(userPath);
        try {
            userPortalPreferences = jcrSessionWrapper.getNode(userPath + "/" + profilePrefPath);
            logger.info("Profile References Directory already exists");
            userPortalPreferences.remove();
            userPortalPreferences = node.addNode(profilePrefPath, "jnt:contentList");
            userPortalPreferences.saveSession();

        } catch (PathNotFoundException pnf) {
            userPortalPreferences = node.addNode(profilePrefPath, "jnt:contentList");
            userPortalPreferences.saveSession();
            logger.info("Create Profile References Directory");

        }
        String[] profileCatPaths = req.getParameterValues("categoryPref");
        if (profileCatPaths != null) {
            for (String profileCatPath : profileCatPaths) {
                if (profileCatPath != null) {
                    JCRNodeWrapper myNewPref = null;
                    logger.info("Prefs Path ..."+userPortalPreferences.getPath());

                    JCRNodeWrapper profilePrefToCreate = session.getNode(profileCatPath);
                    String prefName = profilePrefToCreate.getName();
                    logger.info("New Pref Name ... "+prefName);
                    try {
                        myNewPref = userPortalPreferences.addNode(prefName, "wdnt:profileCategoryPrefs");
                        logger.info("Newly created Pref Name ..." + myNewPref.getName());

                        myNewPref.setProperty("jcr:title", profilePrefToCreate.getName());
                        myNewPref.setProperty("catPath", profilePrefToCreate.getPath());
                        logger.info("Node PAth ..." + profilePrefToCreate.getPath());
                        myNewPref.saveSession();
                    } catch (Exception e){
                        logger.error(e.getMessage());
                    }
                }
            }
            session.save();
        }
        return new ActionResult(HttpServletResponse.SC_OK, null, null);

    }
}
