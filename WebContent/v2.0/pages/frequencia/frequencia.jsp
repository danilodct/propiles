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
		setMenuAtivo("#menuFrequencia");
		setSubMenuAtivo("#subMenuGeral");
		setBtRemover();
		setMaskDate(".data");
	});
</script>
</head>
<body>
	<s:include value="../geral/cabecalho.jsp" />

	<div class="twelve wide column">

		<div class="ui dividing  header">
			<i class="wait teal circular inverted icon"></i>
			<div class="content">
				Últimos Atendimentos
				<div class="sub header">Os últimos atendimentos de todos os serviços</div>
			</div>
		</div>

		<div class="ui hidden divider"></div>
		
		
		<div class="ui centered grid">
			<div class="twelve wide column">
				<s:form action="frequencia" cssClass="ui form fluid" id="formPesquisa">
					<div class="three fields">
						<div class="field">
							<label>Data incial</label>
							<div class="ui icon input">
								<s:textfield cssClass="data" name="dataInicialStr" />
								<i class="calendar icon"></i>
							</div>
						</div>
						<div class="field">
							<label>Data final</label>
							<div class="ui icon input">
								<s:textfield cssClass="data" name="dataFinalStr" />
								<i class="calendar icon"></i>
							</div>
						</div>
						<div class="field">
							<label class="visibilityHidden">Botão</label>
							<s:submit value="Buscar" cssClass="ui teal submit  button" />
						</div>
					</div>
				</s:form>
			</div>
		</div>


	<s:if test="frequencias.size > 0">
		<h4 class="ui header">
			Mostrando <s:property value="frequencias.size" /> atendimentos
		</h4>
	</s:if>
		<table class="ui celled striped teal table">
			<thead>
				<tr>
					<th>Data</th>
					<th>Cliente</th>
					<th>Serviço</th>
					<th>Colaborador</th>
					<th>#</th>
				</tr>
			</thead>
			<tbody>
				<s:if test="frequencias.size > 0">
					<s:iterator value="frequencias">
						<tr>
							<td><s:date name="data" format="dd/MM/yyyy" /> às <s:date name="data" format="HH:mm" /></td>
							<td><a
								href="cadastro?cadastro.idCript=<s:property value="cadastro.idCript" />"><s:property
										value="cadastro.nome" /></a></td>
							<td><s:property value="servicoCerto.nome" /></td>
							<td><s:property value="colaboradorCerto.nome" /></td>
							<td><a class="remover"
								href="removerFrequencia?frequencia.idCript=<s:property value="idCript" />"
								title="Remover"><i class="remove circle red icon"></i></a></td>
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