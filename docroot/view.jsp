<%@ page pageEncoding="utf-8"%>
<%@page import="com.liferay.portal.kernel.util.StringPool"%>
<%@page import="javax.portlet.PortletPreferences"%>
<%@page import="com.njshido.component.ShidoSpacerConfigurationAction" %>
<%@ taglib uri="http://java.sun.com/portlet_2_0" prefix="portlet"%>
<%@ taglib uri="http://liferay.com/tld/security" prefix="liferay-security"%>
<%@ taglib uri="http://liferay.com/tld/theme" prefix="liferay-theme"%>
<%@ taglib uri="http://liferay.com/tld/ui" prefix="liferay-ui"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<portlet:defineObjects />

<%
	PortletPreferences preferences = renderRequest.getPreferences();
	String height = preferences.getValue(ShidoSpacerConfigurationAction.SHIDO_SPACER_HEIGHT, ShidoSpacerConfigurationAction.SHIDO_SPACER_HEIGHT_DEFAULT_VAL);
	String color = preferences.getValue(ShidoSpacerConfigurationAction.SHIDO_SPACER_COLOR, ShidoSpacerConfigurationAction.SHIDO_SPACER_COLOR_DEFAULT_VAL);
%>
<div style="width:100%;height:<%= height%>px;background:<%= color%>;"></div>