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
		setMenuAtivo("#menuServicos");
		setSubMenuAtivo("#subMenuGerenciamento");
		setMaskInteiro(".inteiro");
		setBtRemover();
		setBtAdd();
		setCheckboxTemSessoes();
	});
	function setCheckboxTemSessoes(){
		$("input#temSessoes").change(function(){
			if($(this).is(":checked") == true){
				$("div#areaQtdSessoes").show();
				$("div#areaQtdSessoes input").val("1");
			}else{
				$("div#areaQtdSessoes").hide();
				$("div#areaQtdSessoes input").val("0");
			}
		});
	}
</script>
</head>
<body>
	<s:include value="../geral/cabecalho.jsp" />

	<div class="twelve wide column">


		<!-- TITULO DA PÁGINA 88888888888888888888888888888888888888888888888888888888888888888888888 -->
		<div class="ui dividing  header">
			<i class="configure teal circular inverted icon"></i>
			<div class="content">
				Serviços
				<div class="sub header">Gerencie todos os serviços da sua clínica</div>
			</div>
		</div>
		
		<div class="ui hidden divider"></div>

		<!-- BT ADD 88888888888888888888888888888888888888888888888888888888888888888888888 -->
		<div class="left floated column">
			<a href="#" class="btAdd" title="Inserir novo" >
				<i class="add circle big teal icon"></i>
			</a>
		</div>
		
		<div class="ui hidden divider"></div>
		<div class="ui hidden divider"></div>
		
		<!-- AREA ADD 88888888888888888888888888888888888888888888888888888888888888888888888 -->
		<div class="ui areaAdd hide centered grid" >
			<div class="twelve wide column"> 
				<div class="ui form segment">
					<div class="ui block teal header">
						<i class="add teal icon"></i>
						<div class="content"> Inserir novo serviço</div>
					</div>
					
					<s:form action="cadastrarServico" method="post">
						<h4 class="ui dividing teal header">Dados Principais</h4>
						<div class="two fields">
							<div class="required field">
								<label>Nome do serviço:</label>
								<s:textfield name="servico.nome" />
							</div>
							<div class="required field">
								<label>Centro de custo:</label>
								<s:select name="servico.centroCusto.idCript" cssClass="ui dropdown" list="centrosCusto" listKey="idCript" listValue="nome" />
							</div>
						</div>
						<div class="three fields">
							<div class="field">
								<label>Trabalha com sessões? <i class="help circle icon hint" data-content="Clique nesta opção caso este serviço funcione com base em quantidade de sessões. Caso não, deixe-a desmarcada." data-variation="inverted" ></i></label>
								<div class="ui fitted toggle checkbox">
						        	<input type="checkbox" id="temSessoes" checked="checked" />
						        	<label></label>
						        </div>
							</div>
							<div class="required field" id="areaQtdSessoes">
								<label>Número de sessões:</label>
								<s:textfield name="servico.qtdSessoes" cssClass="inteiro" value="1" />
							</div>
							<div class="required field">
								<label>Duração média (min): <i class="help circle icon hint" data-content="Quanto tempo dura em média a sessão ou o atendimento em minutos" data-variation="inverted" ></i></label>
								<s:textfield name="servico.duracaoSessao" cssClass="inteiro" value="30" />
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
		</div>
		
		<div class="ui hidden divider"></div>
		<div class="ui hidden divider"></div>
		
		<!-- AREA LISTA 88888888888888888888888888888888888888888888888888888888888888888888888 -->
		<table class="ui celled striped teal table">
			<thead>
				<tr>
					<th>#</th>
					<th>Nome</th>
					<th>Num. sessões</th>
					<th>Duração (min) <i class="help circle icon hint" data-content="Quanto tempo dura em média a sessão ou o atendimento em minutos" data-variation="inverted" ></i></th>
					<th>Centro de custo</th>
					<th>#</th>
				</tr>
			</thead>
			<tbody>
				<s:if test="servicos.size > 0">
					<% int i = 0; %>
					<s:iterator value="servicos">
						<tr>
							<td><% i += 1; %><%=i %></td>
							<td><a href="servico?servico.idCript=<s:property value="idCript" />"><s:property value="nome" /></a></td>
							<td><s:if test="qtdSessoes > 0"><s:property value="qtdSessoes" /></s:if><s:else>Não se aplica</s:else></td>
							<td><s:property value="duracaoSessao" /></td>
							<td><s:property value="centroCusto.nome" /></td>
							<td><a class="remover" href="removerServico?servico.idCript=<s:property value="idCript" />"><i class="remove circle red icon"></i></a></td>
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