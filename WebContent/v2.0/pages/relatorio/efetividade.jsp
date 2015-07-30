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

<style type="text/css">
 @media print{
 	.ui.menu .item, .title, .add.icon, .print.icon, tr.linhaFicha.hide, form, h4, .ui.buttons{display:none;}
 	.ui.menu .item.image, form.printable, h4.ui.header{display:block !important;}
 	.ui.menu, .ui.styled.accordion{box-shadow:none;}
 }
</style>
<script type="text/javascript" src="v2.0/js/lib/jquery.semantic.js" ></script>
<script type="text/javascript" src="v2.0/js/lib/jquery.ui.mask.js" ></script>
<script type="text/javascript" src="v2.0/js/lib/scripts.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		setMenuAtivo("#menuEfetividade");
		setSubMenuAtivo("#subMenuRelatorios");
		setMaskDate(".data");
		setBtPrint();
		setFiltrosVirouCliente();
	});
	function setFiltrosVirouCliente(){
		var select = $("select#selectTornou");
		if($(select).val() == -1){
			$("tr.linha").show();
		}else if($(select).val() == "SIM"){
			$("tr.linhaTornou").show();
			$("tr.linhaNaoTornou").hide();
		}else if($(select).val() == "NAO"){
			$("tr.linhaTornou").hide();
			$("tr.linhaNaoTornou").show();
		}
		$(select).change(function(){
			if($(select).val() == -1){
				$("tr.linha").show();
			}else if($(select).val() == "SIM"){
				$("tr.linhaTornou").show();
				$("tr.linhaNaoTornou").hide();
			}else if($(select).val() == "NAO"){
				$("tr.linhaTornou").hide();
				$("tr.linhaNaoTornou").show();
			}
		});
	}
</script>
<script>(function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){(i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)})(window,document,'script','//www.google-analytics.com/analytics.js','ga');ga('create', 'UA-62673588-1', 'auto');ga('send', 'pageview');</script></head>
<body>
	<s:include value="../geral/cabecalho.jsp" />

	<div class="fifteen wide column">
	
		<!-- TITULO DA PÁGINA 88888888888888888888888888888888888888888888888888888888888888888888888 -->

		<div class="ui dividing  header">
			<i class="list layout <s:property value="#session.profisio_user.tenant.corFinal" /> circular inverted icon"></i>
			<div class="content">
				Relatório de efetividade
				<div class="sub header">Mostra quantos novos cadastros foram feitos em determinado período e quantos destes tornaram-se clientes</div>
			</div>
		</div>
		
		<div class="ui hidden divider"></div>
		<div class="ui hidden divider"></div>
		<div class="ui hidden divider"></div>
		
		<!-- AREA PESQUISA 88888888888888888888888888888888888888888888888888888888888888888888888 -->
		
		<div class="ui areaSearch centered grid" >
			<div class="wide column">
				<s:form action="relatorioEfetividade" cssClass="ui form fluid" >
					<div class="four fields">
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
							<label>Tornou-se Cliente:</label>
							<select id="selectTornou" name="tornouCliente" class="ui dropdown">
								<option value="-1" >TODOS</option>
								<option value="SIM" <s:if test="tornouCliente == 'SIM'">selected="selected"</s:if>  >Sim</option>
								<option value="NAO" <s:if test="tornouCliente == 'NAO'">selected="selected"</s:if> >Não</option>
							</select>
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
		<div class="ui hidden divider"></div>
		<div class="ui hidden divider"></div>
		
		<div class="clear" ></div>
		
		<s:if test="clientes.size > 0">
			<!-- INFO DE TOTAL 88888888888888888888888888888888888888888888888888888888888888888888888 -->
			<h2 class="ui horizontal header divider">
				Taxa de Efetividade: (<s:property value="porcentagemEfetividade" />%) <i class="help large circle icon hint" data-content="Taxa de Efetividade: Relação entre a quantidade de novos cadastros feitos no período especificado e quais destes se tornaram clientes" data-variation="inverted" ></i>
			</h2>
			
			<div class="ui hidden divider"></div>
			<div class="ui hidden divider"></div>

		<!-- ICONE DE EXCEL E IMPRIMIR 88888888888888888888888888888888888888888888888888888888888888888888888 -->
			<div class="ui column right floated">
				<a href="exportEfetividade?dataInicialStr=<s:property value="dataInicialStr" />&dataFinalStr=<s:property value="dataFinalStr" />&tornouCliente=<s:property value="tornouCliente" />" target="_blank" title="Exportar relatório para Excel" >
					<i class="file excel outline large teal icon"></i>
				</a>
				<a href="#" title="Imprimir relatório" class="btPrint ui"> 
					<i class="print black large icon"></i>
				</a>
			</div>
		<!-- INFO DE TOTAL 88888888888888888888888888888888888888888888888888888888888888888888888 -->
			<h4 class="ui header">
				<s:property value="clientes.size" /> novos cadastros (<s:property value="somaEfetividade" /> clientes) <s:if test="dataInicialStr == null and dataFinalStr == null">no mês atual</s:if>
			</h4>
		</s:if>
		
		<!-- TABELA DE CONTAS A RECEBER AVULSO 88888888888888888888888888888888888888888888888888888888888888888888888 -->
		<table class="ui celled <s:property value="#session.profisio_user.tenant.corFinal" /> table">
			<thead><tr><th>Nome</th><th>E-mail</th><th>Telefone</th><th>Data de cadastro</th><th>Tornou-se cliente? <i class="help small circle icon hint" data-content="Este dado nos informa se o cadastro feito efetivamente se tornou cliente (pagou e frequentou alguma sessão de algum serviço prestado pelo estabelecimento)" data-variation="inverted" ></i></th></tr></thead>
			<tbody>
				<s:if test="clientes.size > 0">
					<s:iterator value="clientes">
						<tr class="linha <s:if test="virouNovoCliente">linhaTornou</s:if><s:else>linhaNaoTornou</s:else>" >
							<td><a href="cadastro?cadastro.idCript=<s:property value="idCript" />"><s:property value="nome" /></a></td>
							<td><s:property value="email" /></td>
							<td><s:property value="foneFixo" /> <s:property value="foneCelular" /></td>
							<td><s:property value="dataCadastroStr" /></td>
							<td>
								<s:if test="virouNovoCliente">
									<i class="checkmark box icon"></i>
								</s:if><s:else>
									<i class="minus square red icon"></i>
								</s:else>
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