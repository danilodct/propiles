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
<script type="text/javascript" src="v2.0/js/lib/scripts.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		setMenuAtivo("#menuCaptacao");
		setSubMenuAtivo("#subMenuAnalises");
		setMaskDate(".data");
		setBtPrint();
	});
	
	AmCharts.ready(function() {
		if($("input#dados1").val() != "")
			loadChartMidias();
		else if($("input#dados2").val() != "")
			loadChartQtdMidiaCrescimento();
	});
	
	function loadChartQtdMidiaCrescimento(){
		//Grafico apenas com a quantidade de midias 
		var dados = JSON.parse($("input#dados2").val());
		if(dados.length > 0){
			var chart = createChart(dados, "AM_REF", "Crescimento do nº de cadastros x Comportamento da mídia", 18);
			
			var valueAxis = createValueAxis("Qtd. de novos Cadastros");
		    valueAxis.id = "eixoEsquerdo";
		    chart.addValueAxis(valueAxis);
			
		    var valueAxis2 = createValueAxis("");
		    valueAxis2.id = "eixoDireito";
		    valueAxis2.gridAlpha = 0;
		    valueAxis2.position = "right";
		    chart.addValueAxis(valueAxis2);
			
		    var graph = createBarGraph("qtdCadastros", false);
			graph.valueAxis = "eixoEsquerdo";
			chart.addGraph(graph);
			
			setConfBasicasCategoryAxis(chart.categoryAxis, dados);
			
			var dados = [{title:"Qtd. novos cadastros total no mês", color:"#F07727", position:"top"}, {title:"Qtd. novos cadastros apenas por esta mídia", color:"#00B5AD", position:"top"}];
			var legend = createLegend(dados);
			chart.addLegend(legend);
			
			var graphLine = createLineGraph("qtdMidia");
			graphLine.valueAxis = "eixoDireito";
			chart.addGraph(graphLine);
			
			$("#chart1").css("height", (heightChart * 0.6)+"px");
			chart.write('chart1');
		}else{
			$("#chart1").css("width", "780px").css("height", "200px").html("Nenhum dado encontrado para os filtros selecionados");
		}
	}
	
	function loadChartMidias(){
		//Grafico apenas com a quantidade de midias 
		var dados1 = JSON.parse($("input#dados1").val());
		if(dados1.length > 0){
			var mes = "";
			if($("input#dataInicialStr").val() == "" && $("input#dataFinalStr").val() == "")
				mes = "(mês atual)";
			var chart = createChart(dados1, "MIDIA", "Formas de captação mais eficientes " + mes, 22);
		    var graph = createBarGraph("valor", true);
				chart.addGraph(graph);
		    var valueAxis2 = createValueAxis("Qtd. de cadastros");
			    chart.addValueAxis(valueAxis2);
			setConfBasicasCategoryAxis(chart.categoryAxis, dados1);
			
			$("#chart1").css("height", (heightChart * 0.6)+"px");
			chart.write('chart1');
		}else{
			$("#chart1").css("width", "780px").css("height", "200px").html("<h2>Nenhum dado encontrado para os filtros selecionados</h2>");
		}
	}
	
</script>
</head>
<body>
	<s:include value="../geral/cabecalho.jsp" />
<!-- [{\"AM_REF\": \"2014/01\", \"qtdMidia\": 5, \"qtdCadastros\": 10}, {\"AM_REF\": \"2014/02\", \"qtdMidia\": 7, \"qtdCadastros\": 20}, {\"AM_REF\": \"2014/03\", \"qtdMidia\": 14, \"qtdCadastros\": 22}] -->
<s:hidden name="dados1" id="dados1" />
<s:hidden name="dados2" id="dados2" />

	<div class="fifteen wide column">
	
		<!-- TITULO DA PÁGINA 88888888888888888888888888888888888888888888888888888888888888888888888 -->
		<div class="ui dividing  header">
			<i class="list layout <s:property value="#session.profisio_user.tenant.corFinal" /> circular inverted icon"></i>
			<div class="content">
				Análise de formas de captação de novos cadastros
				<div class="sub header">Você poderá observar qual a melhor forma de alcançar novos cadastros (que se converteram em clientes ou não)</div>
			</div>
		</div>
		
		<div class="ui hidden divider"></div>
		<div class="ui hidden divider"></div>
		<div class="ui hidden divider"></div>
		
		<!-- AREA PESQUISA 88888888888888888888888888888888888888888888888888888888888888888888888 -->
		<div class="ui areaSearch centered grid" >
			<div class="wide column">
				<s:form action="BICaptacao" cssClass="ui form fluid" >
					<div class="four fields">
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
							<label>Forma captação de cliente: <i class="help circle icon hint" data-content="Selecione uma forma de captação para ter uma análise mais detalhada. Caso selecione TODAS, será gerado um gráfico com as formas de captação mais eficientes" data-variation="inverted" ></i></label>
							<s:select list="allMidias" cssClass="ui dropdown" listKey="nome" listValue="nome" name="midia" headerKey="-1" headerValue="TODAS"></s:select>
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
		
	<s:if test="(dados1 != null && dados1 != '') || (dados2 != null && dados2 != '') ">
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
			<div class="ui hidden divider"></div>
		</s:if>
		
		<div class="ui one centered column grid">
			<div class="column" id="chart1"  >
			</div>
		</div>
		
	</s:if>
		
	</s:if>
	<s:else>
		<s:include value="../planos.jsp" />
	</s:else>
	</div>
	
	<s:include value="../geral/rodape.jsp" />
</body>
</html>