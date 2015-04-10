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
<link rel="stylesheet" type="text/css" href="v2.0/css/lib/colorpicker.css" />
<script type="text/javascript" src="v2.0/js/lib/jquery.semantic.js" ></script>
<script type="text/javascript" src="v2.0/js/lib/jquery.ui.mask.js" ></script>
<script type="text/javascript" src="v2.0/js/lib/colorpicker.js"></script>
<script type="text/javascript" src="v2.0/js/lib/scripts.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		setSubMenuAtivo("#subMenuPreferencias");
		setMenuAtivo("#aparencia");
		$('#colorPicker').ColorPicker({flat: true});
		$("form#formAparencia").submit(function(){
			$("input#cor").val($("div.colorpicker_hex input").val());
			return true;
		});
	});
</script>
</head>
<body>
	<s:include value="../geral/cabecalho.jsp" />

	<div class="nine wide column">

		<!-- TITULO PAGINA 88888888888888888888888888888888888888888888888888888888888888888888888 -->
		<div class="ui dividing  header">
			<i class="unhide teal circular inverted icon"></i>
			<div class="content">
				Alterar Aparência
				<div class="sub header">Personalize o sistema e deixe-o com a cara do seu estabelecimento</div>
			</div>
		</div>

		<div class="ui hidden divider"></div>
		<div class="ui hidden divider"></div>

		<!-- AREA DE EDICAO 88888888888888888888888888888888888888888888888888888888888888888888888 -->
		<div class="ui form segment">
			<s:form action="mudarAparencia" id="formAparencia" method="post" enctype="multipart/form-data">
				<div class="field">
					<label>Selecione sua logo (tamanho máx.: 5MB; para melhor visualização, recomendamos imagens em formato quadricular e não retangular):</label>
					<div class="ui image tiny item">
						<a href="home">
							<s:if test="#session.profisio_user.tenant.logo == null || #session.profisio_user.tenant.logo == '' ">
								<img src="v2.0/img/logo.jpg" />
							</s:if><s:else>
								<img src="logos/<s:property value="#session.profisio_user.tenant.logo" />" />
							</s:else>
						</a>
					</div>
					<s:file name="logo" />
				</div>
				
				<div class="ui hidden divider"></div>
				<div class="ui hidden divider"></div>
				
				<div class="field">
					<label>Cor dos componentes do sistema:</label>
					<p id="colorPicker"></p>
					<s:hidden name="tenant.cor" id="cor" />
				</div>

				<div class="ui hidden divider"></div>
				
				<div class="ui buttons right floated">
					<input type="button" class="ui cancelar button" value="Cancelar" />
  					<div class="or" data-text="ou"></div>
					<s:submit value="Salvar" cssClass="ui teal submit  button" /> 
				</div>				
			</s:form>
		
		</div>

	</div>

	<s:include value="../geral/rodape.jsp" />
</body>
</html>