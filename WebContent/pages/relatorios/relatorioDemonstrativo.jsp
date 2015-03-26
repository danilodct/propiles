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
<style type="text/css">
table#tabelaRelatorio td, table#tabelaRelatorio th { border: 1px solid #000; padding: 9px 12px; color:#000; }
table#tabelaRelatorio th{background-color: #999; color:#FFF;}
table#tabelaRelatorio tr.linhaReceitasBrutas, table#tabelaRelatorio tr.linhaCustoVariavelTotal {background-color: #95B3D7;}
table#tabelaRelatorio tr.linhaMargemContribuicao {background-color: #D8D8D8;}
table#tabelaRelatorio tr.linhaResultado {background-color: #B6DDE8;}
</style>
<script type="text/javascript" src="js/lib/jquery.1.3.2.js"></script>
<script type="text/javascript" src="js/lib/jquery.mask.js"></script>
<script type="text/javascript" src="js/lib/jquery.datepicker.js"></script>
<script type="text/javascript" src="js/lib/scripts.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		setPaginaPrincipal();
		setMaskDate("form#formInserirContaReceber");
		$("input.data").datepicker();
		formatarRelatorio();
	});
	function formatarRelatorio(){
		var relatorio = $("input#relatorio").val();
		var meses = relatorio.split("|");
		
		$("tr#linhaTitulo").append($("<th>DRE</th>"));
		for(var i = 0; i < meses.length; i += 1){
			var partes = meses[i].split("=");
			$("tr#linhaTitulo").append($("<th>"+partes[0]+"</th>"));
		}
		
		var fat = 0;
		$("tr.linhaReceitasBrutas").append($("<td><b>1. Receitas Brutas</b></td>"));
		for(var i = 0; i < meses.length; i += 1){
			var partes = meses[i].split("=");
			$("tr.linhaReceitasBrutas").append($("<td>"+partes[1]+"</td>"));
			if(i == meses.length - 1){
				$("#indFat").html(partes[1]+"%");
			}
			if(i == meses.length - 2){
				fat = parseFloat((partes[1]).replace(".", "").replace(",", "."));
			}
		}
		var qtdClientes = parseFloat($("#qtdClientesAtivos").val());
		var fatMedio = fat/(meses.length - 2);
		$("#indTicket").html("R$ "+setNumberFormat(fatMedio/qtdClientes));
		
		$("tr.linhaCustoVariavelTotal").append($("<td><b>2. Custo Variável total</b></td>"));
		for(var i = 0; i < meses.length; i += 1){
			var partes = meses[i].split("=");
			$("tr.linhaCustoVariavelTotal").append($("<td>"+partes[2]+"</td>"));
			if(i == meses.length - 1)
				$("#indCustosVar").html(partes[2]+"%");
		}
		
		var indMC = 0;
		$("tr.linhaMargemContribuicao").append($("<td><b>3. Margem de Contribuição</b></td>"));
		for(var i = 0; i < meses.length; i += 1){
			var partes = meses[i].split("=");
			$("tr.linhaMargemContribuicao").append($("<td>"+partes[3]+"</td>"));
			if(i == meses.length - 1){
				$("#indMC").html(partes[3]+"%");
				indMC = parseFloat((partes[3]).replace(",", "."));
			}
		}
		var indCustosFixos = 0;
		$("tr.linhaCustosFixos").append($("<td><b>4. Custos Fixos</b></td>"));
		for(var i = 0; i < meses.length; i += 1){
			var partes = meses[i].split("=");
			$("tr.linhaCustosFixos").append($("<td>"+partes[4]+"</td>"));
			if(i == meses.length - 1)
				$("#indCustosFixos").html(partes[4]+"%");
			if(i == meses.length - 2)
				indCustosFixos = parseFloat((partes[4]).replace(".", "").replace(",", "."));
		}
		
		$("#indPonto").html(setNumberFormat((indCustosFixos/indMC)*100));
		
		$("tr.linhaResultado").append($("<td><b>5. Resultados</b></td>"));
		for(var i = 0; i < meses.length; i += 1){
			var partes = meses[i].split("=");
			$("tr.linhaResultado").append($("<td>"+partes[5]+"</td>"));
			if(i == meses.length - 1)
				$("#indLucratividade").html(partes[5]+"%");
		}
		
	}
</script>
</head>
<body>

<s:hidden name="relatorio" id="relatorio" />
<s:hidden name="qtdClientesAtivos" id="qtdClientesAtivos" />

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
				<legend>Filtros para Gerar Relatório</legend> 
				<s:form id="formGerarRelatorio" action="relatorioDemonstrativoResultadoRedirect" method="post">
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
							<td><s:submit value="gerar relatório" cssClass="submit" /></td>
						</tr>
					</table>
				</s:form>
			</fieldset>
		</div>
		</td>
	</tr>
</table>
</div>
<br /><br />
<div class="separadorLeft">
<s:if test="relatorio != '' ">
<div class="centralizador">
	<a href="javascript:window.print()" class="print" >
		<img src="img/print.gif" />
	</a>
	<br /><br />
	
	<table>
		<tr>
			<td>
				<table>
					<tr>
						<td><h1>MC:</h1></td>
						<td>&nbsp;&nbsp;</td>
						<td><h1 style="color:green" id="indMC"></h1></td>
					</tr>
					<tr>
						<td><h1>LUCRATIVIDADE:</h1></td>
						<td>&nbsp;&nbsp;</td>
						<td><h1 style="color:green" id="indLucratividade"></h1></td>
					</tr>
					<tr>
						<td><h1>CUSTOS FIXOS:</h1></td>
						<td>&nbsp;&nbsp;</td>
						<td><h1 style="color:green" id="indCustosFixos"></h1></td>
					</tr>
					<tr>
						<td><h1>CUSTOS VARIÁVEIS:</h1></td>
						<td>&nbsp;&nbsp;</td>
						<td><h1 style="color:green" id="indCustosVar"></h1></td>
					</tr>
				</table>
			</td>
			<td>&nbsp;&nbsp;&nbsp;</td>
			<td>
				<table>
					<tr>
						<td><h1>TICKET MÉDIO: </h1><h4>(fat. médio/qtd. clientes contrataram serviço)</h4></td>
						<td>&nbsp;</td>
						<td><h1 style="color:green" id="indTicket"></h1></td>
					</tr>
					<tr>
						<td><h1>FATURAMENTO:</h1></td>
						<td>&nbsp;</td>
						<td><h1 style="color:green" id="indFat"></h1></td>
					</tr>
					<tr>
						<td><h1>PONTO DE EQUILÍBRIO:</h1></td>
						<td>&nbsp;</td>
						<td><h1 style="color:green" id="indPonto"></h1></td>
					</tr>
				</table>
			</td>
		</tr>
	</table>
</div>

<table id="tabelaRelatorio">
	<tr id="linhaTitulo"></tr>
	<tr class="linhaReceitasBrutas"></tr>
	<tr class="linhaCustoVariavelTotal"></tr>
	<tr class="linhaMargemContribuicao"></tr>
	<tr class="linhaCustosFixos"></tr>
	<tr class="linhaResultado"></tr>
</table>

</s:if>

</div>
<br /><br />
<s:include value="../geral/rodape.jsp" />
</body>
</html>