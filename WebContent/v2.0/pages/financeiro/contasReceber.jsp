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

<script type="text/javascript" src="v2.0/js/lib/jquery.semantic.js" ></script>
<script type="text/javascript" src="v2.0/js/lib/jquery.ui.mask.js" ></script>
<script type="text/javascript" src="v2.0/js/lib/scripts.js"></script>
<script type="text/javascript">
$(document).ready(function() {
	setMenuAtivo("#menuContasReceber");
	setSubMenuAtivo("#subMenuFluxoCaixa");
	setMaskDate(".data");
	setMaskNumerico(".decimal");
	setBtRemover();
	setBtAdd();
	setSelectTipoContaReceber();
	setBtPrint();
});
function setSelectTipoContaReceber(){
	$("select#selectTipoContaReceber").change(function(){
		if($(this).val() == "Outro"){
			$("#novoTipoContaReceber").show();
		}else{
			$("#novoTipoContaReceber").hide();
			$("#novoTipoContaReceber").val("");
		}
	});
}
</script>
<script>(function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){(i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)})(window,document,'script','//www.google-analytics.com/analytics.js','ga');ga('create', 'UA-62673588-1', 'auto');ga('send', 'pageview');</script></head>
<body>
	<s:include value="../geral/cabecalho.jsp" />

	<div class="fifteen wide column">
	
		<!-- TITULO DA PÁGINA 88888888888888888888888888888888888888888888888888888888888888888888888 -->

		<div class="ui dividing  header">
			<i class="dollar <s:property value="#session.profisio_user.tenant.corFinal" /> circular inverted icon"></i>
			<div class="content">
				Contas a Receber
				<div class="sub header">Gerencie todos os pagamentos recebidos</div>
			</div>
		</div>
		
		<div class="ui hidden divider"></div>

		<!-- BT ADD CONTA RECEBER 88888888888888888888888888888888888888888888888888888888888888888888888 -->
		
		<div class="left floated column">
			<a href="#" class="btAdd" title="Inserir novo" >
				<i class="add circle big <s:property value="#session.profisio_user.tenant.corFinal" /> icon"></i>
			</a>
		</div>
		
		<div class="ui hidden divider"></div>

		<!-- FORM INSERIR CONTA RECEBER 88888888888888888888888888888888888888888888888888888888888888888888888 -->
		
		<div class="ui areaAdd hide centered grid" >
			<div class="fourteen wide column"> 
				<div class="ui form segment">
				
					<div class="ui block <s:property value="#session.profisio_user.tenant.corFinal" /> header">
						<i class="add <s:property value="#session.profisio_user.tenant.corFinal" /> icon"></i>
						<div class="content"> Inserir conta a receber avulso</div>
					</div>
					<s:form action="cadastrarContaReceber" method="post">
						<s:hidden name="avulso" value="true" />
						<h4 class="ui dividing <s:property value="#session.profisio_user.tenant.corFinal" /> header">Dados Principais</h4>
						<div class="three fields">
							<div class="field">
								<label>Valor (R$):</label>
								<s:textfield cssClass="decimal" name="contaReceber.valorStr" />
							</div>
							<div class="field">
								<label>Forma de Pagamento:</label>
								<s:select name="contaReceber.formaPagamentoStr" cssClass="ui dropdown" list="allFormasPagamento" listKey="value" listValue="valor" />
							</div>
							<div class="field">
								<label>Data de Lançamento:</label>
								<div class="ui icon input">
									<s:textfield name="contaReceber.dataLancamentoStr" cssClass="data" />
									<i class="calendar icon"></i>
								</div>
							</div>
							<!-- 
							<div class="field">
								<label>Pago:</label>
							    <div class="ui checkbox">
									<input type="checkbox" value="PAGO" name="contaReceber.statusStr" />
								</div>
							</div>
							 -->
						</div>
						<div class="field">
							<label>Descrição:</label>
							<s:textarea name="contaReceber.observacao" ></s:textarea>
						</div>
									
						<div class="ui hidden divider"></div>
						
						<div class="ui buttons right floated">
							<input type="button" class="ui cancelar button" value="Cancelar" />
		  					<div class="or" data-text="ou"></div>
							<input type="submit" value="Cadastrar" class="ui <s:property value="#session.profisio_user.tenant.corFinal" /> submit  button" /> 
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
				<s:form action="contasReceber" cssClass="ui form fluid" >
					<div class="three fields">
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
							<label>Forma de pagamento:</label>
							<s:select name="formaPagamentoStr" headerKey="-1" headerValue="TODOS" cssClass="ui dropdown" list="allFormasPagamento" listKey="value" listValue="valor" />
						</div>
					</div>
					<div class="three fields">
						<div class="field">
							<label>Colaborador:</label>
							<s:select name="colaborador.idCript" headerKey="-1" headerValue="TODOS" cssClass="ui search dropdown" list="allColaboradores" listKey="idCript" listValue="nome" />
						</div>
						<div class="field">
							<label>Serviço:</label>
							<s:select name="servico.idCript" headerKey="-1" headerValue="TODOS" cssClass="ui search dropdown" list="allServicos" listKey="idCript" listValue="nome" />
						</div>
						<div class="field">
						<!-- 
							<div class="two fields">
								<div class="field">
									<label>Pago:</label>
									<select name="statusContaPagarStr" class="ui dropdown" >
										<option value="-1">TODOS</option>
										<option value="PAGO" <s:if test="statusContaPagarStr == 'PAGO'">selected="selected"</s:if> >Pago</option>
										<option value="PENDENTE" <s:if test="statusContaPagarStr == 'PENDENTE'">selected="selected"</s:if>>Pendente</option>
									</select>
								</div>
								<div class="field">
						 -->
									<label class="visibilityHidden">Botão:</label> 
									<input type="submit" class="ui <s:property value="#session.profisio_user.tenant.corFinal" /> submit button" value="Pesquisar" />
						<!-- 
								</div>
							</div>
						 -->
						</div>
					</div>
				</s:form>			
			</div>
		</div>
		
		<!-- INFO DE TOTAL 88888888888888888888888888888888888888888888888888888888888888888888888 -->
		<h2 class="ui horizontal header divider">
			Total
			<s:if test="dataInicialStr == null && dataFinalStr == null">
				do mês atual
			</s:if>
			: R$ <s:property value="somaTotalStr" />
		</h2>
	
		<!-- BOTOES PRINT EXCEL 88888888888888888888888888888888888888888888888888888888888888888888888 -->
		<div class="ui column right floated">
			<a href="exportContasReceber?dataInicialStr=<s:property value="dataInicialStr" />&dataFinalStr=<s:property value="dataFinalStr" />&formaPagamentoStr=<s:property value="formaPagamentoStr" />&colaborador.idCript=<s:property value="colaborador.idCript" />&statusContaPagarStr=<s:property value="statusContaPagarStr" />&servico.id=<s:property value="servico.id" />" target="_blank" title="Exportar dados detalhados dos pagamentos feitos por clientes para o Excel" >
				<i class="file excel outline large <s:property value="#session.profisio_user.tenant.corFinal" /> icon"></i>
			</a>
			<a href="#" title="Imprimir relatório" class="btPrint">
				<i class="print black large icon"></i>
			</a>
		</div>
		
		<!-- INFO DE LISTAGEM AVULSO 88888888888888888888888888888888888888888888888888888888888888888888888 -->
		<h3 class="ui header">Entradas avulso</h3>

		<div class="left floated column">
			<s:if test="contasReceberAvulso.size > 0">
				<s:property value="contasReceberAvulso.size" /> pagamentos avulso recebidos 
				<s:if test="dataInicialStr == null && dataFinalStr == null">
					no mês corrente
				</s:if>
				no total de <b>R$ <s:property value="somaAvulsoStr" /></b>
			</s:if>
		</div>
		
		<!-- TABELA DE CONTAS A RECEBER AVULSO 88888888888888888888888888888888888888888888888888888888888888888888888 -->

		<table class="ui celled striped <s:property value="#session.profisio_user.tenant.corFinal" /> table">
			<thead>
				<tr>
					<th class="colapse">Ref.:<i class="help circle icon hint" data-content="Código de referência para identificar o pagamento" data-variation="inverted" ></i></th>
					<th>Valor (R$)</th>
					<th>Data de lançamento</th>
					<th>Forma de Pag.</th>
					<th>Obs.</th>
					<!-- 
					<th>Pago</th>
					 -->
					<th>#</th>
				</tr>
			</thead>
			<tbody>
				<s:if test="contasReceberAvulso.size > 0">
					<s:iterator value="contasReceberAvulso">
						<tr>
							<td><s:property value="numRef" /></td>
							<td class="valorConta">
								<s:property value="valorCheioComDescontoStr" />
							</td>
							<td><s:date name="dataLancamento" format="dd/MM/yyyy" /></td>
							<td><s:property value="formaPagamento.valor" /></td>
							<td><s:property value="observacao" /></td>
							<!-- 
							<td>
							    <div class="ui checkbox read-only">
									<input type="checkbox" value="PAGO" name="statusStr" class="checkPago" data-content="<s:property value="id" />"
										<s:if test="status.value == 'PAGO' ">
										 checked="checked"
										</s:if>
									 />
								</div>
							</td>
							 -->
							<td><a class="remover" href="removerContaReceber?contaReceber.idCript=<s:property value="idCript" />&dataInicialStr=<s:property value="dataInicialStr" />&dataFinalStr=<s:property value="dataFinalStr" />&formaPagamentoStr=<s:property value="formaPagamentoStr" />&colaborador.id=<s:property value="colaborador.id" />&statusContaPagarStr=<s:property value="statusContaPagarStr" />&servico.id=<s:property value="servico.id" />"><i class="remove circle red icon"></i></a></td>
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
		
		<!-- INFO DE LISTAGEM AVULSO 88888888888888888888888888888888888888888888888888888888888888888888888 -->
		<h3 class="ui header">Entradas por vendas</h3>

		<div class="left floated column">
			<s:if test="estoques.size > 0">
				<s:property value="estoques.size" /> pagamentos em vendas recebidos 
				<s:if test="dataInicialStr == null && dataFinalStr == null">
					no mês corrente
				</s:if>
				no total de <b>R$ <s:property value="somaEstoqueStr" /></b>
			</s:if>
		</div>
		
		<!-- TABELA DE ENTRADAS POR VENDAS 88888888888888888888888888888888888888888888888888888888888888888888888 -->

		<table class="ui celled striped <s:property value="#session.profisio_user.tenant.corFinal" /> table">
			<thead>
				<tr>
					<th>Valor vendido(R$)</th>
					<th>Data de venda</th>
					<th>Produto</th>
					<th>Status</th>
					<th>Vendedor</th>
					<th>#</th>
				</tr>
			</thead>
			<tbody>
				<s:if test="estoques.size > 0">
					<s:iterator value="estoques">
						<tr>
							<td><s:if test="status.value == 'VENDIDO'"><s:property value="valorStr" /></s:if></td>
							<td><s:date name="data" format="dd/MM/yyyy" /></td>
							<td><s:property value="produto.nome" /></td>
							<td><s:property value="status.valor" /></td>
							<td><s:property value="vendedor.nome" /></td>
							<td><a class="remover" title="Remover" href="removerEstoque?estoque.idCript=<s:property value="idCript" />&page=contasReceber&dataInicialStr=<s:property value="dataInicialStr" />&dataFinalStr=<s:property value="dataFinalStr" />&formaPagamentoStr=<s:property value="formaPagamentoStr" />&colaborador.idCript=<s:property value="colaborador.idCript" />&statusContaPagarStr=<s:property value="statusContaPagarStr" />"><i class="remove circle red icon"></i></a></td>
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
		
		<!-- INFO DE LISTAGEM 88888888888888888888888888888888888888888888888888888888888888888888888 -->
		<h3 class="ui header">Entradas por clientes</h3>

		<div class="left floated column">
			<s:if test="contasReceber.size > 0">
				<s:property value="contasReceber.size" /> pagamentos recebidos 
				<s:if test="dataInicialStr == null && dataFinalStr == null">
					no mês corrente
				</s:if>
				no total de <b>R$ <s:property value="somaStr" /></b>
			</s:if>
		</div>
		
		<!-- TABELA DE CONTAS A RECEBER 88888888888888888888888888888888888888888888888888888888888888888888888 -->

		<table class="ui celled striped <s:property value="#session.profisio_user.tenant.corFinal" /> table">
			<thead>
				<tr>
					<th class="colapse">Ref.:<i class="help circle icon hint" data-content="Código de referência para identificar o pagamento" data-variation="inverted" ></i></th>
					<th>Valor (R$) <i class="help circle icon hint" data-content="Valor já com desconto de acordo com a forma de pagamento" data-variation="inverted" ></i></th>
					<th>Data de lançamento</th>
					<th>Serviço - Cliente [Sessões]</th>
					<th>Forma de Pag.</th>
					<th>Obs.</th>
					<!-- 
					<th>Pago</th>
					 -->
					<th>#</th>
				</tr>
			</thead>
			<tbody>
				<s:if test="contasReceber.size > 0">
					<s:iterator value="contasReceber">
						<tr>
							<td><s:property value="numRef" /></td>
							<td class="valorConta">
								<s:property value="valorCheioComDescontoStr" />
							</td>
							<td><s:date name="dataLancamento" format="dd/MM/yyyy" /></td>
							<td><s:property value="atividade.contrato.servico.nome" /> - <a href="cadastro?cadastro.idCript=<s:property value="atividade.cadastro.idCript" />"><s:property value="atividade.cadastro.nome" /></a> [<s:property value="qtdSessoes" /> <s:if test="qtdSessoes < 2">sessão</s:if><s:else>sessões</s:else>]</td>
							<td><s:property value="formaPagamento.valor" /></td>
							<td><s:property value="observacao" /></td>
							<!-- 
							<td>
							    <div class="ui checkbox read-only">
									<input type="checkbox" value="PAGO" name="statusStr" class="checkPago" data-content="<s:property value="id" />"
										<s:if test="status.value == 'PAGO' ">
										 checked="checked"
										</s:if>
									 />
								</div>
							</td>
							 -->
							<td><a class="remover" href="removerContaReceber?contaReceber.idCript=<s:property value="idCript" />&dataInicialStr=<s:property value="dataInicialStr" />&dataFinalStr=<s:property value="dataFinalStr" />&formaPagamentoStr=<s:property value="formaPagamentoStr" />&colaborador.idCript=<s:property value="colaborador.idCript" />&statusContaPagarStr=<s:property value="statusContaPagarStr" />"><i class="remove circle red icon"></i></a></td>
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