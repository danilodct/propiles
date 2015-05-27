<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head><link rel="icon" href="http://www.propiles.com.br/img/favicon.ico" type="image/x-icon" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title><s:text name="TITULO_SISTEMA" /></title>
<link rel="stylesheet" type="text/css" href="v2.0/css/lib/jquery.ui.css" />
<link rel="stylesheet" type="text/css" href="v2.0/css/lib/semantic.css" />
<link rel="stylesheet" type="text/css" href="v2.0/css/lib/fullcalendar.css" />
<link rel="stylesheet" type="text/css" href="v2.0/css/lib/fullcalendar.print.css" media="print" />

<script type="text/javascript" src="v2.0/js/lib/moment.js" ></script>
<script type="text/javascript" src="v2.0/js/lib/jquery.semantic.js" ></script>
<script type="text/javascript" src="v2.0/js/lib/jquery.ui.mask.js" ></script>
<script type="text/javascript" src="v2.0/js/lib/fullcalendar.js" ></script>
<script type="text/javascript" src="v2.0/js/lib/scripts.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		setMenuAtivo("#menuAgenda");
		setSubMenuAtivo("#subMenuGeral");		
		setBtAdd();
		setBtCancelarAdd(".cancelarAdd");
		setMaskDate(".data");
		setMaskHora(".hora");
		setMaskInteiro(".inteiro");

		var agendamentos = JSON.parse($("input#agendamentos").val());
		createAgenda("#calendar", agendamentos, 
			function(calEvent, jsEvent, view) {
		        $("input#agId").val(calEvent.id);
		        $("input#agCadastro").val(calEvent.cadastro);
		        $("input#agTitulo").val(calEvent.title);
		        $("textarea#agNota").val(calEvent.nota);
		        $("input#agDataInicio").val(calEvent.start.format("DD/MM/YYYY"));
		        $("input#agHorario").val(calEvent.horario);
		        $("input#agDuracao").val(calEvent.duracao);
		        $("input#agPai").val(calEvent.pai);
		        $("input#agRepeticao").val(calEvent.repeticao);
		        $("input#agStatus").val(calEvent.status);
		        if(calEvent.cliente != "")
		        	$("#areaNomeCliente").html("Cliente: "+calEvent.cliente).show();
		        else
		        	$("#areaNomeCliente").html("").hide();

		        if(calEvent.pai == "" && calEvent.repeticao == "NAO_REPETIR"){
		        	$("form#editarAgendamento .repeticoes").hide();
		        }else{
		        	$("form#editarAgendamento .repeticoes").show();
		        }
		        $("a.btRemoverAgendamento").attr("href", $("a.btRemoverAgendamento").attr("href")+calEvent.id);
		        $("a.btRemoverAgendamentoTodos").attr("href", $("a.btRemoverAgendamentoTodos").attr("href")+calEvent.id);

		        
				$("div#modalEditarAgendamento div.header").html("Agendamento");
		        if(calEvent.cadastro == null || calEvent.cadastro == ""){
					$("div.areaPreBotoesAgendamento").hide();
					$("div#areaDadosAgendamento").show();
					$("div.areaBotoesFalta").hide();
					$("div.areaBotoesPresenca").hide();
					$("div.areaBotoesEditar").show();
		        }else{
					$("div.areaPreBotoesAgendamento").show();
					$("div#areaDadosAgendamento").hide();
					$("div.areaBotoesFalta").show();
					$("div.areaBotoesPresenca").show();
					$("div.areaBotoesEditar").show();
		        }

				if(calEvent.atividade != null && calEvent.atividade != ""){
					$("h4#areaNomeAtividade").html("Atividade: " + calEvent.atividade);
					$("h4#areaNomeAtividade").show();
				}else{
					$("h4#areaNomeAtividade").html("");
					$("h4#areaNomeAtividade").hide();
				}
				
		        showModal("#modalEditarAgendamento");
		    },
		    function(event, delta, revertFunc){
		    	if(!confirm("Tem certeza que deseja alterar a data deste agendamento?")){
		    		revertFunc();
		    	}else{
		    		var novaData = event.start;
		    		var novaHora = novaData.format("HH:MM");
		    		novaData = novaData.format("DD/MM/YYYY");
		    		runAjax("alterarDataAgendamento", "agendamento.idCript="+event.id+"&agendamento.dataInicioStr="+novaData+"&agendamento.horario="+novaHora, "text", doNothing);
		    	}
		    }
		);

		$("a#btMarcarFalta").click(function(evt){
			evt.preventDefault();
			$("div#modalEditarAgendamento div.header").html("Marcar Falta");
			$("input#agStatus").val("FALTOU");
			$("div.areaPreBotoesAgendamento").hide();
			$("div#areaDadosAgendamento").show();
			$("div.areaBotoesFalta").show();
			$("div.areaBotoesPresenca").hide();
			$("div.areaBotoesEditar").hide();
			$("div#modalEditarAgendamento").modal('refresh');
		});
		$("a#btMarcarPresenca").click(function(evt){
			evt.preventDefault();
			$("div#modalEditarAgendamento div.header").html("Marcar Presença");
			$("input#agStatus").val("COMPARECEU");
			$("div.areaPreBotoesAgendamento").hide();
			$("div#areaDadosAgendamento").show();
			$("div.areaBotoesFalta").hide();
			$("div.areaBotoesPresenca").show();
			$("div.areaBotoesEditar").hide();
			$("div#modalEditarAgendamento").modal('refresh');
		});
		$("input#btAlterarDados").click(function(evt){
			evt.preventDefault();
			$("div#modalEditarAgendamento div.header").html("Editar Agendamento");
			$("div.areaPreBotoesAgendamento").hide();
			$("div#areaDadosAgendamento").show();
			$("div.areaBotoesFalta").hide();
			$("div.areaBotoesPresenca").hide();
			$("div.areaBotoesEditar").show();
			$("div#modalEditarAgendamento").modal('refresh');
		});
		$("form#editarAgendamento .submit").click(function(){
			if($(this).hasClass("positive")){
				$("form#editarAgendamento input#agSalvarRepeticoes").val("false");
			}else{
				$("form#editarAgendamento input#agSalvarRepeticoes").val("true");
			}
			$("form#editarAgendamento").submit();
		});
	});

</script>
<script>(function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){(i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)})(window,document,'script','//www.google-analytics.com/analytics.js','ga');ga('create', 'UA-62673588-1', 'auto');ga('send', 'pageview');</script></head>
<body>
<s:hidden name="agendamentos" id="agendamentos" />
	<s:include value="../geral/cabecalho.jsp" />

	<div class="twelve wide column">

		<div class="ui dividing  header">
			<i class="calendar <s:property value="#session.profisio_user.tenant.corFinal" /> circular inverted icon"></i>
			<div class="content">
				Agenda
				<div class="sub header">Veja todos os atendimentos já programados</div>
			</div>
		</div>

		<div class="ui hidden divider"></div>
		
		<!-- LEGENDA  88888888888888888888888888888888888888888888888888888888888888888888888 -->
		<div class="left floated column">
			<div style="width: 18px;height: 18px;border: 1px solid #D4D4D5;background-color: #99C347;float: left;margin-right: 5px;"></div>
			<div style="float:left; margin-right:10px;">= cliente compareceu</div>
			<div style="width: 18px;height: 18px;border: 1px solid #D4D4D5;background-color: red;float: left;margin-right: 5px;"></div>
			<div style="float:left; margin-right:10px;">= cliente faltou</div>
		</div>

		<div class="ui hidden divider"></div>
		<div class="ui hidden divider"></div>
		<div class="ui hidden divider"></div>
		
		<!-- BT ADD FREQUENCIA 88888888888888888888888888888888888888888888888888888888888888888888888 -->
		<div class="column">
			<a href="#" class="btAdd" title="Inserir novo" >
				<i class="add circle big <s:property value="#session.profisio_user.tenant.corFinal" /> icon"></i>
			</a>
		</div>
		
		<div class="ui areaAdd hide centered grid" >
			<div class="fourteen wide column"> 
			
				<div class="ui form segment">
					<div class="ui block <s:property value="#session.profisio_user.tenant.corFinal" /> header">
						<i class="add <s:property value="#session.profisio_user.tenant.corFinal" /> icon"></i>
						<div class="content">Inserir Agendamento</div>
					</div>
					<s:form id="formInserirAgendamentos" action="cadastrarAgendamento" method="post">
						<input type="hidden" name="agendamento.pai.idCript" value="<s:property value="pai.idCript" />" />
						
						<h4 class="ui dividing <s:property value="#session.profisio_user.tenant.corFinal" /> header">Dados principais</h4>
						<div class="required field">
							<label>Título</label>
							<s:textfield name="agendamento.titulo" />
						</div>
						<div class="field">
							<label>Anotações</label>
							<s:textarea name="agendamento.nota" />
						</div>
						<div class="four fields">
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
							<div class="required field">
								<label>Repetir</label>
								<s:select list="allRepeticaoAgendamento" cssClass="ui dropdown" listKey="value" listValue="valor" name="agendamento.repeticao"/>
							</div>
						</div>
						
						<div class="ui buttons right floated">
							<input type="button" class="ui cancelarAdd button" value="Cancelar" />
		  					<div class="or" data-text="ou"></div>
							<input type="submit" value="Cadastrar" class="ui <s:property value="#session.profisio_user.tenant.corFinal" /> submit  button" /> 
						</div>	
						
					</s:form>
					<div class="ui divider hidden"></div>
				</div>
			</div>
		</div>
		
		<div class="ui hidden divider"></div>
		
		<div id="calendar" ></div>

	</div>

		<div class="ui small modal" id="modalEditarAgendamento">
			<i class="close icon"></i>
			<div class="header">Editar Agendamento</div>
			<div class="content">
						
				<div class="ui actions buttons left floated areaPreBotoesAgendamento">
					<a href="removerAgendamento?repeticoes=false&aba=agendamentos&cadastro.idCript=<s:property value="cadastro.idCript" />&agendamento.idCript=" class="ui left meuBotao negativo" id="btMarcarFalta" >Marcar falta</a>
					<a href="removerAgendamento?repeticoes=true&aba=agendamentos&cadastro.idCript=<s:property value="cadastro.idCript" />&agendamento.idCript=" class="ui left positive meuBotao positivo" id="btMarcarPresenca" >Marcar presença</a>
				</div>
				
				<div class="ui actions buttons right floated areaPreBotoesAgendamento">
					<input type="button" class="ui right meuBotao" id="btAlterarDados" value="Editar/Remover" />
				</div>
				
				<div id="areaDadosAgendamento" class="hide">
					<s:form action="editarAgendamento" id="editarAgendamento" cssClass="ui form" >
						<h4 id="areaNomeCliente" class="ui header <s:property value="#session.profisio_user.tenant.corFinal" /> hide"></h4>
						<h4 id="areaNomeAtividade" class="ui header <s:property value="#session.profisio_user.tenant.corFinal" /> hide"></h4>
						
						<input type="hidden" id="agId" name="agendamento.idCript" />
						<input type="hidden" id="agCadastro" name="agendamento.cadastro.idCadastroCript" />
						<input type="hidden" id="agPai" name="agendamento.pai.idCript" />
						<input type="hidden" id="agRepeticao" name="agendamento.repeticaoStr" />
						<input type="hidden" id="agSalvarRepeticoes" name="repeticoes" />
						<input type="hidden" id="agStatus" name="agendamento.statusStr" />
						
						<div class="required field">
							<label>Título:</label>
							<s:textfield name="agendamento.titulo" id="agTitulo" />
						</div>
						<div class="field">
							<label>Anotações:</label>
							<s:textarea name="agendamento.nota" id="agNota" ></s:textarea>
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
						
						<div class="areaBotoesEditar">
							<div class="ui actions buttons left floated">
								<a href="removerAgendamento?repeticoes=false&aba=agendamentos&cadastro.idCript=<s:property value="cadastro.idCript" />&agendamento.idCript=" class="ui left negative button btRemoverAgendamento">Excluir</a>
								<div class="or repeticoes" data-text="ou"></div>
								<a href="removerAgendamento?repeticoes=true&aba=agendamentos&cadastro.idCript=<s:property value="cadastro.idCript" />&agendamento.idCript=" class="ui left button repeticoes btRemoverAgendamentoTodos">Excluir próximos</a>
							</div>
							
							<div class="ui actions buttons right floated">
								<input type="button" class="ui positive right submit button" value="Salvar" />
							</div>
						</div>
						
						<div class="ui actions buttons right floated areaBotoesFalta">
							<input type="button" class="ui right submit button negative" value="Marcar falta" />
						</div>
						
						<div class="ui actions buttons right floated areaBotoesPresenca">
							<input type="button" class="ui right submit button positive" value="Marcar presença" />
						</div>
					</s:form>
				</div>
			</div>
		</div>

	<s:include value="../geral/rodape.jsp" />
</body>
</html>