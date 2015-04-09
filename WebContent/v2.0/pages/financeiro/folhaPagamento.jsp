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
	setMenuAtivo("#menuFolhaPagamento");
	setSubMenuAtivo("#subMenuFluxoCaixa");
	setMaskDate(".data");
	setMaskNumerico(".decimal");
	setBtGerarConta();
	setSelectTipoContaPagar();
});
function setSelectTipoContaPagar(){
	$("select#selectTipoContaPagar").change(function(){
		if($(this).val() == "Outro"){
			$("#novoTipoContaPagar").show();
		}else{
			$("#novoTipoContaPagar").hide();
			$("#novoTipoContaPagar input").val("");
		}
	});
}
function setBtGerarConta(){
	$("a.btGerar").click(function(evt){
		evt.preventDefault();
		//cntaObs
		var valorTotal = $(this).parent().find("input.cntaValor").val();
		$("input#cntaValor").val(valorTotal);
		var hoje = getCurrentDate();
		var mes = hoje.split("/");
		$("input#cntaMesCompetencia").val(hoje);
		$("input#cntaDataVencimento").val(hoje);
		var nome = $(this).parent().find("input.cntaColaborador").val();
		var id = $(this).parent().find("input.cntaColaboradorId").val();
		$("input#cntaColaboradorId").val(id);
		var salario = $(this).parent().find("input.cntaSalario").val();
		var parte = setNumberFormat(parseFloat(parseStringToNumber(valorTotal)) - parseFloat(parseStringToNumber(salario)));
		$("textarea#cntaObs").html(nome + "; Mês/Ano: "+mes[1] + "/"+mes[2] + "; Salário: R$ "+ salario + "; Atendimentos: R$ " + parte);
    	showModal(".modal");
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
				Folha de Pagamento
				<div class="sub header">Tenha uma visão da sua folha de pagamento com os seus colaboradores e gere contas a pagar direto em seu fluxo de caixa</div>
			</div>
		</div>
		
		<div class="ui hidden divider"></div>
		<div class="ui hidden divider"></div>
		
		<!-- AREA PESQUISA 88888888888888888888888888888888888888888888888888888888888888888888888 -->
		
		<div class="ui areaSearch centered grid" >
			<div class="wide column">
				<s:form action="folhaPagamento" cssClass="ui form fluid" >
					<div class="three fields">
						<div class="field">
							<label>Colaborador:</label>
							<s:select name="colaborador.idCript" headerKey="-1" headerValue="TODOS" cssClass="ui dropdown" list="allColaboradores" listKey="idCript" listValue="nome" />
						</div>
						<div class="field">
							<label>Escolha um mês: <i class="help circle icon hint" data-content="Escolha qualquer dia do mês desejado" data-variation="inverted" ></i></label>
							<div class="ui icon input">
								<s:textfield name="dataInicialStr" cssClass="data" />
								<i class="calendar icon"></i>
							</div>
						</div>
						<div class="field">
							<label class="visibilityHidden">Botão:</label> 
							<input type="submit" class="ui teal submit button" value="Pesquisar" />
						</div>
					</div>
				</s:form>			
			</div>
		</div>
		
		<div class="ui hidden divider"></div>
		
		
		<!-- INFO DE TOTAL 88888888888888888888888888888888888888888888888888888888888888888888888 -->
		<s:if test="dataInicialStr != null && dataInicialStr != ''">
			<h2 class="ui horizontal header divider">
				Total: R$ <s:property value="somaStr" />
			</h2>
		</s:if>
		
		<!-- TABELA DE COLABORADORES 88888888888888888888888888888888888888888888888888888888888888888888888 -->

		<s:if test="colaboradores.size > 0">
			<s:iterator value="colaboradores" >
				<h4 class="ui header"><a href="colaborador?colaborador.idCript=<s:property value="idCript" />"><s:property value="nome" /></a></h4>
				<table class="ui celled striped teal table">
					<thead>
						<tr>
							<th>Salário base</th>
							<th><s:property value="salarioBaseStr" /></th>
							<th></th>
							<th>
								<input type="hidden" class="cntaValor" value="<s:property value="somaSalarioParteStr" />" />
								<input type="hidden" class="cntaSalario" value="<s:property value="salarioBaseStr" />" />
								<input type="hidden" class="cntaColaborador" value="<s:property value="nome" />" />
								<input type="hidden" class="cntaColaboradorId" value="<s:property value="idCript" />" />
								<s:if test="!jaTemPagamentos">
									<a class="ui blue mini button hint btGerar" href="#" data-content="Ao clicar você poderá gerar uma conta a pagar no seu fluxo de caixa referente ao pagamento deste colaborador" >GERAR CONTA A PAGAR</a>
								</s:if><s:else>
									Conta a pagar já criada.
								</s:else>
							</th>
						</tr>
					</thead>
					<thead>
						<tr>
							<th>Frequência</th>
							<th>Cliente</th>
							<th>Serviço</th>
							<th>Participação (R$) <i class="help circle icon hint" data-content="Cálculo baseado na contribuição (%) que o colaborador possui em cima de cada atendimento (dado informado na tela do colaborador). O valor será igual a zero quando a frequência não for associada a um pagamento em seu cadastro. Sendo assim o sistema não tem como inferir o valor do atendimento" data-variation="inverted" ></i></th>
						</tr>
					</thead>
					<tbody>
						<s:if test="frequencias.size > 0">
							<s:iterator value="frequencias">
								<tr>
									<td><s:property value="dataStr" /></td>
									<td><a href="cadastro?cadastro.idCript=<s:property value="cadastro.idCript" />"><s:property value="cadastro.nome" /></a></td>
									<td><s:property value="servicoCerto.nome" /></td>
									<td><s:property value="porcentagemColaboradorStr" /></td>
								</tr>
							</s:iterator>
						</s:if>
						<s:else>
							<tr>
								<td colspan="5">Nenhuma frequência encontrada.</td>
							</tr>
						</s:else>
					</tbody>
				</table>
			</s:iterator>
		</s:if>
		
	</div>
	

	<div class="ui modal">
		<i class="close icon"></i>
		<div class="header">Gerar Conta a Pagar</div>
		<div class="content">
			<s:form action="cadastrarContaPagar" cssClass="ui form" >
				<s:hidden name="colaborador.idCript" />
				<s:hidden name="dataInicialStr" />
				<input type="hidden" name="contaPagar.colaborador.idCript" id="cntaColaboradorId" />
				<input type="hidden" name="aba" value="folha" />
				<h4 id="areaNomeCliente" class="ui header teal hide"></h4>
				<div class="three fields">
					<div class="required field">
						<label>Valor (R$):</label>
						<s:textfield id="cntaValor" cssClass="decimal" name="contaPagar.valorStr" />
					</div>
					<div class="required field">
						<label>Mês competência: <i class="help circle icon hint" data-content="Escolha uma data e o sistema usará o mês como o mês de competência para esta despesa em seus relatórios" data-variation="inverted" ></i></label>
						<div class="ui icon input">
							<s:textfield id="cntaMesCompetencia" name="contaPagar.mesCompetenciaStr" cssClass="data" />
							<i class="calendar icon"></i>
						</div>
					</div>
					<div class="field">
						<label>Data de Pagamento:</label>
						<div class="ui icon input">
							<s:textfield id="cntaDataVencimento" name="contaPagar.dataPagamentoStr" cssClass="data" />
							<i class="calendar icon"></i>
						</div>
					</div>
				</div>
				<div class="three fields">
					<div class="field">
						<label>Classificar Custo:</label>
						<s:select name="contaPagar.tipoCustoStr" value="FIXO" cssClass="ui dropdown" list="allTiposCusto" listKey="value" listValue="valor" />
					</div>
					<div class="field">
						<label>Centro de Custo:</label>
						<s:select name="contaPagar.centroCusto.idCript" cssClass="ui dropdown"  headerKey="-1" headerValue="NENHUM" list="allCentrosCusto" listKey="idCript" listValue="nome" />
					</div>
				</div>
				<div class="three fields">
					<div class="field">
						<label>Tipo de despesa:</label>
						<s:select name="contaPagar.tipo.id" id="selectTipoContaPagar" headerValue="ESCOLHA" headerKey="" cssClass="ui dropdown" list="allTiposContaPagar" listKey="id" listValue="nome" />
					</div>
					<div class="field hide " id="novoTipoContaPagar">
						<label>Novo Tipo:</label> 
						<s:textfield name="novoTipoContaPagar" />
					</div>
					<div class="field">
						<label>Pago:</label>
					    <div class="ui checkbox">
							<input type="checkbox" value="PAGO" name="contaPagar.statusStr" checked="checked" />
						</div>
					</div>
				</div>
				<div class="field">
					<label>Observação:</label>
					<s:textarea name="contaPagar.observacao" id="cntaObs" ></s:textarea>
				</div>
							
				<div class="ui hidden divider"></div>
						
				<div class="ui actions buttons right floated">
					<div class="ui button">Cancelar</div>
					<div class="or" data-text="ou"></div>
					<s:submit cssClass="ui positive right submit button" value="Salvar" />
				</div>
			</s:form>
		</div>
	</div>
	
	<s:include value="../geral/rodape.jsp" />
</body>
</html>