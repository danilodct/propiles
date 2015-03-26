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
<script type="text/javascript" src="js/lib/jquery.1.3.2.js"></script>
<script type="text/javascript" src="js/lib/jquery.mask.js"></script>
<script type="text/javascript" src="js/lib/jquery.datepicker.js"></script>
<script type="text/javascript" src="js/lib/scripts.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		setPaginaPrincipal();
		setMaskCPF("form#formInserirFuncionario");
		setMaskDate("form#formInserirFuncionario");
		setMaskFone("form#formInserirFuncionario");
		setMaskCEP("form#formInserirFuncionario");
		setMaskNumerico("form#formInserirFuncionario");
		setCEP("form#formInserirFuncionario");
		$("input#cpf").blur(function(){
			runAjax("isCPFDisponviel", "cpf="+$(this).val(), "xml", procBuscaCPF);
		});
		function procBuscaCPF(xml){
			if($(xml).attr("status") == "false"){
				$("span#erroAddFuncionario").html("Já existe um Colaborador cadastrado com este mesmo CPF");
				$("span#erroAddFuncionario").show();
			}
		}
		$("form#formPesquisa").submit(function(){
			$("table.listagem").find("tr.linhaResultado").each(function(){
				$(this).remove();
			});
			$("table.listagem").append("<tr class='carregando'><td><label>carregando...</label></td></tr>");
			runAjax("pesquisarFuncionarios", $(this).serialize(), "xml", procPesquisa);
			return false;
		});
		function procPesquisa(xml){
			$("table.listagem").find("tr.carregando").each(function(){
				$(this).remove();
			}); 
			var counter = 0;
			var classes = ["linhaEscura", ""];
			if($(xml).find("funcionario").length > 0){
				var conteudoPesquisa = "";
				$(xml).find("funcionario").each(function(){
					var id = $(this).attr("id");
					var dataNascimento = $(this).attr("dataNascimento");
					var nome = $(this).find("nome").text();
					var foneFixo = $(this).find("telefoneFixo").text();
					var foneCelular = $(this).find("telefoneCelular").text();
					conteudoPesquisa += "<tr class='"+classes[counter%2]+" linhaResultado'>";
					conteudoPesquisa += "<td><a href='funcionario?funcionario.id="+id+"'>"+nome+"</a></td>";
					conteudoPesquisa += "<td>" + foneFixo + "<br />" + foneCelular + "</td>";
					conteudoPesquisa += "<td>" + dataNascimento + "</td>";
					conteudoPesquisa += "<td><a class='remover' href='removerFuncionario?funcionario.id="+id+"'><img src='img/delete.gif' /></a></td>";
					conteudoPesquisa += "</tr>";
					counter += 1;
				});
				$("table.listagem").append($(conteudoPesquisa));
			}else{
				$("table.listagem").append("<tr class='linhaResultado'><td><label>Nenhum resultado!</label></td></tr>");
			}		
		}
		$("form#formInserirFuncionario").submit(function(){
			clearBordasVermelhas($(this));
			var validado = (validaTXT($("input#nome")) && validaTXT($("input#cpf")));
			if(validado){
				tirarVirgulaPontos("form#formInserirFuncionario");
			}
			return validado;
		});
		$("a.remover").click(function(evt){
			var confirmacao = true;
			if(!confirm("Tem certeza que deseja remover este Colaborador?")){
				confirmacao = false;
			}
			return confirmacao;
		});
	});
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
<table class="mor">
	<tr>
		<th>Colaboradores</th>
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
		<div class="formAdd hidden">
			<fieldset>
				<legend>Cadastrar Colaborador</legend> 
				<s:form id="formInserirFuncionario" action="inserirFuncionario" method="post">
					<table class="formAdd">
						<tr><td class="linhaPequena"></td></tr>
						<tr>
							<td>
								<span id="erroAddFuncionario" class="error hidden"></span>
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
							<td><s:textfield id="nome" name="funcionario.nome" cssClass="grande" /></td>
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
										<td><s:select name="funcionario.sexoStr" cssClass="pequeno" list="sexos" listKey="value" listValue="valor" /></td>
										<td></td>
										<td><s:textfield id="cpf" cssClass="pequeno cpf" name="funcionario.cpf" /></td>
										<td></td>
										<td><s:textfield cssClass="pequeno data" name="funcionario.dataNascimentoStr" /></td>
										<td></td>
										<td><s:textfield cssClass="pequeno" name="funcionario.email" /></td>
									</tr>
								</table>
							</td>
						</tr>
						<tr>
							<td>
								<table>
									<tr>
										<td><label>Fone Fixo:</label></td>
										<td>&nbsp;&nbsp;</td>
										<td><label>Fone Celular:</label></td>
										<td>&nbsp;&nbsp;</td>
										<td><label>Carteira de Trabalho:</label></td>
										<td>&nbsp;&nbsp;</td>
										<td><label>Salário Base:</label></td>
									</tr>
									<tr>
										<td><s:textfield cssClass="pequeno fone" name="funcionario.foneFixo" /></td>
										<td></td>
										<td><s:textfield cssClass="pequeno fone" name="funcionario.foneCelular" /></td>
										<td></td>
										<td><s:textfield cssClass="pequeno" name="funcionario.numeroCarteira" /></td>
										<td></td>
										<td><s:textfield cssClass="pequeno decimal" name="funcionario.salarioBase" /></td>
									</tr>
									<tr>
										<td><label>Porcentagem vendas:</label></td>
										<td></td>
										<td><label>Recepcionista:</label></td>
									</tr>
									<tr>
										<td><s:textfield cssClass="pequeno decimal" name="funcionario.porcentagemVendas" /></td>
										<td></td>
										<td><input type="checkbox" name="recepcionista" /> sim</td>
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
										<td><s:textfield id="cep" cssClass="pequeno cep" name="funcionario.endereco.cep" /></td>
										<td></td>
										<td><s:textfield cssClass="pequeno" name="funcionario.endereco.numero" /></td>
										<td></td>
										<td><s:textfield cssClass="medio" name="funcionario.endereco.complemento" /></td>
									</tr>
								</table>
							</td>
						</tr>
						<tr>
							<td><label>Logradouro:</label></td>
						</tr>
						<tr>
							<td><s:textfield name="funcionario.endereco.logradouro" id="logradouro" cssClass="grande" /></td>
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
										<td><s:textfield cssClass="pequeno" id="bairro" name="funcionario.endereco.bairro" /></td>
										<td></td>
										<td><s:textfield cssClass="pequeno" id="cidade" name="funcionario.endereco.cidade" /></td>
										<td></td>
										<td><s:textfield cssClass="sigla" id="uf" maxlength="2" name="funcionario.endereco.uf" /></td>
									</tr>
								</table>
							</td>
						</tr>
						<tr><td class="linhaMedia"></td></tr>
						<tr>
							<td class="header">Dados de Autenticação</td>
						</tr>
						<tr><td class="linhaPequena"></td></tr>
						<tr>
							<td>
								<table>
									<tr>
										<td><label>Login:</label></td>
									</tr>
									<tr>
										<td><s:textfield id="login" cssClass="pequeno" name="funcionario.login" /></td>
									</tr>
									<tr>
										<td><label>Senha:</label></td>
									</tr>
									<tr>
										<td><s:password cssClass="pequeno" name="funcionario.senha" /></td>
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
</div>
<br /><br />
<table class="normal">
	<tr>
		<td align="center">
			<s:form action="" id="formPesquisa">
				<label>Pesquisar:</label>
				<s:textfield cssClass="pequeno" name="pesquisa" /> 
				Nome<input type="radio" name="param" value="nome" checked="checked" /> 
				CPF<input type="radio" name="param" value="cpf" />
				<input type="submit" class="submit" value="buscar" />
			</s:form>
		</td>
	</tr>
</table>
<table class="listagem">
	<tr>
		<th>Nome</th>
		<th>Telefones</th>
		<th>Data de Aniversário</th>
		<th>Remover</th>
	</tr>
	<%
		List<String> classes = Arrays.asList("linhaEscura", "");
		int pointer = 0;
	%>
	<s:iterator value="funcionarios">
		<tr class="<%= classes.get(pointer % 2) %> linhaResultado">
			<td><a href="funcionario?funcionario.id=<s:property value="id" />"><s:property value="nome" /></a></td>
			<td>
				<s:property value="foneFixo" />
				<s:if test="foneFixo != null && foneFixo != '' && foneCelular != null && foneCelular != ''">
					<br /> 
				</s:if>
				<s:property value="foneCelular" />
			</td>
			<td><s:date name="dataNascimento" format="dd/MM" /></td>
			<td><a class="remover" href="removerFuncionario?funcionario.id=<s:property value="id" />"><img src="img/delete.gif" /></a></td>
		</tr>
	<% pointer += 1; %>
	</s:iterator>
</table>
<s:include value="../geral/rodape.jsp" />
</body>
</html>