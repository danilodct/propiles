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
<script type="text/javascript" src="js/lib/jquery.1.3.2.js"></script>
<script type="text/javascript" src="js/lib/jquery.mask.js"></script>
<script type="text/javascript" src="js/lib/jquery.datepicker.js"></script>
<script type="text/javascript" src="js/lib/scripts.js"></script>
<script type="text/javascript">
$(document).ready(function() {
	setPaginaPrincipal();
	setMaskNumerico();
	setMaskDate("form#formInserirContaReceber");
	$("input.data").datepicker();
	$("input.leitura").attr("readonly", "true");
	$("textarea.leitura").attr("readonly", "true");
	$("form#formInserirContaReceber").submit(function(){
		var validou = true;
		if(($("select#tipo").val() == "-1" || $("select#tipo").val() == "Outro") && $("input#novoTipoContaReceber").val() == ""){
			validou = false;
		}
		if(validou){
			tirarVirgulaPontos("form#formInserirContaReceber");
		}
		return validou;
	});
	$("form#formEditarAvaliacao").submit(function(){tirarVirgulaPontos("form#formEditarAvaliacao");return true;});
	/*
	$("form#formEditarAvaliacaoTratamentoFacial").submit(function(){tirarVirgulaPontos("form#formEditarAvaliacaoTratamentoFacial");return true;});
	$("form#formEditarAvaliacaoDermatologia").submit(function(){tirarVirgulaPontos("form#formEditarAvaliacaoDermatologia");return true;});
	$("form#formEditarAvaliacaoOperatorioCirurgia").submit(function(){tirarVirgulaPontos("form#formEditarAvaliacaoOperatorioCirurgia");return true;});
	$("form#formEditarAvaliacaoGestante").submit(function(){tirarVirgulaPontos("form#formEditarAvaliacaoGestante");return true;});
	$("form#formEditarAvaliacaoGorduraLocalizada").submit(function(){tirarVirgulaPontos("form#formEditarAvaliacaoGorduraLocalizada");return true;});
	$("form#formEditarAvaliacaoEstria").submit(function(){tirarVirgulaPontos("form#formEditarAvaliacaoEstria");return true;});
	$("form#formEditarAvaliacaoDepilacao").submit(function(){tirarVirgulaPontos("form#formEditarAvaliacaoDepilacao");return true;});
	$("form#formEditarAvaliacaoDaySpa").submit(function(){tirarVirgulaPontos("form#formEditarAvaliacaoDaySpa");return true;});
	$("form#formEditarAvaliacaoCirurgiaPlastica").submit(function(){tirarVirgulaPontos("form#formEditarAvaliacaoCirurgiaPlastica");return true;});
	$("form#formEditarAvaliacaoNutricao").submit(function(){tirarVirgulaPontos("form#formEditarAvaliacaoNutricao");return true;});
	$("form#formEditarAvaliacaoPowerShape").submit(function(){tirarVirgulaPontos("form#formEditarAvaliacaoPowerShape");return true;});
	$("form#formEditarAvaliacaoNatacaoInfantil").submit(function(){tirarVirgulaPontos("form#formEditarAvaliacaoNatacaoInfantil");return true;});
	$("form#formEditarAvaliacaoLimpezaPele").submit(function(){tirarVirgulaPontos("form#formEditarAvaliacaoLimpezaPele");return true;});
	$("form#formEditarAvaliacaoPeeling").submit(function(){tirarVirgulaPontos("form#formEditarAvaliacaoPeeling");return true;});
	$("form#formEditarAvaliacaoCripolise").submit(function(){tirarVirgulaPontos("form#formEditarAvaliacaoCripolise");return true;});
	$("form#formEditarAvaliacaoProjeto100Dias").submit(function(){tirarVirgulaPontos("form#formEditarAvaliacaoProjeto100Dias");return true;});
	*/
	$("a.remover").click(function(evt){
		if(!confirm("Tem certeza que deseja remover este pagamento?")){
			evt.preventDefault();
		}
	});
	$("select#tipo").change(function(){
		if($(this).val() == "Outro"){
			$("div#novoTipoContaReceber").show();
		}else if($(this).val().toLowerCase() == "avaliação"){
			$("div#novoTipoContaReceber").hide();
		}else{
			$("div#novoTipoContaReceber").hide();
		}
	});
	getProfessoresByModalidadeAtual();
});
function selectProfessorAtual(){
	var professorId = $("input#professorId").val();
	var options = $("select#professores option");
	for(var i = 0; i < $(options).length; i += 1){
		if($($(options).get(i)).val() == professorId){
			$(options).attr("selected", "selected");
		}
	}
}
function getProfessoresByModalidadeAtual(){
	runAjax("getFuncionariosByModalidade", "servico.id="+$("input#modalidade").val(), "xml", procProfByModalidadeMudar);
}
function procProfByModalidadeMudar(xml){
	removeOptionsJquery("select#professores");
	if($(xml).find("funcionario").length > 0){
		$(xml).find("funcionario").each(function(){
			var idProf = $(this).attr("id");
			var nomeProf = $(this).find("nome").text();
			option = $("<option value='"+idProf+"'>"+nomeProf+"</option>");
			$("select#professores").append(option);
		});
		selectProfessorAtual();
	}
}
</script>
</head>
<body>
<s:hidden name="cadastro.modalidade.professor.id" id="professorId" />
<s:hidden name="cadastro.modalidade.servico.id" id="modalidade" />
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
<div class="guia">
	<a href="clientes">Clientes</a> » <a href="cliente?cliente.id=<s:property value="cadastro.cliente.id" />"><s:property value="cadastro.cliente.nome" /></a> »  <s:property value="cadastro.modalidade.professor.nome" /> (<s:property value="cadastro.modalidade.servico.nome" />)
</div>



<s:if test="#session.pilates_user.tipoStr != 'PROFESSOR'">
<table class="mor">
	<tr>
		<th>Histórico Financeiro</th>
	</tr>
	<tr>
		<td class="linhaMedia"></td>
	</tr>
	<tr>
		<td><a href="#" class="btAdd"><img src="img/add.png" /></a></td>
	</tr>
	<tr>
		<td class="linhaMedia"></td>
	</tr>
	<tr>
		<td>
		<span id="msgErro" class="error hidden"></span>
		<br />
		<div class="formAdd hidden">
			<fieldset>
				<legend>Efetuar Pagamento</legend> 
				<s:form id="formInserirContaReceber" action="inserirContaReceberCadastro" method="post" enctype="multipart/form-data">
					<input type="hidden" name="cadastro.id" value="<s:property value="cadastro.id" />" />
					<table class="formAdd">
						<tr><td class="linhaPequena"></td></tr>
						<tr>
							<td class="header">Dados do Pagamento</td>
						</tr>
						<tr><td class="linhaPequena"></td></tr>
						<tr>
							<td>
								<table>
									<tr>
										<td><label>Valor (R$):</label></td>
										<td width="10px"></td>
										<td><label>Pago:</label></td>
										<td width="10px"></td>
										<td><label>Forma de Pagamento:</label></td>
									</tr>
									<tr>
										<td><s:textfield cssClass="pequeno decimal" name="contaReceber.valor" /></td>
										<td></td>
										<td><s:checkbox value="true" name="contaReceber.statusStr" /></td>
										<td></td>
										<td>
											<s:select name="contaReceber.formaPagamentoStr" cssClass="medio" list="formasPagamento" listKey="value" listValue="valor" />
										</td>
									</tr>
									<tr>
										<td colspan="5" align="left">
											<div id="legendaProf">
												<label>Professor:</label>
											</div>
											<div id="campoProfAvaliacao">
											<select id="professores" class="medio" name="contaReceber.professor.id"></select>
											</div>
										</td>
									</tr>
									<tr>
										<td colspan="5" align="left">
											<table>
												<tr>
													<td>
														<table>
															<tr>
																<td><label>Tipo de Pagamento:</label></td>
															</tr>
															<tr>
																<td>
																	<s:select id="tipo" name="contaReceber.tipo.nome"  headerValue="ESCOLHA" headerKey="-1" cssClass="medio" list="tiposContaReceber" listKey="nome" listValue="nome" />
																</td>
															</tr>
														</table>
													</td>
													<td>&nbsp;&nbsp;</td>
													<td>
														<div id="novoTipoContaReceber" class="hidden">
															<table>
																<tr>
																	<td align="left">
																		<label>Novo Tipo:</label> 
																	</td>
																</tr>
																<tr>
																	<td>
																		<s:textfield id="novoTipoContaReceber" name="novoTipoContaReceber" cssClass="medio" />
																	</td>
																</tr>
															</table> 
														</div>
													</td>
												</tr>
											</table>
										</td>
									</tr>
									<tr>
										<td>
											<table>
												<tr>
													<td><label>Data de Lançamento:</label></td>
												</tr>
												<tr>
													<td><s:textfield name="contaReceber.dataLancamentoStr" cssClass="pequeno data" /></td>
												</tr>
											</table>
										</td>
									</tr>
								</table>
							</td>
						</tr>
						<tr><td class="linhaMedia"></td></tr>
						<tr>
							<td><s:submit value="cadastrar" cssClass="submit" /> <input type="button" class="cancelar submit" value="cancelar" /></td>
						</tr>
					</table>
				</s:form>
			</fieldset>
		</div>
		</td>
	</tr>
</table>
<br /><br />
<table class="listagem">
	<tr>
		<th>Valor (R$)</th>
		<!--<th>Dt Lançamento</th>-->
		<th>Dt Pagamento</th>
		<th>Colaborador</th>
		<th>Forma</th>
		<th>Tipo</th>
		<th>Remover</th>
	</tr>
	<%
		List<String> classes = Arrays.asList("linhaEscura", "");
		int pointer = 0;
	%>
	<s:iterator value="contasReceber">
		<tr class="<%= classes.get(pointer % 2) %>">
			<td><s:property value="%{getText('{0,number,#,##0.00}',{caixa})}" /></td>
			<!-- <td><s:date name="dataLancamento" format="dd/MM/yyyy" /></td> -->
			<td><s:date name="dataPagamento" format="dd/MM/yyyy" /></td>
			<td><s:property value="professor.nome" /></td>
			<td>
				<s:property value="formaPagamento.valor" />
				<s:if test="formaPagamento.qtdParcelas > 1">
					[<s:property value="ordemParcelamento" />/<s:property value="%{getText('{0,number,#,##0}',{formaPagamento.qtdParcelas})}" />]
				</s:if>
			</td>
			<td><s:property value="tipo.nome" /></td>
			<td><a class="remover" href="removerContaReceberCadastro?cadastro.id=<s:property value="cadastro.id" />&contaReceber.id=<s:property value="id" />"><img src="img/delete.gif" /></a></td>
		</tr>
	<% pointer += 1; %>
	</s:iterator>
</table>
</s:if>




<s:if test="cadastro.avaliacao != null">
<table class="mor">
	<tr>
		<th>Ficha de Avaliação</th>
	</tr>
	<tr>
		<td class="linhaMedia"></td>
	</tr>
	<tr>
		<td>
			<s:form id="formEditarAvaliacao" action="editarAvaliacao" method="post">
				<s:hidden name="cadastro.id" />
				<s:hidden name="cadastro.modalidade.servico.id" />
				<s:hidden name="cadastro.avaliacao.id" />
				<table>
					<tr>
						<td>
							<jsp:include page="avaliacao.jsp" />	
						</td>
					</tr>
					<tr><td class="linhaMedia"></td></tr>
					<tr>
						<td align="right">
							<s:submit cssClass="submit" value="salvar avaliação" />
						</td>
					</tr>
				</table>
			</s:form>
		</td>
	</tr>
</table>
</s:if>
</div>
<s:include value="../geral/rodape.jsp" />
</body>
</html>