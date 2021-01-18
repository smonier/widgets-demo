package org.jahia.modules.widgets.filters;
import org.apache.commons.lang.StringUtils;
import org.jahia.services.render.RenderContext;
import org.jahia.services.render.Resource;
import org.jahia.services.render.filter.AbstractFilter;
import org.jahia.services.render.filter.RenderChain;

/**
 * Inject mapbox key into request to be used client side by jsp.
 * Created by smonier on 08/09/2020.
 */
public class AlphavantageKeyFilter extends AbstractFilter {
    private static final String ALPHAVANTAGE_KEY_ATTR = "alphavantageKey";
    private String alphavantageKey;

    @Override
    public String prepare(RenderContext renderContext, Resource resource, RenderChain chain) throws Exception {
        if (StringUtils.isNotEmpty(alphavantageKey) && renderContext.getRequest().getAttribute(ALPHAVANTAGE_KEY_ATTR) == null) {
            renderContext.getRequest().setAttribute(ALPHAVANTAGE_KEY_ATTR, alphavantageKey);
        }
        return null;
    }

    public void setAlphavantageKey(String alphavantageKey) {
        this.alphavantageKey = alphavantageKey;
    }
}

