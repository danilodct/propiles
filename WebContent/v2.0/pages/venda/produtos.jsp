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
		setMenuAtivo("#menuProdutos");
		setSubMenuAtivo("#subMenuVendas");
		setMaskNumerico(".decimal"); 
		setBtRemover();
		setBtAdd();
		setSelectOutro("#listCategorias", "#outraCategoria");
	});
</script>
<script>(function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){(i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)})(window,document,'script','//www.google-analytics.com/analytics.js','ga');ga('create', 'UA-62673588-1', 'auto');ga('send', 'pageview');</script></head>
<body>
<s:hidden name="pagAtual" id="pagAtual" />
	<s:include value="../geral/cabecalho.jsp" />

	<div class="twelve wide column">

		<div class="ui dividing  header">
			<i class="cube <s:property value="#session.profisio_user.tenant.corFinal" /> circular inverted icon"></i>
			<div class="content">
				Produtos
				<div class="sub header">Gerencie todos os produtos que estão à venda</div>
			</div>
		</div>
		
		<div class="ui hidden divider"></div>

		<div class="left floated column">
			<a href="#" class="btAdd" title="Inserir novo" >
				<i class="add circle big <s:property value="#session.profisio_user.tenant.corFinal" /> icon"></i>
			</a>
		</div>
		
		<div class="ui areaAdd hide centered grid" >
			<div class="eleven wide column"> 
				<div class="ui form segment">
					<div class="ui block <s:property value="#session.profisio_user.tenant.corFinal" /> header">
						<i class="add <s:property value="#session.profisio_user.tenant.corFinal" /> icon"></i>
						<div class="content"> Inserir novo Produto</div>
					</div>
					<s:form id="formInserirProduto" action="cadastrarProduto" method="post">
						<div class="two fields">
							<div class="required field">
								<label>Nome:</label>
								<s:textfield id="nome" name="produto.nome"/>
							</div>
							<div class="required field">
								<label>Valor (R$):</label>
								<s:textfield id="valor" name="produto.valorStr" cssClass="decimal" />
							</div>
						</div>
						<div class="two fields">
							<div class="field">
								<label>Categoria:</label>
								<s:select list="categoriasProduto" id="listCategorias" cssClass="ui dropdown" name="produto.categoria" listKey="valor" listValue="nome" ></s:select>
							</div>
							<div class="required field" id="outraCategoria">
								<label>Nova categoria:</label>
								<s:textfield name="novaCategoria" />
							</div>
						</div>
						<div class="ui buttons right floated">
							<input type="button" class="ui cancelar button" value="Cancelar" />
		  					<div class="or" data-text="ou"></div>
							<input type="submit" value="Cadastrar" class="ui <s:property value="#session.profisio_user.tenant.corFinal" /> submit  button" /> 
						</div>	
					</s:form>
				</div>
			</div>
		</div>
		
		<div class="ui areaSearch centered grid" >
			<div class="nine wide column">
				<s:form action="produtos" cssClass="ui form fluid" id="formPesquisa">
					<div class="two fields">
						<div class="field">
							<label>Categoria</label>
							<s:select list="categoriasProduto" cssClass="ui dropdown" name="produto.categoria" headerKey=" " headerValue="Todos" listKey="valor" listValue="nome" ></s:select>
						</div>
						<div class="field">
							<label class="visibilityHidden">Botão</label>
							<input type="submit" value="Pesquisar" class="ui <s:property value="#session.profisio_user.tenant.corFinal" /> right submit  button" />
						</div>
					</div>
				</s:form>
			</div>
		</div>

		<div class="left floated column">
			Mostrando <s:property value="produtos.size" /> de <s:property value="qtdProdutos" /> produtos
		</div>
		
		<table class="ui celled striped <s:property value="#session.profisio_user.tenant.corFinal" /> table">
			<thead>
				<tr>
					<th>Nome</th>
					<th>Valor</th>
					<th>Categoria</th>
					<th>#</th>
					<th>#</th>
				</tr>
			</thead>
			<tbody>
				<s:if test="produtos.size > 0">
					<s:iterator value="produtos">
						<tr>
							<td><s:property value="nome" /></td>
							<td>R$ <s:property value="valorStr" /></td>
							<td><s:property value="categoria" /></td>
							<td><a class="ui blue mini button" href="produto?produto.idCript=<s:property value="idCript" />">EDITAR</a></td>
							<td><a class="remover" href="removerProduto?produto.idCript=<s:property value="idCript" />"><i class="remove circle red icon"></i></a></td>
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
					<a class="icon item" href="produtos?pagAtual=<%=(((Integer)request.getAttribute("pagAtual")) - 1) %>&produto.categoria=<s:property value="produto.categoria" />"><i class="left arrow icon"></i></a> 
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
						<a class="<s:if test="pagAtual == nome">active</s:if> item" href="produtos?pagAtual=<s:property value="nome" />&produto.categoria=<s:property value="produto.categoria" />"><s:property value="nome" /></a>
					</s:else>
				</s:iterator>
				<s:if test="pagAtual < qtdPaginas.size">
					<a class="icon item" href="produtos?pagAtual=<%=(((Integer)request.getAttribute("pagAtual")) + 1) %>&produto.categoria=<s:property value="produto.categoria" />"><i class="right arrow icon"></i></a>
				</s:if>
			</div>
		</s:if>
	</div>

	<s:include value="../geral/rodape.jsp" />
</body>
</html>