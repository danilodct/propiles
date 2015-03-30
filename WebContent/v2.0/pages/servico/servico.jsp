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
		setMenuAtivo("#menuServicos");
		setSubMenuAtivo("#subMenuGerenciamento");
		setBtCancelarPage(".cancelar", "servicos");
		setMaskInteiro(".inteiro");
		setCheckboxTemSessoes();
	});
	var qtdSessoes = 1;
	function setCheckboxTemSessoes(){
		$("input#temSessoes").change(function(){
			if($(this).is(":checked") == true){
				$("div#areaQtdSessoes").show();
				$("div#areaQtdSessoes input").val(qtdSessoes);
			}else{
				$("div#areaQtdSessoes").hide();
				$("div#areaQtdSessoes input").val("0");
			}
		});
		qtdSessoes = $("div#areaQtdSessoes input").val();
		if($("input#temSessoes").is(":checked") == true){
			$("div#areaQtdSessoes").show();
			$("div#areaQtdSessoes input").val(qtdSessoes);
		}else{
			$("div#areaQtdSessoes").hide();
			$("div#areaQtdSessoes input").val("0");
		}
	}
</script>
</head>
<body>
	<s:include value="../geral/cabecalho.jsp" />

	<div class="nine wide column">

		<!-- TITULO PAGINA 88888888888888888888888888888888888888888888888888888888888888888888888 -->
		<div class="ui dividing  header">
			<i class="configure teal circular inverted icon"></i>
			<div class="content">
				Editar Serviço
				<div class="sub header">Atualize as informações do serviço</div>
			</div>
		</div>

		<div class="ui hidden divider"></div>
		<div class="ui hidden divider"></div>

		<!-- AREA DE EDICAO 88888888888888888888888888888888888888888888888888888888888888888888888 -->
		<div class="ui form segment">
			<s:form action="editarServico" method="post">
				<s:hidden name="servico.idCript" />
				<div class="two fields">
					<div class="required field">
						<label>Nome do serviço:</label>
						<s:textfield name="servico.nome" />
					</div>
					<div class="required field">
						<label>Centro de custo:</label>
						<s:select name="servico.centroCusto.idCript" cssClass="ui dropdown" headerKey="-1" headerValue="NENHUM" list="centrosCusto" listKey="idCript" listValue="nome" />
					</div>
				</div>
				<div class="three fields">
					<div class="field">
						<label>Trabalha com sessões?</label>
						<div class="ui fitted toggle checkbox">
				        	<input type="checkbox" id="temSessoes" <s:if test="servico.qtdSessoes > 0">checked="checked"</s:if> />
				        	<label></label>
				        </div>
					</div>
					<div class="required field" id="areaQtdSessoes">
						<label>Número de sessões:</label>
						<s:textfield name="servico.qtdSessoes" cssClass="inteiro" />
					</div>
					<div class="required field">
						<label>Duração (em minutos):</label>
						<s:textfield name="servico.duracaoSessao" cssClass="inteiro" />
					</div>
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