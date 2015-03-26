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
<script type="text/javascript" src="js/lib/scripts.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		setPaginaPrincipal();
		setMaskNumerico("form#formInserirProduto");
		$("form#formInserirProduto").submit(function(){
			clearBordasVermelhas($(this));
			var validado = (validaTXT($("input#nome")));
			if(validado){
				tirarVirgulaPontos("form#formInserirProduto");
			}
			return validado;
		});
		$("a.remover").click(function(evt){
			var confirmacao = true;
			if(!confirm("Tem certeza que deseja remover este produto?")){
				confirmacao = false;
			}
			return confirmacao;
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
		<th>Produtos</th>
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
				<legend>Cadastrar Produto</legend> 
				<s:form id="formInserirProduto" action="addProduto" method="post">
					<table class="formAdd">
						<tr><td class="linhaPequena"></td></tr>
						<tr>
							<td><label>Nome:</label></td>
						</tr>
						<tr>
							<td><s:textfield id="nome" name="produto.nome" cssClass="grande" /></td>
						</tr>
						<tr><td class="linhaMedia"></td></tr>
						<tr>
							<td>
								<table>
									<tr>
										<td><label>Categoria:</label></td>
										<td><label>Valor (R$):</label></td>
									</tr>
									<tr>
										<td><s:textfield id="categoria" name="produto.categoria" cssClass="medio" /></td>
										<td><s:textfield id="valor" name="produto.valor" cssClass="decimal medio" /></td>
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
</div>
<br /><br />
<!-- 
<table class="normal">
	<tr>
		<td align="center">
			<s:form action="produtos">
				<label>Pesquisar:</label>
				<s:textfield cssClass="pequeno" name="pesquisa" /> 
				Nome<input type="radio" name="param" value="nome" checked="checked" /> 
				CPF<input type="radio" name="param" value="cpf" />
				<input type="submit" class="submit" value="buscar" />
			</s:form>
		</td>
	</tr>
</table>
 -->
<table class="listagem">
	<tr>
		<th>Nome</th>
		<th>Valor</th>
		<th>Categoria</th>
		<th>Remover</th>
	</tr>
	<%
		List<String> classes = Arrays.asList("linhaEscura", "");
		int pointer = 0;
	%>
	<s:if test="produtos.size > 0">
		<s:iterator value="produtos">
			<tr class="<%= classes.get(pointer % 2) %> linhaResultado">
				<td><a href="produto?produto.id=<s:property value="id" />"><s:property value="nome" /></a></td>
				<td>R$ <s:property value="valorStr" /></td>
				<td><s:property value="categoria" /></td>
				<td><a class="remover" href="removerProduto?produto.id=<s:property value="id" />"><img src="img/delete.gif" /></a></td>
			</tr>
		<% pointer += 1; %>
		</s:iterator>
	</s:if><s:else>
		<tr>
			<td>Nenhum produto encontrado!</td>
		</tr>
	</s:else>
</table>
<s:include value="../geral/rodape.jsp" />
</body>
</html>