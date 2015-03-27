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
		setSubMenuAtivo("#menuCadastros");
		setMaskDate(".data");
		setMaskFone(".fone");
		setMaskCEP(".cep");
		setMaskCPF(".cpf");
		setCEP(".cep");
		setBtRemover();
		setBtAdd();
		setBtOutroRadio();
	});
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
</script>
</head>
<body>
<s:hidden name="pagAtual" id="pagAtual" />

	<s:include value="../geral/cabecalho.jsp" />

	<div class="fourteen wide column">

		<!-- TITULO DA PÁGINA 88888888888888888888888888888888888888888888888888888888888888888888888 -->

		<div class="ui dividing  header">
			<i class="users teal circular inverted icon"></i>
			<div class="content">
				Cadastros
				<div class="sub header">Todos os cadastros já feitos de visitantes ou clientes</div>
			</div>
		</div>
		
		<div class="ui hidden divider"></div>


		<!-- BT ADD CADASTRO 88888888888888888888888888888888888888888888888888888888888888888888888 -->
	
		<div class="left floated column">
			<a href="#" class="btAdd" title="Inserir novo" >
				<i class="add circle big teal icon"></i>
			</a>
		</div>
		

		<!-- ÁREA ADD 88888888888888888888888888888888888888888888888888888888888888888888888 -->
		
		<div class="ui areaAdd hide centered grid" >
			<div class="fifteen wide column"> 
				<div class="ui form segment">
					<div class="ui block teal header">
						<i class="add teal icon"></i>
						<div class="content"> Inserir novo Cadastro</div>
					</div>
					
					<s:form action="cadastrarCadastro" method="post">
						<h4 class="ui dividing teal header">Dados Principais</h4>
						<div class="required field">
							<label>Nome:</label>
							<s:textfield id="nome" name="cadastro.nome" />
						</div>
						<div class="four fields">
							<div class="field">
								<label>Sexo:</label>
								<s:select name="cadastro.sexoStr" cssClass="ui dropdown" list="allSexos" listKey="value" listValue="valor" />
							</div>
							<div class="field">
								<label>CPF:</label>
								<s:textfield cssClass="cpf" name="cadastro.cpf" />
							</div>
							<div class="field">
								<label>Data de Nascimento:</label>
								<div class="ui icon input">
									<s:textfield cssClass="data" name="cadastro.dataNascimentoStr" />
									<i class="calendar icon"></i>
								</div>
							</div>
							<div class="field">
								<label>E-mail:</label>
								<s:textfield name="cadastro.email" />
							</div>
						</div>
						<div class="four fields">
							<div class="field">
								<label>Estado Civil:</label>
								<s:select name="cadastro.estadoCivilStr" cssClass="ui dropdown" list="allEstadosCivil" listKey="value" listValue="valor" />
							</div>
							<div class="field">
								<label>Fone Fixo:</label>
								<div class="ui icon input">
									<s:textfield cssClass="fone" name="cadastro.foneFixo" />
									<i class="call icon"></i>
								</div>
							</div>
							<div class="field">
								<label>Fone Celular:</label>
								<div class="ui icon input">
									<s:textfield cssClass="fone" name="cadastro.foneCelular" />
									<i class="call icon"></i>
								</div>
							</div>
							<div class="field">
								<label>Profissão:</label>
								<s:textfield name="cadastro.profissao" />
							</div>
						</div>
						
						<h4 class="ui dividing teal header">Endereço</h4>
						<div class="three fields">
							<div class="field">
								<label>CEP:</label>
								<s:textfield id="cep" cssClass="cep" name="cadastro.endereco.cep" />
							</div>
							<div class="field">
								<label>Número:</label>
								<s:textfield name="cadastro.endereco.numero" />
							</div>
							<div class="field">
								<label>Complemento:</label>
								<s:textfield name="cadastro.endereco.complemento" />
							</div>
						</div>
						<div class="field">
							<label>Logradouro:</label>
							<s:textfield name="cadastro.endereco.logradouro" id="logradouro" />
						</div>
						<div class="three fields">
							<div class="field">
								<label>Bairro:</label>
								<s:textfield id="bairro" name="cadastro.endereco.bairro" />
							</div>
							<div class="field">
								<label>Cidade:</label>
								<s:textfield id="cidade" name="cadastro.endereco.cidade" />
							</div>
							<div class="field">
								<div class="five fields">
									<div class="field">
										<label>UF:</label>	
										<s:textfield id="uf" maxlength="2" name="cadastro.endereco.uf" />
									</div>
								</div>
							</div>
						</div>
					
						<h4 class="ui dividing teal header">Como o cliente tomou conhecimento deste estabelecimento?</h4>
 						<div class="grouped fields">
 							<s:iterator value="allFormasConhecimento" >
 								<div class="field">
							      <div class="ui radio checkbox">
							        <input type="radio" value="<s:property value="nome" />" name="cadastro.conhecimentoStudio" class="radioFormaConhecimento" />
							        <label><s:property value="nome" /></label>
							      </div>
							    </div>
 							</s:iterator>
						</div>
						<div class="four fields">
							<div class="field">
								<input type="text" name="outraFormaConhecimento" class="hide" value="" id="outraFormaConhecimento" />
							</div>
						</div>

						<div class="ui hidden divider" ></div>

						<div class="ui buttons right floated">
							<input type="button" class="ui cancelar button" value="Cancelar" />
		  					<div class="or" data-text="ou"></div>
							<s:submit value="Cadastrar" cssClass="ui teal submit  button" /> 
						</div>	
					</s:form>
				</div>
				<div class="ui hidden divider" ></div>
				<div class="ui hidden divider" ></div>
				<div class="ui hidden divider" ></div>
			</div>
		</div>
		

		<!-- ÁREA PESQUISA 88888888888888888888888888888888888888888888888888888888888888888888888 -->
	
		<div class="ui areaSearch centered grid" >
			<div class="nine wide column">
				<s:form action="cadastros" cssClass="ui form fluid" id="formPesquisa">
					<div class="two fields">
						<div class="field">
							<label>Nome do cliente</label>
							<s:textfield name="nomeCliente" /> 	
						</div>
						<div class="field">
							<label class="visibilityHidden">Botão</label>
							<s:submit value="Pesquisar" cssClass="ui teal right submit  button" />
						</div>
					</div>
				</s:form>
			</div>
		</div>


		<!-- ÁREA LISTAGEM 88888888888888888888888888888888888888888888888888888888888888888888888 -->
		
		<div class="left floated column">
			Mostrando <s:property value="clientes.size" /> de <s:property value="qtdCadastros" /> cadastros
		</div>
		<table class="ui celled striped teal table">
			<thead>
				<tr>
					<th>Nome</th>
					<th>E-mail</th>
					<th>Telefones</th>
					<th>Data cadastro</th>
					<th>Data de Aniversário</th>
					<th>#</th>
				</tr>
			</thead>
			<tbody>
				<s:if test="clientes.size > 0">
					<s:iterator value="clientes">
						<tr>
							<td><a href="cadastro?cadastro.id=<s:property value="id" />"><s:property value="nome" /></a></td>
							<td><s:property value="email" /></td>
							<td class="collapsing">
								<s:property value="foneFixo" />
								<s:if test="foneFixo != null && foneFixo != '' && foneCelular != null && foneCelular != ''">
									<br /> 
								</s:if>
								<s:property value="foneCelular" />
							</td>
							<td class="collapsing"><s:date name="dataCadastro" format="dd/MM/yy" /></td>
							<td class="collapsing"><s:date name="dataNascimento" format="dd/MM" /></td>
							<td class="collapsing"><a class="remover" href="removerCadastro?cadastro.id=<s:property value="id" />"><i class="remove circle red icon"></i></a></td>
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


		<!-- PAGINACAO 88888888888888888888888888888888888888888888888888888888888888888888888 -->
		
		<s:if test="qtdPaginas.size > 1">
			<div class="ui pagination menu">
				<s:if test="pagAtual > 1">
					<a class="icon item" href="cadastros?pagAtual=<%=(((Integer)request.getAttribute("pagAtual")) - 1) %>&nomeCliente=<s:property value="nomeCliente" />"><i class="left arrow icon"></i></a> 
				</s:if>
				<s:iterator value="qtdPaginas" >
					<s:if test="qtdPaginas.size > 13 && ((pagAtual + 5) == nome)">
						<div class="disabled item">...</div>
					</s:if>
					<s:elseif test="qtdPaginas.size > 13 && ((pagAtual - 5) == nome)">
						<div class="disabled item">...</div>
					</s:elseif>
					<s:elseif test="qtdPaginas.size > 13 && (((pagAtual - nome) > 0 && (pagAtual - nome) > 4) || ((pagAtual - nome) < 0 && (pagAtual - nome) < -4))">
					</s:elseif><s:else>
						<a class="<s:if test="pagAtual == nome">active</s:if> item" href="cadastros?pagAtual=<s:property value="nome" />&nomeCliente=<s:property value="nomeCliente" />"><s:property value="nome" /></a>
					</s:else>
				</s:iterator>
				<s:if test="pagAtual < qtdPaginas.size">
					<a class="icon item" href="cadastros?pagAtual=<%=(((Integer)request.getAttribute("pagAtual")) + 1) %>&nomeCliente=<s:property value="nomeCliente" />"><i class="right arrow icon"></i></a>
				</s:if>
			</div>
		</s:if>

	</div>

	<s:include value="../geral/rodape.jsp" />
</body>
</html>