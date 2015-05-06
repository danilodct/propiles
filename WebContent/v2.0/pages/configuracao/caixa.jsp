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

<script type="text/javascript" src="v2.0/js/lib/jquery.semantic.js" ></script>
<script type="text/javascript" src="v2.0/js/lib/jquery.ui.mask.js" ></script>
<script type="text/javascript" src="v2.0/js/lib/scripts.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		setMenuAtivo("#menuSaldoCaixa");
		setSubMenuAtivo("#subMenuGerenciamento");
		setMaskNumerico(".decimal");
		setMaskDate(".data");
	});
</script>
<script>(function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){(i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)})(window,document,'script','//www.google-analytics.com/analytics.js','ga');ga('create', 'UA-62673588-1', 'auto');ga('send', 'pageview');</script></head>
<body>
	<s:include value="../geral/cabecalho.jsp" />

	<div class="twelve wide column">


		<!-- TITULO DA PÁGINA 88888888888888888888888888888888888888888888888888888888888888888888888 -->
		<div class="ui dividing  header">
			<i class="configure <s:property value="#session.profisio_user.tenant.corFinal" /> circular inverted icon"></i>
			<div class="content">
				Configurações do Caixa
				<div class="sub header">Gerencie o valor real do caixa em determianda data</div>
			</div>
		</div>
		
		<div class="ui hidden divider"></div>
		<div class="ui hidden divider"></div>
		
		<!-- AREA ADD 88888888888888888888888888888888888888888888888888888888888888888888888 -->
		<div class="ui areaAdd centered grid" >
			<div class="twelve wide column"> 
				<div class="ui form segment">
					<div class="ui block <s:property value="#session.profisio_user.tenant.corFinal" /> header">
						<i class="add <s:property value="#session.profisio_user.tenant.corFinal" /> icon"></i>
						<div class="content"> Editar configurações iniciais do caixa</div>
					</div>
					
					<s:form action="gerenciarCaixa" method="post">
						<div class="two fields">
							<div class="required field">
								<label><i class="help circle icon hint" data-content="Este valor representa o valor real em sua conta bancária em determinada data. O objetivo é termos o sistema representando sua realidade bancária. Não se preocupe, todas as informações são sigilosas!" data-variation="inverted" ></i> Valor inicial do caixa: </label>
								<s:textfield name="configuracao.caixaValorInicialStr" cssClass="decimal" />
							</div>
							<div class="required field">
								<label><i class="help circle icon hint" data-content="O sistema irá considerar que nesta data sua conta bancária tinha o valor informado no campo anterior. Isto serve para que o sistema represente realmente a realidade de sua conta bancária" data-variation="inverted" ></i> Data quando o caixa tinha este valor:</label>
								<s:textfield name="configuracao.caixaDataInicialStr" cssClass="data" />
							</div>
						</div>

						<div class="ui buttons right floated">
							<input type="submit" value="Salvar" class="ui <s:property value="#session.profisio_user.tenant.corFinal" /> submit  button" /> 
						</div>
						
					</s:form>
				</div>
			</div>
		</div>
		
		<div class="ui hidden divider"></div>
		<div class="ui hidden divider"></div>
		

	</div>

	<s:include value="../geral/rodape.jsp" />
</body>
</html>