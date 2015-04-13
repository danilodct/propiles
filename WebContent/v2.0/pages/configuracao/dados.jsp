<%@page import="java.util.Arrays"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title><s:text name="TITULO_SISTEMA" /></title>
<link rel="stylesheet" type="text/css" href="v2.0/css/lib/jquery.ui.css" />
<link rel="stylesheet" type="text/css" href="v2.0/css/lib/semantic.css" />
<style type="text/css">
.button.actived{border:5px solid red;}
</style>
<script type="text/javascript" src="v2.0/js/lib/jquery.semantic.js" ></script>
<script type="text/javascript" src="v2.0/js/lib/jquery.ui.mask.js" ></script>
<script type="text/javascript" src="v2.0/js/lib/scripts.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		setSubMenuAtivo("#subMenuPreferencias");
		setMenuAtivo("#dados");
	});
</script>
</head>
<body>
<s:hidden name="tenant.cor" id="corAtual" />
	<s:include value="../geral/cabecalho.jsp" />

	<div class="nine wide column">

		<!-- TITULO PAGINA 88888888888888888888888888888888888888888888888888888888888888888888888 -->
		<div class="ui dividing  header">
			<i class="unhide <s:property value="#session.profisio_user.tenant.corFinal" /> circular inverted icon"></i>
			<div class="content">
				Alterar Dados Pessoais
				<div class="sub header">Altere seus dados</div>
			</div>
		</div>

		<div class="ui hidden divider"></div>
		<div class="ui hidden divider"></div>

		<!-- AREA DE EDICAO 88888888888888888888888888888888888888888888888888888888888888888888888 -->
		<div class="ui form segment">
			<s:form action="mudarDados" id="formDados" method="post" >
				<div class="field">
					<label>Seu nome:</label>
					<s:textfield name="usuario.nomeUser" />
				</div>
				<div class="field">
					<label>Sua empresa:</label>
					<s:textfield name="tenant.nome" />
				</div>
				
				<div class="ui hidden divider"></div>
				
				<div class="ui buttons right floated">
					<input type="submit" value="Salvar" class="ui <s:property value="#session.profisio_user.tenant.corFinal" /> submit  button" /> 
				</div>				
			</s:form>
		
		</div>

	</div>

	<s:include value="../geral/rodape.jsp" />
</body>
</html>