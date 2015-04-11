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
		setSubMenuAtivo("#subMenuPreferencias");
		setMenuAtivo("#alterarSenha");
		setFormAlterarSenha();
	});
	function setFormAlterarSenha(){
		$("form#formAlterarSenha").submit(function(){
			var retorno = true;
			if($("input#novaSenha1").val() != $("input#novaSenha2").val()){
				retorno = false;
				alert("As duas senhas digitadas não conferem. Por favor digite novamente");
				$("input#novaSenha1").val("");
				$("input#novaSenha2").val("");
			}
			return retorno;
		});
	}
</script>
</head>
<body>
	<s:include value="../geral/cabecalho.jsp" />

	<div class="twelve wide column">


		<!-- TITULO DA PÁGINA 88888888888888888888888888888888888888888888888888888888888888888888888 -->
		<div class="ui dividing  header">
			<i class="unlock alternate <s:property value="#session.profisio_user.tenant.corFinal" /> circular inverted icon"></i>
			<div class="content">
				Alterar Senha
				<div class="sub header">Altere sua senha de acesso ao sistema</div>
			</div>
		</div>
		
		<div class="ui hidden divider"></div>
		<div class="ui hidden divider"></div>
		
		<!-- AREA ADD 88888888888888888888888888888888888888888888888888888888888888888888888 -->
		<div class="ui areaAdd centered grid" >
			<div class="eight wide column"> 
				<div class="ui form segment">
					<div class="ui block <s:property value="#session.profisio_user.tenant.corFinal" /> header">
						<i class="add <s:property value="#session.profisio_user.tenant.corFinal" /> icon"></i>
						<div class="content">Mudar senha de acesso</div>
					</div>
					
					<s:form action="alterarSenha" method="post" id="formAlterarSenha">
						<div class="required field">
							<label>Digite a nova senha: </label>
							<s:password name="colaborador.senha" id="novaSenha1" />
						</div>
						<div class="required field">
							<label>Digite novamente a nova senha:</label>
							<input type="password" id="novaSenha2" />
						</div>

						<div class="ui buttons right floated">
							<input type="submit" value="Alterar" class="ui <s:property value="#session.profisio_user.tenant.corFinal" /> submit  button" /> 
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