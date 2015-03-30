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
		setMenuAtivo("#menuVendidos");
		setSubMenuAtivo("#subMenuVendas");
		setMaskDate(".data"); 
		setBtRemover();
	});
</script>
</head>
<body>
	<s:include value="../geral/cabecalho.jsp" />

	<div class="twelve wide column">

		<div class="ui dividing  header">
			<i class="shop teal circular inverted icon"></i>
			<div class="content">
				Estoque Vendido
				<div class="sub header">Lista com todas as vendas já efetuadas</div>
			</div>
		</div>
		
		<div class="ui hidden divider"></div>

		<div class="ui areaSearch centered grid" >
			<div class="wide column">
				<s:form action="vendidos" cssClass="ui form fluid" id="formBuscar">
					<div class="two fields">
						<div class="field">
							<label>Produto:</label> 
							<s:select name="produto.id" cssClass="ui fonteMenor dropdown" list="allProdutos" headerKey="-1" headerValue="Todos" listKey="id" listValue="nome" />
						</div>
						<div class="field">
							<label>Vendedor:</label> 
							<s:select name="vendedor.id" cssClass="ui fonteMenor dropdown" list="allVendedores" headerKey="-1" headerValue="Todos" listKey="id" listValue="nome" />
						</div>
					</div>
					<div class="three fields">
						<div class="field">
							<label>Data de venda inicial:</label>
							<div class="ui icon input">
								<s:textfield cssClass="data fonteMenor" name="dataInicialStr" />
								<i class="calendar icon"></i>
							</div>
						</div>
						<div class="field">
							<label>Data de venda final:</label> 
							<div class="ui icon input">
								<s:textfield cssClass="data fonteMenor" name="dataFinalStr" />
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
		<div class="ui hidden divider"></div>

		<table class="ui celled striped teal table">
			<thead>
				<tr>
					<th>Produto</th>
					<th>Valor vendido(R$)</th>
					<th>Data de venda</th>
					<th>Vendedor</th>
					<th>#</th>
				</tr>
			</thead>
			<tbody>
				<s:if test="estoques.size > 0">
					<s:iterator value="estoques">
						<tr>
							<td><s:property value="produto.nome" /></td>
							<td><s:property value="status.valor" /></td>
							<td><s:date name="data" format="dd/MM/yyyy" /></td>
							<td><s:property value="vendedor.nome" /></td>
							<td><a class="remover" title="Remover" href="removerEstoque?page=vendidos&estoque.id=<s:property value="id" />"><i class="remove circle red icon"></i></a></td>
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