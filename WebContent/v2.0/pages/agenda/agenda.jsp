<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
		        $("input#agTitulo").val(calEvent.title);
		        $("textarea#agNota").html(calEvent.nota);
		        $("input#agDataInicio").val(calEvent.dataInicial);
		        $("input#agHorario").val(calEvent.horario);
		        $("input#agDuracao").val(calEvent.duracao);
		        if(calEvent.cliente != "")
		        	$("#areaNomeCliente").html("Cliente: "+calEvent.cliente).show();
		        else
		        	$("#areaNomeCliente").html("").hide();
		        $("a#btRemoverAgendamento").attr("href", "removerAgendamento?agendamento.idCript="+calEvent.id);
		        showModal(".modal");
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
	});

</script>
</head>
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
						<h4 class="ui dividing <s:property value="#session.profisio_user.tenant.corFinal" /> header">Dados principais</h4>
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

		<div class="ui small modal">
			<i class="close icon"></i>
			<div class="header">Editar Agendamento</div>
			<div class="content">
				<s:form action="editarAgendamento" cssClass="ui form" >
					<h4 id="areaNomeCliente" class="ui header <s:property value="#session.profisio_user.tenant.corFinal" /> hide"></h4>
					<input type="hidden" id="agId" name="agendamento.idCript" />
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
					
					<div class="ui actions buttons left floated">
						<a href="#" id="btRemoverAgendamento" class="ui left negative button">Excluir</a>
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