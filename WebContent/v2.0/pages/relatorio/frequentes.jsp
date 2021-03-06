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

<style type="text/css">
 @media print{
 	.ui.menu .item, .title, .add.icon, .print.icon, tr.linhaFicha.hide, form, h4, .ui.buttons{display:none;}
 	.ui.menu .item.image, form.printable{display:block !important;}
 	.ui.menu, .ui.styled.accordion{box-shadow:none;}
 }
</style>
<script type="text/javascript" src="v2.0/js/lib/jquery.semantic.js" ></script>
<script type="text/javascript" src="v2.0/js/lib/jquery.ui.mask.js" ></script>
<script type="text/javascript" src="v2.0/js/lib/scripts.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		setMenuAtivo("#menuFrequentes");
		setSubMenuAtivo("#subMenuRelatorios");
		setMaskDate(".data");
		setBtPrint();
	});
</script>
<script>(function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){(i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)})(window,document,'script','//www.google-analytics.com/analytics.js','ga');ga('create', 'UA-62673588-1', 'auto');ga('send', 'pageview');</script></head>
<body>
	<s:include value="../geral/cabecalho.jsp" />

	<div class="fifteen wide column">
	
		<!-- TITULO DA PÁGINA 88888888888888888888888888888888888888888888888888888888888888888888888 -->

		<div class="ui dividing  header">
			<i class="list layout <s:property value="#session.profisio_user.tenant.corFinal" /> circular inverted icon"></i>
			<div class="content">
				Relatório de clientes frequentes
				<div class="sub header">Relatório com todos os clientes que frequentaram seu estabelecimento em determinado período</div>
			</div>
		</div>
		
		<div class="ui hidden divider"></div>
		<div class="ui hidden divider"></div>
		<div class="ui hidden divider"></div>
		
		<!-- AREA PESQUISA 88888888888888888888888888888888888888888888888888888888888888888888888 -->
		
		<div class="ui areaSearch centered grid" >
			<div class="wide column">
				<s:form action="relatorioFrequentes" cssClass="ui form fluid" >
					<div class="two fields">
						<div class="field">
							<label>Professor:</label>
							<s:select list="allColaboradores" cssClass="ui dropdown" name="colaborador.idCript" headerKey="-1" headerValue="TODOS" listKey="idCript" listValue="nome"></s:select>
						</div>
						<div class="field">
							<label>Serviço:</label>
							<s:select list="allServicos" name="servico.idCript" cssClass="ui dropdown" headerKey="-1" headerValue="TODOS" listKey="idCript" listValue="nome"></s:select>
						</div>
					</div>
					<div class="three fields">
						<div class="field">
							<label>Data Inicial:</label>
							<div class="ui icon input">
								<s:textfield name="dataInicialStr" cssClass="data" />
								<i class="calendar icon"></i>
							</div>
						</div>
						<div class="field">
							<label>Data Final:</label>
							<div class="ui icon input">
								<s:textfield name="dataFinalStr" cssClass="data" />
								<i class="calendar icon"></i>
							</div>
						</div>
						<div class="field">
							<label class="visibilityHidden">Botão:</label> 
							<input type="submit" class="ui <s:property value="#session.profisio_user.tenant.corFinal" /> submit button" value="Gerar" />
						</div>
					</div>
				</s:form>			
			</div>
		</div>

	<s:if test="#session.profisio_user.tenant.accessRelatorio">		
		<!-- INFO DE TOTAL 88888888888888888888888888888888888888888888888888888888888888888888888 -->
		<s:if test="clientes.size > 0">
			<div class="ui hidden divider"></div>
			<div class="ui hidden divider"></div>
		
			<div class="ui column right floated">
				<a href="exportAtividadesClientes?dataInicialStr=<s:property value="dataInicialStr" />&dataFinalStr=<s:property value="dataFinalStr" />" target="_blank" title="Exportar dados detalhados para o Excel" >
					<i class="file excel outline large <s:property value="#session.profisio_user.tenant.corFinal" /> icon"></i>
				</a>
				<a href="#" title="Imprimir relatório" class="btPrint">
					<i class="print black large icon"></i>
				</a>
			</div>
			<h4 class="ui header">
				<s:property value="clientes.size" /> clientes frequentaram o estabelecimento <s:if test="dataInicialStr == null and dataFinalStr == null">este mês</s:if>
			</h4>
		</s:if>
		
		<!-- TABELA DE CONTAS A RECEBER AVULSO 88888888888888888888888888888888888888888888888888888888888888888888888 -->
		<table class="ui celled <s:property value="#session.profisio_user.tenant.corFinal" /> table">
			<thead><tr><th>Cliente</th><th>E-mail</th><th>Telefone</th></tr></thead>
			<tbody>
				<s:if test="clientes.size > 0">
					<s:iterator value="clientes">
						<tr>
							<td><a href="cadastro?cadastro.idCript=<s:property value="idCript" />"><s:property value="nome" /></a></td>
							<td><s:property value="email" /></td>
							<td class="collapsing">
								<s:property value="foneFixo" />
								<s:if test="foneCelular != null && foneCelular != '' && foneFixo != null && foneFixo != '' ">
									<br />
								</s:if> 
								<s:property value="foneCelular" />
							</td>
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
	</s:if>
	<s:else>
		<s:include value="../planos.jsp" />
	</s:else>
</div>
	
	<s:include value="../geral/rodape.jsp" />
</body>
</html>