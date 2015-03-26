<%@page import="com.opensymphony.xwork2.ActionContext"%>
<%@page import="com.opensymphony.xwork2.util.ValueStack"%>
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
<link rel="stylesheet" type="text/css" href="v2.0/css/lib/fullcalendar.css" />
<link rel="stylesheet" type="text/css" href="v2.0/css/lib/fullcalendar.print.css" media="print" />
<style type="text/css">
 @media print{
 	.ui.menu .item, .ui.dividing.header, .title, .add.icon, .print.icon, tr.linhaFicha.hide, form, tr, h4, .ui.buttons{display:none;}
 	.ui.menu .item.image, form.printable{display:block !important;}
 	tr.linhaFicha{display:table-row;}
 	.ui.menu, .ui.styled.accordion{box-shadow:none;}
 }
</style>
<script type="text/javascript" src="v2.0/js/lib/moment.js" ></script>
<script type="text/javascript" src="v2.0/js/lib/jquery.semantic.js" ></script>
<script type="text/javascript" src="v2.0/js/lib/jquery.ui.mask.js" ></script>
<script type="text/javascript" src="v2.0/js/lib/fullcalendar.js" ></script>
<script type="text/javascript" src="v2.0/js/lib/scripts.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		setSubMenuAtivo("#menuCadastros");
		setMaskDate(".data");
		setMaskHora(".hora");
		setMaskFone(".fone");
		setMaskNumerico(".decimal");
		setMaskInteiro(".inteiro");
		setMaskCEP(".cep");
		setMaskCPF(".cpf");
		setCEP(".cep");
		setBtEditar(".editar");
		setBtCancelarEditar(".cancelar", "form#formEditarCadastro");
		setBtCancelarAdd(".cancelarAdd", "form#formEditarCadastro");
		setBtCancelarFicha();
		setBtOutroRadio();
		setBtPrint();
		setBtAdd();
		setBtRemover();
		setSelectServicos();
		setSelectAtividades();
		setSelectAtividadesPagamentos();
		setBtVerFichaAvaliacao();
		setFiltroServicosFrequencias();
		setFiltroServicosContasRecebidas();
		setBtAddAgendamento();
		setQtdSessoes();
		setAgenda();
	});
	function setQtdSessoes(){
		$("input#qtdSessoes").change(function(){
			var idAtividade = $("select#atividadesPagamentos").val();
			var duracaoSessoes = $("select#atividadesAgendamentoSuporte option[value='"+idAtividade+"']").html();
			gerarLinhasAgendamento($(this).val(), duracaoSessoes);
		});
	}
	function setSelectAtividadesPagamentos(){
		$("select#atividadesPagamentos").change(function(){
			var idAtividade = $(this).val();
			var qtdSessoes = $("select#atividadesPagamentosSuporte option[value='"+idAtividade+"']").html();
			var duracaoSessao = $("select#atividadesAgendamentoSuporte option[value='"+idAtividade+"']").html();
			$("input#qtdSessoes").val(qtdSessoes);
			if(qtdSessoes == 0){
				$("div#areaQtdSessoes").hide();
			}else{
				$("div#areaQtdSessoes").show();
				gerarLinhasAgendamento(qtdSessoes, duracaoSessao);
			}
		});
		var idAtividade = $("select#atividadesPagamentos").val();
		var qtdSessoes = $("select#atividadesPagamentosSuporte option[value='"+idAtividade+"']").html();
		var duracaoSessoes = $("select#atividadesAgendamentoSuporte option[value='"+idAtividade+"']").html();
		$("input#qtdSessoes").val(qtdSessoes);
		if(qtdSessoes == 0){
			$("div#areaQtdSessoes").hide();
		}else{
			$("div#areaQtdSessoes").show();
			gerarLinhasAgendamento(qtdSessoes, duracaoSessoes);
		}
	}
	function gerarLinhasAgendamento(qtd, duracao){
		$("div#areaAgendarConteudo").html("");
		for(var i = 0; i < qtd; i += 1){
			gerarLinhaAgendamento(i, duracao);
		}
		$("input#qtdAgendamentos").val(qtd);
	}
	function gerarLinhaAgendamento(i, duracao){
		$("div#areaAgendarConteudo").append($("<div class='three fields'><div class='field'><label>Dia:</label><input type='text' class='data' name='agendamento"+(i+1)+".dataStr' /></div><div class='field'><label>Horário:</label><input type='text' class='hora' name='agendamento"+(i+1)+".horario' /></div><div class='field'><label>Duração (minutos):</label><input type='text' class='inteiro' name='agendamento"+(i+1)+".duracao' value='"+duracao+"' /></div></div>"));
		setMaskDate("div#areaAgendarConteudo .three.fields:last .data");
		setMaskHora("div#areaAgendarConteudo .three.fields:last .hora");
		setMaskInteiro("div#areaAgendarConteudo .three.fields:last .inteiro");
	}
	function setBtAddAgendamento(){
		$("input.btAdicionarAgendamento").click(function(evt){
			evt.preventDefault();
			var idAtividade = $("select#atividadesPagamentos").val();
			var duracaoSessoes = $("select#atividadesAgendamentoSuporte option[value='"+idAtividade+"']").html();
			var qtd = $("div#areaAgendarConteudo").find(".three.fields").length;
			gerarLinhaAgendamento(qtd, duracaoSessoes);
			$("input#qtdAgendamentos").val(qtd + 1);
		});
	}
	function setBtCancelarFicha(){
		$("input.cancelarFicha").click(function(evt){
			evt.preventDefault();
			var linhaFicha = $(this).parent().parent().parent().parent();
			$(linhaFicha).hide();
		});
	}
	function setFiltroServicosContasRecebidas(){
		$("select#servicosContasReceber").change(function(){
			var valorPago = 0;
			if($(this).val() == -1){
				$("tr.linhaConta").show();
				$("tr.linhaConta").each(function(){
					valorPago += parseFloat($(this).find("td.valorConta").html());
				});
			}else{
				$("tr.linhaConta").hide();
				$("tr.linhaConta"+$(this).val()).show();
				$("tr.linhaConta"+$(this).val()).each(function(){
					valorPago += parseFloat($(this).find("td.valorConta").html());
				});
			}
			$("span#pagoContas").html(setNumberFormat(valorPago));
		});
	}
	function setFiltroServicosFrequencias(){
		$("select#servicosFrequencias").change(function(){
			if($(this).val() == -1){
				$("tr.linhaFreq").show();
			}else{
				$("tr.linhaFreq").hide();
				$("tr.linhaFreq"+$(this).val()).show();
			}
		});
	}
	function setBtVerFichaAvaliacao(){
		$("input.btFicha").click(function(evt){
			evt.preventDefault();
			var linhaBt = $(this).parent().parent();
			var linhaFicha = $(linhaBt).next("tr.linhaFicha");
			if($(linhaFicha).css("display") == "none")
				$(linhaFicha).show();
			else
				$(linhaFicha).hide();
		});
	}
	function setSelectAtividades(){
		$("select#atividadesFrequencia").change(function(){
			if($(this).val() != -1){
				$("input#duracaoSessao").val($("select#atividadesFrequenciasSuporte option[value='"+$(this).val()+"']").html());
				runAjax("getPagamentosCheiosByAtividade", "atividade.id="+$(this).val(), "xml", procGetPagamentosCheiosByAtividade);
			}else{
				$("div#areaPagamentos").hide();
				$("div#areaPagamentos .menu").remove();
				$("div#areaPagamentos select").dropdown("destroy");
				removeOptions("div#areaPagamentos select");
			}
		});
	}
	function procGetPagamentosCheiosByAtividade(xml){
		$("div#areaPagamentos .menu").remove();
		$("div#areaPagamentos select").dropdown("destroy");
		removeOptions("div#areaPagamentos select");
		if($(xml).find("pagamento").length > 0){
			$("div#areaPagamentos").show();
			$(xml).find("pagamento").each(function(){
				var idPag = $(this).attr("id");
				var data = $(this).attr("data");
				var sessoes = $(this).attr("qtdSessoes");
				var valor = $(this).attr("valor");
				var sessaoStr = "sessões";
				if(sessoes == 1)
					sessaoStr = "sessão";
				var txtQtdSessoes = "";
				if(sessoes > 0)
					txtQtdSessoes = " ["+sessoes+" "+sessaoStr+"]";
				option = $("<option value='"+idPag+"'>"+data+" - R$ "+valor+ txtQtdSessoes +"</option>");
				$("div#areaPagamentos select").append(option);
			});
			var optionNenhum = $("<option value='-1'>NENHUM</option>");
			$("div#areaPagamentos select").append(optionNenhum);
			$("div#areaPagamentos select").dropdown("destroy");
			$("div#areaPagamentos select").dropdown();
		}else{
			$("div#areaPagamentos").hide();
		}
	}
	function setSelectServicos(){
		$("select#servicos").change(function(){
			runAjax("getContratosByServico", "servico.id="+$(this).val(), "xml", procGetContratosByServico);
		});
	}
	function procGetContratosByServico(xml){
		if($(xml).find("contrato").length > 0){
			$("div#divColaboradores").show();
			$("div#divColaboradores .menu").remove();
			$("div#areaErroColaborador").hide();
			removeOptions("div#divColaboradores select");
			$(xml).find("contrato").each(function(){
				var idCont = $(this).attr("id");
				var nomeCola = $(this).find("colaborador").text();
				option = $("<option value='"+idCont+"'>"+nomeCola+"</option>");
				$("div#divColaboradores select").append(option);
			});
			$("div#divColaboradores select").dropdown("destroy");
			$("div#divColaboradores select").dropdown();
		}else{
			$("div#divColaboradores").hide();
			$("div#areaErroColaborador").show();
		}
	}
	function setBtOutroRadio(){
		$("input.radioFormaConhecimento").change(function(){
			if($(this).val() == "Outro")
				$("input#outraFormaConhecimento").show();
			else{
				$("input#outraFormaConhecimento").val("");
				$("input#outraFormaConhecimento").hide();
			}
		});
	}
	function setAgenda(){
		$("a[data-tab='agendamentos']").click(function(){
			if($("div.fc-view-container .fc-view").html() == "")
				$(".fc-today-button").click();
		});
		if($("input#agendamentos").val() != ""){
			var valor = $("input#agendamentos").val();
			var agendamentos = JSON.parse(valor);
			createAgenda("div#areaAgenda", agendamentos, function(calEvent, jsEvent, view) {
			        $("input#agId").val(calEvent.id);
			        $("input#agTitulo").val(calEvent.title);
			        $("textarea#agNota").val(calEvent.nota);
			        $("input#agDataInicio").val(calEvent.start.format("DD/MM/YYYY"));
			        $("input#agHorario").val(calEvent.horario);
			        $("input#agDuracao").val(calEvent.duracao);
			        $("a#btRemoverAgendamento").attr("href", $("a#btRemoverAgendamento").attr("href")+calEvent.id);
			        showModal(".modal");
			    },
				function(event, delta, revertFunc){
			    	if(!confirm("Tem certeza que deseja alterar a data deste agendamento?")){
			    		revertFunc();
			    	}else{
			    		var novaData = event.start;
			    		var novaHora = novaData.format("HH:MM");
			    		novaData = novaData.format("DD/MM/YYYY");
			    		runAjax("alterarDataAgendamento", "aba=agendamentos&agendamento.id="+event.id+"&cadastro.id="+$("input#cadastroId").val()+"&agendamento.dataInicioStr="+novaData+"&agendamento.horario="+novaHora, "text", doNothing);
			    	}
			    }
			);
		}
	}
</script>
</head>
<body>
<s:hidden name="agendamentos" id="agendamentos" />
	<s:include value="../geral/cabecalho.jsp" />

	<!-- TITULO DA PÁGINA 88888888888888888888888888888888888888888888888888888888888888888888888 -->
	
	<div class="fifteen wide column">
		<div class="ui dividing  header">
			<i class="user teal circular inverted icon"></i>
			<div class="content">
				Cadastro
				<div class="sub header">Veja as informações do seu cliente, assim como suas atividades na clínica</div>
			</div>
		</div>
		<div class="ui hidden divider"></div>
	
	<!-- NOME DO CLIENTE 88888888888888888888888888888888888888888888888888888888888888888888888 -->
		
	<div class="ui header">
		<a href="cadastro?cadastro.id=<s:property value="cadastro.id" />"><s:property value="cadastro.nome" /></a>
	</div>
	
	<div class="ui styled fluid accordion">
	
		<!-- AREA DAS ABAS 88888888888888888888888888888888888888888888888888888888888888888888888 -->
		<div class="ui top attached tabular menu">
			<a class="item <s:if test="aba == null || aba == 'infoCadastro'" >active</s:if>" data-tab="infoCadastro">Informações de cadastro</a>
			<a class="item <s:if test="aba != null && aba == 'atividades'" >active</s:if>" data-tab="atividades">Atividades na clínica</a>
			<a class="item <s:if test="aba != null && aba == 'contasReceber'" >active</s:if>" data-tab="pagamentos">Pagamentos</a>
			<a class="item <s:if test="aba != null && aba == 'frequencias'" >active</s:if>" data-tab="frequencias">Frequências</a>
			<a class="item <s:if test="aba != null && aba == 'agendamentos'" >active</s:if>" data-tab="agendamentos">Agendamentos</a>
		</div>
		
		
		<!--CONTEUDO ABA 1 88888888888888888888888888888888888888888888888888888888888888888888888 -->
		<div class="ui bottom attached tab segment  <s:if test="aba == null || aba == 'infoCadastro'" >active</s:if>" data-tab="infoCadastro">
			<div class="ui form">
			
				<!-- FORM EDITAR CADASTRO 88888888888888888888888888888888888888888888888888888888888888888888888 -->
				<s:form id="formEditarCadastro" action="editarCadastro" method="post">
					<s:hidden name="cadastro.id" />
					<h4 class="ui dividing teal header">Dados Principais</h4>
						<div class="required field">
							<label>Nome:</label>
							<div class="ui transparent input">
								<s:textfield id="nome" name="cadastro.nome" />
							</div>
						</div>
						<div class="four fields">
							<div class="field">
								<label>Sexo:</label>
								<s:select name="cadastro.sexoStr" cssClass="ui disabled dropdown" list="allSexos" listKey="value" listValue="valor" />
							</div>
							<div class="field">
								<label>CPF:</label>
								<div class="ui transparent input">
									<s:textfield cssClass="cpf" name="cadastro.cpf" />
								</div>
							</div>
							<div class="field">
								<label>Data de Nascimento:</label>
								<div class="ui icon transparent input">
									<s:textfield cssClass="data" name="cadastro.dataNascimentoStr" />
									<i class="calendar icon"></i>
								</div>
							</div>
							<div class="field">
								<label>E-Mail:</label>
								<div class="ui transparent input">
									<s:textfield name="cadastro.email" />
								</div>
							</div>
						</div>
						<div class="four fields">
							<div class="field">
								<label>Estado Civil:</label>
								<s:select name="cadastro.estadoCivilStr" cssClass="ui disabled dropdown" list="allEstadosCivil" listKey="value" listValue="valor" />
							</div>
							<div class="field">
								<label>Fone Fixo:</label>
								<div class="ui transparent icon input">
									<s:textfield cssClass="fone" name="cadastro.foneFixo" />
									<i class="call icon"></i>
								</div>
							</div>
							<div class="field">
								<label>Fone Celular:</label>
								<div class="ui transparent icon input">
									<s:textfield cssClass="fone" name="cadastro.foneCelular" />
									<i class="call icon"></i>
								</div>
							</div>
							<div class="field">
								<label>Profissão:</label>
								<div class="ui transparent input">
									<s:textfield name="cadastro.profissao" />
								</div>
							</div>
						</div>
						
						<h4 class="ui dividing teal header">Endereço</h4>
						<div class="three fields">
							<div class="field">
								<label>CEP:</label>
								<div class="ui transparent input">
									<s:textfield id="cep" cssClass="cep" name="cadastro.endereco.cep" />
								</div>
							</div>
							<div class="field">
								<label>Número:</label>
								<div class="ui transparent input">
									<s:textfield name="cadastro.endereco.numero" />
								</div>
							</div>
							<div class="field">
								<label>Complemento:</label>
								<div class="ui transparent input">
									<s:textfield name="cadastro.endereco.complemento" />
								</div>
							</div>
						</div>
						<div class="field">
							<label>Logradouro:</label>
							<div class="ui transparent input">
								<s:textfield name="cadastro.endereco.logradouro" id="logradouro" />
							</div>
						</div>
						<div class="three fields">
							<div class="field">
								<label>Bairro:</label>
								<div class="ui transparent input">
									<s:textfield id="bairro" name="cadastro.endereco.bairro" />
								</div>
							</div>
							<div class="field">
								<label>Cidade:</label>
								<div class="ui transparent input">
									<s:textfield id="cidade" name="cadastro.endereco.cidade" />
								</div>
							</div>
							<div class="field">
								<div class="five fields">
									<div class="field">
										<label>UF:</label>	
										<div class="ui transparent input">
											<s:textfield id="uf" maxlength="2" name="cadastro.endereco.uf" />
										</div>
									</div>
								</div>
							</div>
						</div>
					
						<h4 class="ui dividing teal header">Informações adicionais</h4>
 						<div class="grouped fields">
 							<s:iterator value="allFormasConhecimento" >
 								<div class="field">
							      <div class="ui radio read-only checkbox">
							        <input type="radio" value="<s:property value="nome" />" name="cadastro.conhecimentoStudio" class="radioFormaConhecimento" 
							        	<s:if test="cadastro.conhecimentoStudio == nome" >
							        		checked="checked"
							        	</s:if>
							         />
							        <label><s:property value="nome" /></label>
							      </div>
							    </div>
 							</s:iterator>
						</div>
						<div class="four fields">
							<div class="field">
								<div class="ui transparent input">
									<input type="text" name="outraFormaConhecimento" class="hide" value="" id="outraFormaConhecimento" />
								</div>
							</div>
						</div>

						<div class="ui hidden divider" ></div>
					
					
					<div class="actions">
						<div class="ui right floated labeled icon teal button editar">
							Editar
							<i class="edit right icon"></i>
						</div>				
					</div>
					
					<div class="ui buttons hide right floated">
						<input type="button" class="ui cancelar button" value="Cancelar" />
	  					<div class="or" data-text="ou"></div>
						<s:submit value="Salvar alterações" cssClass="ui teal submit  button" /> 
					</div>	
					
				</s:form>
			</div>
			<div class="ui divider hidden"></div>
			<div class="ui divider hidden"></div>

		</div>
		
		
		<!-- CONTEUDO ABA 2 88888888888888888888888888888888888888888888888888888888888888888888888 -->
		<div class="ui bottom attached tab segment <s:if test="aba != null && aba == 'atividades'" >active</s:if>" data-tab="atividades" >
	
			<div class="ui hidden divider"></div>
	
			<!-- BT ADD ATIVIDADE 88888888888888888888888888888888888888888888888888888888888888888888888 -->
			<div class="column">
				<a href="#" class="btAdd" title="Inserir novo" >
					<i class="add circle big teal icon"></i>
				</a>
			</div>
			
			<div class="ui hidden divider"></div>
			
			<!-- FORM ADD ATIVIDADE 88888888888888888888888888888888888888888888888888888888888888888888888 -->
			<div class="ui areaAdd hide centered grid" >
				<div class="twelve wide column"> 
					
					<!-- MSG ERRO SE NAO TIVER COLABORADOR 88888888888888888888888888888888888888888888888888888888888888888888888 -->
					<div class="hide content" id="areaErroColaborador">
						<div class="ui error message">
							<i class="close icon"></i>
							<div class="header">Nenhum colaborador atende este serviço!</div>
							<ul class="list">
								<li>Associe ao menos um colaborador a este serviço na área de Colaboradores</li>
							</ul>
						</div>
						<div class="ui hidden divider"></div>
					</div>
				
					<div class="ui form segment">
						<div class="ui block teal header">
							<i class="add teal icon"></i>
							<div class="content">Inserir nova atividade/serviço para este cliente</div>
						</div>
						<s:form id="formInserirAtividade" action="cadastrarAtividade" method="post">
							<input type="hidden" name="atividade.cadastro.id" value="<s:property value="cadastro.id" />" />
							<s:hidden name="cadastro.id" />
							<input type="hidden" name="aba" value="atividades" />
							<h4 class="ui dividing teal header">Dados da Atividade</h4>
							<div class="two fields">
								<div class="required field">
									<label>Data de Início:</label>
									<div class="ui icon input">
										<s:textfield cssClass="data" name="atividade.dataCriacaoStr" />
										<i class="calendar icon"></i>
									</div>
								</div>
								<div class="required field">
									<label>Serviço:</label>
									<s:select id="servicos" headerValue="ESCOLHA" headerKey="-1" cssClass="ui dropdown" list="allServicos" listKey="id" listValue="nome" />
								</div>
							</div>

							<div id="divColaboradores" class="hide field">
								<label>Colaborador responsável:</label>
								<select class="ui dropdown" name="atividade.contrato.id" >
									<option value="-1">ESCOLHER</option>
								</select>
							</div>
							
							<div id="divAvaliacoes">
							</div>
							
							<div class="ui buttons right floated">
								<input type="button" class="ui cancelarAdd button" value="Cancelar" />
			  					<div class="or" data-text="ou"></div>
								<s:submit value="Cadastrar" cssClass="ui teal submit  button" /> 
							</div>	
						</s:form>
						<div class="ui divider hidden"></div>
					</div>
				</div>
				<div class="ui divider hidden"></div>
				<div class="ui divider hidden"></div>
			</div>
			
			<!-- TABELA COM AS ATIVIDADES 88888888888888888888888888888888888888888888888888888888888888888888888 -->
			<table class="ui celled striped teal table">
				<thead>
					<tr>
						<th>#</th>
						<th>Serviço</th>
						<th>Colaborador</th>
						<th>Ficha de avaliação</th>
						<th>#</th>
					</tr>
				</thead>
				<tbody>
					<s:if test="atividades.size > 0">
						<% int i = 0; %>
						<s:iterator value="atividades">
							<tr>
								<td class="colapse"><% i += 1; %><%=i %></td>
								<td><s:property value="contrato.servico.nome" /></td>
								<td><s:property value="contrato.colaborador.nome" /></td>
								<td><input type="button" value="FICHA DE AVALIAÇÃO" class="ui teal mini button btFicha" /></td>
								<td class="colapse"><a class="remover" href="removerAtividade?aba=atividades&cadastro.id=<s:property value="cadastro.id" />&atividade.id=<s:property value="id" />"><i class="remove circle red icon"></i></a></td>
							</tr>
							<tr class="linhaFicha <s:if test="avaliacaoId == null || avaliacaoId != avaliacao.id" >hide</s:if>">
								<td colspan="5" >
									<s:form action="editarAvaliacao" cssClass="ui form printable" method="post">
										<s:hidden name="cadastro.id" />
										<s:hidden name="avaliacao.id" />
										<input type="hidden" name="aba" value="atividades" />
										<input type="hidden" name="avaliacaoId" value="<s:property value="avaliacao.id" />" />
										
										<h2 class="ui block teal header">
											<a href="#" title="Imprimir ficha de avaliação" class="btPrint ui buttons right floated">
												<i class="print black mini icon"></i>
											</a>
											<i class="text file teal icon"></i>
											<div class="content">Ficha de Avaliação</div>
										</h2>
										<h4 class="ui dividing teal header">ANAMNESE</h4>
											<div class="field">
												<label>Motivo da consulta / Queixa principal:</label>
												<s:textarea name="avaliacao.objetivo"></s:textarea>
											</div>
											<div class="three fields">
												<div class="field">
													<label>Peso (Kg):</label>
													<s:textfield name="avaliacao.pesoStr" cssClass="decimal"  />
												</div>
												<div class="field">
													<label>Altura (m):</label>
													<s:textfield name="avaliacao.alturaStr" cssClass="decimal" />
												</div>
												<div class="field">
													<label>PA:</label>
													<s:textfield name="avaliacao.pa"  />
												</div>
											</div>
							     			<div class="grouped inline fields">
												<div class="field">
      												<div class="ui  checkbox">
														<label>Atividade física</label>
														<input type="checkbox" name="avaliacao.atividadeFisicaStr" <s:if test="avaliacao.atividadeFisica">checked="checked"</s:if> />
													</div>
												</div>
												<div class="field">
      												<div class="ui  checkbox">
														<label>Dorme bem</label>
														<input type="checkbox" name="avaliacao.dormeBemStr" <s:if test="avaliacao.dormeBem">checked="checked"</s:if>  />
													</div>
												</div>
												<div class="field">
      												<div class="ui  checkbox">
														<label>Fuma</label>
														<input type="checkbox" name="avaliacao.tabagismoStr" <s:if test="avaliacao.tabagismo">checked="checked"</s:if>  />
													</div>
												</div>
												<div class="field">
      												<div class="ui  checkbox">
														<label>Alcólico</label>
														<input type="checkbox" name="avaliacao.alcolicoStr" <s:if test="avaliacao.alcolico">checked="checked"</s:if>  />
													</div>
												</div>
												<div class="field">
      												<div class="ui  checkbox">
														<label>Diabetes</label>
														<input type="checkbox" name="avaliacao.diabetesStr" <s:if test="avaliacao.diabetes">checked="checked"</s:if>  />
													</div>
												</div>
												<div class="field">
      												<div class="ui  checkbox">
														<label>Hipertensão</label>
														<input type="checkbox" name="avaliacao.hipertensaoStr" <s:if test="avaliacao.hipertensao">checked="checked"</s:if>  />
													</div>
												</div>
												<div class="field">
      												<div class="ui  checkbox">
														<label>Propensão a queloides</label>
														<input type="checkbox" name="avaliacao.queloidesStr" <s:if test="avaliacao.queloides">checked="checked"</s:if>   />
													</div>
												</div>
											</div>
											<div class="field">
												<label>Cuidados faciais habituais (que tipo e frequência):</label>
												<s:textfield  name="avaliacao.cuidadosFaciais" />
											</div>
											<div class="field">
												<label>Cuidados corporais habituais (que tipo e frequência):</label>
												<s:textfield  name="avaliacao.cuidadosCorporais" />
											</div>
											<div class="field">
												<label>Medicação habitual:</label>
												<s:textfield  name="avaliacao.medicacao" />
											</div>
											<div class="field">
												<label>Alterações hormonais (não; sim, qual?):</label>
												<s:textfield  name="avaliacao.alteracaoHormonal" />
											</div>
											<div class="field">
												<label>Alergias (não; sim, qual?):</label>
												<s:textfield  name="avaliacao.alergias" />
											</div>
											<div class="field">
												<label>Próteses metálicas:</label>
												<s:textfield  name="avaliacao.proteseMetalica" />
											</div>
											
											<div class="field">
												<label>Antecedentes Familiares</label>
												<s:textarea name="avaliacao.antecedentes" ></s:textarea>
											</div>
											
										<h4 class="ui dividing teal header">História Ginecológica</h4>
											<div class="field">
												<label>Tensão pré-menstrual:</label>
												<s:textfield  name="avaliacao.tensaoPremenstrual" />
											</div>
											<div class="field">
												<label>Quantidade de G/ P/ A:</label>
												<s:textfield  name="avaliacao.quantidadeGPA" />
											</div>
											<div class="field">
												<label>Método anticonceptivo:</label>
												<s:textfield  name="avaliacao.anticonceptivo" />
											</div>
											
										<h4 class="ui dividing teal header">Perimetria (cm)</h4>
											<div class="field">
												<table>
													<tr>
														<th></th>
														<th align="center"><strong>Avaliação</strong></th>
														<th align="center"><strong>Perda</strong></th>
													</tr>
													<tr>
														<td align="right" valign="top"><strong>Mama:</strong></td>
														<td>
															<div class="five fields">
																<div class="field"><s:textfield name="avaliacao.mamaAvaliacao" /></div>
																<div class="field"><s:textfield name="avaliacao.mamaAvaliacao2"/></div>
																<div class="field"><s:textfield name="avaliacao.mamaAvaliacao3"/></div>
																<div class="field"><s:textfield name="avaliacao.mamaAvaliacao4"/></div>
																<div class="field"><s:textfield name="avaliacao.mamaAvaliacao5"/></div>
															</div>
														</td>
														<td valign="top"><div class="field"><s:textfield name="avaliacao.mamaPerda" /></div></td>
													</tr>
													<tr>
														<td align="right" valign="top"><strong>Esterno:</strong></td>
														<td>
															<div class="five fields">
																<div class="field"><s:textfield name="avaliacao.esternoAvaliacao" /></div>
																<div class="field"><s:textfield name="avaliacao.esternoAvaliacao2" /></div>
																<div class="field"><s:textfield name="avaliacao.esternoAvaliacao3" /></div>
																<div class="field"><s:textfield name="avaliacao.esternoAvaliacao4" /></div>
																<div class="field"><s:textfield name="avaliacao.esternoAvaliacao5" /></div>
															</div>
														</td>
														<td valign="top"><div class="field"><s:textfield name="avaliacao.esternoPerda" /></div></td>
													</tr>
													<tr>
														<td align="right" valign="top"><strong>Cintura:</strong></td>
														<td>
															<div class="five fields">
																<div class="field"><s:textfield name="avaliacao.cinturaAvaliacao" /></div>
																<div class="field"><s:textfield name="avaliacao.cinturaAvaliacao2" /></div>
																<div class="field"><s:textfield name="avaliacao.cinturaAvaliacao3" /></div>
																<div class="field"><s:textfield name="avaliacao.cinturaAvaliacao4" /></div>
																<div class="field"><s:textfield name="avaliacao.cinturaAvaliacao5" /></div>
															</div>
														</td>
														<td valign="top"><div class="field"><s:textfield name="avaliacao.cinturaPerda" /></div></td>
													</tr>
													<tr>
														<td align="right" valign="top"><strong>Cicatriz Umbilical:</strong></td>
														<td>
															<div class="five fields">
																<div class="field"><s:textfield name="avaliacao.cicatrizUmbilicalAvaliacao" /></div>
																<div class="field"><s:textfield name="avaliacao.cicatrizUmbilicalAvaliacao2" /></div>
																<div class="field"><s:textfield name="avaliacao.cicatrizUmbilicalAvaliacao3" /></div>
																<div class="field"><s:textfield name="avaliacao.cicatrizUmbilicalAvaliacao4" /></div>
																<div class="field"><s:textfield name="avaliacao.cicatrizUmbilicalAvaliacao5" /></div>
															</div>
														</td>
														<td valign="top"><div class="field"><s:textfield name="avaliacao.cicatrizUmbilicalPerda" /></div></td>
													</tr>
													<tr>
														<td align="right" valign="top"><strong>Crista Ilíaca:</strong></td>
														<td>
															<div class="five fields">
																<div class="field"><s:textfield name="avaliacao.cristaIliacaAvaliacao" /></div>
																<div class="field"><s:textfield name="avaliacao.cristaIliacaAvaliacao2" /></div>
																<div class="field"><s:textfield name="avaliacao.cristaIliacaAvaliacao3" /></div>
																<div class="field"><s:textfield name="avaliacao.cristaIliacaAvaliacao4" /></div>
																<div class="field"><s:textfield name="avaliacao.cristaIliacaAvaliacao5" /></div>
															</div>
														</td>
														<td valign="top"><div class="field"><s:textfield name="avaliacao.cristaIliacaPerda" /></div></td>
													</tr>
													<tr>
														<td align="right" valign="top"><strong>Quadril:</strong></td>
														<td>
															<div class="five fields">
																<div class="field"><s:textfield name="avaliacao.quadrilAvaliacao" /></div>
																<div class="field"><s:textfield name="avaliacao.quadrilAvaliacao2" /></div>
																<div class="field"><s:textfield name="avaliacao.quadrilAvaliacao3" /></div>
																<div class="field"><s:textfield name="avaliacao.quadrilAvaliacao4" /></div>
																<div class="field"><s:textfield name="avaliacao.quadrilAvaliacao5" /></div>
															</div>
														</td>
														<td valign="top"><div class="field"><s:textfield name="avaliacao.quadrilPerda" /></div></td>
													</tr>
													<tr>
														<td align="right" valign="top"><strong>Prega glútea:</strong></td>
														<td>
															<div class="five fields">
																<div class="field"><s:textfield name="avaliacao.pregaGluteaAvaliacao" /></div>
																<div class="field"><s:textfield name="avaliacao.pregaGluteaAvaliacao2" /></div>
																<div class="field"><s:textfield name="avaliacao.pregaGluteaAvaliacao3" /></div>
																<div class="field"><s:textfield name="avaliacao.pregaGluteaAvaliacao4" /></div>
																<div class="field"><s:textfield name="avaliacao.pregaGluteaAvaliacao5" /></div>
															</div>
														</td>
														<td valign="top"><div class="field"><s:textfield name="avaliacao.pregaGluteaPerda" /></div></td>
													</tr>
												</table>
											</div>
											
											<div class="field">
												<label>Anotações Relevantes:</label>
												<s:textarea name="avaliacao.observacoes" ></s:textarea>
											</div>
											
											<div class="field">
												<label>Tratamento fisioterapêutico proposto:</label>
												<s:textarea name="avaliacao.tratamento" ></s:textarea>
											</div>
											
											<div class="ui hidden divider"></div>
											<div class="ui hidden divider"></div>
											
											<div class="ui buttons right floated">
												<input type="button" class="ui cancelarFicha button" value="Fechar" />
							  					<div class="or" data-text="ou"></div>
												<s:submit value="Salvar" cssClass="ui teal submit  button" /> 
											</div>
											
											<div class="ui hidden divider"></div>
											<div class="ui hidden divider"></div>
									</s:form>
								</td>
							</tr>
						</s:iterator>
					</s:if>
					<s:else>
						<tr>
							<td colspan="5">Nenhum registro encontrado.</td>
						</tr>
					</s:else>
				</tbody>
			</table>
			<div class="ui divider hidden"></div>
			<div class="ui divider hidden"></div>
		</div>
		
		
		<!-- CONTEUDO ABA 3 88888888888888888888888888888888888888888888888888888888888888888888888 -->
		<div class="ui bottom attached tab segment <s:if test="aba != null && aba == 'contasReceber'" >active</s:if>"  data-tab="pagamentos" >
				
			<div class="ui hidden divider"></div>
			
			<!-- BT ADD CONTA RECEBER 88888888888888888888888888888888888888888888888888888888888888888888888 -->
			
			<div class="column">
				<a href="#" class="btAdd" title="Inserir novo" >
					<i class="add circle big teal icon"></i>
				</a>
			</div>
			
			<div class="ui areaAdd hide centered grid" >
				<div class="fourteen wide column"> 
					<div class="ui form segment">
						<div class="ui block teal header">
							<i class="add teal icon"></i>
							<div class="content">Inserir novo pagamento</div>
						</div>
						<s:form id="formInserirContaReceber" action="cadastrarContaReceber" method="post">
							<s:hidden name="cadastro.id" />
							<input type="hidden" name="aba" value="contasReceber" />

							<h4 class="ui dividing teal header">Dados do Pagamento</h4>
							<div class="two fields">
								<div class="required field">
									<label class="medio final left">Atividade </label>
									<s:select id="atividadesPagamentos" name="contaReceber.atividade.id" cssClass="ui multiple dropdown" list="atividades" listKey="id" listValue="contrato.servico.nome + ' - ' + contrato.colaborador.nome" />
									<s:select id="atividadesPagamentosSuporte" cssStyle="display:none !important;" list="atividades" listKey="id" listValue="contrato.servico.qtdSessoes" />
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
								<div class="field">
									<div class="two fields">
										<div class="required field">
											<label>Valor (R$):</label>
											<s:textfield cssClass="decimal" name="contaReceber.valorStr" />
										</div>
										<div class="field">
											<label>Pago:</label>
										    <div class="ui checkbox">
												<input type="checkbox" value="PAGO" checked="checked" name="contaReceber.statusStr" />
											</div>
										</div>
									</div>
								</div>
							</div>
							<div class="field">
								<label>Observação:</label>
								<s:textarea name="contaReceber.observacao" ></s:textarea>
							</div>
							
							<s:select id="atividadesAgendamentoSuporte" cssStyle="display:none !important;" list="atividades" listKey="id" listValue="contrato.servico.duracaoSessao" />
							<div id="areaAgendar">
								<h4 class="ui dividing teal header">Agende os atendimentos (opcional)</h4>
								<input type="hidden" name="qtdAgendamentos" id="qtdAgendamentos" />
								<div id="areaAgendarConteudo">
								</div>
								<div class="field">
									<input type="button" class="ui btAdicionarAgendamento button" value="+ Add" />
								</div>
							</div>
							
							<div class="ui buttons right floated">
								<input type="button" class="ui cancelarAdd button" value="Cancelar" />
			  					<div class="or" data-text="ou"></div>
								<s:submit value="Cadastrar" cssClass="ui teal submit  button" /> 
							</div>	
						</s:form>
						<div class="ui divider hidden"></div>
					</div>
				</div>
			</div>
			
			<div class="ui divider hidden"></div>
			<div class="ui divider hidden"></div>
			
			<!-- AREA DE FILTRAGEM 88888888888888888888888888888888888888888888888888888888888888888888888 -->
			
			<s:if test="servicosContasReceber.size > 1">
				<div class="areaSearch ui centered grid" >
					<div class="nine wide column">
						<div class="ui form fluid" >
							<div class="field">
								<label>Mostrar apenas os pagamentos do serviço:</label>
								<s:select list="servicosContasReceber" id="servicosContasReceber" cssClass="ui dropdown" listKey="id" listValue="nome" headerKey="-1" headerValue="TODOS" /> 	
							</div>
						</div>
					</div>
				</div>
			</s:if>
			
			<!-- TABELA COM AS CONTAS_RECEBER JÁ PAGAS 88888888888888888888888888888888888888888888888888888888888888888888888 -->
			<div class="left floated column">
				<strong>Total já pago: R$ <span id="pagoContas"><s:property value="totalValorContasReceberStr" /></span></strong>
			</div>
			
			<table class="ui celled striped teal table">
				<thead>
					<tr>
						<th class="colapse">Ref.:<i class="help circle icon hint" data-content="Código de referência para identificar o pagamento" data-variation="inverted" ></i></th>
						<th>Valor (R$)</th>
						<th>Data de lança.</th>
						<th>Atividade</th>
						<th>Forma de Pag.</th>
						<th>Obs.</th>
						<th>Pago</th>
						<th>#</th>
						<th>#</th>
					</tr>
				</thead>
				<tbody>
					<s:if test="contasReceber.size > 0">
						<s:iterator value="contasReceber">
							<tr class="linhaConta linhaConta<s:property value="atividade.contrato.servico.id" />">
								<td><s:property value="id" /></td>
								<td class="valorConta">
									<s:property value="valorCheioStr" />
								</td>
								<td><s:date name="dataLancamento" format="dd/MM/yyyy" /></td>
								<td><s:property value="atividade.contrato.servico.nome" /> - <s:property value="colaboradorCerto.nome" /></td>
								<td><s:property value="formaPagamento.valor" /></td>
								<td><s:property value="observacao" /></td>
								<td>
								    <div class="ui checkbox read-only">
										<input type="checkbox" value="PAGO" name="statusStr" class="checkPago" data-content="<s:property value="id" />"
											<s:if test="status.value == 'PAGO' ">
											 checked="checked"
											</s:if>
										 />
									</div>
								</td>
								<td>
									<a class="ui blue mini button" href="contaReceber?contaReceber.id=<s:property value="id" />&cadastro.id=<s:property value="cadastro.id" />&aba=contasReceber" >EDITAR</a>
								</td>
								<td><a class="remover" href="removerContaReceber?aba=contasReceber&contaReceber.id=<s:property value="id" />&cadastro.id=<s:property value="cadastro.id" />"><i class="remove circle red icon"></i></a></td>
							</tr>
						</s:iterator>
					</s:if>
					<s:else>
						<tr>
							<td colspan="5">Nenhum registro encontrado.</td>
						</tr>
					</s:else>
				</tbody>
			</table>
			<div class="ui divider hidden"></div>
			<div class="ui divider hidden"></div>
		</div>
		
		
		<!-- CONTEUDO ABA 4 88888888888888888888888888888888888888888888888888888888888888888888888 -->
		<div class="ui bottom attached tab segment <s:if test="aba != null && aba == 'frequencias'" >active</s:if>"  data-tab="frequencias"  >
				
			<div class="ui hidden divider"></div>

	
			<!-- BT ADD FREQUENCIA 88888888888888888888888888888888888888888888888888888888888888888888888 -->
			<div class="column">
				<a href="#" class="btAdd" title="Inserir novo" >
					<i class="add circle big teal icon"></i>
				</a>
			</div>
			
			<div class="ui areaAdd hide centered grid" >
				<div class="fourteen wide column"> 
				
					<div class="ui form segment">
						<div class="ui block teal header">
							<i class="add teal icon"></i>
							<div class="content">Inserir nova frequência</div>
						</div>
						<s:form id="formInserirFrequencia" action="cadastrarFrequencia" method="post">
							<input type="hidden" name="frequencia.cadastro.id" value="<s:property value="cadastro.id" />" />
							<input type="hidden" name="frequencia.novo" value="true" />
							<s:hidden name="cadastro.id" />
							<input type="hidden" name="aba" value="frequencias" />
							
							<h4 class="ui dividing teal header">Dados principais</h4>
							<div class="field">
								<label class="medio final left">Atividade</label>
								<s:select id="atividadesFrequencia" name="frequencia.atividade.id" cssClass="ui dropdown" headerKey="-1" headerValue="SELECIONE UMA ATIVIDADE" list="atividades" listKey="id" listValue="contrato.servico.nome + ' - ' + contrato.colaborador.nome" />
								<s:select id="atividadesFrequenciasSuporte" cssStyle="display:none !important;" list="atividades" listKey="id" listValue="contrato.servico.duracaoSessao" />
							</div>
							<div class="two fields">
								<div class="field">
									<label class="grande left">Caso outro colaborador, diferente do descrito acima, tenha atendido:</label>
									<s:select list="allColaboradores" cssClass="ui dropdown" headerKey="-1" headerValue="-- O mesmo descrito na atividade acima --" name="frequencia.colaborador.id" listKey="id" listValue="nome" />
								</div>
								<div class="field hide" id="areaPagamentos">
									<label class="medio final left">Referente ao pagamento:</label>
									<select class="ui dropdown" name="frequencia.contaReceber.id" >
									</select>
								</div>
							</div>
							<div class="three fields">
								<div class="field">
									<label class="pequeno left">Data</label>
									<div class="ui icon input">
										<s:textfield name="frequencia.dataStr" cssClass="data" />
										<i class="calendar icon"></i>
									</div>
								</div>
								<div class="field">
									<label class="pequeno left">Hora de início</label>
									<s:textfield name="frequencia.horario" cssClass="hora" />
								</div>
								<div class="field">
									<label class="pequeno left">Duração (em minutos)</label>
									<s:textfield id="duracaoSessao" name="frequencia.duracao" cssClass="inteiro" />
								</div>
							</div>
							
							<div class="ui buttons right floated">
								<input type="button" class="ui cancelarAdd button" value="Cancelar" />
			  					<div class="or" data-text="ou"></div>
								<s:submit value="Cadastrar" cssClass="ui teal submit  button" /> 
							</div>	
						</s:form>
						<div class="ui divider hidden"></div>
					</div>
				</div>
			</div>
			
			<div class="ui divider hidden"></div>
			<div class="ui divider hidden"></div>
			
			<!-- AREA DE FILTRAGEM 88888888888888888888888888888888888888888888888888888888888888888888888 -->
			
			<s:if test="servicosFrequencias.size > 1">
				<div class="areaSearch ui centered grid" >
					<div class="nine wide column">
						<div class="ui form fluid" >
							<div class="field">
								<label>Mostrar apenas as frequências no serviço:</label>
								<s:select list="servicosFrequencias" id="servicosFrequencias" cssClass="ui dropdown" listKey="id" listValue="nome" headerKey="-1" headerValue="TODOS" /> 	
							</div>
						</div>
					</div>
				</div>
			</s:if>
			
			<!-- TABELA COM AS FREQUENCIAS EXISTENTES 88888888888888888888888888888888888888888888888888888888888888888888888 -->
			
			<table class="ui celled striped teal table">
				<thead>
					<tr>
						<th>#</th>
						<th>Data</th>
						<th>Serviço</th>
						<th>Colaborador</th>
						<th>Pag. <i class="help circle icon hint" data-content="Código do pagamento ao qual esta frequência está associada" data-variation="inverted" ></i></th>
						<th>#</th>
					</tr>
				</thead>
				<tbody>
					<s:if test="frequencias.size > 0">
						<% int i = 0; %>
						<s:iterator value="frequencias">
							<tr class="linhaFreq linhaFreq<s:property value="servicoCerto.id" />">
								<td><s:property value="ordem" /></td>
								<td><s:date name="data" format="dd/MM/yyyy" /> às <s:date name="data" format="HH:mm" /> <s:if test="duracao != null && duracao != 0">(<s:property value="duracao" />min)</s:if></td>
								<td><s:property value="servicoCerto.nome" /></td>
								<td><s:property value="colaboradorCerto.nome" /></td>
								<td><s:property value="contaReceber.id" /></td>
								<td><a class="remover" href="removerFrequencia?aba=frequencias&frequencia.id=<s:property value="id" />&cadastro.id=<s:property value="cadastro.id" />"><i class="remove circle red icon"></i></a></td>
							</tr>
						</s:iterator>
					</s:if>
					<s:else>
						<tr>
							<td colspan="5">Nenhum registro encontrado.</td>
						</tr>
					</s:else>
				</tbody>
			</table>
			
			<div class="ui divider hidden"></div>
			<div class="ui divider hidden"></div>
		</div>
		
		
		<!-- CONTEUDO ABA AGENDAMENTOS 88888888888888888888888888888888888888888888888888888888888888888888888 -->
		<div class="ui bottom attached tab segment <s:if test="aba != null && aba == 'agendamentos'" >active</s:if>"  data-tab="agendamentos"  >
				
			<div class="ui hidden divider"></div>

	
			<!-- BT ADD AGENDAMENTO 88888888888888888888888888888888888888888888888888888888888888888888888 -->
			<div class="column">
				<a href="#" class="btAdd" title="Inserir novo" >
					<i class="add circle big teal icon"></i>
				</a>
			</div>
			
			<div class="ui areaAdd hide centered grid" >
				<div class="fourteen wide column"> 
				
					<div class="ui form segment">
						<div class="ui block teal header">
							<i class="add teal icon"></i>
							<div class="content">Inserir Agendamento</div>
						</div>
						<s:form id="formInserirAgendamentos" action="cadastrarAgendamento" method="post">
							<input type="hidden" name="agendamento.cadastro.id" value="<s:property value="cadastro.id" />" />
							<s:hidden name="cadastro.id" />
							<input type="hidden" name="aba" value="agendamentos" />
							
							<h4 class="ui dividing teal header">Dados principais</h4>
							<div class="required field">
								<label>Título</label>
								<s:textfield name="agendamento.titulo" />
							</div>
							<div class="field">
								<label>Anotações</label>
								<s:textarea name="agendamento.nota" />
							</div>
							<div class="three fields">
								<div class="required field">
									<label>Data</label>
									<div class="ui icon input">
										<s:textfield name="agendamento.dataInicioStr" cssClass="data" />
										<i class="calendar icon"></i>
									</div>
								</div>
								<div class="required field">
									<label>Horário</label>
									<s:textfield name="agendamento.horario" cssClass="hora" />
								</div>
								<div class="required field">
									<label>Duração (minutos)</label>
									<s:textfield name="agendamento.duracao" cssClass="inteiro" />
								</div>
							</div>
							
							<div class="ui buttons right floated">
								<input type="button" class="ui cancelarAdd button" value="Cancelar" />
			  					<div class="or" data-text="ou"></div>
								<s:submit value="Cadastrar" cssClass="ui teal submit  button" /> 
							</div>	
						</s:form>
						<div class="ui divider hidden"></div>
					</div>
				</div>
			</div>
			
			<div class="ui divider hidden"></div>
			<div class="ui divider hidden"></div>
			
			<!-- TABELA COM OS AGENDMENTOS EXISTENTES 88888888888888888888888888888888888888888888888888888888888888888888888 -->
			<div id="areaAgenda" >
			</div>
			
			<div class="ui divider hidden"></div>
			<div class="ui divider hidden"></div>
		</div>
		
	</div>
	
	</div>
	
	
		<!-- POPUP EDITAR AGENDAMENTO 88888888888888888888888888888888888888888888888888888888888888888888888888888 -->
		<div class="ui small modal">
			<i class="close icon"></i>
			<div class="header">Editar Agendamento</div>
			<div class="content">
				<s:form action="editarAgendamento" cssClass="ui form" >
					<input type="hidden" name="agendamento.cadastro.id" value="<s:property value="cadastro.id" />" />
					<s:hidden name="cadastro.id" id="cadastroId" />
					<input type="hidden" name="aba" value="agendamentos" />
					<input type="hidden" id="agId" name="agendamento.id" />
					<div class="required field">
						<label>Título:</label>
						<s:textfield name="agendamento.titulo" id="agTitulo" />
					</div>
					<div class="field">
						<label>Anotações:</label>
						<s:textarea name="agendamento.nota" id="agNota" />
					</div>
					<div class="three fields">
						<div class="required field">
							<label>Data inicial:</label>
							<div class="ui icon input">
								<i class="calendar icon"></i>
								<s:textfield name="agendamento.dataInicioStr" cssClass="data" id="agDataInicio" />
							</div>
						</div>
						<div class="required field">
							<label>Hora:</label>
							<s:textfield name="agendamento.horario" cssClass="hora" id="agHorario" />
						</div>
						<div class="required field">
							<label>Duração:</label>
							<s:textfield name="agendamento.duracao" cssClass="inteiro" id="agDuracao" />
						</div>
					</div>
					
					<div class="ui hidden divider"></div>
					
					<div class="ui actions buttons left floated">
						<a href="removerAgendamento?aba=agendamentos&cadastro.id=<s:property value="cadastro.id" />&agendamento.id=" id="btRemoverAgendamento" class="ui left negative button">Excluir</a>
					</div>
					<div class="ui actions buttons right floated">
						<div class="ui button">Cancelar</div>
						<div class="or" data-text="ou"></div>
						<s:submit cssClass="ui positive right submit button" value="Salvar" />
					</div>
				</s:form>
			</div>
		</div>	
	
	<s:include value="../geral/rodape.jsp" />
</body>
</html>