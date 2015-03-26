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
<script type="text/javascript" src="js/lib/jquery.1.3.2.js"></script>
<script type="text/javascript" src="js/lib/jquery.mask.js"></script>
<script type="text/javascript" src="js/lib/jquery.datepicker.js"></script>
<script type="text/javascript" src="js/lib/jquery.simplemodal-1.3.4.js"></script>
<script type="text/javascript" src="js/lib/scripts.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		setPaginaPrincipal();
		setMaskNumerico("form#formInserirEstoque");
		setMaskDate("form#formBuscar");
		setMaskDate("form#formVenda");
		setMaskNumerico("form#formVenda");
		$("form#formInserirEstoque").submit(function(){
			clearBordasVermelhas($(this));
			var validado = (validaTXT($("input#nome")));
			if(validado){
				tirarVirgulaPontos("form#formInserirEstoque");
			}
			return validado;
		});
		$("form#formVenda").submit(function(){
			tirarVirgulaPontos("form#formVenda");
			return true;
		});
		$("a.remover").click(function(evt){
			var confirmacao = true;
			if(!confirm("Tem certeza que deseja remover este item?")){
				confirmacao = false;
			}
			return confirmacao;
		});
		$("a.vender").click(function(evt){
			evt.preventDefault();
			$("input#estoqueValor").val($(this).attr("lang"));
			$("input#estoqueId").val($(this).attr("id"));
			setMaskDate("form#formVenda");
			setMaskNumerico("form#formVenda");
			showModal("div.modal", true);
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
		<th>Estoque</th>
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
				<legend>Cadastrar item no estoque</legend> 
				<s:form id="formInserirEstoque" action="addEstoque" method="post">
					<table class="formAdd">
						<tr><td class="linhaPequena"></td></tr>
						<tr>
							<td><label>Produto:</label></td>
						</tr>
						<tr>
							<td><s:select id="produto" name="estoque.produto.id" cssClass="grande" list="allProdutos" listKey="id" listValue="nome" /></td>
						</tr>
						<tr>
							<td><label>Quantidade:</label></td>
						</tr>
						<tr>
							<td><s:textfield id="quantidade" name="qtd" cssClass="medio" /></td>
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
</div>
<br /><br />
<table class="normal">
	<tr>
		<td align="center">
			<s:form action="estoque" id="formBuscar">
				<label>Produto:</label> <s:textfield cssClass="pequeno" name="nome" /> 
				<label>Data inicial:</label> <input type="text" class="data pequeno" name="dataInicial" value="<s:date format="dd/MM/yyyy" name="dataInicial" />" /> 
				<label>Data Final:</label> <input type="text" class="data pequeno" name="dataFinal" value="<s:date format="dd/MM/yyyy" name="dataFinal" />" /> 
				<label>Status:</label> 
				<select class="pequeno" name="status" >
					<option value="">Todos</option>
					<option value="DISPONIVEL" <s:if test="status == 'DISPONIVEL'">selected="selected"</s:if> >Disponível</option>
					<option value="VENDIDO" <s:if test="status == 'VENDIDO'">selected="selected"</s:if>>Vendido</option>
				</select> 
				<input type="submit" class="submit" value="PESQUISAR" />
			</s:form>
		</td>
	</tr>
</table>
<table class="listagem">
	<tr>
		<th>Produto</th>
		<th>Status</th>
		<th>Valor (R$)</th>
		<th>Data de venda</th>
		<th>Vendedor</th>
		<th>Vender</th>
		<th>Remover</th>
	</tr>
	<%
		List<String> classes = Arrays.asList("linhaEscura", "");
		int pointer = 0;
	%>
	<s:if test="estoques.size > 0">
		<s:iterator value="estoques">
			<tr class="<%= classes.get(pointer % 2) %> linhaResultado">
				<td><s:property value="produto.nome" /></td>
				<td><s:property value="status.valor" /></td>
				<td><s:if test="status.value == 'VENDIDO'"><s:property value="valorStr" /></s:if></td>
				<td><s:date name="data" format="dd/MM/yyyy" /></td>
				<td><s:property value="vendedor.nome" /></td>
				<td>
					<s:if test="status.value != 'VENDIDO'">
						<a class="vender submit" id="<s:property value="id" />" lang="<s:property value="produto.valorStr" />" href="#" >VENDER</a>
					</s:if>
				</td>
				<td><a class="remover" href="removerEstoque?estoque.id=<s:property value="id" />"><img src="img/delete.gif" /></a></td>
			</tr>
		<% pointer += 1; %>
		</s:iterator>
	</s:if><s:else>
		<tr>
			<td>Nenhum item encontrado!</td>
		</tr>
	</s:else>
</table>

<div class="modal">
	<h1>Efetuar Venda</h1>
	<fieldset>
		<legend>Informe os dados</legend>
		<s:form action="venderEstoque" id="formVenda">
			<input type="hidden" id="estoqueId" name="estoque.id" />
			<label class="grande">Vendedor:</label>
			<s:select list="vendedores" cssClass="grande" listKey="id" listValue="nome" name="estoque.vendedor.id" />
			<label class="medio">Valor (R$):</label>
			<label class="medio final">Data:</label>
			<s:textfield name="estoque.valor" cssClass="medio decimal" id="estoqueValor" />
			<s:textfield name="estoque.dataStr" cssClass="medio final data" />
			<div class="areaBotoes">
				<s:submit value="salvar" cssClass="submit" />
			</div>
		</s:form>
	</fieldset>
</div>

<s:include value="../geral/rodape.jsp" />
</body>
</html>