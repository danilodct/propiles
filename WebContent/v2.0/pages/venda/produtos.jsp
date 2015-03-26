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
		setMenuAtivo("#menuProdutos");
		setSubMenuAtivo("#subMenuVendas");
		setMaskNumerico(".decimal"); 
		setBtRemover();
		setBtAdd();
		setSelectOutro("#listCategorias", "#outraCategoria");
	});
</script>
</head>
<body>
	<s:include value="../geral/cabecalho.jsp" />

	<div class="twelve wide column">

		<div class="ui dividing  header">
			<i class="cube teal circular inverted icon"></i>
			<div class="content">
				Produtos
				<div class="sub header">Gerencie todos os produtos que estão à venda</div>
			</div>
		</div>
		
		<div class="ui hidden divider"></div>

		<div class="left floated column">
			<a href="#" class="btAdd" title="Inserir novo" >
				<i class="add circle big teal icon"></i>
			</a>
		</div>
		
		<div class="ui areaAdd hide centered grid" >
			<div class="nine wide column"> 
				<div class="ui form segment">
					<div class="ui block teal header">
						<i class="add teal icon"></i>
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
								<s:select list="categoriasProduto" id="listCategorias" cssClass="ui dropdown" name="produto.categoria" headerKey="-1" headerValue="Outra" listKey="valor" listValue="nome" ></s:select>
							</div>
							<div class="required field" id="outraCategoria">
								<label>Nova categoria:</label>
								<s:textfield name="novaCategoria" />
							</div>
						</div>
						<div class="ui buttons right floated">
							<input type="button" class="ui cancelar button" value="Cancelar" />
		  					<div class="or" data-text="ou"></div>
							<s:submit value="Cadastrar" cssClass="ui teal submit  button" /> 
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
							<s:select list="categoriasProduto" cssClass="ui dropdown" name="produto.categoria" headerKey="-1" headerValue="Todos" listKey="valor" listValue="nome" ></s:select>
						</div>
						<div class="field">
							<label class="visibilityHidden">Botão</label>
							<s:submit value="Pesquisar" cssClass="ui teal right submit  button" />
						</div>
					</div>
				</s:form>
			</div>
		</div>

		<div class="left floated column">
			Mostrando <s:property value="produtos.size" /> de <s:property value="qtdProdutos" /> produtos
		</div>
		
		<table class="ui celled striped teal table">
			<thead>
				<tr>
					<th>Nome</th>
					<th>Valor</th>
					<th>Categoria</th>
					<th>#</th>
				</tr>
			</thead>
			<tbody>
				<s:if test="produtos.size > 0">
					<s:iterator value="produtos">
						<tr>
							<td><a href="produto?produto.id=<s:property value="id" />"><s:property value="nome" /></a></td>
							<td>R$ <s:property value="valorStr" /></td>
							<td><s:property value="categoria" /></td>
							<td><a class="remover" href="removerProduto?produto.id=<s:property value="id" />"><i class="remove circle red icon"></i></a></td>
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