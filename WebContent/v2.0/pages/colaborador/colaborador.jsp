<%@page import="java.util.Arrays"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head><link rel="icon" href="http://www.propiles.com.br/img/favicon.ico" type="image/x-icon" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title><s:text name="TITULO_SISTEMA" /></title>
<link rel="stylesheet" type="text/css" href="v2.0/css/lib/jquery.ui.css" />
<link rel="stylesheet" type="text/css" href="v2.0/css/lib/semantic.css" />
<link rel="stylesheet" type="text/css" href="v2.0/css/lib/styles-extras.css" />

<script type="text/javascript" src="v2.0/js/lib/jquery.semantic.js" ></script>
<script type="text/javascript" src="v2.0/js/lib/jquery.ui.mask.js" ></script>
<script type="text/javascript" src="v2.0/js/lib/scripts.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		setSubMenuAtivo("#menuColaboradores");
		setMaskDate(".data");
		setMaskFone(".fone");
		setMaskNumerico(".decimal");
		setMaskCEP(".cep");
		setMaskCPF(".cpf");
		setCEP(".cep");
		setBtEditar(".editar");
		setBtCancelarEditar(".cancelar", "form#formEditarProduto");
		setBtCancelarAdd(".cancelarAdd");
		setBtRemover();
		setBtAdd();
		setBtAlterarContrato();
		setBtCancelarAlterarContrato();
	});
	function setBtAlterarContrato(){
		$("input.alterarContrato").click(function(evt){
			evt.preventDefault();
			$(this).parent().find("form.editarContrato").show();
			$(this).hide();
		});
	}
	function setBtCancelarAlterarContrato(){
		$(".cancelarContrato").click(function(evt){
			evt.preventDefault();
			var celula = $(this).parent().parent().parent().parent().parent().parent();
			$(celula).find("input.alterarContrato").show();
			$(celula).find("form.editarContrato").hide();
		});
	}
</script>
<script>(function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){(i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)})(window,document,'script','//www.google-analytics.com/analytics.js','ga');ga('create', 'UA-62673588-1', 'auto');ga('send', 'pageview');</script></head>
<body>
	<s:include value="../geral/cabecalho.jsp" />

	<!-- TITULO DA PÁGINA 88888888888888888888888888888888888888888888888888888888888888888888888 -->
	
	<div class="thirteen wide column">
		<div class="ui dividing  header">
			<i class="user <s:property value="#session.profisio_user.tenant.corFinal" /> circular inverted icon"></i>
			<div class="content">
				Colaborador
				<div class="sub header">Veja as informações do seu colaborador, assim como suas atividades na clínica</div>
			</div>
		</div>
		<div class="ui hidden divider"></div>
	
	<!-- NOME DO COLABORADOR 88888888888888888888888888888888888888888888888888888888888888888888888 -->
		
	<div class="ui header">
		<a href="colaborador?colaborador.idCript=<s:property value="colaborador.idCript" />" ><s:property value="colaborador.nome" /></a>
	</div>
	
	<div class="ui styled fluid accordion">
	
		<!-- AREA DAS ABAS 88888888888888888888888888888888888888888888888888888888888888888888888 -->
		<div class="ui top attached tabular menu">
			<a class="item <s:if test="aba == null || aba == 'infoColaborador'" >active</s:if>" data-tab="infoColaborador">Informações do colaborador</a>
			<a class="item <s:if test="aba != null && aba == 'servicos'" >active</s:if>" data-tab="servicos">Serviços prestados na clínica</a>
		</div>
	
		<!--CONTEUDO ABA 1 88888888888888888888888888888888888888888888888888888888888888888888888 -->
		<div class="ui bottom attached tab segment  <s:if test="aba == null || aba == 'infoColaborador'" >active</s:if>" data-tab="infoColaborador">
			<div class="ui form">
			
				<!-- FORM EDITAR COLABORADOR 88888888888888888888888888888888888888888888888888888888888888888888888 -->
				<s:form id="formEditarProduto" action="editarColaborador" method="post">
					<input type="hidden" name="aba" value="infoColaborador" />
					<s:hidden name="colaborador.idCript" />
					<s:hidden name="colaborador.login" />
					<s:hidden name="colaborador.senhaCript" />
					<h4 class="ui dividing <s:property value="#session.profisio_user.tenant.corFinal" /> header">Dados Principais</h4>
					<div class="required field">
						<label>Nome:</label>
						<div class="ui transparent input">
							<s:textfield name="colaborador.nome" />
						</div>
					</div>
					<div class="four fields">
						<div class="field">
							<label>Sexo:</label>
							<s:select name="colaborador.sexoStr" cssClass="ui disabled dropdown" list="sexos" listKey="value" listValue="valor" />
						</div>
						<div class="field">
							<label>CPF:</label>
							<div class="ui transparent input">
								<s:textfield cssClass="cpf" name="colaborador.cpf" />
							</div>
						</div>
						<div class="field">
							<label>Data de Nascimento:</label>
							<div class="ui icon transparent input">
								<s:textfield cssClass="data" name="colaborador.dataNascimentoStr" />
								<i class="calendar icon"></i>
							</div>
						</div>
						<div class="field">
							<label>E-mail:</label>
							<div class="ui transparent input">
								<s:textfield name="colaborador.email" />
							</div>
						</div>
					</div>
					<div class="four fields">
						<div class="field">
							<label>Fone Fixo:</label>
							<div class="ui transparent icon input">
								<s:textfield cssClass="fone" name="colaborador.foneFixo" />
								<i class="call icon"></i>
							</div>
						</div>
						<div class="field">
							<label>Fone Celular:</label>
							<div class="ui transparent icon input">
								<s:textfield cssClass="fone" name="colaborador.foneCelular" />
								<i class="call icon"></i>
							</div>
						</div>
						<div class="field">
							<label>Carteira de Trabalho:</label>
							<div class="ui transparent input">
								<s:textfield name="colaborador.numeroCarteira" />
							</div>
						</div>
						<div class="field">
							<label>Salário Base:</label>
							<div class="ui transparent input">
								<s:textfield cssClass="decimal" name="colaborador.salarioBaseStr" />
							</div>
						</div>
					</div>
					<div class="four fields">
						<div class="field">
						    <label>Usuário no sistema <i class="help circle icon hint" data-content="Professor: Tem acesso aos dados dos clientes || Recepcionista: Tem acesso aos dados dos clientes, à área administrativa, à área dos colaboradores || Aux. Administrativo: Tem acesso a tudo que os outros usuários podem ver, além da área financeira e gerencial" data-variation="inverted" ></i></label>
							<s:select name="colaborador.tipoStr" cssClass="ui disabled dropdown" list="tiposUser" listKey="value" listValue="value" />
						</div>
					</div>
						
					<h4 class="ui dividing <s:property value="#session.profisio_user.tenant.corFinal" /> header">Endereço</h4>
					<div class="two fields">	
						<div class="field">
							<div class="two fields">	
								<div class="field">
									<label>CEP:</label>
									<div class="ui transparent input">
										<s:textfield id="cep" cssClass="cep" name="colaborador.endereco.cep" />
									</div>
								</div>
								<div class="field">
									<label>Número:</label>
									<div class="ui transparent input">
										<s:textfield name="colaborador.endereco.numero" />
									</div>
								</div>
							</div>
						</div>
						<div class="field">
							<label>Complemento:</label>
							<div class="ui transparent input">
								<s:textfield name="colaborador.endereco.complemento" />
							</div>
						</div>
					</div>
					<div class="two fields">
						<div class="field">
							<label>Logradouro:</label>
							<div class="ui transparent input">
								<s:textfield id="logradouro" name="colaborador.endereco.logradouro" />
							</div>
						</div>
						<div class="field">
							<div class="three fields">
								<div class="field">
									<label>Bairro:</label>
									<div class="ui transparent input">
										<s:textfield id="bairro" name="colaborador.endereco.bairro" />
									</div>
								</div>
								<div class="field">
									<label>Cidade:</label>
									<div class="ui transparent input">
										<s:textfield id="cidade" name="colaborador.endereco.cidade" />
									</div>
								</div>
								<div class="field">
									<div class="three fields">
										<div class="field">
											<label>UF:</label>
											<div class="ui transparent input">
												<s:textfield maxlength="2" id="uf" name="colaborador.endereco.uf" />
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					
					<div class="ui hidden divider"></div>
					<div class="ui hidden divider"></div>
					
					
					<div class="actions">
						<div class="ui right floated labeled icon <s:property value="#session.profisio_user.tenant.corFinal" /> button editar">
							Editar
							<i class="edit right icon"></i>
						</div>				
					</div>
					
					<div class="ui buttons hide right floated">
						<input type="button" class="ui cancelar button" value="Cancelar" />
	  					<div class="or" data-text="ou"></div>
						<input type="submit" value="Salvar alterações" class="ui <s:property value="#session.profisio_user.tenant.corFinal" /> submit  button" /> 
					</div>	
					
				</s:form>
			</div>
			
			<div class="ui divider hidden"></div>
			<div class="ui divider hidden"></div>

		</div>
		
		<!--CONTEUDO ABA  88888888888888888888888888888888888888888888888888888888888888888888888 -->
		<div class="ui bottom attached tab segment <s:if test="aba != null && aba == 'servicos'" >active</s:if>" data-tab="servicos">
			
			<div class="ui hidden divider"></div>
	
			<!-- BT ADD CONTRATO 88888888888888888888888888888888888888888888888888888888888888888888888 -->
			
			<div class="column">
				<a href="#" class="btAdd" title="Inserir novo" >
					<i class="add circle big <s:property value="#session.profisio_user.tenant.corFinal" /> icon"></i>
				</a>
			</div>
		
		
			<!-- FORM ADD CONTRATO 88888888888888888888888888888888888888888888888888888888888888888888888 -->
			
			<div class="ui areaAdd hide centered grid" >
				<div class="twelve wide column"> 
					<div class="ui form segment">
						<div class="ui block <s:property value="#session.profisio_user.tenant.corFinal" /> header">
							<i class="add <s:property value="#session.profisio_user.tenant.corFinal" /> icon"></i>
							<div class="content"> Associar novo serviço ao colaborador</div>
						</div>
						<div class="ui form">
							<s:form id="formInserirContrato" action="cadastrarContrato" method="post">
								<input type="hidden" name="aba" value="servicos" />
								<input type="hidden" name="contrato.colaborador.idCript" value="<s:property value="colaborador.idCript" />" />
								<input type="hidden" name="colaborador.idCript" value="<s:property value="colaborador.idCript" />" />
								<div class="tow fields">
									<div class="required field">
										<label>Serviço:</label>
										<div class="ui transparent input">
											<s:select name="contrato.servico.idCript" list="allServicos" cssClass="ui dropdown" listKey="idCript" listValue="nome" />
										</div>
									</div>
									<div class="required field">
										<label>Percentual do Colaborador: <i class="help circle icon hint" data-content="Porcentagem que o colaborador recebe sobre cada atendimento feito neste contrato de serviço" data-variation="inverted" ></i></label>
										<div class="ui input">
											<s:textfield name="contrato.percentualStr" cssClass="decimal" />
										</div>
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
			</div>
			
			<div class="ui divider hidden"></div>
			<div class="ui divider hidden"></div>
			
			<!-- TABELA COM OS CONTRATOS JÁ EXISTENTES 88888888888888888888888888888888888888888888888888888888888888888888888 -->
			
			<table class="ui celled striped <s:property value="#session.profisio_user.tenant.corFinal" /> table">
				<thead>
					<tr>
						<th>#</th>
						<th>Serviço</th>
						<th>Percentual do Colaborador <i class="help circle icon hint" data-content="Porcentagem que o colaborador recebe sobre cada atendimento feito neste contrato de serviço" data-variation="inverted" ></i></th>
						<th>Alterar %</th>
						<th>#</th>
					</tr>
				</thead>
				<tbody>
					<s:if test="contratos.size > 0">
						<% int i = 0; %>
						<s:iterator value="contratos">
							<tr>
								<td><% i += 1; %><%=i %></td>
								<td><s:property value="servico.nome" /></td>
								<td>
									<s:property value="percentualStr" />%
								</td>
								<td>
									<!-- FORM ALTERAR % DO CONTRATO 88888888888888888888888888888888888888888888888888888888888888888888888 -->
									<s:form cssClass="hide ui form editarContrato" action="editarContrato">
										<input type="hidden" name="aba" value="servicos" />
										<input type="hidden" name="contrato.idCript" value="<s:property value="idCript" />" />
										<input type="hidden" name="colaborador.idCript" value="<s:property value="colaborador.idCript" />" />
										<input type="hidden" name="contrato.colaborador.idCript" value="<s:property value="colaborador.idCript" />" />
										<div class="three fields">
											<div class="field">
												<input type="text" name="contrato.percentualStr" class="decimal" value="<s:property value="percentualStr" />" />
											</div>
											<div class="field">
												<input type="button" value="Cancelar" class="ui cancel cancelarContrato button" /> 
											</div>
											<div class="field">
												<input type="submit" value="Salvar" class="ui <s:property value="#session.profisio_user.tenant.corFinal" /> submit  button" /> 
											</div>
										</div>
									</s:form>
									<input type="button" value="ALTERAR" class="ui blue mini button alterarContrato" />
								</td>
								<td><a class="remover" href="removerContrato?aba=servicos&colaborador.idCript=<s:property value="colaborador.idCript" />&contrato.idCript=<s:property value="idCript" />"><i class="remove circle red icon"></i></a></td>
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
	
	</div>
	
	</div>

	<s:include value="../geral/rodape.jsp" />
</body>
</html>