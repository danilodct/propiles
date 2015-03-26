<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title><s:text name="TITULO_SISTEMA" /></title>
<link rel="stylesheet" type="text/css" href="css/lib/styles.css" />
</head>
<body>
<s:include value="geral/cabecalho.jsp" />
<s:if test="hasActionErrors()">
	<table width="100%">
		<s:iterator value="actionErrors">
			<tr>
				<td align="center"><div class="error"><s:property /></div></td>
			</tr>
		</s:iterator>
	</table>
</s:if>
<s:if test="hasActionMessages()">
<table width="100%">
	<tr>
		<td align="center"><s:iterator value="actionMessages">
			<span class="message"><s:property /></span>
			<br />
		</s:iterator><br />
		</td>
	</tr>
</table>
</s:if>
<div class="centralizador login">
<div id="containerLogin">
<form action="login" method="post">
<table>
	<tr><td class="linhaPequena"></td></tr>
	<tr>
		<td align="right">Login:</td>
		<td><input type="text" name="usuario.login" size="25" /></td>
	</tr>
	<tr><td class="linhaPequena"></td></tr>
	<tr>
		<td align="right">Senha:</td>
		<td><input type="password" name="usuario.senha" size="25" /></td>
	</tr>
	<tr><td class="linhaPequena"></td></tr>
	<tr>
		<td colspan="2" align="right"><input type="submit" value="entrar" class="submit" /></td>
	</tr>
</table>
</form>
</div>
</div>
</body>
</html>