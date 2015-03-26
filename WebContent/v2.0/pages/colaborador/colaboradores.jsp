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
			<i class="users teal circular inverted icon"></i>
			<div class="content">
				Colaboradores
				<div class="sub header">Gerencie todos os colaboradores da sua clínica</div>
			</div>
		</div>
		
		<div class="ui hidden divider"></div>

		<div class="left floated column">
			<a href="#" class="btAdd" title="Inserir novo" >
				<i class="add circle big teal icon"></i>
			</a>
		</div>
		
		<div class="ui areaAdd hide centered grid" >
			<div class="sixteen wide column"> 
				<div class="ui form segment">
					<div class="ui block teal header">
						<i class="add teal icon"></i>
						<div class="content"> Inserir novo Colaborador</div>
					</div>
					
					<s:form action="cadastrarColaborador" method="post">
						<h4 class="ui dividing teal header">Dados Principais</h4>
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
							<div class="field">
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
								<label>Parte nos atendimentos (%): <i class="help circle icon hint" data-content="Utilize este campo caso seus colaboradores recebam porcentagem em cima de cada atendimento feito" data-variation="inverted" ></i></label>
								<s:textfield cssClass="decimal" name="colaborador.porcentagemVendasStr" />
							</div>
							<div class="field">
							    <label>Tipo do usuário no sistema <i class="help circle icon hint" data-content="Professor: Tem acesso aos dados dos clientes || Recepcionista: Tem acesso aos dados dos clientes, à área administrativa, à área dos colaboradores || Aux. Administrativo: Tem acesso a tudo que os outros usuários podem ver, além da área financeira e gerencial" data-variation="inverted" ></i></label>
								<s:select name="colaborador.tipoStr" cssClass="ui dropdown" list="tiposUser" listKey="value" listValue="value" />
							</div>
						</div>
							
						<h4 class="ui dividing teal header">Endereço</h4>
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

						<h4 class="ui dividing teal header">Dados de Autenticação</h4>
						<div class="four fields">
							<div class="required field">
								<label>Login:</label>
								<s:textfield id="login" name="colaborador.login" />
							</div>
							<div class="required field">
								<label>Senha:</label>
								<s:password name="colaborador.senha" />
							</div>
						</div>

						<div class="ui buttons right floated">
							<input type="button" class="ui cancelar button" value="Cancelar" />
		  					<div class="or" data-text="ou"></div>
							<s:submit value="Cadastrar" cssClass="ui teal submit  button" /> 
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
							<s:submit value="Pesquisar" cssClass="ui teal right submit  button" />
						</div>
					</div>
				</s:form>
			</div>
		</div>

		<table class="ui celled striped teal table">
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
							<td><a href="colaborador?colaborador.id=<s:property value="id" />"><s:property value="nome" /></a></td>
							<td>
								<s:property value="foneFixo" />
								<s:if test="foneFixo != null && foneFixo != '' && foneCelular != null && foneCelular != ''">
									<br /> 
								</s:if>
								<s:property value="foneCelular" />
							</td>
							<td><s:date name="dataNascimento" format="dd/MM" /></td>
							<td><a class="remover" href="removerColaborador?colaborador.id=<s:property value="id" />"><i class="remove circle red icon"></i></a></td>
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