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
		setMenuAtivo("#menuCentrosCusto");
		setSubMenuAtivo("#subMenuGerenciamento");
		setBtRemover();
		setBtAdd();
		setBtAlterarCentroCusto();
		setBtCancelarAlterarCentroCusto();
	});
	function setBtAlterarCentroCusto(){
		$("input.alterarCentroCusto").click(function(evt){
			evt.preventDefault();
			$(this).parent().find("form.editarCentroCusto").show();
			$(this).hide();
		});
	}
	function setBtCancelarAlterarCentroCusto(){
		$(".cancelarCentroCusto").click(function(evt){
			evt.preventDefault();
			var celula = $(this).parent().parent().parent().parent().parent().parent();
			$(celula).find("input.alterarCentroCusto").show();
			$(celula).find("form.editarCentroCusto").hide();
		});
	}
</script>
</head>
<body>
	<s:include value="../geral/cabecalho.jsp" />

	<div class="twelve wide column">


		<!-- TITULO DA PÁGINA 88888888888888888888888888888888888888888888888888888888888888888888888 -->
		<div class="ui dividing  header">
			<i class="grid layout <s:property value="#session.profisio_user.tenant.corFinal" /> circular inverted icon"></i>
			<div class="content">
				Centros de Custo
				<div class="sub header">Crie grupos de serviços para gerar análises mais detalhas no futuro. Ex.: estéticos, aquáticos, massagens, etc.</div>
			</div>
		</div>
		
		<div class="ui hidden divider"></div>

		<!-- BT ADD 88888888888888888888888888888888888888888888888888888888888888888888888 -->
		<div class="left floated column">
			<a href="#" class="btAdd" title="Inserir novo" >
				<i class="add circle big <s:property value="#session.profisio_user.tenant.corFinal" /> icon"></i>
			</a>
		</div>
		
		<div class="ui hidden divider"></div>
		<div class="ui hidden divider"></div>
		
		<!-- AREA ADD 88888888888888888888888888888888888888888888888888888888888888888888888 -->
		<div class="ui areaAdd hide centered grid" >
			<div class="twelve wide column"> 
				<div class="ui form segment">
					<div class="ui block <s:property value="#session.profisio_user.tenant.corFinal" /> header">
						<i class="add <s:property value="#session.profisio_user.tenant.corFinal" /> icon"></i>
						<div class="content"> Inserir novo centro de custo</div>
					</div>
					
					<s:form action="cadastrarCentroCusto" method="post">
						<h4 class="ui dividing <s:property value="#session.profisio_user.tenant.corFinal" /> header">Dados Principais</h4>
						<div class="two fields">
							<div class="required field">
								<label>Nome do centro de custo:</label>
								<s:textfield name="centroCusto.nome" />
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
		
		<div class="ui hidden divider"></div>
		<div class="ui hidden divider"></div>
		
		<!-- AREA LISTA 88888888888888888888888888888888888888888888888888888888888888888888888 -->
		<table class="ui celled striped <s:property value="#session.profisio_user.tenant.corFinal" /> table">
			<thead>
				<tr>
					<th>#</th>
					<th>Centro de custo</th>
					<th>Alterar Nome</th>
					<th>#</th>
				</tr>
			</thead>
			<tbody>
				<s:if test="centrosCusto.size > 0">
					<% int i = 0; %>
					<s:iterator value="centrosCusto">
						<tr>
							<td><% i += 1; %><%=i %></td>
							<td><s:property value="nome" /></td>
							<td>
								<input type="button" value="ALTERAR" class="ui blue mini button alterarCentroCusto" />
								
								<!-- FORM ALTERAR NOME DO CENTRO 88888888888888888888888888888888888888888888888888888888888888888888888 -->
								<s:form cssClass="hide ui form editarCentroCusto" action="editarCentroCusto">
									<input type="hidden" name="centroCusto.idCript" value="<s:property value="idCript" />" />
									<div class="two fields">
										<div class="field">
											<input type="text" name="centroCusto.nome" value="<s:property value="nome" />" />
										</div>
										<div class="field">
											<div class="two fields">
												<div class="field">
													<input type="button" value="Cancelar" class="ui cancel cancelarCentroCusto button" /> 
												</div>
												<div class="field">
													<input type="submit" value="Salvar" class="ui <s:property value="#session.profisio_user.tenant.corFinal" /> submit  button" /> 
												</div>
											</div>
										</div>
									</div>
								</s:form>
							</td>
							<td><a class="remover" href="removerCentroCusto?centroCusto.idCript=<s:property value="idCript" />"><i class="remove circle red icon"></i></a></td>
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