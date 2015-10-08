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
 	.ui.menu .item.image, form.printable, h4.ui.header{display:block !important;}
 	.ui.menu, .ui.styled.accordion{box-shadow:none;}
 }
</style>
<script type="text/javascript" src="v2.0/js/lib/jquery.semantic.js" ></script>
<script type="text/javascript" src="v2.0/js/lib/jquery.ui.mask.js" ></script>
<script type="text/javascript" src="v2.0/js/lib/amcharts/amcharts.js" ></script>
<script type="text/javascript" src="v2.0/js/lib/amcharts/serial.js" ></script>
<script type="text/javascript" src="v2.0/js/lib/amcharts/pie.js" ></script>
<script type="text/javascript" src="v2.0/js/lib/scripts.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		setMenuAtivo("#menuEfetividadeBI");
		setSubMenuAtivo("#subMenuAnalises");
		setMaskDate(".data");
		setBtPrint();
	});
	
	AmCharts.ready(function() {
		carregarEfetividade();
		carregarAtivos();
	});

	function carregarEfetividade(){
		var dadosEfetividade = JSON.parse($("input#dados1").val());
		if(dadosEfetividade.length > 0){
			var chart = createChart(dadosEfetividade, "AM_REF");
			chart.addGraph(createBarGraph("taxa", true));
		    chart.addValueAxis(createValueAxis(""));
			setConfBasicasCategoryAxis(chart.categoryAxis, dadosEfetividade);
			$("#chart1").css("height", heightChart+"px");
			chart.write('chart1');
		}else{
			$("#chart1").css("width", "780px").css("height", "200px").html("Nenhum dado encontrado para os filtros selecionados");
		}
	}

	function carregarAtivos(){
		var dadosEfetividade = JSON.parse($("input#dados2").val());
		if(dadosEfetividade.length > 0){
			var chart = createChart(dadosEfetividade, "AM_REF");
			chart.numberFormatter = {precision:0, decimalSeparator:',', thousandsSeparator:'.'};
			var bar1Graph = createBarGraph("qtdClientes", false);
			bar1Graph.colorField = "cor1";
			bar1Graph.lineColor = "cor1";
			bar1Graph.balloonText = "[[category]]: <b>[[value]]</b> Cli.";
			chart.addGraph(bar1Graph);
			var bar2Graph = createBarGraph("qtdCadastros", false);
			bar2Graph.colorField = "cor2";
			bar2Graph.lineColor = "cor2";
			bar2Graph.balloonText = "[[category]]: <b>[[value]]</b> Cad.";
			chart.addGraph(bar2Graph);
		    chart.addValueAxis(createValueAxis(""));
			setConfBasicasCategoryAxis(chart.categoryAxis, dadosEfetividade);
			
			var dados = [{title:"Qtd. novos cadastros", color:"#57A385", position:"left"}, {title:"Qtd. novos clientes", color:"#CDCEE1", position:"right"}];
			chart.addLegend(createLegend(dados));
			
			$("#chart2").css("height", heightChart+"px");
			chart.write('chart2');
		}else{
			$("#chart2").css("width", "780px").css("height", "200px").html("Nenhum dado encontrado para os filtros selecionados");
		}
	}
	
	
</script>
<script>(function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){(i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)})(window,document,'script','//www.google-analytics.com/analytics.js','ga');ga('create', 'UA-62673588-1', 'auto');ga('send', 'pageview');</script></head>
<body>
	<s:include value="../geral/cabecalho.jsp" />
	
<s:hidden name="dados1" id="dados1" /><!-- TAXA EFETIVIDADE -->
<s:hidden name="dados2" id="dados2" /><!-- ATIVOS -->

	<div class="fifteen wide column">
	
		<!-- TITULO DA PÁGINA 88888888888888888888888888888888888888888888888888888888888888888888888 -->
		<div class="ui dividing  header">
			<i class="bar chart <s:property value="#session.profisio_user.tenant.corFinal" /> circular inverted icon"></i>
			<div class="content">
				Análise da Taxa de Efetividade
				<div class="sub header">Painel com análises da taxa de efetividade em relação aos seus clientes</div>
			</div>
		</div>
		
		<div class="ui hidden divider"></div>
		<div class="ui hidden divider"></div>
		<div class="ui hidden divider"></div>
		
		<!-- AREA PESQUISA 88888888888888888888888888888888888888888888888888888888888888888888888 -->
		<div class="ui areaSearch centered grid" >
			<div class="wide column">
				<s:form action="BIEfetividade" cssClass="ui form fluid" >
					<div class="three fields">
						<div class="field">
							<label>Data Inicial:</label>
							<div class="ui icon input">
								<s:textfield name="dataInicialStr" id="dataInicialStr" cssClass="data" />
								<i class="calendar icon"></i>
							</div>
						</div>
						<div class="field">
							<label>Data Final:</label>
							<div class="ui icon input">
								<s:textfield name="dataFinalStr" id="dataFinalStr" cssClass="data" />
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
		<div class="ui hidden divider"></div>
		<div class="ui hidden divider"></div>
		
		<!-- ICONE DE IMPRIMIR 88888888888888888888888888888888888888888888888888888888888888888888888 -->
		<a href="#" title="Imprimir relatório" class="btPrint ui"> 
			<i class="print black large icon"></i>
		</a>
		
		<!-- INFO DE TOTAL 88888888888888888888888888888888888888888888888888888888888888888888888 -->
		<s:if test="dataInicialStr == null && dataFinalStr == null">
			<h2 class="ui horizontal header divider">Dados referentes ao mês atual</h2>
			<div class="ui hidden divider"></div>
		</s:if>
		
		<div class="ui hidden divider"></div>
		<div class="ui hidden divider"></div>
		<div class="ui hidden divider"></div>
		
		<!-- DASHBOARD 88888888888888888888888888888888888888888888888888888888888888888888888 -->
		<div class="ui two centered column grid">
			<div class="two column centered row" >
				<div class="column"  >
					<h2 class="ui centered align header">Taxa de Efetividade (%)<i class="help circle icon hint" data-content="Indicador que informa quantos dos cadastros feitos no período especificado tornaram-se clientes" data-variation="inverted" ></i></h2>
					<div id="chart1"></div>
				</div>
				<div class="column" >
					<h2 class="ui centered align header">Evolução dos Ativos <i class="help circle icon hint" data-content="Quantidade de cadastros ativos (clientes) mês a mês" data-variation="inverted" ></i></h2>
					<div id="chart2"></div>
				</div>
			</div>
		</div>
		
		
	</s:if>
	<s:else>
		<s:include value="../planos.jsp" />
	</s:else>
	</div>
	
	<s:include value="../geral/rodape.jsp" />
</body>
</html>