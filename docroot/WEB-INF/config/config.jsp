<%@ page pageEncoding="utf-8" %>
<%@page import="com.njshido.component.ShidoSpacerConfigurationAction" %>
<%@ taglib uri="http://java.sun.com/portlet_2_0" prefix="portlet" %>
<%@ taglib uri="http://liferay.com/tld/security" prefix="liferay-security" %>
<%@ taglib uri="http://liferay.com/tld/theme" prefix="liferay-theme" %>
<%@ taglib uri="http://liferay.com/tld/ui" prefix="liferay-ui" %>
<%@ taglib uri="http://liferay.com/tld/portlet" prefix="liferay-portlet" %>

<portlet:defineObjects />

<liferay-theme:defineObjects />

<%
	String height = String.valueOf(request.getAttribute(ShidoSpacerConfigurationAction.SHIDO_SPACER_HEIGHT));
	String color = String.valueOf(request.getAttribute(ShidoSpacerConfigurationAction.SHIDO_SPACER_COLOR));
%>
<liferay-ui:success key="success" message="your-configuration-was-saved-sucessfully"/>
<form action="<liferay-portlet:actionURL portletConfiguration='true' />" name="<portlet:namespace/>shido_image_slider_config_form" method="post">
	<div style="background:#ddd;padding:20px 0px;opacity:0.8">
		<ul>
			<li>
				<span>高度：</span>
				<input name="<portlet:namespace/><%=ShidoSpacerConfigurationAction.SHIDO_SPACER_HEIGHT%>" type="number" style="width:30%;" value="<%= height%>"/>
			</li>
			<li>
				<span>颜色：</span>
				<input name="<portlet:namespace/><%=ShidoSpacerConfigurationAction.SHIDO_SPACER_COLOR%>" type="text" style="width:30%;"  value="<%= color%>"/>
			</li>
		</ul>
	</div>
	<input type="submit" value="save"/>
</form>