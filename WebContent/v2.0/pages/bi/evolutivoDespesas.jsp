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
		setMenuAtivo("#menuEvolutivoDespesas");
		setSubMenuAtivo("#subMenuAnalises");
		setMaskDate(".data");
		setBtPrint();
	});
	
	AmCharts.ready(function() {
		carregarCrescimento();
		carregarCrescimentoAcumulado();
	});

	function carregarCrescimento(){
		var dadosRequeridos = JSON.parse($("input#dados1").val());
		if(dadosRequeridos.length > 0){
			var chart = createChart(dadosRequeridos, "AM_REF");
			chart.maxSelectedSeries = 1000;
			var graph = createLineGraph("somaCustosMes");
			graph.lineThickness = 4;
			graph.balloonText = "[[category]]: <b>[[value]]</b>";
			chart.addGraph(graph);
			var graph2 = createLineGraph("somaCustosMesAnterior");
			graph2.lineThickness = 1;
			graph2.lineColor = "#D96100";
			graph2.balloonText = "Mesmo mês do ano anterior: <b>[[value]]</b>";
			chart.addGraph(graph2);
		    chart.addValueAxis(createValueAxis("Custos ($)"));
			setConfBasicasCategoryAxis(chart.categoryAxis, dadosRequeridos);
			var dados = [{title:"Ano informado", color:"#00B5AD", position:"top"}, {title:"Ano anterior", color:"#D96100", position:"top"}];
			var legend = createLegend(dados);
			chart.addLegend(legend);
			
			$("#chart1").css("height", (heightChart)+"px");
			chart.write('chart1');
		}else
			$("#chart1").css("width", "780px").css("height", "200px").html("Nenhum dado encontrado para os filtros selecionados");
	}

	function carregarCrescimentoAcumulado(){
		var dadosRequeridos = JSON.parse($("input#dados1").val());
		if(dadosRequeridos.length > 0){
			var chart = createChart(dadosRequeridos, "AM_REF");
			chart.maxSelectedSeries = 1000;
			var graph = createLineGraph("somaCustos");
			graph.lineThickness = 4;
			graph.balloonText = "[[category]]: <b>[[value]]</b>";
			chart.addGraph(graph);
			var graph2 = createLineGraph("somaCustosAnterior");
			graph2.lineThickness = 1;
			graph2.lineColor = "#D96100";
			graph2.balloonText = "Mesmo mês do ano anterior: <b>[[value]]</b>";
			chart.addGraph(graph2);
		    chart.addValueAxis(createValueAxis("Custos ($)"));
			setConfBasicasCategoryAxis(chart.categoryAxis, dadosRequeridos);
			var dados = [{title:"Ano informado", color:"#00B5AD", position:"top"}, {title:"Ano anterior", color:"#D96100", position:"top"}];
			var legend = createLegend(dados);
			chart.addLegend(legend);
			
			$("#chart2").css("height", (heightChart)+"px");
			chart.write('chart2');
		}else
			$("#chart2").css("width", "780px").css("height", "200px").html("Nenhum dado encontrado para os filtros selecionados");
	}

</script>
</head>
<body>
	<s:include value="../geral/cabecalho.jsp" />
	
<s:hidden name="dados1" id="dados1" /><!-- CRESCIMENTO -->

	<div class="fifteen wide column">
	
		<!-- TITULO DA PÁGINA 88888888888888888888888888888888888888888888888888888888888888888888888 -->
		<div class="ui dividing  header">
			<i class="bar chart teal circular inverted icon"></i>
			<div class="content">
				Análise da evolução das despesas ao longo do tempo
				<div class="sub header">Análise detalhda da evolução das despesas ao longo do tempo, comparado ao ano anterior</div>
			</div>
		</div>
		
		<div class="ui hidden divider"></div>
		<div class="ui hidden divider"></div>
		
		<div class="ui hidden divider"></div>
		
		<!-- AREA PESQUISA 88888888888888888888888888888888888888888888888888888888888888888888888 -->
		<div class="ui areaSearch centered grid" >
			<div class="wide column">
				<s:form action="BIEvolutivoDespesas" cssClass="ui form fluid" >
					<div class="three fields">
						<div class="required field">
							<label>Data Inicial:</label>
							<div class="ui icon input">
								<s:textfield name="dataInicialStr" id="dataInicialStr" cssClass="data" />
								<i class="calendar icon"></i>
							</div>
						</div>
						<div class="required field">
							<label>Data Final:</label>
							<div class="ui icon input">
								<s:textfield name="dataFinalStr" id="dataFinalStr" cssClass="data" />
								<i class="calendar icon"></i>
							</div>
						</div>
						<div class="field">
							<label class="visibilityHidden">Botão:</label> 
							<input type="submit" class="ui teal submit button" value="Gerar" />
						</div>
					</div>
				</s:form>			
			</div>
		</div>
		
		<div class="ui hidden divider"></div>
		<div class="ui hidden divider"></div>
		
		<s:if test="dataInicialStr == null && dataFinalStr == null">
			<h3 class="ui horizontal header">Selecione um período para análise</h3>
		</s:if>		
		
	<s:if test="dados1 != null && dados1 != '' && dados1 != '[]' ">
		<!-- ICONE DE IMPRIMIR 88888888888888888888888888888888888888888888888888888888888888888888888 -->
		<a href="#" title="Imprimir relatório" class="btPrint ui"> 
			<i class="print black large icon"></i>
		</a>
		
		<!-- INFO DE TOTAL 88888888888888888888888888888888888888888888888888888888888888888888888 -->
		<s:if test="dataInicialStr == null && dataFinalStr == null">
			<h2 class="ui horizontal header divider">Dados referentes ao mês atual</h2>
			<div class="ui hidden divider"></div>
			<div class="ui hidden divider"></div>
			<div class="ui hidden divider"></div>
		</s:if>
		
		
		<!-- DASHBOARD 88888888888888888888888888888888888888888888888888888888888888888888888 -->
		<div class="ui two centered column grid">
			<div class="two column centered row" >
				<div class="column" >
					<h3 class="ui centered align header">Soma dos custos <i class="help circle icon hint" data-content="Soma dos custos no período especificado, comparado ao ano anterior" data-variation="inverted" ></i></h3>
					<div id="chart1" class=""></div>
				</div>
				<div class="column" >
					<h3 class="ui centered align header">Soma dos custos (acumulado)<i class="help circle icon hint" data-content="Soma dos custos acumulado no período especificado, comparado ao ano anterior" data-variation="inverted" ></i></h3>
					<div id="chart2" class=""></div>
				</div>
			</div>
		</div>
	</s:if>
		
	</div>
	
	<s:include value="../geral/rodape.jsp" />
</body>
</html>