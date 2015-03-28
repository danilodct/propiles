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
	setBtRemover();
	setBtAdd();
	setSelectTipoContaPagar();
	setMesCompetencia();
});
function setMesCompetencia(){
	$("input#campoMesCompetencia").change(function(){
		if($("input#campoDataVencimento").val().length != 10){
			$("input#campoDataVencimento").val($(this).val());
		}
	});
}
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
</script>
</head>
<body>
	<s:include value="../geral/cabecalho.jsp" />

	<div class="fifteen wide column">
	
		<!-- TITULO DA PÁGINA 88888888888888888888888888888888888888888888888888888888888888888888888 -->

		<div class="ui dividing  header">
			<i class="dollar teal circular inverted icon"></i>
			<div class="content">
				Contas a pagar
				<div class="sub header">Gerencie todos os pagamentos (aluguel, manutenção, material, etc.)</div>
			</div>
		</div>
		
		<div class="ui hidden divider"></div>

		<!-- BT ADD CONTA PAGAR 88888888888888888888888888888888888888888888888888888888888888888888888 -->
		
		<div class="left floated column">
			<a href="#" class="btAdd" title="Inserir novo" >
				<i class="add circle big teal icon"></i>
			</a>
		</div>
		
		<div class="ui hidden divider"></div>

		<!-- FORM INSERIR CONTA PAGAR 88888888888888888888888888888888888888888888888888888888888888888888888 -->
		
		<div class="ui areaAdd hide centered grid" >
			<div class="twelve wide column"> 
				<div class="ui form segment">
					<div class="ui block teal header">
						<i class="add teal icon"></i>
						<div class="content"> Inserir Conta a Pagar</div>
					</div>
					<s:form id="formInserirContaPagar" action="cadastrarContaPagar" method="post">
						<h4 class="ui dividing teal header">Dados Principais</h4>
						<div class="three fields">
							<div class="required field">
								<label>Valor (R$):</label>
								<s:textfield cssClass="decimal" name="contaPagar.valorStr" />
							</div>
							<div class="required field">
								<label>Mês competência: <i class="help circle icon hint" data-content="Escolha uma data e o sistema usará o mês como o mês de competência para esta despesa em seus relatórios" data-variation="inverted" ></i></label>
								<div class="ui icon input">
									<s:textfield name="contaPagar.mesCompetenciaStr" id="campoMesCompetencia" cssClass="data" />
									<i class="calendar icon"></i>
								</div>
							</div>
							<div class="field">
								<label>Data de Pagamento:</label>
								<div class="ui icon input">
									<s:textfield name="contaPagar.dataPagamentoStr" id="campoDataVencimento" cssClass="data" />
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
								<s:select name="contaPagar.centroCusto.id" cssClass="ui dropdown"  headerKey="-1" headerValue="NENHUM" list="allCentrosCusto" listKey="id" listValue="nome" />
							</div>
						</div>
						<div class="two fields">
							<div class="field">
								<label>Tipo de despesa:</label>
								<s:select name="contaPagar.tipo.nome" id="selectTipoContaPagar" headerValue="ESCOLHA" headerKey="" cssClass="ui dropdown" list="allTiposContaPagar" listKey="nome" listValue="nome" />
							</div>
							<div class="field hide " id="novoTipoContaPagar">
								<label>Novo Tipo:</label> 
								<s:textfield name="novoTipoContaPagar" />
							</div>
							<!-- 
							<div class="field">
								<label>Pago:</label>
							    <div class="ui checkbox">
									<input type="checkbox" value="PAGO" name="contaPagar.statusStr" />
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
							<s:submit value="Cadastrar" cssClass="ui teal submit  button" /> 
						</div>	
					</s:form>
				</div>
			</div>
		</div>
		
		<div class="ui hidden divider"></div>
		<div class="ui hidden divider"></div>
		<div class="ui hidden divider"></div>
		
		<!-- AREA PESQUISA 88888888888888888888888888888888888888888888888888888888888888888888888 -->
		
		<div class="ui areaSearch centered grid" >
			<div class="wide column">
				<s:form action="contasPagar" cssClass="ui form fluid" >
					<div class="four fields">
						<div class="field">
							<label>Data Inicial:</label>
							<div class="ui icon input">
								<s:textfield name="dataInicialStr" cssClass="data" />
								<i class="calendar icon"></i>
							</div>
						</div>
						<div class="field">
							<label>Data Final:</label>
							<div class="ui icon input">
								<s:textfield name="dataFinalStr" cssClass="data" />
								<i class="calendar icon"></i>
							</div>
						</div>
						<div class="field">
							<label>Classificação do Custo:</label>
							<s:select name="contaPagar.tipoCustoStr" headerKey="-1" headerValue="TODOS" cssClass="ui dropdown" list="allTiposCusto" listKey="value" listValue="valor" />
						</div>
						<div class="field">
							<label>Centro de Custo:</label>
							<s:select id="centroCusto" name="contaPagar.centroCusto.id" headerKey="-1" headerValue="TODOS" cssClass="ui dropdown" list="allCentrosCusto" listKey="id" listValue="nome" />
						</div>
					</div>
					<div class="two fields">
						<div class="field">
							<label>Tipo da despesa:</label>
							<s:select name="tipoContaPagar.nome" headerKey="-1" headerValue="TODOS" cssClass="ui search dropdown" list="allTiposContaPagar" listKey="nome" listValue="nome" />
						</div>
						<!-- 
						<div class="field">
							<label>Pago:</label>
							<select name="statusContaPagarStr" class="ui dropdown" >
								<option value="-1">TODOS</option>
								<option value="PAGO" <s:if test="statusContaPagarStr == 'PAGO'">selected="selected"</s:if> >Pago</option>
								<option value="PENDENTE" <s:if test="statusContaPagarStr == 'PENDENTE'">selected="selected"</s:if>>Pendente</option>
							</select>
						</div>
						 -->
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
		<h2 class="ui horizontal header divider">
			Total: R$ <s:property value="somaStr" />
		</h2>
		
		<!-- INFO DE LISTAGEM PESSOAL 88888888888888888888888888888888888888888888888888888888888888888888888 -->
		<h3 class="ui header">Pagamentos com pessoal</h3>
		
		<!-- TABELA DE CONTAS A PAGAR PESSOAL 88888888888888888888888888888888888888888888888888888888888888888888888 -->

		<table class="ui celled striped teal table">
			<thead>
				<tr>
					<th class="colapse">Ref.:<i class="help circle icon hint" data-content="Código de referência para identificar o pagamento" data-variation="inverted" ></i></th>
					<th>Valor (R$)</th>
					<th>Classificação</th>
					<th>Centro Custo</th>
					<th>Tipo despesa</th>
					<th>Mês compet.</th>
					<th>Data Pag.</th>
					<th>Obs.:</th>
					<!-- 
					<th>Pago</th>
					 -->
					<th>#</th>
					<th>#</th>
				</tr>
			</thead>
			<tbody>
				<s:if test="contasPagarColaboradores.size > 0">
					<s:iterator value="contasPagarColaboradores" >
						<tr>
							<td><s:property value="id" /></td>
							<td><s:property value="valorStr" /></td>
							<td><s:property value="tipoCusto.valor" /></td>
							<td><s:property value="centroCusto.nome" /></td>
							<td><s:property value="tipo.nome" /></td>
							<td><s:property value="mesCompetenciaNome" /></td>
							<td><s:property value="dataPagamentoStr" /></td>
							<td><s:property value="observacao" /></td>
							<!-- 
							<td>
							    <div class="ui checkbox read-only">
									<input type="checkbox" value="PAGO" name="statusStr" class="checkPago" data-content="<s:property value="id" />"
										<s:if test="statusStr == 'PAGO' ">
										 checked="checked"
										</s:if>
									 />
								</div>
							</td>
							 -->
							<td><a class="editar ui blue mini button" href="contaPagar?dataInicialStr=<s:property value="dataInicialStr" />&dataFinalStr=<s:property value="dataFinalStr" />&contaPagar.tipoCustoStr=<s:property value="contaPagar.tipoCustoStr" />&centroCusto.id=<s:property value="centroCusto.id" />&contaPagar.id=<s:property value="id" />" >EDITAR</a></td>
							<td class="remover"><a class="remover" href="removerContaPagar?dataInicialStr=<s:property value="dataInicialStr" />&dataFinalStr=<s:property value="dataFinalStr" />&contaPagar.tipoCustoStr=<s:property value="contaPagar.tipoCustoStr" />&centroCusto.id=<s:property value="centroCusto.id" />&contaPagar.id=<s:property value="id" />"><i class="remove circle red icon"></i></a></td>
						</tr>
					</s:iterator>
				</s:if>
				<s:else>
					<tr>
						<td colspan="5">Nenhum registro encontrado.</td>
					</tr>
				</s:else>
			</tbody>
		</table>
		
		<div class="ui hidden divider"></div>
		
		<!-- INFO DE LISTAGEM GERAL 88888888888888888888888888888888888888888888888888888888888888888888888 -->
		<h3 class="ui header">Pagamentos gerais</h3>
		
		<!-- INFO DE LISTAGEM 88888888888888888888888888888888888888888888888888888888888888888888888 -->

		<div class="left floated column">
			<s:if test="contasPagar.size > 0">
				<s:property value="contasPagar.size" /> pagamentos cadastrados 
				<s:if test="dataInicialStr == null && dataFinalStr == null">
					no mês corrente
				</s:if>
			</s:if>
		</div>
		
		<!-- TABELA DE CONTAS A PAGAR 88888888888888888888888888888888888888888888888888888888888888888888888 -->

		<table class="ui celled striped teal table">
			<thead>
				<tr>
					<th class="colapse">Ref.:<i class="help circle icon hint" data-content="Código de referência para identificar o pagamento" data-variation="inverted" ></i></th>
					<th>Valor (R$)</th>
					<th>Classificação</th>
					<th>Centro Custo</th>
					<th>Tipo despesa</th>
					<th>Mês compet.</th>
					<th>Data Pag.</th>
					<th>Obs.:</th>
					<!-- 
					<th>Pago</th>
					 -->
					<th>#</th>
					<th>#</th>
				</tr>
			</thead>
			<tbody>
				<s:if test="contasPagar.size > 0">
					<s:iterator value="contasPagar">
						<tr>
							<td><s:property value="id" /></td>
							<td><s:property value="valorStr" /></td>
							<td><s:property value="tipoCusto.valor" /></td>
							<td><s:property value="centroCusto.nome" /></td>
							<td><s:property value="tipo.nome" /></td>
							<td><s:property value="mesCompetenciaNome" /></td>
							<td><s:property value="dataPagamentoStr" /></td>
							<td><s:property value="observacao" /></td>
							<!-- 
							<td>
							    <div class="ui checkbox read-only">
									<input type="checkbox" value="PAGO" name="statusStr" class="checkPago" data-content="<s:property value="id" />"
										<s:if test="statusStr == 'PAGO' ">
										 checked="checked"
										</s:if>
									 />
								</div>
							</td>
							 -->
							<td><a class="editar ui blue mini button" href="contaPagar?dataInicialStr=<s:property value="dataInicialStr" />&dataFinalStr=<s:property value="dataFinalStr" />&contaPagar.tipoCustoStr=<s:property value="contaPagar.tipoCustoStr" />&centroCusto.id=<s:property value="centroCusto.id" />&contaPagar.id=<s:property value="id" />" >EDITAR</a></td>
							<td class="remover"><a class="remover" href="removerContaPagar?dataInicialStr=<s:property value="dataInicialStr" />&dataFinalStr=<s:property value="dataFinalStr" />&contaPagar.tipoCustoStr=<s:property value="contaPagar.tipoCustoStr" />&contaPagar.centroCusto.id=<s:property value="contaPagar.centroCusto.id" />&contaPagar.id=<s:property value="id" />"><i class="remove circle red icon"></i></a></td>
						</tr>
					</s:iterator>
				</s:if>
				<s:else>
					<tr>
						<td colspan="5">Nenhum registro encontrado.</td>
					</tr>
				</s:else>
			</tbody>
		</table>
	</div>
	
	<s:include value="../geral/rodape.jsp" />
</body>
</html>