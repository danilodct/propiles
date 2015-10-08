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
<link rel="stylesheet" type="text/css" href="v2.0/css/lib/styles-extras.css" />

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
<script>(function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){(i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)})(window,document,'script','//www.google-analytics.com/analytics.js','ga');ga('create', 'UA-62673588-1', 'auto');ga('send', 'pageview');</script></head>
<body>
	<s:include value="../geral/cabecalho.jsp" />

	<div class="twelve wide column">

		<div class="ui dividing  header">
			<i class="shop <s:property value="#session.profisio_user.tenant.corFinal" /> circular inverted icon"></i>
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
							<s:select name="produto.idCript" cssClass="ui fonteMenor dropdown" list="allProdutos" headerKey="-1" headerValue="Todos" listKey="idCript" listValue="nome" />
						</div>
						<div class="field">
							<label>Vendedor:</label> 
							<s:select name="vendedor.idCript" cssClass="ui fonteMenor dropdown" list="allVendedores" headerKey="-1" headerValue="Todos" listKey="idCript" listValue="nome" />
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
							<input type="submit" class="ui <s:property value="#session.profisio_user.tenant.corFinal" /> submit button" value="Pesquisar" />
						</div>
					</div>
				</s:form>			
				
			</div>
		</div>

		<div class="ui hidden divider"></div>
		<div class="ui hidden divider"></div>
		
		
		
		<div class="left floated column">
			Mostrando <s:property value="estoques.size" /> de <s:property value="qtdProdutos" /> vendas 
			<s:if test="(dataInicialStr == null || dataInicialStr == '') && (dataFinalStr == null || dataFinalStr == '') ">
				no mês atual
			</s:if>
		</div>

		<table class="ui celled striped <s:property value="#session.profisio_user.tenant.corFinal" /> table">
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
							<td><a class="remover" title="Remover" href="removerEstoque?page=vendidos&estoque.idCript=<s:property value="idCript" />"><i class="remove circle red icon"></i></a></td>
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
		
		
		<!-- PAGINACAO 88888888888888888888888888888888888888888888888888888888888888888888888 -->
		
		<s:if test="qtdPaginas.size > 1">
			<div class="ui pagination menu">
				<s:if test="pagAtual > 1">
					<a class="icon item" href="vendidos?pagAtual=<%=(((Integer)request.getAttribute("pagAtual")) - 1) %>&produto.idCript=<s:property value="produto.idCript" />&dataFinalStr=<s:property value="dataFinalStr" />&dataInicialStr=<s:property value="dataInicialStr" />&vendedor.idCript=<s:property value="vendedor.idCript" />"><i class="left arrow icon"></i></a> 
				</s:if>
				<s:iterator value="qtdPaginas" >
					<s:if test="qtdPaginas.size > 13 && ((pagAtual + 5) == nome)">
						<div class="disabled item">...</div>
					</s:if>
					<s:elseif test="qtdPaginas.size > 13 && ((pagAtual - 5) == nome)">
						<div class="disabled item">...</div>
					</s:elseif>
					<s:elseif test="qtdPaginas.size > 13 && (((pagAtual - nome) > 0 && (pagAtual - nome) > 4) || ((pagAtual - nome) < 0 && (pagAtual - nome) < -4))">
					</s:elseif><s:else>
						<a class="<s:if test="pagAtual == nome">active</s:if> item" href="vendidos?pagAtual=<s:property value="nome" />&produto.idCript=<s:property value="produto.idCript" />&dataFinalStr=<s:property value="dataFinalStr" />&dataInicialStr=<s:property value="dataInicialStr" />&vendedor.idCript=<s:property value="vendedor.idCript" />"><s:property value="nome" /></a>
					</s:else>
				</s:iterator>
				<s:if test="pagAtual < qtdPaginas.size">
					<a class="icon item" href="vendidos?pagAtual=<%=(((Integer)request.getAttribute("pagAtual")) + 1) %>&produto.idCript=<s:property value="produto.idCript" />&dataFinalStr=<s:property value="dataFinalStr" />&dataInicialStr=<s:property value="dataInicialStr" />&vendedor.idCript=<s:property value="vendedor.idCript" />"><i class="right arrow icon"></i></a>
				</s:if>
			</div>
		</s:if>
		
		
	</div>
	
	<s:include value="../geral/rodape.jsp" />
</body>
</html>