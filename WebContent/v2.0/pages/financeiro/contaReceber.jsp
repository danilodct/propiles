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
<script type="text/javascript" src="v2.0/js/lib/jquery.semantic.js" ></script>
<script type="text/javascript" src="v2.0/js/lib/jquery.ui.mask.js" ></script>
<script type="text/javascript" src="v2.0/js/lib/scripts.js"></script>
<script type="text/javascript">
$(document).ready(function() {
	setMenuAtivo("#menuContasReceber");
	setSubMenuAtivo("#subMenuFluxoCaixa");
	setMaskDate(".data");
	setMaskNumerico(".decimal");
	if($("input#cadastroId").val() != "")
		setBtCancelarPage(".cancelar", "cadastro?aba=contasReceber&cadastro.idCript="+$("input#cadastroId").val());
	else
		setBtCancelarPage(".cancelar", "contasReceber");
	setSelectAtividadesPagamentos();
});
function setSelectAtividadesPagamentos(){
	$("select#atividadesPagamentos").change(function(){
		var idAtividade = $(this).val();
		var qtdSessoes = $("select#atividadesPagamentosSuporte option[value='"+idAtividade+"']").html();
		$("input#qtdSessoes").val(qtdSessoes);
		if(qtdSessoes == 0)
			$("div#areaQtdSessoes").hide();
		else
			$("div#areaQtdSessoes").show();
	});
}
</script>
</head>
<body>
	<s:include value="../geral/cabecalho.jsp" />

	<div class="fifteen wide column">
	
		<!-- TITULO DA PÁGINA 88888888888888888888888888888888888888888888888888888888888888888888888 -->

		<div class="ui dividing  header">
			<i class="dollar teal circular inverted icon"></i>
			<div class="content">
				Conta a receber
				<div class="sub header">Edite os dados do pagamento</div>
			</div>
		</div>
		
		<div class="ui hidden divider"></div>
		<div class="ui hidden divider"></div>

		<!-- FORM EDITAR CONTA PAGAR 88888888888888888888888888888888888888888888888888888888888888888888888 -->
		
		<div class="ui areaAdd centered grid" >
			<div class="twelve wide column"> 
				<div class="ui form segment">
					<div class="ui block teal header">
						<i class="add teal icon"></i>
						<div class="content"> Editar Conta a Receber</div>
					</div>
					<s:form action="editarContaReceber" method="post">
						<s:hidden name="contaReceber.numRefCript" />
						<s:hidden name="contaReceber.idCript" />
						<s:hidden name="cadastro.idCript" id="cadastroId" />
						<s:hidden name="aba" />

						<h4 class="ui dividing teal header">Dados do Pagamento</h4>
						<div class="two fields">
							<div class="required field">
								<label class="medio final left">Atividade </label>
								<s:select id="atividadesPagamentos" name="contaReceber.atividade.idCript" cssClass="ui multiple dropdown" list="atividades" listKey="idCript" listValue="contrato.servico.nome + ' - ' + contrato.colaborador.nome" />
								<s:select id="atividadesPagamentosSuporte" cssStyle="display:none !important;" list="atividades" listKey="idCript" listValue="contrato.servico.qtdSessoes" />
							</div>
							<div class="required field">
								<label>Data de Lançamento:</label>
								<div class="ui icon input">
									<s:textfield name="contaReceber.dataLancamentoStr" cssClass="data" />
									<i class="calendar icon"></i>
								</div>
							</div>
						</div>
						<div class="three fields">
							<div class="required field" id="areaQtdSessoes">
								<label>Quantidade de sessões:</label>
								<s:textfield id="qtdSessoes" name="contaReceber.qtdSessoes" cssClass="inteiro" />
							</div>
							<div class="required field">
								<label>Forma de Pagamento:</label>
								<s:select name="contaReceber.formaPagamentoStr" cssClass="ui dropdown" list="allFormasPagamento" listKey="value" listValue="valor" />
							</div>
							<!-- 
							<div class="field">
								<div class="two fields">
							 -->
									<div class="required field">
										<label>Valor (R$):</label>
										<input type="text" class="decimal" name="contaReceber.valorStr" value="<s:property value="contaReceber.valorCheioStr" />" />
									</div>
									<!-- 
									<div class="field">
										<label>Pago:</label>
									    <div class="ui checkbox">
											<input type="checkbox" value="PAGO" checked="checked" name="contaReceber.statusStr" />
										</div>
									</div>
								</div>
							</div>
									 -->
						</div>
						<div class="field">
							<label>Observação:</label>
							<s:textarea name="contaReceber.observacao" ></s:textarea>
						</div>
						
						<div class="ui buttons right floated">
							<input type="button" class="ui cancelar button" value="Cancelar" />
		  					<div class="or" data-text="ou"></div>
							<s:submit value="Salvar" cssClass="ui teal submit  button" /> 
						</div>	
					</s:form>
				</div>
			</div>
		</div>
	</div>
	
	<s:include value="../geral/rodape.jsp" />
</body>
</html>