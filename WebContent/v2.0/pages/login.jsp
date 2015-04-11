<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title><s:text name="TITULO_SISTEMA" /></title>
<link rel="stylesheet" type="text/css" href="v2.0/css/lib/jquery.ui.css" />
<link rel="stylesheet" type="text/css" href="v2.0/css/lib/semantic.css" />
<script type="text/javascript" src="v2.0/js/lib/jquery.ui.mask.js" ></script>
<script type="text/javascript" src="v2.0/js/lib/jquery.semantic.js" ></script>
<script type="text/javascript" src="v2.0/js/lib/scripts.js" ></script>
</head>
<body>

	<div class="ui hidden divider"></div>
	<div class="ui hidden divider"></div>
	<div class="ui hidden divider"></div>
	
	<div class="ui five column centered grid">
		<div class="column">
			<div class="ui one column centered grid">
				<div class="column">
					<div class="ui image big item">
						<img src="v2.0/img/logo.png">
					</div>
				</div>
			</div>
		</div>
	</div>

	<s:if test="hasActionErrors()">
		<div class="ui three column centered grid">
			<div class="column">
				<div class="ui error message">
					<i class="close icon"></i>
					<div class="header">Ocorreu um erro!</div>
					<ul class="list">
						<s:iterator value="actionErrors">
							<li><s:property /></li>
						</s:iterator>
					</ul>
				</div>
			</div>
		</div>
	</s:if>

	<div class="ui five column centered grid">
		<div class="column">
			<form class="ui form segment" action="login" method="post" autocomplete="off">
				<div class="required field">
					<div class="ui icon input">
						<s:textfield name="usuario.login" autocomplete="off" placeholder="Login" />
						<i class="user icon"></i>
					</div>
				</div>
				<div class="required field">
					<div class="ui icon input">
						<s:password name="usuario.senha" placeholder="Senha" />
						<i class="lock icon"></i>
					</div>
				</div>
				<div class="ui hidden divider"></div>
				<input type="submit" value="Entrar" class="ui <s:property value="#session.profisio_user.tenant.corFinal" /> submit right floated button" />
			</form>
		</div>
	</div>

</body>
</html>