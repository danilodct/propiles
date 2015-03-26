<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="java.util.Arrays"%>
<%@page import="java.util.List"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title><s:text name="TITULO_SISTEMA" /></title>
<link rel="stylesheet" type="text/css" href="css/lib/jquery.ui.all.css" />
<link rel="stylesheet" type="text/css" href="css/lib/styles.css" />
<script type="text/javascript" src="js/lib/jquery.1.3.2.js"></script>
<script type="text/javascript" src="js/lib/jquery.mask.js"></script>
<script type="text/javascript" src="js/lib/jquery.datepicker.js"></script>
<script type="text/javascript" src="js/lib/scripts.js"></script>
<script type="text/javascript">
$(document).ready(function() {
	setPaginaPrincipal();
	setMaskNumerico();
	setMaskDate("form#formAddFrequencia");
	$(".hora").setMask("time");
	$("input.leitura").attr("readonly", "true");
	setMaskDate("form#formInserirCadastro");
	$("input.data").datepicker();
	$("form#formInserirCadastro").submit(function(){
		var validou = true;
		if($("select#tipo").val() == "-1" && $("input#novoTipoCadastro").val() == ""){
			validou = false;
		}
		if(!modalidadeLiberada){
			validou = false;
		}
		if(validou){
			if($("select#modalidade").val() == "TRATAMENTO_FACIAL"){
				$("div.avaliacao").each(function(){ if($(this).attr("id") != "avaliacaoTratamentoFacial") $(this).remove(); });
			}else if($("select#modalidade").val() == "DERMATOLOGIA"){
				$("div.avaliacao").each(function(){ if($(this).attr("id") != "avaliacaoDermatologia") $(this).remove(); });
			}else if($("select#modalidade").val() == "OPERATORIO_CIRURGIA"){
				$("div.avaliacao").each(function(){ if($(this).attr("id") != "avaliacaoOperatorioCirurgia") $(this).remove(); });
			}else if($("select#modalidade").val() == "TRATAMENTO_GESTANTE"){
				$("div.avaliacao").each(function(){ if($(this).attr("id") != "avaliacaoGestante") $(this).remove(); });
			}else if($("select#modalidade").val() == "POS_MASTECTOMIA"){
				$("div.avaliacao").each(function(){ if($(this).attr("id") != "avaliacaoPosMastectomia") $(this).remove(); });
			}else if($("select#modalidade").val() == "GL_FEG"){
				$("div.avaliacao").each(function(){ if($(this).attr("id") != "avaliacaoGorduraLocalizada") $(this).remove(); });
			}else if($("select#modalidade").val() == "TRATAMENTO_ESTRIAS"){
				$("div.avaliacao").each(function(){ if($(this).attr("id") != "avaliacaoEstrias") $(this).remove(); });
			}else if($("select#modalidade").val() == "MASSAGENS_RELAXANTES_TERAPEUTICAS"){
				$("div.avaliacao").each(function(){ if($(this).attr("id") != "avaliacaoMassagens") $(this).remove(); });
			}else if($("select#modalidade").val() == "DEPILACAO_LASER"){
				$("div.avaliacao").each(function(){ if($(this).attr("id") != "avaliacaoDepilacao") $(this).remove(); });
			}else if($("select#modalidade").val() == "DAY_SPA"){
				$("div.avaliacao").each(function(){ if($(this).attr("id") != "avaliacaoDaySpa") $(this).remove(); });
			}else if($("select#modalidade").val() == "HIDROGINASTICA"){
				$("div.avaliacao").each(function(){ if($(this).attr("id") != "avaliacaoHidroginastica") $(this).remove(); });
			}else if($("select#modalidade").val() == "DESIGN_CILIOS_SOBRANCELHAS"){
				$("div.avaliacao").each(function(){ if($(this).attr("id") != "avaliacaoDesignCilios") $(this).remove(); });
			}else if($("select#modalidade").val() == "MICROPIGMENTACAO"){
				$("div.avaliacao").each(function(){ if($(this).attr("id") != "avaliacaoMicropigmentacao") $(this).remove(); });
			}else if($("select#modalidade").val() == "NUTRICAO"){
				$("div.avaliacao").each(function(){ if($(this).attr("id") != "avaliacaoNutricao") $(this).remove(); });
			}else if($("select#modalidade").val() == "POWER_SHAPE"){
				$("div.avaliacao").each(function(){ if($(this).attr("id") != "avaliacaoPowerShape") $(this).remove(); });
			}else if($("select#modalidade").val() == "NATACAO_INFANTIL"){
				$("div.avaliacao").each(function(){ if($(this).attr("id") != "avaliacaoNatacaoInfantil") $(this).remove(); });
			}else if($("select#modalidade").val() == "LIMPEZA_PELE"){
				$("div.avaliacao").each(function(){ if($(this).attr("id") != "avaliacaoLimpezaPele") $(this).remove(); });
			}else if($("select#modalidade").val() == "PEELING"){
				$("div.avaliacao").each(function(){ if($(this).attr("id") != "avaliacaoPeeling") $(this).remove(); });
			}else if($("select#modalidade").val() == "CRIPOLISE"){
				$("div.avaliacao").each(function(){ if($(this).attr("id") != "avaliacaoCripolise") $(this).remove(); });
			}else if($("select#modalidade").val() == "PROJETO_100_DIAS"){
				$("div.avaliacao").each(function(){ if($(this).attr("id") != "avaliacaoProjeto100Dias") $(this).remove(); });
			}
			tirarVirgulaPontos("form#formInserirCadastro");
			corrigirData("form#formInserirCadastro");
		}
		return validou;
	});
	$("a.remover").click(function(evt){
		if(!$(this).hasClass("frequencia") ){
			if(!confirm("Tem certeza que deseja remover esta matrícula?")){
				evt.preventDefault();
			}
		}else{
			if(!confirm("Tem certeza que deseja remover este item?")){
				evt.preventDefault();
			}
		}
	});
	$("select#tipo").change(function(){
		if($(this).val() == "-1"){
			$("div#novoTipoCadastro").show();
		}else{
			$("div#novoTipoCadastro").hide();
		}
	});
	$("select#modalidade").change(function(){
		runAjax("getFuncionariosByModalidade", "servico.id="+$("select#modalidade").val(), "xml", procProfByModalidade);
		//runAjax("getLastAvaliacaoByModalidadeCliente", "servico.id="+$(this).val()+"&cliente.id="+$("input#clienteId").val(), "xml", procAvaliacaoByModalidadeCliente);
	});
	$("input.alterarProfessor").click(function(){
		$(this).parent().parent().find("form").show();
		$(this).hide();
		getProfessoresByModalidadeAtual($(this));
	});
	$("div.bt-add.frequencia a").click(function(evt){
		evt.preventDefault();
		$(this).parent().parent().find(".area-add-frequencia").show();
	});
});

$("div#msgAvaliacao").hide();
var temAvaliacao = false;
/*
- Implementacao antiga, qd ele via se tinha uma avaliacao ja cadastrada e reusava:

function procAvaliacaoByModalidadeCliente(xml){
	runAjax("getFuncionariosByModalidade", "servico.id="+$("select#modalidade").val(), "xml", procProfByModalidade);
	if($(xml).find("avaliacao").attr("status") == "true"){
		temAvaliacao = true;
		var id = $(xml).find("avaliacao").attr("id");
		$("input#avaliacaoID").val(id);
		$("div#msgAvaliacao").html("Será utilizada a última ficha de avaliação cadastrada. Caso queira alterá-la, poderá fazê-lo posteriormente.");
		$("div#msgAvaliacao").show();
	}else{
		$("div#msgAvaliacao").hide();
		temAvaliacao = false;
	}
}
*/
function getProfessoresByModalidadeAtual(input){
	runAjax("getFuncionariosByModalidade", "servico.id="+$(input).parent().find("input.modalidade").val(), "xml", procProfByModalidadeMudar);
}
function procProfByModalidadeMudar(xml){
	removeOptionsJquery(".professores");
	if($(xml).find("funcionario").length > 0){
		$(xml).find("funcionario").each(function(){
			var idProf = $(this).attr("id");
			var nomeProf = $(this).find("nome").text();
			option = $("<option value='"+idProf+"'>"+nomeProf+"</option>");
			$("select.professores").append(option);
		});
	}
}

var modalidadeLiberada = false;
function procProfByModalidade(xml){
	removeOptions("professores");
	$("div#divAvaliacoes div").hide();
	if($(xml).find("funcionario").length > 0){
		$("span#msgErro").hide();
		$(xml).find("funcionario").each(function(){
			var idProf = $(this).attr("id");
			var nomeProf = $(this).find("nome").text();
			option = $("<option value='"+idProf+"'>"+nomeProf+"</option>");
			$("select.professores").append(option);
		});
		$("div#divProfessores").show();
		modalidadeLiberada = true;
		
		/*
		if(!temAvaliacao){
			if($("select#modalidade").val() == "TRATAMENTO_FACIAL"){
				runAjax("avaliacaoTratamentoFacial", "", "html", procPutAvaliacao);
			}else if($("select#modalidade").val() == "DERMATOLOGIA"){
				runAjax("avaliacaoDermatologia", "", "html", procPutAvaliacao);
			}else if($("select#modalidade").val() == "OPERATORIO_CIRURGIA"){
				runAjax("avaliacaoCirurgiaPlastica", "", "html", procPutAvaliacao);
			}else if($("select#modalidade").val() == "TRATAMENTO_GESTANTE"){
				runAjax("avaliacaoGestante", "", "html", procPutAvaliacao);
			}else if($("select#modalidade").val() == "POS_MASTECTOMIA"){
				runAjax("avaliacaoPosMastectomia", "", "html", procPutAvaliacao);
			}else if($("select#modalidade").val() == "GL_FEG"){
				runAjax("avaliacaoGorduraLocalizada", "", "html", procPutAvaliacao);
			}else if($("select#modalidade").val() == "TRATAMENTO_ESTRIAS"){
				runAjax("avaliacaoEstrias", "", "html", procPutAvaliacao);
			}else if($("select#modalidade").val() == "MASSAGENS_RELAXANTES_TERAPEUTICAS"){
				runAjax("avaliacaoMassagem", "", "html", procPutAvaliacao);
			}else if($("select#modalidade").val() == "DEPILACAO_LASER"){
				runAjax("avaliacaoDepilacao", "", "html", procPutAvaliacao);
			}else if($("select#modalidade").val() == "DAY_SPA"){
				runAjax("avaliacaoDaySpa", "", "html", procPutAvaliacao);
			}else if($("select#modalidade").val() == "HIDROGINASTICA"){
				runAjax("avaliacaoHidroginastica", "", "html", procPutAvaliacao);
			}else if($("select#modalidade").val() == "DESIGN_CILIOS_SOBRANCELHAS"){
				runAjax("avaliacaoDesignCilios", "", "html", procPutAvaliacao);
			}else if($("select#modalidade").val() == "MICROPIGMENTACAO"){
				runAjax("avaliacaoMicropigmentacao", "", "html", procPutAvaliacao);
			}else if($("select#modalidade").val() == "NUTRICAO"){
				runAjax("avaliacaoNutricao", "", "html", procPutAvaliacao);
			}else if($("select#modalidade").val() == "POWER_SHAPE"){
				runAjax("avaliacaoPowerShape", "", "html", procPutAvaliacao);
			}else if($("select#modalidade").val() == "NATACAO_INFANTIL"){
				runAjax("avaliacaoNatacaoInfantil", "", "html", procPutAvaliacao);
			}else if($("select#modalidade").val() == "LIMPEZA_PELE"){
				runAjax("avaliacaoLimpezaPele", "", "html", procPutAvaliacao);
			}else if($("select#modalidade").val() == "PEELING"){
				runAjax("avaliacaoPeeling", "", "html", procPutAvaliacao);
			}else if($("select#modalidade").val() == "CRIPOLISE"){
				runAjax("avaliacaoCripolise", "", "html", procPutAvaliacao);
			}else if($("select#modalidade").val() == "PROJETO_100_DIAS"){
				runAjax("avaliacaoProjeto100Dias", "", "html", procPutAvaliacao);
			}
		}
		*/
		runAjax("avaliacao", "", "html", procPutAvaliacao);
		
	}else{
		$("span#msgErro").html("Não há nenhum professor para esta modalidade.");
		$("span#msgErro").show();
		$("div#divProfessores").hide();
		modalidadeLiberada = false;
	}
}
function procPutAvaliacao(txt){
	$("div#divAvaliacoes").html(txt);
	setMaskNumerico();
	setMaskDate("div#divAvaliacoes");
}
</script>
</head>
<body>
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
	<a href="clientes">Clientes</a> » <s:property value="cliente.nome" /> 
</div>
<table class="mor">
	<tr>
		<th>
			<s:if test="cadastros.size > 0">
				Cliente 
			</s:if><s:else>
				Cadastro
			</s:else>
			» <s:property value="cliente.nome" /></th>
	</tr>
	<tr>
		<td class="linhaMedia"></td>
	</tr>
	<tr>
		<td>
			<table class="formAdd">
				<tr><td class="linhaPequena"></td></tr>
				<tr>
					<td>
						<span id="erroAddCliente" class="error hidden"></span>
					</td>
				</tr>
				<tr>
					<td class="header">Dados Principais</td>
				</tr>
				<tr><td class="linhaPequena"></td></tr>
				<tr>
					<td><label>Nome:</label></td>
				</tr>
				<tr>
					<td><s:textfield id="nome" name="cliente.nome" cssClass="grande leitura" /></td>
				</tr>
				<tr>
					<td>
						<table>
							<tr>
								<td><label>Sexo:</label></td>
								<td>&nbsp;&nbsp;</td>
								<td><label>CPF:</label></td>
								<td>&nbsp;&nbsp;</td>
								<td><label>Data de Nascimento:</label></td>
								<td>&nbsp;&nbsp;</td>
								<td><label>E-Mail:</label></td>
							</tr>
							<tr>
								<td><s:textfield name="cliente.sexo.valor" cssClass="pequeno leitura" /></td>
								<td></td>
								<td><s:textfield id="cpf" cssClass="pequeno cpf leitura" name="cliente.cpf" /></td>
								<td></td>
								<td><input type="text" class="pequeno data leitura" name="cliente.dataNascimentoStr" value="<s:date name="cliente.dataNascimento" format="dd/MM/yyyy" />" /></td>
								<td></td>
								<td><s:textfield cssClass="pequeno leitura" name="cliente.email" /></td>
							</tr>
						</table>
					</td>
				</tr>
				<tr>
					<td>
						<table>
							<tr>
								<td><label>Estado Civil:</label></td>
								<td>&nbsp;&nbsp;</td>
								<td><label>Fone Fixo:</label></td>
								<td>&nbsp;&nbsp;</td>
								<td><label>Fone Celular:</label></td>
								<td>&nbsp;&nbsp;</td>
								<td><label>Profissão:</label></td>
							</tr>
							<tr>
								<td><s:textfield cssClass="pequeno leitura" name="cliente.estadoCivil.valor" /></td>
								<td></td>
								<td><s:textfield cssClass="pequeno fone leitura" name="cliente.foneFixo" /></td>
								<td></td>
								<td><s:textfield cssClass="pequeno fone leitura" name="cliente.foneCelular" /></td>
								<td></td>
								<td><s:textfield cssClass="pequeno leitura" name="cliente.profissao" /></td>
							</tr>
						</table>
					</td>
				</tr>
				<tr><td class="linhaMedia"></td></tr>
				<tr>
					<td class="header">Endereço</td>
				</tr>
				<tr><td class="linhaPequena"></td></tr>
				<tr>
					<td>
						<table>
							<tr>
								<td><label>CEP:</label></td>
								<td>&nbsp;&nbsp;</td>
								<td><label>Número:</label></td>
								<td>&nbsp;&nbsp;</td>
								<td><label>Complemento:</label></td>
							</tr>
							<tr>
								<td><s:textfield id="cep" cssClass="pequeno cep leitura" name="cliente.endereco.cep" /></td>
								<td></td>
								<td><s:textfield cssClass="pequeno leitura" name="cliente.endereco.numero" /></td>
								<td></td>
								<td><s:textfield cssClass="medio leitura" name="cliente.endereco.complemento" /></td>
							</tr>
						</table>
					</td>
				</tr>
				<tr>
					<td><label>Logradouro:</label></td>
				</tr>
				<tr>
					<td><s:textfield name="cliente.endereco.logradouro" id="logradouro" cssClass="grande leitura" /></td>
				</tr>
				<tr>
					<td>
						<table>
							<tr>
								<td><label>Bairro:</label></td>
								<td>&nbsp;&nbsp;</td>
								<td><label>Cidade:</label></td>
								<td>&nbsp;&nbsp;</td>
								<td><label>UF:</label></td>
							</tr>
							<tr>
								<td><s:textfield cssClass="pequeno leitura" id="bairro" name="cliente.endereco.bairro" /></td>
								<td></td>
								<td><s:textfield cssClass="pequeno leitura" id="cidade" name="cliente.endereco.cidade" /></td>
								<td></td>
								<td><s:textfield cssClass="sigla leitura" id="uf" maxlength="2" name="cliente.endereco.uf" /></td>
							</tr>
						</table>
					</td>
				</tr>
						
						
				<tr><td class="linhaMedia"></td></tr>
				<tr>
					<td class="header">Informações adicionais</td>
				</tr>
				<tr><td class="linhaPequena"></td></tr>
				<tr>
					<td><label>Como conheceu o Studio:</label></td>
				</tr>
				<tr>
					<td>
						<s:textfield name="cliente.conhecimentoStudio" cssClass="medio leitura" />
					</td>
				</tr>
				<tr>
					<td><label>Data de cadastro no sistema:</label></td>
				</tr>
				<tr>
					<td>
						<s:date name="cliente.dataCadastro" format="dd/MM/yyyy" />
					</td>
				</tr>
				
				
				<tr><td class="linhaMedia"></td></tr>
				<tr>
					<td><form action="editarClienteRedirect"><s:hidden name="cliente.id" /><s:submit value="Editar dados" cssClass="submit" /></form></td>
				</tr>
			</table>
		</td>
	</tr>
</table>
<table class="mor">
	<tr>
		<th>Atividades</th>
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
		<br /><br />
		<div class="formAdd hidden">
			<fieldset>
				<legend>Cadastrar Atividade do Cliente</legend> 
				<s:form id="formInserirCadastro" action="inserirCadastro" method="post" enctype="multipart/form-data">
					<input type="hidden" name="cadastro.cliente.id" value="<s:property value="cliente.id" />" />
					<input type="hidden" id="clienteId" name="cliente.id" value="<s:property value="cliente.id" />" />
					<input type="hidden" id="avaliacaoID" name="avaliacaoID" />
					<table class="formAdd">
						<tr><td class="linhaPequena"></td></tr>
						<tr>
							<td class="header">Dados da Atividade</td>
						</tr>
						<tr><td class="linhaPequena"></td></tr>
						<tr>
							<td>
								<table>
									<tr>
										<td><label>Data de Início:</label></td>
									</tr>
									<tr>
										<td><s:textfield cssClass="pequeno data" name="cadastro.dataCriacaoStr"  /></td>
									</tr>
									<tr>
										<td><label>Serviço:</label></td>
									</tr>
									<tr>
										<td><s:select id="modalidade" name="cadastro.modalidade.servico.id" headerValue="ESCOLHA" headerKey="-1" cssClass="medio" list="modalidades" listKey="id" listValue="nome" /></td>
									</tr>
								</table>
								<div id="divProfessores" class="hidden">
								<table>
									<tr>
										<td><label>Professor:</label></td>
									</tr>
									<tr>
										<td>
											<select class="professores medio" id="professores" name="cadastro.modalidade.professor.id" >
												<option value="-1">ESCOLHER</option>
											</select>
										</td>
									</tr>
								</table>
								<br /><br />
								<!-- 
									<div id="msgAvaliacao" class="message"></div>
								 -->
								</div>
							</td>
						</tr>
						<tr><td class="linhaMedia"></td></tr>
						<tr>
							<td>
								<div id="divAvaliacoes">
								</div>
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
		<th>Modalidade</th>
		<th>Professor</th>
		<th>Início</th>
		<th>Remover</th>
	</tr>
	<%
		List<String> classes = Arrays.asList("linhaEscura", "");
		int pointer = 0;
	%>
	<s:iterator value="cadastros">
		<tr class="<%= classes.get(pointer % 2) %>">
			<td><a href="cadastro?cadastro.id=<s:property value="id" />"><s:property value="modalidade.servico.nome" /></a></td>
			<td>
				<table>
					<tr>
						<td>
							<a href="cadastro?cadastro.id=<s:property value="id" />"><s:property value="modalidade.professor.nome" /></a>
							<s:form cssClass="hidden mudarProfessor" action="mudarProfessor">
								<input type="hidden" name="cliente.id" value="<s:property value="cliente.id" />" />
								<input type="hidden" name="cadastro.modalidade.servico.id" value="<s:property value="modalidade.servico.id" />" />
								<input type="hidden" name="cadastro.id" value="<s:property value="id" />" />
								<select class="professores medio" name="cadastro.modalidade.professor.id" >
								</select>
								<s:submit value="salvar" cssClass="submit" />
							</s:form>
						</td>
						<td>
							<s:hidden name="modalidade.servico.id" cssClass="modalidade" />
							<input type="button" value="mudar" class="submit alterarProfessor" />
						</td>
					</tr>
				</table>
			</td>
			<td><a href="cadastro?cadastro.id=<s:property value="id" />"><s:date name="dataCriacao" format="dd/MM/yyyy" /></a></td>
			<td><a class="remover" href="removerCadastro?cliente.id=<s:property value="cliente.id" />&cadastro.id=<s:property value="id" />"><img src="img/delete.gif" /></a></td>
		</tr>
	<% pointer += 1; %>
	</s:iterator>
</table>
</div>




<s:if test="#session.pilates_user.tipoStr != 'PROFESSOR'">
<!-- HISTORICO FINANCEIRO TOTAL -->
<div class="centralizador">
	<div class="titulo">Histórico Financeiro Geral</div>
<table class="listagem">
	<tr>
		<th>Modalidade</th>
		<th>Valor (R$)</th>
		<th>Data de Pagamento</th>
		<th>Colaborador</th>
		<th>Forma</th>
		<th>Tipo</th>
	</tr>
	<%
		classes = Arrays.asList("linhaEscura", "");
		pointer = 0;
	%>
	<s:iterator value="contasReceber">
		<tr class="<%= classes.get(pointer % 2) %>">
			<td><s:property value="cadastro.modalidade.servico.nome" /></td>
			<td><s:property value="%{getText('{0,number,#,##0.00}',{valor})}" /></td>
			<td><s:date name="dataPagamento" format="dd/MM/yyyy" /></td>
			<td><s:property value="professor.nome" /></td>
			<td><s:property value="formaPagamento.valor" /></td>
			<td><s:property value="tipo.nome" /></td>
		</tr>
	<% pointer += 1; %>
	</s:iterator>
</table>
	
</div>
</s:if>





<s:if test="#session.pilates_user.tipoStr == 'ADMINISTRADOR' || #session.pilates_user.tipoStr == 'RECEPCIONISTA' ">
<!-- FREQUENCIAS -->
<div class="centralizador">
	<div class="titulo">Frequência</div>
	<div class="bt-add frequencia"><a href="#"></a></div>
	<div class="area-add-frequencia hidden">
		<fieldset>
			<legend>Cadastro de frequência</legend>
			<s:form action="addFrequencia" id="formAddFrequencia">
				<input type="hidden" name="frequencia.cliente.id" value="<s:property value="cliente.id" />" />
				<input type="hidden" name="cliente.id" value="<s:property value="cliente.id" />" />
				
				<label class="pequeno left">Data</label>
				<label class="pequeno left">Hora</label>
				<label class="medio final left">Modalidade</label>
				<s:textfield name="frequencia.dataStr" cssClass="data pequeno left" />
				<s:textfield name="frequencia.horario" cssClass="hora pequeno left" />
				<s:select name="frequencia.servico.id" cssClass="medio final left" list="modalidades" listKey="id" listValue="nome" />
				
				<label class="grande left">Colaborador</label>
				<s:select list="colaboradores" cssClass="grande left" name="frequencia.profissional.id" listKey="id" listValue="nome" />
				
				<p class="botoes">
					<s:submit value="salvar" cssClass="submit" />
				</p>
			</s:form>
		</fieldset>
	</div>
	
<table class="listagem">
	<tr>
		<th>#</th>
		<th>Data</th>
		<th>Modalidade</th>
		<th>Colaborador</th>
		<th>Remover</th>
	</tr>
	<s:if test="frequencias.size > 0">
	<%
		classes = Arrays.asList("linhaEscura", "");
		pointer = 0;
	%>
	<s:iterator value="frequencias">
		<tr class="<%= classes.get(pointer % 2) %>">
			<td><s:property value="ordem" /></td>
			<td><s:date name="data" format="dd/MM/yyyy" /></td>
			<td><s:property value="servico.nome" /></td>
			<td><s:property value="profissional.nome" /></td>
			<td><a class="remover frequencia" href="removerFrequencia?frequencia.id=<s:property value="id" />&cliente.id=<s:property value="cliente.id" />"><img src="img/delete.gif" /></a></td>
		</tr>
	<% pointer += 1; %>
	</s:iterator>
	</s:if><s:else>
		<tr>
			<td>
				Nenhum registro encontrado
			</td>
		</tr>
	</s:else>
</table>
	
</div>
</s:if>


<s:include value="../geral/rodape.jsp" />
</body>
</html>