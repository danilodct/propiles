<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="java.util.Arrays"%>
<%@page import="java.util.List"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title><s:text name="TITULO_SISTEMA" /></title>
<link rel="stylesheet" type="text/css" href="css/lib/styles.css" />
<link rel="stylesheet" type="text/css" href="css/lib/jquery.ui.all.css" />
<script type="text/javascript" src="js/lib/jquery.1.3.2.js"></script>
<script type="text/javascript" src="js/lib/jquery.mask.js"></script>
<script type="text/javascript" src="js/lib/jquery.datepicker.js"></script>
<script type="text/javascript" src="js/lib/scripts.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		setPaginaPrincipal();
		setMaskDate("form#formInserirContaPagar");
		$("input.data").datepicker();
		setMaskNumerico("form#formInserirContaPagar");
		$("form#formInserirContaPagar").submit(function(){
			var validou = true;
			if(($("select#tipo").val() == "-1" || $("select#tipo").val() == "Outro") && $("input#novoTipoContaPagar").val() == ""){
				validou = false;
			}
			if(validou){
				tirarVirgulaPontos("form#formInserirContaPagar");
			}
			return validou;
		});
		$("a.remover").click(function(evt){
			var confirmacao = true;
			if(!confirm("Tem certeza que deseja remover esta conta?")){
				confirmacao = false;
			}
			return confirmacao;
		});
		$("select#tipo").change(function(){
			if($(this).val() == "Outro"){
				$("div#novoTipoContaPagar").show();
			}else{
				$("div#novoTipoContaPagar").hide();
			}
		});
	});
</script>
</head>
<body>
<s:include value="../geral/cabecalho.jsp" />
<s:if test="hasActionErrors()">
	<table width="100%">
		<s:iterator value="actionErrors">
			<tr>
				<td align="center">
				<div class="error"><s:property /></div>
				</td>
			</tr>
		</s:iterator>
	</table>
</s:if>
<s:if test="hasActionMessages()">
	<table width="100%">
		<s:iterator value="actionMessages">
			<tr>
				<td align="center">
				<div class="message"><s:property /></div>
				</td>
			</tr>
		</s:iterator>
	</table>
</s:if>
<div class="centralizador">
<table class="mor">
	<tr>
		<th>Contas a pagar</th>
	</tr>
	<tr>
		<td class="linhaMedia"></td>
	</tr>
	<tr>
		<td><a href="#" class="btAdd"><img src="img/add.png" /></a></td>
	</tr>
	<tr>
		<td class="linhaMedia"></td>
	</tr>
	<tr>
		<td>
		<div class="formAdd hidden">
			<fieldset>
				<legend>Cadastrar conta a pagar</legend> 
				<s:form id="formInserirContaPagar" action="inserirContaPagar" method="post">
					<table class="formAdd">
						<tr><td class="linhaPequena"></td></tr>
						<tr>
							<td>
								<span id="erroAddContaPagar" class="error hidden"></span>
							</td>
						</tr>
						<tr>
							<td class="header">Dados Principais</td>
						</tr>
						<tr><td class="linhaPequena"></td></tr>
						<tr>
							<td>
								<table>
									<tr>
										<td><label>Valor (R$):</label></td>
										<td width="10px"></td>
										<td><label>Pago:</label></td>
									</tr>
									<tr>
										<td><s:textfield cssClass="pequeno decimal" name="contaPagar.valor" /></td>
										<td></td>
										<td><s:checkbox value="true" name="contaPagar.statusStr" /></td>
									</tr>
									<tr>
										<td><label>Data de Pagamento:</label></td>
										<td></td>
										<td><label>Data de Vencimento:</label></td>
									</tr>
									<tr>
										<td><s:textfield name="contaPagar.dataPagamentoStr" cssClass="medio data" /></td>
										<td></td>
										<td><s:textfield name="contaPagar.dataVencimentoStr" cssClass="medio data" /></td>
									</tr>
									<tr>
										<td align="left">
											<table width="100%">
												<tr>
													<td><label>Tipo de Pagamento:</label></td>
												</tr>
												<tr>
													<td><s:select id="tipo" name="contaPagar.tipo.nome"  headerValue="ESCOLHA" headerKey="-1" cssClass="medio" list="tiposContaPagar" listKey="nome" listValue="nome" /></td>
												</tr>
											</table>
										</td>
										<td></td>
										<td>
											<div id="novoTipoContaPagar" class="hidden">
												<table>
													<tr>
														<td align="left">
															<label>Novo Tipo:</label> 
														</td>
													</tr>
													<tr>
														<td>
															<s:textfield id="novoTipoContaPagar" name="novoTipoContaPagar" cssClass="medio" />
														</td>
													</tr>
												</table> 
											</div>
										</td>
									</tr>
									<tr>
										<td align="left"><label>Classificar Custo:</label></td>
										<td></td>
										<td align="left" ><label>Mês competência (qualquer dia do mês desejado):</label></td>
									</tr>
									<tr>
										<td><s:select id="tipoCusto" name="contaPagar.tipoCustoStr" cssClass="medio" list="tiposCusto" listKey="value" listValue="valor" /></td>
										<td></td>
										<td><s:textfield name="contaPagar.mesCompetenciaStr" cssClass="medio data" /></td>
									</tr>
									<tr>
										<td align="left"><label>Centro de Custo:</label></td>
									</tr>
									<tr>
										<td><s:select id="centroCusto" name="contaPagar.centroCusto.id" cssClass="medio"  headerKey="-1" headerValue="NENHUM" list="allCentrosCusto" listKey="id" listValue="nome" /></td>
									</tr>
								</table>
							</td>
						</tr>
						<tr><td class="linhaMedia"></td></tr>
						<tr>
							<td><s:submit value="cadastrar" cssClass="submit" /> <input type="button" class="cancelar submit" value="cancelar" /></td>
						</tr>
					</table>
				</s:form>
			</fieldset>
		</div>
		</td>
	</tr>
</table>
<br /><br />
<fieldset>
<legend>Pesquisar</legend>
<s:form id="formPesquisar" action="contasPagar" method="post">
	<table class="formAdd">
		<tr><td class="linhaPequena"></td></tr>
		<tr>
			<td align="left">
				<table>
					<tr>
						<td><label>Data Inicial:</label></td>
						<td>&nbsp;&nbsp;</td>
						<td><label>Data Final:</label></td>
					</tr>
					<tr>
						<td><input type="text" name="dataInicialStr" class="pequeno data" value="<s:date name="dataInicial" format="dd/MM/yyyy" />" /></td>
						<td></td>
						<td><input type="text" name="dataFinalStr" class="pequeno data" value="<s:date name="dataFinal" format="dd/MM/yyyy" />" /></td>
					</tr>
				</table>
			</td>
		</tr>
		<tr>
			<td align="left">
				<table>
					<tr>
						<td><label>Classificação do Custo:</label></td>
						<td>&nbsp;&nbsp;</td>
						<td><label>Centro de Custo:</label></td>
					</tr>
					<tr>
						<td><s:select id="tipoCusto" name="contaPagar.tipoCustoStr" headerKey="-1" headerValue="TODOS" cssClass="medio" list="tiposCusto" listKey="value" listValue="valor" /></td>
						<td></td>
						<td><s:select id="centroCusto" name="centroCusto.id" headerKey="-1" headerValue="TODOS" cssClass="medio" list="allCentrosCusto" listKey="id" listValue="nome" /></td>
					</tr>
				</table>
			</td>
		</tr>
		<tr><td class="linhaMedia"></td></tr>
		<tr>
			<td><s:submit value="procurar" cssClass="submit" /></td>
		</tr>
	</table>
</s:form>
</fieldset>
</div>
<br /><br />
<div class="separadorLeft">
<a href="javascript:window.print()" class="print" >
	<img src="img/print.gif" />
</a>
<br />
<h2>
	Total: R$ <s:property value="%{getText('{0,number,#,##0.00}',{soma})}" /> 
	<s:if test="dataInicial != null">
		a partir da data <s:date name="dataInicial" format="dd/MM/yyyy" />
	</s:if>
	<s:if test="dataFinal != null">
		até a data <s:date name="dataFinal" format="dd/MM/yyyy" />
	</s:if> 
</h2>
<br />
<table class="listagem">
	<tr>
		<th>Valor (R$)</th>
		<th>Classificação</th>
		<th>Tipo</th>
		<th>Centro de Custo</th>
		<th>Mês competência</th>
		<th>Data de Pagamento</th>
		<th>Data de Vencimento</th>
		<th>Situação</th>
		<th class="remover">Remover</th>
	</tr>
	<%
		List<String> classes = Arrays.asList("linhaEscura", "");
		int pointer = 0;
	%>
	<s:iterator value="contasPagar">
		<tr class="<%= classes.get(pointer % 2) %> linhaResultado">
			<td><s:property value="%{getText('{0,number,#,##0.00}',{valor})}" /></td>
			<td><s:property value="tipoCusto.valor" /></td>
			<td><s:property value="tipo.nome" /></td>
			<td><s:property value="centroCusto.nome" /></td>
			<td><s:property value="mesCompetenciaNome" /></td>
			<td><s:date name="dataPagamento" format="dd/MM/yyyy" /></td>
			<td><s:date name="dataVencimento" format="dd/MM/yyyy" /></td>
			<td><s:property value="status.valor" /></td>
			<td class="remover"><a class="remover" href="removerContaPagar?contaPagar.id=<s:property value="id" />"><img src="img/delete.gif" /></a></td>
		</tr>
	<% pointer += 1; %>
	</s:iterator>
</table>
</div>
<s:include value="../geral/rodape.jsp" />
</body>
</html>