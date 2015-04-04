package com.njshido.component;

import javax.portlet.ActionRequest;
import javax.portlet.ActionResponse;
import javax.portlet.PortletConfig;
import javax.portlet.PortletPreferences;
import javax.portlet.RenderRequest;
import javax.portlet.RenderResponse;

import com.liferay.portal.kernel.portlet.DefaultConfigurationAction;
import com.liferay.portal.kernel.servlet.SessionMessages;
import com.liferay.portal.kernel.util.ParamUtil;
import com.liferay.portal.kernel.util.Validator;
import com.liferay.portlet.PortletPreferencesFactoryUtil;

public class ShidoSpacerConfigurationAction extends DefaultConfigurationAction {
	
	public static final String SHIDO_SPACER_HEIGHT = "shido_spacer_height";
	public static final String SHIDO_SPACER_COLOR = "shido_spacer_color";
	
	private static final String CONFIG_JSP = "/WEB-INF/config/config.jsp";
	private static final String SUCCESS = "success";
	
	public static final String SHIDO_SPACER_HEIGHT_DEFAULT_VAL = "50";
	public static final String SHIDO_SPACER_COLOR_DEFAULT_VAL = "#ffffff";
	
	@Override
	public String render(PortletConfig portletConfig, RenderRequest renderRequest, RenderResponse renderResponse)
			throws Exception {
		String portletId = renderRequest.getParameter("portletResource");
		PortletPreferences preferences = PortletPreferencesFactoryUtil.getPortletSetup(renderRequest, portletId);
		renderRequest.setAttribute(SHIDO_SPACER_HEIGHT, preferences.getValue(SHIDO_SPACER_HEIGHT, SHIDO_SPACER_HEIGHT_DEFAULT_VAL));
		renderRequest.setAttribute(SHIDO_SPACER_COLOR, preferences.getValue(SHIDO_SPACER_COLOR, SHIDO_SPACER_COLOR_DEFAULT_VAL));
		return CONFIG_JSP;
	}
	
	@Override
	public void processAction(PortletConfig portletConfig,
			ActionRequest actionRequest, ActionResponse actionResponse)
			throws Exception {
		String portletResource = ParamUtil.getString(actionRequest, "portletResource");
		PortletPreferences preferences = PortletPreferencesFactoryUtil.getPortletSetup(actionRequest, portletResource);
		if (Validator.isNotNull(preferences)) {
			String height = ParamUtil.getString(actionRequest, SHIDO_SPACER_HEIGHT);
			String color = ParamUtil.getString(actionRequest, SHIDO_SPACER_COLOR);
			
			preferences.setValue(SHIDO_SPACER_HEIGHT, height);
			preferences.setValue(SHIDO_SPACER_COLOR, color);
			preferences.store();
			
			SessionMessages.add(actionRequest, SUCCESS);
		}
		super.processAction(portletConfig, actionRequest, actionResponse);
	}
	
}
