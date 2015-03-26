<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="java.util.Arrays"%>
<%@page import="java.util.List"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title><s:text name="TITULO_SISTEMA" /></title>
<link rel="stylesheet" type="text/css" href="css/lib/styles.css" />
<link rel="stylesheet" type="text/css" href="css/lib/jquery.ui.all.css" />
<script type="text/javascript" src="js/lib/jquery.1.9.1.js"></script>
<script type="text/javascript" src="js/lib/jquery.ui.1.10.js"></script>
<script type="text/javascript" src="http://code.highcharts.com/stock/highstock.js"></script>
<script type="text/javascript" src="js/lib/scripts.js"></script>

<script type="text/javascript">
	$(document).ready(function() {
		setPaginaPrincipal();
		$("input.data").datepicker();
		setChartRendimentos();
		setChartGastos();
	});
	
	function passDataToArray(id){
	    var teste = new Array();
	    var dadosSplit = $("#"+id).val().split(";");
	    for(var i = 0; i < dadosSplit.length; i += 1){
	    	var temp = dadosSplit[i];
	    	var tempSplit = temp.split(",");
	    	teste.push([tempSplit[0], parseInt(tempSplit[1])]);
	    }
	    return teste;
	}
	
	function passLabelToArray(id){
	    var teste = new Array();
	    var dadosSplit = $("#"+id).val().split(";");
	    for(var i = 0; i < dadosSplit.length; i += 1){
	    	var temp = dadosSplit[i];
	    	var tempSplit = temp.split(",");
	    	teste.push([tempSplit[0]]);
	    }
	    return teste;
	}
	
	function passValuesToArray(id){
	    var teste = new Array();
	    var dadosSplit = $("#"+id).val().split(";");
	    for(var i = 0; i < dadosSplit.length; i += 1){
	    	var temp = dadosSplit[i];
	    	var tempSplit = temp.split(",");
	    	teste.push([tempSplit[1]]);
	    }
	    return teste;
	}
	
	function setChartGastos() {
	    var modalidades = passLabelToArray("gastosPorTipo");
	    var dados = passDataToArray("gastosPorTipo");
	    var values = passValuesToArray("gastosPorTipo");
	    var dataSum = 0;
	    for (var i=0;i < values.length;i++) {
	        dataSum += parseFloat(values[i]);
	    }
	    var chart = new Highcharts.Chart({
	        chart: {
	            renderTo:'containerGastos',
                type: 'column',
    	        plotBorderWidth: 1
            },
            title: {
                text: 'Gastos por Tipo (total: R$ ' +setNumberFormat(dataSum)+ ')' 
            },
            /*
            subtitle: {
                text: 'Subtítulo'
            },*/
            xAxis: {
                categories: modalidades,
            	labels: {
                    rotation: -45
                },
                max: 25
            },
            yAxis: {
                min: 0,
                title: {
                    text: 'Gastos (R$)'
                }
            },
            tooltip: {
                formatter:function() {
                    var pcnt = (this.y / dataSum) * 100;
                    return setNumberFormat(this.y) + ' (' + Highcharts.numberFormat(pcnt) + '%)';
                },
                shared: true,
                useHTML: true
            },
            scrollbar: {
                enabled: true
            },
            series: [{
                name: 'Tipos de Gastos',
                data: dados,
                color: 'pink'
            }]
        });
	}
	
	function setChartRendimentos() {
	    var modalidades = passLabelToArray("rendimentoServicos");
	    var dados = passDataToArray("rendimentoServicos");
	    var values = passValuesToArray("rendimentoServicos");
	    var dataSum = 0;
	    for (var i=0;i < values.length;i++) {
	        dataSum += parseFloat(values[i]);
	    }
		var chart = new Highcharts.Chart({
            chart: {
            	renderTo: 'containerRendimentos',
                type: 'column',
    	        plotBorderWidth: 1
            },
            title: {
                text: 'Rendimentos por Serviço (total: R$ ' +setNumberFormat(dataSum)+ ')'
            },
            /*
            subtitle: {
                text: 'Subtítulo'
            },*/
            xAxis: {
                categories: modalidades,
            	labels: {
                    rotation: -45
                }
            },
            yAxis: {
                min: 0,
                title: {
                    text: 'Rendimentos (R$)'
                }
            },
            tooltip: {
                /* headerFormat: '<span style="font-size:10px">{point.key}</span><table>',
                pointFormat: '<tr><td style="color:{series.color};padding:0">{series.name}: </td>' +
                    '<td style="padding:0"><b>{point.y:.1f}</b></td></tr>',
                footerFormat: '</table>', */
                formatter:function() {
                    var pcnt = (this.y / dataSum) * 100;
                    return setNumberFormat(this.y) + ' (' + Highcharts.numberFormat(pcnt) + '%)';
                },
                shared: true,
                useHTML: true
            },
            plotOptions: {
                column: {
                    pointPadding: 0.2,
                    borderWidth: 1
                }
            },
            series: [{
                name: 'Modalidades',
                data: dados,
                color: 'pink'
            }]
        });
	}
	    
</script>
</head>
<body>

<s:hidden name="rendimentoServicos" id="rendimentoServicos" />
<s:hidden name="gastosPorTipo" id="gastosPorTipo" />

<s:include value="../geral/cabecalho.jsp" />
<s:if test="hasActionErrors()">
	<table width="100%">
		<s:iterator value="actionErrors">
			<tr>
				<td align="center">
				<div class="error"><s:property /></div>
				</td>
			</tr>
		</s:iterator>
	</table>
</s:if>
<s:if test="hasActionMessages()">
	<table width="100%">
		<s:iterator value="actionMessages">
			<tr>
				<td align="center">
				<div class="message"><s:property /></div>
				</td>
			</tr>
		</s:iterator>
	</table>
</s:if>

<div class="clear"></div>

<div class="centralizador">
<table class="mor">
	<tr>
		<td>
		<div class="formAdd">
			<fieldset>
				<legend>Filtros para Gerar Gráficos</legend> 
				<s:form id="formGerarRelatorio" action="gestaoFinanceiraRedirect" method="post">
					<table class="formAdd">
						<tr><td class="linhaPequena"></td></tr>
						<tr>
							<td>
								<span id="erroAddContrato" class="error hidden"></span>
							</td>
						</tr>
						<tr>
							<td align="left">
								<table>
									<tr>
										<td><label>Data Inicial:</label></td>
										<td>&nbsp;&nbsp;</td>
										<td><label>Data Final:</label></td>
									</tr>
									<tr>
										<td><input type="text" name="dataInicialStr" class="pequeno data" value="<s:date name="dataInicial" format="dd/MM/yyyy" />" /></td>
										<td></td>
										<td><input type="text" name="dataFinalStr" class="pequeno data" value="<s:date name="dataFinal" format="dd/MM/yyyy" />" /></td>
									</tr>
								</table>
							</td>
						</tr>
						<tr><td class="linhaMedia"></td></tr>
						<tr>
							<td><s:submit value="gerar gráficos" cssClass="submit" /></td>
						</tr>
					</table>
				</s:form>
			</fieldset>
		</div>
		</td>
	</tr>
</table>
</div>

<div class="clear"></div>

<div id="containerRendimentos" style="min-width: 300px; height: 500px; max-width: 1000px; margin: 0 auto; margin-bottom: 100px;"></div>
<div id="containerGastos" style="min-width: 300px; height: 500px; max-width: 1000px; margin: 0 auto; margin-bottom: 100px;"></div>

<div class="clear"></div>

<s:include value="../geral/rodape.jsp" />
</body>
</html>