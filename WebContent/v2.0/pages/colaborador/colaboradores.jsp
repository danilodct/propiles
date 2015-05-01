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
		setSubMenuAtivo("#menuColaboradores");
		setMaskDate(".data");
		setMaskFone(".fone");
		setMaskNumerico(".decimal");
		setMaskCEP(".cep");
		setMaskCPF(".cpf");
		setCEP(".cep");
		setBtRemover();
		setBtAdd();
	});
</script>
</head>
<body>
	<s:include value="../geral/cabecalho.jsp" />

	<div class="twelve wide column">

		<div class="ui dividing  header">
			<i class="users <s:property value="#session.profisio_user.tenant.corFinal" /> circular inverted icon"></i>
			<div class="content">
				Colaboradores
				<div class="sub header">Gerencie todos os colaboradores da sua clínica</div>
			</div>
		</div>
		
		<div class="ui hidden divider"></div>

		<div class="left floated column">
			<a href="#" class="btAdd" title="Inserir novo" >
				<i class="add circle big <s:property value="#session.profisio_user.tenant.corFinal" /> icon"></i>
			</a>
		</div>
		
		<div class="ui areaAdd hide centered grid" >
			<div class="sixteen wide column"> 
				<div class="ui form segment">
					<div class="ui block <s:property value="#session.profisio_user.tenant.corFinal" /> header">
						<i class="add <s:property value="#session.profisio_user.tenant.corFinal" /> icon"></i>
						<div class="content"> Inserir novo Colaborador</div>
					</div>
					
					<s:form action="cadastrarColaborador" method="post">
						<h4 class="ui dividing <s:property value="#session.profisio_user.tenant.corFinal" /> header">Dados Principais</h4>
						<div class="required field">
							<label>Nome:</label>
							<s:textfield name="colaborador.nome" />
						</div>
						<div class="four fields">
							<div class="field">
								<label>Sexo:</label>
								<s:select name="colaborador.sexoStr" cssClass="ui dropdown" list="sexos" listKey="value" listValue="valor" />
							</div>
							<div class="field">
								<label>CPF:</label>
								<s:textfield cssClass="cpf" name="colaborador.cpf" />
							</div>
							<div class="field">
								<label>Data de Nascimento:</label>
								<div class="ui icon input">
									<s:textfield cssClass="data" name="colaborador.dataNascimentoStr" />
									<i class="calendar icon"></i>
								</div>
							</div>
							<div class="required field">
								<label>E-mail:</label>
								<s:textfield name="colaborador.email" />
							</div>
						</div>
						<div class="four fields">
							<div class="field">
								<label>Fone Fixo:</label>
								<div class="ui icon input">
									<s:textfield cssClass="fone" name="colaborador.foneFixo" />
									<i class="call icon"></i>
								</div>
							</div>
							<div class="field">
								<label>Fone Celular:</label>
								<div class="ui icon input">
									<s:textfield cssClass="fone" name="colaborador.foneCelular" />
									<i class="call icon"></i>
								</div>
							</div>
							<div class="field">
								<label>Carteira de Trabalho:</label>
								<s:textfield name="colaborador.numeroCarteira" />
							</div>
							<div class="field">
								<label>Salário Base:</label>
								<s:textfield cssClass="decimal" name="colaborador.salarioBaseStr" />
							</div>
						</div>
						<div class="four fields">
							<div class="field">
							    <label>Tipo do usuário no sistema <i class="help circle icon hint" data-content="Professor: Tem acesso aos dados dos clientes || Recepcionista: Tem acesso aos dados dos clientes, à área administrativa, à área dos colaboradores || Aux. Administrativo: Tem acesso a tudo que os outros usuários podem ver, além da área financeira e gerencial" data-variation="inverted" ></i></label>
								<s:select name="colaborador.tipoStr" cssClass="ui dropdown" list="tiposUser" listKey="value" listValue="value" />
							</div>
						</div>
							
						<h4 class="ui dividing <s:property value="#session.profisio_user.tenant.corFinal" /> header">Endereço</h4>
						<div class="two fields">	
							<div class="field">
								<div class="two fields">	
									<div class="field">
										<label>CEP:</label>
										<s:textfield id="cep" cssClass="cep" name="colaborador.endereco.cep" />
									</div>
									<div class="field">
										<label>Número:</label>
										<s:textfield name="colaborador.endereco.numero" />
									</div>
								</div>
							</div>
							<div class="field">
								<label>Complemento:</label>
								<s:textfield name="colaborador.endereco.complemento" />
							</div>
						</div>
						<div class="two fields">
							<div class="field">
								<label>Logradouro:</label>
								<s:textfield id="logradouro" name="colaborador.endereco.logradouro" />
							</div>
							<div class="field">
								<div class="three fields">
									<div class="field">
										<label>Bairro:</label>
										<s:textfield id="bairro" name="colaborador.endereco.bairro" />
									</div>
									<div class="field">
										<label>Cidade:</label>
										<s:textfield id="cidade" name="colaborador.endereco.cidade" />
									</div>
									<div class="field">
										<div class="two fields">
											<div class="field">
												<label>UF:</label>
												<s:textfield maxlength="2" id="uf" name="colaborador.endereco.uf" />
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
						
						<s:if test="#session.profisio_user.tenant.plano.value == 'PLANO_2' || #session.profisio_user.tenant.plano.value == 'PLANO_3' ">
							<h4 class="ui dividing <s:property value="#session.profisio_user.tenant.corFinal" /> header">Dados de Autenticação</h4>
							<div class="four fields">
								<div class="required field">
									<label>Senha:</label>
									<s:password name="colaborador.senha" />
								</div>
							</div>
						</s:if><s:else>
							   <div class="ui four centered column grid planos">
								 <div class="ui hidden divider"></div>
								
								 <h4 class="ui header nossosPlanos">Deseja que este colaborador acesse o sistema?</h4>
								 
								<div style="font-size:1rem">Com acesso ao sistema este colaborador poderá inserir no momento do atendimento as informações da ficha de avaliação dos pacientes, dentre outras funcionalidades.</div>
								
								 <div class="ui hidden divider"></div>
								
								   	<div class="column ui horizontal segment">
								           <h2 class="ui centered header">
												Básico
											</h2>
											<div class="centered">
												<p>R$ 19,90 / mês<br />
												<span class="claro">ou R$ 228,00 / ano</span></p>
												<p></p>
											</div>
											<div class="content centered">
												<a href="" class="ui green degrade button btPlano1" id="btPlano1">Contrate já!</a>
											</div>
											<p></p>
											<div class="centered">
										            <p>Total acesso ao sistema</p>
										            <p>Quantidade ilimitada de usuários</p>
										            <p>Não tem acesso aos módulos Relatório e Análise BI</p>
											</div>
								   	</div>
								   	<div class="column ui horizontal segment actived">
								           <h2 class="ui centered header">
										           	Avançado
											</h2>
											<div class="centered">
												<p>R$ 29,90 / mês<br />
												<span class="claro">ou R$ 339,00 / ano</span></p>
												<p></p>
											</div>
											<div class="content centered">
												<a href="" class="ui green degrade button btPlano2" id="btPlano2">Contrate já!</a>
											</div>
											<p></p>
											<div class="centered">
										            <p>Total acesso ao sistema</p>
										            <p>Quantidade ilimitada de usuários</p>
										            <p>Acesso à todos os módulos do sistema</p>
											</div>
								   	</div>
								   	<div class="column ui horizontal segment last">
								           <h2 class="ui centered header">
										           	Personalizado
											</h2>
											<div class="centered">
												<p>Valor à combinar<br />&nbsp;</p>
												<p></p>
											</div>
											<div class="content centered">
												<a href="" class="ui green degrade button btPlano3" id="btPlano3">Contrate já!</a>
											</div>
											<p></p>
											<div class="centered">
										            <p>Total acesso ao sistema com quantidade ilimitada de usuários</p>
										            <p>Possibilidade de adequar o sistema à sua necessidade com atendimento personalizado e individual</p>
											</div>
								   	</div>
								</div>
								
								<div class="ui hidden divider"></div>
								<div class="ui hidden divider"></div>
								<div class="ui hidden divider"></div>
						</s:else>

						<div class="ui buttons right floated">
							<input type="button" class="ui cancelar button" value="Cancelar" />
		  					<div class="or" data-text="ou"></div>
							<input type="submit" value="Cadastrar" class="ui <s:property value="#session.profisio_user.tenant.corFinal" /> submit  button" /> 
						</div>	
					</s:form>
				</div>
			</div>
		</div>
		
		<div class="ui areaSearch centered grid" >
			<div class="twelve wide column">
				<s:form action="colaboradores" cssClass="ui form fluid" id="formPesquisa">
					<div class="two fields">
						<div class="field">
							<label>Nome do colaborador</label>
							<s:textfield name="nomeColaborador" /> 	
						</div>
						<div class="field">
							<label class="visibilityHidden">Botão</label>
							<input type="submit" value="Pesquisar" class="ui <s:property value="#session.profisio_user.tenant.corFinal" /> right submit  button" />
						</div>
					</div>
				</s:form>
			</div>
		</div>

		<table class="ui celled striped <s:property value="#session.profisio_user.tenant.corFinal" /> table">
			<thead>
				<tr>
					<th>#</th>
					<th>Nome</th>
					<th>Telefones</th>
					<th>Data de Aniversário</th>
					<th>#</th>
				</tr>
			</thead>
			<tbody>
				<s:if test="colaboradores.size > 0">
					<% int i = 0; %>
					<s:iterator value="colaboradores">
						<tr>
							<td><% i += 1; %><%=i %></td>
							<td><a href="colaborador?colaborador.idCript=<s:property value="idCript" />"><s:property value="nome" /></a></td>
							<td>
								<s:property value="foneFixo" />
								<s:if test="foneFixo != null && foneFixo != '' && foneCelular != null && foneCelular != ''">
									<br /> 
								</s:if>
								<s:property value="foneCelular" />
							</td>
							<td><s:date name="dataNascimento" format="dd/MM" /></td>
							<td><a class="remover" href="removerColaborador?colaborador.idCript=<s:property value="idCript" />"><i class="remove circle red icon"></i></a></td>
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

	</div>

	<s:include value="../geral/rodape.jsp" />
</body>
</html>