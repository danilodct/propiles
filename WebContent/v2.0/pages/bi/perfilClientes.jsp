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
		setMenuAtivo("#menuPerfil");
		setSubMenuAtivo("#subMenuAnalises");
		setMaskDate(".data");
		setBtPrint();
	});
	
	AmCharts.ready(function() {
		carregarBairros();
		carregarSexo();
		carregarEstadoCivil();
		carregarFaixaEtaria();
	});

	function carregarBairros(){
		var dadosBairro = JSON.parse($("input#dados1").val());
		if(dadosBairro.length > 0){
			var chart = createChart(dadosBairro, "BAIRRO");
			chart.numberFormatter = {precision:0, decimalSeparator:',', thousandsSeparator:'.'};
			chart.addGraph(createBarGraph("qtdCadastros", true));
		    chart.addValueAxis(createValueAxis("Qtd. de Cadastros"));
			setConfBasicasCategoryAxis(chart.categoryAxis, dadosBairro);
			chart.addChartScrollbar(createHorizontalScroll());
			$("#chart1").css("height", heightChart+"px");
			chart.write('chart1');
		}else
			$("#chart1").css("width", "780px").css("height", "200px").html("Nenhum dado encontrado para os filtros selecionados");
	}
	
	function carregarSexo(){
		var dadosSexo = JSON.parse($("input#dados2").val());
		if(dadosSexo.length > 0){
			var chart = createPieChart(dadosSexo, "SEXO", "qtdCadastros", "cor");
			$("#chart2").css("height", heightChart+"px");
			chart.write('chart2');
		}else
			$("#chart2").css("width", "780px").css("height", "200px").html("Nenhum dado encontrado para os filtros selecionados");
	}
	
	function carregarEstadoCivil(){
		var dadosEstadoCivil = JSON.parse($("input#dados3").val());
		if(dadosEstadoCivil.length > 0){
			var chart = createPieChart(dadosEstadoCivil, "ESTADO", "qtdCadastros", "cor");
			$("#chart3").css("height", heightChart+"px");
			chart.write('chart3');
		}else
			$("#chart3").css("width", "780px").css("height", "200px").html("Nenhum dado encontrado para os filtros selecionados");
	}
	
	function carregarFaixaEtaria(){
		var dadosFaixa = JSON.parse($("input#dados4").val());
		if(dadosFaixa.length > 0){
			var chart = createPieChart(dadosFaixa, "FAIXA", "qtdCadastros", "cor");
			$("#chart4").css("height", heightChart+"px");
			chart.write('chart4');
		}else
			$("#chart4").css("width", "780px").css("height", "200px").html("Nenhum dado encontrado para os filtros selecionados");
	}
	
</script>
</head>
<body>
	<s:include value="../geral/cabecalho.jsp" />
	
<s:hidden name="dados1" id="dados1" /><!-- BAIRRO -->
<s:hidden name="dados2" id="dados2" /><!-- SEXO -->
<s:hidden name="dados3" id="dados3" /><!-- ESTADO CIVIL -->
<s:hidden name="dados4" id="dados4" /><!-- FAIXA ETARIA -->

	<div class="fifteen wide column">
	
		<!-- TITULO DA PÁGINA 88888888888888888888888888888888888888888888888888888888888888888888888 -->
		<div class="ui dividing  header">
			<i class="bar chart <s:property value="#session.profisio_user.tenant.corFinal" /> circular inverted icon"></i>
			<div class="content">
				Análise detalhada do perfil de seus clientes ativos
				<div class="sub header">Painel com várias análises da sua clientela, todos baseando-se nas frequências cadastradas</div>
			</div>
		</div>
		
		<div class="ui hidden divider"></div>
		<div class="ui hidden divider"></div>
		<div class="ui hidden divider"></div>
		
		<!-- AREA PESQUISA 88888888888888888888888888888888888888888888888888888888888888888888888 -->
		<div class="ui areaSearch centered grid" >
			<div class="wide column">
				<s:form action="BIPerfilClientes" cssClass="ui form fluid" >
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
				<div class="column" >
					<h2 class="ui centered align header">Visão por Bairro<i class="help circle icon hint" data-content="Quantidade de novos cadastros, no período especificado, agrupado por bairro" data-variation="inverted" ></i></h2>
					<div id="chart1"></div>
				</div>
				<div class="column" >
					<h2 class="ui centered align header">Visão por Sexo<i class="help circle icon hint" data-content="Quantidade de novos cadastros, no período especificado, agrupado por sexo" data-variation="inverted" ></i></h2>
					<div id="chart2"></div>
				</div>
			</div>
			<div class="two column centered row" >
				<div class="column" >
					<h2 class="ui centered align header">Visão por Estado Civil<i class="help circle icon hint" data-content="Quantidade de novos cadastros, no período especificado, agrupado por estado civil" data-variation="inverted" ></i></h2>
					<div id="chart3"></div>
				</div>
				<div class="column" >
					<h2 class="ui centered align header">Visão por Faixa Etária<i class="help circle icon hint" data-content="Quantidade de novos cadastros, no período especificado, agrupado por faixa etária" data-variation="inverted" ></i></h2>
					<div id="chart4"></div>
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