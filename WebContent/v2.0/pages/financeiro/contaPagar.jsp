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
	setMenuAtivo("#menuContasPagar");
	setSubMenuAtivo("#subMenuFluxoCaixa");
	setMaskDate(".data");
	setMaskNumerico(".decimal");
	setBtCancelarPage(".cancelar", "contasPagar");
	setSelectTipoContaPagar();
});
function setSelectTipoContaPagar(){
	$("select#selectTipoContaPagar").change(function(){
		if($(this).val() == "Outro"){
			$("#novoTipoContaPagar").show();
		}else{
			$("#novoTipoContaPagar").hide();
			$("#novoTipoContaPagar").val("");
		}
	});
}
</script>
</head>
<body>
	<s:include value="../geral/cabecalho.jsp" />

	<div class="fifteen wide column">
	
		<!-- TITULO DA PÁGINA 88888888888888888888888888888888888888888888888888888888888888888888888 -->

		<div class="ui dividing  header">
			<i class="dollar teal circular inverted icon"></i>
			<div class="content">
				Conta a pagar
				<div class="sub header">Edite os dados do pagamento</div>
			</div>
		</div>
		
		<div class="ui hidden divider"></div>
		<div class="ui hidden divider"></div>

		<!-- FORM EDITAR CONTA PAGAR 88888888888888888888888888888888888888888888888888888888888888888888888 -->
		
		<div class="ui areaAdd centered grid" >
			<div class="twelve wide column"> 
				<div class="ui form segment">
					<div class="ui block teal header">
						<i class="add teal icon"></i>
						<div class="content"> Editar Conta a Pagar</div>
					</div>
					<s:form action="editarContaPagar" method="post">
						<s:hidden name="contaPagar.idCript" />
						<s:if test="contaPagar.colaborador != null">
							<s:hidden name="contaPagar.colaborador.idCript" />
						</s:if>
						<h4 class="ui dividing teal header">Dados Principais</h4>
						<div class="three fields">
							<div class="required field">
								<label>Valor (R$):</label>
								<s:textfield cssClass="decimal" name="contaPagar.valorStr" />
							</div>
							<div class="field">
								<label>Mês competência:</label>
								<div class="ui icon input">
									<s:textfield name="contaPagar.mesCompetenciaStr" cssClass="medio data" />
									<i class="calendar icon"></i>
								</div>
							</div>
							<div class="field">
								<label>Data de Pagamento:</label>
								<div class="ui icon input">
									<s:textfield name="contaPagar.dataPagamentoStr" cssClass="data" />
									<i class="calendar icon"></i>
								</div>
							</div>
						</div>
						<div class="two fields">
							<div class="field">
								<label>Classificar Custo:</label>
								<s:select name="contaPagar.tipoCustoStr" cssClass="ui dropdown" list="allTiposCusto" listKey="value" listValue="valor" />
							</div>
							<div class="field">
								<label>Centro de Custo:</label>
								<s:select name="contaPagar.centroCusto.idCript" cssClass="ui dropdown"  headerKey="-1" headerValue="NENHUM" list="allCentrosCusto" listKey="idCript" listValue="nome" />
							</div>
						</div>
						<div class="two fields">
							<div class="field">
								<label>Tipo de despesa:</label>
								<s:select name="contaPagar.tipo.nome" id="selectTipoContaPagar" headerValue="ESCOLHA" headerKey="" cssClass="ui search dropdown" list="allTiposContaPagar" listKey="nome" listValue="nome" />
							</div>
							<div class="field hide " id="novoTipoContaPagar">
								<label>Novo Tipo:</label> 
								<s:textfield name="novoTipoContaPagar" />
							</div>
							<!-- 
							<div class="field">
								<label>Pago:</label>
							    <div class="ui checkbox">
									<input type="checkbox" value="PAGO" name="contaPagar.statusStr"
										<s:if test="contaPagar.statusStr == 'PAGO' ">
										 checked="checked"
										</s:if>
									 />
								</div>
							</div>
							 -->
						</div>
						<div class="field">
							<label>Observação:</label>
							<s:textarea name="contaPagar.observacao" ></s:textarea>
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
		</div>
	</div>
	
	<s:include value="../geral/rodape.jsp" />
</body>
</html>