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
		setMaskDate(".data");
		setSelectOutro("#listCategorias", ".outraCategoria");
		setBtCancelarPage(".cancelar", "produtos");
		setMaskNumerico(".numerico");
	});
</script>
</head>
<body>
	<s:include value="../geral/cabecalho.jsp" />

	<div class="nine wide column">

		<div class="ui dividing  header">
			<i class="cube teal circular inverted icon"></i>
			<div class="content">
				Produto
				<div class="sub header">Atualize as informações do produto</div>
			</div>
		</div>

		<div class="ui hidden divider"></div>
		<div class="ui hidden divider"></div>

		<div class="ui form segment">
		
			<s:form id="formEditarProduto" action="editarProduto" method="post">
				<s:hidden name="produto.idCript" />
				<div class="required field">
					<label>Nome:</label>
					<s:textfield id="nome" name="produto.nome" />
				</div>
				<div class="three fields">
					<div class="required field">
						<label>Valor ($):</label>
						<s:textfield id="valor" name="produto.valorStr" cssClass="numerico" />
					</div>
					<div class="field">
						<label>Categoria:</label>
						<s:select list="categoriasProduto" id="listCategorias" cssClass="ui dropdown" name="produto.categoria" headerKey="-1" headerValue="Outra" listKey="valor" listValue="nome" ></s:select>
						<!--<s:textfield id="categoria" name="produto.categoria" cssClass="medio" />-->
					</div>
					<div class="field outraCategoria hide">
						<label>Nova categoria:</label>
						<s:textfield name="novaCategoria" />
						<!--<s:textfield id="categoria" name="produto.categoria" cssClass="medio" />-->
					</div>
				</div>
				<div class="ui buttons right floated">
					<input type="button" class="ui cancelar button" value="Cancelar" />
  					<div class="or" data-text="ou"></div>
					<s:submit value="Salvar" cssClass="ui teal submit  button" /> 
				</div>				
				
			</s:form>
		
		</div>

	</div>

	<s:include value="../geral/rodape.jsp" />
</body>
</html>