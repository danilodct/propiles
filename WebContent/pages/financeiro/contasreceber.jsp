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
		setMaskDate("form#formInserirContaReceber");
		$("input.data").datepicker();
		setMaskNumerico("form#formInserirContaReceber");
		$("form#formInserirContaReceber").submit(function(){
			var validou = true;
			if(($("select#tipo").val() == "-1" || $("select#tipo").val() == "Outro") && $("input#novoTipoContaReceber").val() == ""){
				validou = false;
			}
			if(validou){
				tirarVirgulaPontos("form#formInserirContaReceber");
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
				$("div#novoTipoContaReceber").show();
			}else{
				$("div#novoTipoContaReceber").hide();
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
		<th>Contas a Receber</th>
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
				<legend>Cadastrar conta a receber</legend> 
				<s:form id="formInserirContaReceber" action="inserirContaReceber" method="post">
					<table class="formAdd">
						<tr><td class="linhaPequena"></td></tr>
						<tr>
							<td>
								<span id="erroAddContaReceber" class="error hidden"></span>
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
										<td width="10px"></td>
										<td><label>Forma de Pagamento:</label></td>
									</tr>
									<tr>
										<td><s:textfield cssClass="pequeno decimal" name="contaReceber.valor" /></td>
										<td></td>
										<td><s:checkbox value="true" name="contaReceber.statusStr" /></td>
										<td></td>
										<td>
											<s:select name="contaReceber.formaPagamentoStr" cssClass="medio" list="formasPagamento" listKey="value" listValue="valor" />
										</td>
									</tr>
									<tr>
										<td><label>Data de Lançamento:</label></td>
										<td></td>
										<td></td>
										<td></td>
										<!-- <td><label>Data de Vencimento:</label></td> -->
									</tr>
									<tr>
										<td><s:textfield name="contaReceber.dataLancamentoStr" cssClass="pequeno data" /></td>
										<td></td>
										<td></td>
										<td></td>
										<!-- <td><s:textfield name="contaReceber.dataVencimentoStr" cssClass="pequeno data" /></td> -->
									</tr>
									<tr>
										<td align="left" colspan="5">
											<table>
												<tr>
													<td><label>Tipo de Pagamento:</label></td>
												</tr>
												<tr>
													<td>
														<s:select id="tipo" name="contaReceber.tipo.nome"  headerValue="ESCOLHA" headerKey="-1" cssClass="medio" list="tiposContaReceber" listKey="nome" listValue="nome" />
													</td>
													<td>
														<div id="novoTipoContaReceber" class="hidden">
															<table>
																<tr>
																	<td align="left">
																		<label>Novo Tipo:</label> 
																	</td>
																</tr>
																<tr>
																	<td>
																		<s:textfield id="novoTipoContaReceber" name="novoTipoContaReceber" cssClass="medio" />
																	</td>
																</tr>
															</table> 
														</div>
													</td>
												</tr>
											</table>
										</td>
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
<s:form id="formPesquisar" action="contasReceber" method="post">
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
		<tr><td class="linhaMedia"></td></tr>
		<tr>
			<td align="left">
				<table>
					<tr>
						<td><label>Professor:</label></td>
						<td><s:select list="professores" name="professor.id" headerKey="-1" headerValue="TODOS" listKey="id" listValue="nome"></s:select></td>
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
Clientes: R$ <s:property value="%{getText('{0,number,#,##0.00}',{soma})}" /> + 
Avulso: R$ <s:property value="%{getText('{0,number,#,##0.00}',{somaAvulso})}" /> +
Vendas: R$ <s:property value="%{getText('{0,number,#,##0.00}',{somaEstoque})}" /> =
<h2>Total: R$ <s:property value="%{getText('{0,number,#,##0.00}',{somaTotal})}" /> </h2>
<hr />
<br /><br />
<div class="separadorLeft">
<a href="javascript:window.print()" class="print" >
	<img src="img/print.gif" />
</a>
<h2>
	Total de entradas de clientes: R$ <s:property value="%{getText('{0,number,#,##0.00}',{soma})}" /> 
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
		<th>Cliente</th>
		<th>Modalidade</th>
		<th>Valor (R$)</th>
		<th>Data de Pagamento</th>
		<th>Forma</th>
		<!-- <th>Tipo</th>-->
		<th>Situação</th>
		<th class="remover">Remover</th>
	</tr>
	<%
		List<String> classes = Arrays.asList("linhaEscura", "");
		int pointer = 0;
	%>
	<s:iterator value="contasReceber">
		<tr class="<%= classes.get(pointer % 2) %> linhaResultado">
			<td>
				<s:if test="cadastro != null">
					<s:property value="cadastro.cliente.nome" />
				</s:if>
			</td>
			<td><s:property value="cadastro.modalidade.servico.nome" /></td>
			<td><s:property value="%{getText('{0,number,#,##0.00}',{caixa})}" /></td>
			<td><s:date name="dataPagamento" format="dd/MM/yyyy" /></td>
			<td>
				<s:property value="formaPagamento.valor" />
				<s:if test="formaPagamento.qtdParcelas > 1">
					[<s:property value="ordemParcelamento" />/<s:property value="%{getText('{0,number,#,##0}',{formaPagamento.qtdParcelas})}" />]
				</s:if>
			</td>
			<!-- <td><s:property value="tipo.nome" /></td>-->
			<td><s:property value="status.valor" /></td>
			<td class="remover"><a class="remover" href="removerContaReceber?contaReceber.id=<s:property value="id" />"><img src="img/delete.gif" /></a></td>
		</tr>
	<% pointer += 1; %>
	</s:iterator>
</table>

<br /><br /><br />

<h2>
	Total de entradas avulso: R$ <s:property value="%{getText('{0,number,#,##0.00}',{somaAvulso})}" /> 
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
		<th>Data de Pagamento</th>
		<th>Forma</th>
		<th>Tipo</th>
		<th>Situação</th>
		<th class="remover">Remover</th>
	</tr>
	<%
		pointer = 0;
	%>
	<s:iterator value="contasReceberAvulso">
		<tr class="<%= classes.get(pointer % 2) %> linhaResultado">
			<td><s:property value="%{getText('{0,number,#,##0.00}',{valor})}" /></td>
			<td><s:date name="dataPagamento" format="dd/MM/yyyy" /></td>
			<td>
				<s:property value="formaPagamento.valor" />
				<s:if test="formaPagamento.qtdParcelas > 1">
					[<s:property value="ordemParcelamento" />/<s:property value="%{getText('{0,number,#,##0}',{formaPagamento.qtdParcelas})}" />]
				</s:if>
			</td>
			<td><s:property value="tipo.nome" /></td>
			<td><s:property value="status.valor" /></td>
			<td class="remover"><a class="remover" href="removerContaReceber?contaReceber.id=<s:property value="id" />"><img src="img/delete.gif" /></a></td>
		</tr>
	<% pointer += 1; %>
	</s:iterator>
</table>

<br /><br /><br />

<h2>
	Total de vendas: R$ <s:property value="%{getText('{0,number,#,##0.00}',{somaEstoque})}" /> 
	<s:if test="dataInicial != null">
		a partir da data <s:date name="dataInicial" format="dd/MM/yyyy" />
	</s:if>
	<s:if test="dataFinal != null">
		até a data <s:date name="dataFinal" format="dd/MM/yyyy" />
	</s:if> 
</h2>
<table class="listagem">
<tr>
		<th>Produto</th>
		<th>Status</th>
		<th>Valor (R$)</th>
		<th>Data de venda</th>
		<th>Vendedor</th>
	</tr>	
	<%
		pointer = 0;
	%>
	<s:iterator value="estoques">
		<tr class="<%= classes.get(pointer % 2) %> linhaResultado">
			<td><s:property value="produto.nome" /></td>
			<td><s:property value="status.valor" /></td>
			<td><s:if test="status.value == 'VENDIDO'"><s:property value="valorStr" /></s:if></td>
			<td><s:date name="data" format="dd/MM/yyyy" /></td>
			<td><s:property value="vendedor.nome" /></td>
		</tr>
	<% pointer += 1; %>
	</s:iterator>
</table>
<br /><br /><br />
________________________________________________________________________
<h2>Total: R$ <s:property value="%{getText('{0,number,#,##0.00}',{somaTotal})}" /> </h2>
</div>
<s:include value="../geral/rodape.jsp" />
</body>
</html>