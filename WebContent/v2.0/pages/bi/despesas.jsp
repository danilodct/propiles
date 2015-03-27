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
		setMenuAtivo("#menuDespesas");
		setSubMenuAtivo("#subMenuAnalises");
		setMaskDate(".data");
		setBtPrint();
	});
	
	AmCharts.ready(function() {
		carregarTiposFixos();
		carregarTiposVariaveis();
		carregarCustos();
	});

	function carregarTiposFixos(){
		var somaTotal = 0;
		var dadosRequeridos = JSON.parse($("input#dados1").val());
		for(var i = 0; i < dadosRequeridos.length; i += 1)
			somaTotal += dadosRequeridos[i].soma;
		var percAnterior = 0;
		for(var i = 0; i < dadosRequeridos.length; i += 1){
			var valor = (dadosRequeridos[i].soma / somaTotal)*100 + percAnterior;
			dadosRequeridos[i].perc = valor;
			percAnterior = valor; 
		}
		if(dadosRequeridos.length > 0){
			var chart = createChart(dadosRequeridos, "TIPO");
			chart.addGraph(createBarGraph("soma", true));
			
			var valueAxis = createValueAxis("Custo ($)");
			valueAxis.id = "valueAxis1";
		    chart.addValueAxis(valueAxis);
			
		    var valueAxis2 = createValueAxis("");
		    valueAxis2.id = "eixoDireito";
		    valueAxis2.gridAlpha = 0;
		    valueAxis2.position = "right";
		    chart.addValueAxis(valueAxis2);
		    
			var graphLine = createLineGraph("perc");
			graphLine.valueAxis = "eixoDireito";
			graphLine.labelText = null;
			graphLine.lineThickness = 1;
			chart.addGraph(graphLine);
			
			createGuide(valueAxis2, 80, "80%");
			
		    setConfBasicasCategoryAxis(chart.categoryAxis, dadosRequeridos);
			chart.addChartScrollbar(createHorizontalScroll());
			$("#chart1").css("height", (heightChart * 1.5)+"px");
			chart.write('chart1');
		}else
			$("#chart1").css("width", "780px").css("height", "200px").html("Nenhum dado encontrado para os filtros selecionados");
	}

	function carregarTiposVariaveis(){
		var somaTotal = 0;
		var dadosRequeridos = JSON.parse($("input#dados2").val());
		for(var i = 0; i < dadosRequeridos.length; i += 1)
			somaTotal += dadosRequeridos[i].soma;
		var percAnterior = 0;
		for(var i = 0; i < dadosRequeridos.length; i += 1){
			var valor = (dadosRequeridos[i].soma / somaTotal)*100 + percAnterior;
			dadosRequeridos[i].perc = valor;
			percAnterior = valor; 
		}
		if(dadosRequeridos.length > 0){
			var chart = createChart(dadosRequeridos, "TIPO");
			chart.addGraph(createBarGraph("soma", true));
			chart.addValueAxis(createValueAxis("Custo ($)"));

		    var valueAxis2 = createValueAxis("");
		    valueAxis2.id = "eixoDireito";
		    valueAxis2.gridAlpha = 0;
		    valueAxis2.position = "right";
		    chart.addValueAxis(valueAxis2);
		    
			var graphLine = createLineGraph("perc");
			graphLine.valueAxis = "eixoDireito";
			graphLine.labelText = null;
			graphLine.lineThickness = 1;
			chart.addGraph(graphLine);
			
			createGuide(valueAxis2, 80, "80%");
		    
			setConfBasicasCategoryAxis(chart.categoryAxis, dadosRequeridos);
			chart.addChartScrollbar(createHorizontalScroll());
			$("#chart2").css("height", (heightChart * 1.5)+"px");
			chart.write('chart2');
		}else
			$("#chart2").css("width", "780px").css("height", "200px").html("Nenhum dado encontrado para os filtros selecionados");
	}

	function carregarCustos(){
		var somaTotal = 0;
		var dadosRequeridos = JSON.parse($("input#dados3").val());
		for(var i = 0; i < dadosRequeridos.length; i += 1)
			somaTotal += dadosRequeridos[i].custo;
		var percAnterior = 0;
		for(var i = 0; i < dadosRequeridos.length; i += 1){
			var valor = (dadosRequeridos[i].custo / somaTotal)*100 + percAnterior;
			dadosRequeridos[i].perc = valor;
			percAnterior = valor; 
		}
		if(dadosRequeridos.length > 0){
			var chart = createChart(dadosRequeridos, "CENTRO");
			chart.maxSelectedSeries = 5;
			chart.addGraph(createBarGraph("custo", true));
		    chart.addValueAxis(createValueAxis("Custo ($)"));


		    var valueAxis2 = createValueAxis("");
		    valueAxis2.id = "eixoDireito";
		    valueAxis2.gridAlpha = 0;
		    valueAxis2.position = "right";
		    chart.addValueAxis(valueAxis2);
		    
			var graphLine = createLineGraph("perc");
			graphLine.valueAxis = "eixoDireito";
			graphLine.labelText = null;
			graphLine.lineThickness = 1;
			chart.addGraph(graphLine);
			
			createGuide(valueAxis2, 80, "80%");
			
			setConfBasicasCategoryAxis(chart.categoryAxis, dadosRequeridos);
			chart.addChartScrollbar(createHorizontalScroll());
			$("#chart3").css("height", (heightChart * 1.5)+"px");
			chart.write('chart3');
		}else
			$("#chart3").css("width", "780px").css("height", "200px").html("Nenhum dado encontrado para os filtros selecionados");
	}
	
</script>
</head>
<body>
	<s:include value="../geral/cabecalho.jsp" />
	
<s:hidden name="dados1" id="dados1" /><!-- TIPOS CUSTOS FIXOS -->
<s:hidden name="dados2" id="dados2" /><!-- TIPOS CUSTOS VARIAVEIS -->
<s:hidden name="dados3" id="dados3" /><!-- CENTRO CUSTO -->

	<div class="fifteen wide column">
	
		<!-- TITULO DA PÁGINA 88888888888888888888888888888888888888888888888888888888888888888888888 -->
		<div class="ui dividing  header">
			<i class="bar chart teal circular inverted icon"></i>
			<div class="content">
				Análise detalhada dos custos
				<div class="sub header">Painel com várias análises das contas a pagar</div>
			</div>
		</div>
		
		<div class="ui hidden divider"></div>
		<div class="ui hidden divider"></div>
		<div class="ui hidden divider"></div>
		
		<!-- AREA PESQUISA 88888888888888888888888888888888888888888888888888888888888888888888888 -->
		<div class="ui areaSearch centered grid" >
			<div class="wide column">
				<s:form action="BIDespesas" cssClass="ui form fluid" >
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
							<input type="submit" class="ui teal submit button" value="Gerar" />
						</div>
					</div>
				</s:form>			
			</div>
		</div>
		
		<div class="ui hidden divider"></div>
		<div class="ui hidden divider"></div>
		
		<!-- ICONE DE IMPRIMIR 88888888888888888888888888888888888888888888888888888888888888888888888 -->
	<s:if test="dados1 != '[]'">
		<a href="#" title="Imprimir relatório" class="btPrint ui"> 
			<i class="print black large icon"></i>
		</a>
		
		<!-- INFO DE TOTAL 88888888888888888888888888888888888888888888888888888888888888888888888 -->
		<h2 class="ui horizontal header divider">Dados referentes ao mês atual</h2>
		<div class="ui hidden divider"></div>
		
		<div class="ui hidden divider"></div>
		<div class="ui hidden divider"></div>
		<div class="ui hidden divider"></div>
		
		<!-- DASHBOARD 88888888888888888888888888888888888888888888888888888888888888888888888 -->
		<div class="ui two centered column grid">
			<div class="two column centered row" >
				<div class="column" >
					<h2 class="ui centered align header">Custos Fixos (pareto)<i class="help circle icon hint" data-content="Análise dos tipos de custos que mais geram despesas" data-variation="inverted" ></i></h2>
					<div id="chart1" class=""></div>
				</div>
				<div class="column" >
					<h2 class="ui centered align header">Custos Variáveis (pareto)<i class="help circle icon hint" data-content="Análise dos tipos de custos variáveis que mais geram despesas" data-variation="inverted" ></i></h2>
					<div id="chart2" class=""></div>
				</div>
			</div>
			<div class="two column centered row" >
				<div class="column" >
					<h2 class="ui centered align header">Centros de Custo mais custosos (pareto)<i class="help circle icon hint" data-content="Análise dos centros de custo que mais geram despesas" data-variation="inverted" ></i></h2>
					<div id="chart3" class=""></div>
				</div>
				<div class="column" >
				</div>
			</div>
		</div>
	</s:if>
		
	</div>
	
	<s:include value="../geral/rodape.jsp" />
</body>
</html>