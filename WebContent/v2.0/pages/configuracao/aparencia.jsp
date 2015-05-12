<%@page import="java.util.Arrays"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head><link rel="icon" href="http://www.propiles.com.br/img/favicon.ico" type="image/x-icon" />
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
		setMenuAtivo("#aparencia");
		$("div.cores .button").click(function(evt){
			evt.preventDefault();
			$("input#cor").val($(this).attr("id"));
			$("div.cores .button").removeClass("actived");
			$(this).addClass("actived");
			return true;
		});
	});
</script>
<script>(function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){(i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)})(window,document,'script','//www.google-analytics.com/analytics.js','ga');ga('create', 'UA-62673588-1', 'auto');ga('send', 'pageview');</script></head>
<body>
<s:hidden name="tenant.cor" id="corAtual" />
	<s:include value="../geral/cabecalho.jsp" />

	<div class="eleven wide column">

		<!-- TITULO PAGINA 88888888888888888888888888888888888888888888888888888888888888888888888 -->
		<div class="ui dividing  header">
			<i class="unhide <s:property value="#session.profisio_user.tenant.corFinal" /> circular inverted icon"></i>
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
					<div class="cores">
						<div class="ui black button <s:if test="#session.profisio_user.tenant.corFinal == 'black' " >actived</s:if>" id="black" >Preto</div>
						<div class="ui yellow button <s:if test="#session.profisio_user.tenant.corFinal == 'yellow' " >actived</s:if>" id="yellow">Amarelo</div>
						<div class="ui green button <s:if test="#session.profisio_user.tenant.corFinal == 'green' " >actived</s:if>" id="green" >Verde</div>
						<div class="ui blue button <s:if test="#session.profisio_user.tenant.corFinal == 'blue' " >actived</s:if>" id="blue" >Azul</div>
						<div class="ui orange button <s:if test="#session.profisio_user.tenant.corFinal == 'orange' " >actived</s:if>" id="orange" >Laranja</div>
						<div class="ui purple button <s:if test="#session.profisio_user.tenant.corFinal == 'purple' " >actived</s:if>" id="purple" >Rocho</div>
						<div class="ui red button <s:if test="#session.profisio_user.tenant.corFinal == 'red' " >actived</s:if>" id="red" >Vermelho</div>
						<div class="ui teal button <s:if test="#session.profisio_user.tenant.corFinal == 'teal' " >actived</s:if>" id="teal" >Teal</div>
					</div>
					<s:hidden name="tenant.cor" id="cor" />
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