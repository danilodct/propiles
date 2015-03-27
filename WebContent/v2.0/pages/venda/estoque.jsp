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
		setMenuAtivo("#menuEstoque");
		setSubMenuAtivo("#subMenuVendas");
		setMaskDate(".data"); 
		setMaskInteiro(".inteiro"); 
		setBtRemover();
		setBtAdd();
		$("a.vender").click(function(evt){
			evt.preventDefault();
			$("input#estoqueValor").val($(this).attr("lang"));
			$("input#estoqueId").val($(this).attr("id"));
			setMaskDate(".data");
			setMaskNumerico("form#formVenda .decimal");
			showModal("div.modal");
		});
	});
</script>
</head>
<body>
	<s:include value="../geral/cabecalho.jsp" />

	<div class="twelve wide column">

		<div class="ui dividing  header">
			<i class="shop teal circular inverted icon"></i>
			<div class="content">
				Estoque
				<div class="sub header">Gerencie seu estoque e suas vendas</div>
			</div>
		</div>
		
		<div class="ui hidden divider"></div>

		<div class="left floated column">
			<a href="#" class="btAdd" title="Inserir novo" >
				<i class="add circle big teal icon"></i>
			</a>
			<div class="ui hidden divider"></div>
			<div class="ui hidden divider"></div>
		</div>
		
		<div class="ui areaAdd hide centered grid" >
			<div class="ten wide column"> 
				<div class="ui form segment">
					<div class="ui block teal header">
						<i class="add teal icon"></i>
						<div class="content"> Inserir item Estoque</div>
					</div>
					<s:form id="formInserirEstoque" action="addEstoque" method="post">
						<div class="required tow fields">
							<div class="field">
								<label>Produto:</label>
								<s:select id="produto" cssClass="ui dropdown" name="estoque.produto.id" list="allProdutos" listKey="id" listValue="nome" />
							</div>
							<div class="field">
								<label>Quantidade:</label>
								<s:textfield cssClass="inteiro" name="qtdProdutos" />
							</div>
						</div>
						<div class="ui hidden divider"></div>
						<div class="ui buttons right floated">
							<input type="button" class="ui cancelar button" value="Cancelar" />
		  					<div class="or" data-text="ou"></div>
							<s:submit value="Cadastrar" cssClass="ui teal submit  button" /> 
						</div>	
					</s:form>
				</div>
			</div>
			<div class="ui hidden divider"></div>
		</div>
		
		<div class="ui areaSearch centered grid" >
			<div class="wide column">
				<s:form action="estoque" cssClass="ui form fluid" id="formBuscar">
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
					<div class="four fields">
						<div class="field">
							<label>Status:</label> 
							<select name="status" class="ui dropdown" >
								<option value="-1">Todos</option>
								<option value="DISPONIVEL" <s:if test="status == 'DISPONIVEL'">selected="selected"</s:if> >Disponível</option>
								<option value="VENDIDO" <s:if test="status == 'VENDIDO'">selected="selected"</s:if>>Vendido</option>
							</select> 
						</div>
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

		<div class="left floated column">
			<s:if test="estoques.size > 0">
				<s:property value="qtdVendidos" /> vendidos de <s:property value="qtdEstoque" /> produtos já inseridos no estoque
			</s:if>
		</div>

		<table class="ui celled striped teal table">
			<thead>
				<tr>
					<th>Produto</th>
					<th>Status</th>
					<th>Valor vendido(R$)</th>
					<th>Data de venda</th>
					<th>Vendedor</th>
					<th>Vender</th>
					<th>#</th>
				</tr>
			</thead>
			<tbody>
				<s:if test="estoques.size > 0">
					<s:iterator value="estoques">
						<tr>
							<td><s:property value="produto.nome" /></td>
							<td><s:property value="status.valor" /></td>
							<td><s:if test="status.value == 'VENDIDO'"><s:property value="valorStr" /></s:if></td>
							<td><s:date name="data" format="dd/MM/yyyy" /></td>
							<td><s:property value="vendedor.nome" /></td>
							<td><s:if test="status.value != 'VENDIDO'">
									<a class="vender ui blue mini button" id="<s:property value="id" />" lang="<s:property value="produto.valorStr" />" href="#" >VENDER</a>
								</s:if></td>
							<td><a class="remover" title="Remover" href="removerEstoque?estoque.id=<s:property value="id" />"><i class="remove circle red icon"></i></a></td>
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
	
		<div class="ui small modal">
			<i class="close icon"></i>
			<div class="header">Efetuar Venda</div>
			<div class="content">
				<p>Informe os dados da venda:</p>
				<s:form action="venderEstoque" cssClass="ui form" id="formVenda">
					<input type="hidden" id="estoqueId" name="estoque.id" />
					<div class="required field">
						<label class="grande">Vendedor:</label>
						<s:select list="allVendedores" cssClass="ui dropdown" listKey="id" listValue="nome" name="estoque.vendedor.id" />
					</div>
					<div class="two fields">
						<div class="required field">
							<label class="medio">Valor (R$):</label>
							<s:textfield name="estoque.valorStr" cssClass="decimal" id="estoqueValor" />
						</div>
						<div class="required field">
							<label class="medio final">Data:</label>
							<div class="ui icon input">
								<i class="calendar icon"></i>
								<s:textfield name="estoque.dataStr" cssClass="final data" />
							</div>
						</div>
					</div>
					<div class="ui actions buttons right floated">
						<div class="ui negative button">Cancelar</div>
						<div class="or" data-text="ou"></div>
						<s:submit cssClass="ui positive right submit button" value="Salvar" />
					</div>
				</s:form>
			</div>
		</div>
	
	<s:include value="../geral/rodape.jsp" />
</body>
</html>