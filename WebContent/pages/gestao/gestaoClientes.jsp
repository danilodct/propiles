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
	var totalClientes = 0;
	$(document).ready(function() {
		setPaginaPrincipal();
		$("input.data").datepicker();
		setChartMes();
		setChartSexo();
		setChartServicosSexo();
		setChartBairro();
		setChartEstadoCivil();
		setChartFaixaEtaria();
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
	
	function passNumberToArray(id){
	    var teste = new Array();
	    var dadosSplit = $("#"+id).val().split(";");
	    for(var i = 0; i < dadosSplit.length; i += 1){
	    	var temp = dadosSplit[i];
	    	var tempSplit = temp.split(",");
	    	teste.push([parseInt(tempSplit[1])]);
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
	
	function setChartServicosSexo(){
		var modalidades = $("#modalidades").val().split(";");
		var modalidadesMas = passNumberToArray("clientesServicoMasculino");
		var modalidadesFem = passNumberToArray("clientesServicoFeminino");
		$('#containerServicosSexo').highcharts({
            chart: {
                type: 'column',
    	        plotBorderWidth: 1
            },
            title: {
                text: 'Clientes ativos por Serviço/Sexo '
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
                    text: 'Clientes'
                }
            },
            tooltip: {
                headerFormat: '<span style="font-size:10px">{point.key}</span><table>',
                pointFormat: '<tr><td style="color:{series.color};padding:0">{series.name}: </td>' +
                    '<td style="padding:0"><b>{point.y:.1f}</b></td></tr>',
                footerFormat: '</table>',
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
                name: 'Mulher',
                data: modalidadesFem,
                color: 'pink'
            },{
                name: 'Homem',
                data: modalidadesMas,
                color: 'silver'
            }]
        });
	}
	
	function setChartMes() {
	    var meses = passLabelToArray("clientesMes");
	    var dados = passDataToArray("clientesMes");
	    if($("#clientesMes").val() == "")
	    	$('#containerMes').hide();
		$('#containerMes').highcharts({
            chart: {
                type: 'column',
    	        plotBorderWidth: 1
            },
            title: {
                text: 'Clientes ativos por Mês '
            },
            /*
            subtitle: {
                text: 'Subtítulo'
            },*/
            xAxis: {
                categories: meses,
            	labels: {
                    rotation: -45
                },
                max: (meses.length-1)
            },
            yAxis: {
                min: 0,
                title: {
                    text: 'Clientes'
                }
            },
            tooltip: {
                headerFormat: '<span style="font-size:10px">{point.key}</span><table>',
                pointFormat: '<tr><td style="color:{series.color};padding:0">{series.name}: </td>' +
                    '<td style="padding:0"><b>{point.y:.1f}</b></td></tr>',
                footerFormat: '</table>',
                shared: true,
                useHTML: true
            },
            plotOptions: {
                column: {
                    pointPadding: 0.2,
                    borderWidth: 1
                }
            },
            scrollbar: {
                enabled: true
            },
            series: [{
                name: 'Qtd. clientes',
                data: dados,
                color: 'pink'
            }]
        });
	}
	
	
	function setChartBairro() {
	    var bairros = passLabelToArray("clientesBairro");
	    var dados = passDataToArray("clientesBairro");
		$('#containerBairro').highcharts({
            chart: {
                type: 'column',
    	        plotBorderWidth: 1
            },
            title: {
                text: 'Clientes ativos por Bairro '
            },
            /*
            subtitle: {
                text: 'Subtítulo'
            },*/
            xAxis: {
                categories: bairros,
            	labels: {
                    rotation: -45
                },
                max: 20
            },
            yAxis: {
                min: 0,
                title: {
                    text: 'Clientes'
                }
            },
            tooltip: {
                headerFormat: '<span style="font-size:10px">{point.key}</span><table>',
                pointFormat: '<tr><td style="color:{series.color};padding:0">{series.name}: </td>' +
                    '<td style="padding:0"><b>{point.y:.1f}</b></td></tr>',
                footerFormat: '</table>',
                shared: true,
                useHTML: true
            },
            plotOptions: {
                column: {
                    pointPadding: 0.2,
                    borderWidth: 1
                }
            },
            scrollbar: {
                enabled: true
            },
            series: [{
                name: 'Qtd. clientes',
                data: dados,
                color: 'pink'
            }]
        });
	}
	
	function setChartSexo() {
	    var teste = passDataToArray("clientesSexo");
	    var modalidadesMas = teste[0];
	    var modalidadesFem = teste[1];
	    totalClientes = modalidadesMas[1] + modalidadesFem[1];
	    
	    $('#containerSexo').highcharts({
	        chart: {
	            plotBackgroundColor: null,
	            plotBorderWidth: 1,//null,
	            plotShadow: false
	        },
	        title: {
	            text: 'Clientes ativos por Sexo (' + totalClientes + ' clientes ativos)'
	        },
	        tooltip: {
	    	    pointFormat: '{series.name}: {point.y} - <b>{point.percentage:.1f}%</b>'
	        },
	        plotOptions: {
	            pie: {
	                allowPointSelect: true,
	                cursor: 'pointer',
	                dataLabels: {
	                    enabled: true,
	                    format: '<b>{point.name}</b>: {point.y} - {point.percentage:.1f} %',
	                    style: {
	                        color: (Highcharts.theme && Highcharts.theme.contrastTextColor) || 'black'
	                    }
	                }
	            }
	        },
	        series: [{
	            type: 'pie',
	            name: 'Browser share',
	            data: teste
	        }]
	    });
	}   
	
	function setChartEstadoCivil() {
	    var teste = passDataToArray("clientesEstadoCivil");
	    $('#containerEstadoCivil').highcharts({
	        chart: {
	            plotBackgroundColor: null,
	            plotBorderWidth: 1,//null,
	            plotShadow: false
	        },
	        title: {
	            text: 'Clientes ativos por Estado Civil'
	        },
	        tooltip: {
	    	    pointFormat: '{series.name}: {point.y} - <b>{point.percentage:.1f}%</b>'
	        },
	        plotOptions: {
	            pie: {
	                allowPointSelect: true,
	                cursor: 'pointer',
	                dataLabels: {
	                    enabled: true,
	                    format: '<b>{point.name}</b>: {point.y} - {point.percentage:.1f} %',
	                    style: {
	                        color: (Highcharts.theme && Highcharts.theme.contrastTextColor) || 'black'
	                    }
	                }
	            }
	        },
	        series: [{
	            type: 'pie',
	            name: 'Browser share',
	            data: teste
	        }]
	    });
	}
	
	function setChartFaixaEtaria() {
	    var teste = passDataToArray("clientesFaixaEtaria");
	    $('#containerFaixaEtaria').highcharts({
	        chart: {
	            plotBackgroundColor: null,
	            plotBorderWidth: 1,//null,
	            plotShadow: false
	        },
	        title: {
	            text: 'Clientes ativos por Faixa Etária'
	        },
	        tooltip: {
	    	    pointFormat: '{series.name}: {point.y} - <b>{point.percentage:.1f}%</b>'
	        },
	        plotOptions: {
	            pie: {
	                allowPointSelect: true,
	                cursor: 'pointer',
	                dataLabels: {
	                    enabled: true,
	                    format: '<b>{point.name}</b>: {point.y} - {point.percentage:.1f} %',
	                    style: {
	                        color: (Highcharts.theme && Highcharts.theme.contrastTextColor) || 'black'
	                    }
	                }
	            }
	        },
	        series: [{
	            type: 'pie',
	            name: 'Clientes',
	            data: teste
	        }]
	    });
	}
	    
</script>
</head>
<body>

<s:hidden name="clientesPeriodo" id="clientesMes" />
<s:hidden name="clientesBairro" id="clientesBairro" />

<s:hidden name="clientesServicoMasculino" id="clientesServicoMasculino" />
<s:hidden name="clientesServicoFeminino" id="clientesServicoFeminino" />
<s:hidden name="modalidadesStr" id="modalidades" />

<s:hidden name="clientesEstadoCivil" id="clientesEstadoCivil" />
<s:hidden name="clientesSexo" id="clientesSexo" />
<s:hidden name="clientesFaixaEtaria" id="clientesFaixaEtaria" />

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

<div class="centralizador">
<table class="mor">
	<tr>
		<td>
		<div class="formAdd">
			<fieldset>
				<legend>Filtros para Gerar Gráficos</legend> 
				<s:form id="formGerarRelatorio" action="gestaoClientesRedirect" method="post">
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

<div id="containerMes" style="min-width: 300px; height: 500px; max-width: 1000px; margin: 0 auto; margin-bottom: 100px;"></div>
<div id="containerSexo" style="min-width: 300px; height: 400px; max-width: 800px; margin: 0 auto; margin-bottom: 100px;"></div>
<div id="containerServicosSexo" style="min-width: 300px; height: 500px; max-width: 1000px; margin: 0 auto; margin-bottom: 100px;"></div>
<div id="containerBairro" style="min-width: 300px; height: 500px; max-width: 1000px; margin: 0 auto; margin-bottom: 100px;"></div>

<div class="clear"></div>

<div class="centralizador">
	<div id="containerEstadoCivil" style="min-width: 300px; height: 400px; max-width: 800px; margin: 0 auto; margin-bottom: 100px;"></div>
	<div id="containerFaixaEtaria" style="min-width: 300px; height: 400px; max-width: 800px; margin: 0 auto; "></div>
	<div class="clear"></div>
</div>

<div class="clear"></div>

<s:include value="../geral/rodape.jsp" />
</body>
</html>