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
		setMaskNumerico();
		$("input.leitura").attr("readonly", "true");
		$("form#formInserirContrato").submit(function(){
			tirarVirgulaPontos("form#formInserirContrato");
			return true;
		});
		$("form.editarContrato").submit(function(){
			tirarVirgulaPontos("form.editarContrato");
			return true;
		});
		$("input.alterarContrato").click(function(){
			$(this).parent().parent().find("form").show();
			$(this).hide();
		});
		$("a.remover").click(function(evt){
			if(!confirm("Tem certeza que deseja remover este contrato?")){
				evt.preventDefault();
			}
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
<div class="guia">
	<a href="funcionarios">Colaboradores</a> »  <s:property value="funcionario.nome" />
</div>
<table class="mor">
	<tr>
		<th>Colaborador » <s:property value="funcionario.nome" /></th>
	</tr>
	<tr>
		<td class="linhaMedia"></td>
	</tr>
	<tr>
		<td>
			<table class="formAdd">
				<tr><td class="linhaPequena"></td></tr>
				<tr>
					<td class="header">Dados Principais</td>
				</tr>
				<tr><td class="linhaPequena"></td></tr>
				<tr>
					<td><label>Nome:</label></td>
				</tr>
				<tr>
					<td><s:textfield id="nome" name="funcionario.nome" cssClass="grande leitura" /></td>
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
								<td><s:textfield name="funcionario.sexo.valor" cssClass="pequeno leitura" /></td>
								<td></td>
								<td><s:textfield id="cpf" cssClass="pequeno cpf leitura" name="funcionario.cpf" /></td>
								<td></td>
								<td><input type="text" class="pequeno data leitura" name="funcionario.dataNascimentoStr" value="<s:date name="funcionario.dataNascimento" format="dd/MM/yyyy" />" /></td>
								<td></td>
								<td><s:textfield cssClass="pequeno leitura" name="funcionario.email" /></td>
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
								<td><s:textfield cssClass="pequeno fone leitura" name="funcionario.foneFixo" /></td>
								<td></td>
								<td><s:textfield cssClass="pequeno fone leitura" name="funcionario.foneCelular" /></td>
								<td></td>
								<td><s:textfield cssClass="pequeno leitura" name="funcionario.numeroCarteira" /></td>
								<td></td>
								<td><s:textfield cssClass="pequeno leitura decimal" name="funcionario.salarioBase" /></td>
							</tr>
							<tr>
								<td><label>Porcentagem vendas:</label></td>
								<td></td>
								<td><label>Recepcionista:</label></td>
							</tr>
							<tr>
								<td><s:textfield cssClass="pequeno decimal leitura" name="funcionario.porcentagemVendas" /></td>
								<td></td>
								<td><s:if test="funcionario.tipoStr == 'RECEPCIONISTA'">sim</s:if><s:else>não</s:else></td>
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
								<td><s:textfield id="cep" cssClass="pequeno cep leitura" name="funcionario.endereco.cep" /></td>
								<td></td>
								<td><s:textfield cssClass="pequeno leitura" name="funcionario.endereco.numero" /></td>
								<td></td>
								<td><s:textfield cssClass="medio leitura" name="funcionario.endereco.complemento" /></td>
							</tr>
						</table>
					</td>
				</tr>
				<tr>
					<td><label>Logradouro:</label></td>
				</tr>
				<tr>
					<td><s:textfield name="funcionario.endereco.logradouro" id="logradouro" cssClass="grande leitura" /></td>
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
								<td><s:textfield cssClass="pequeno leitura" id="bairro" name="funcionario.endereco.bairro" /></td>
								<td></td>
								<td><s:textfield cssClass="pequeno leitura" id="cidade" name="funcionario.endereco.cidade" /></td>
								<td></td>
								<td><s:textfield cssClass="sigla leitura" id="uf" maxlength="2" name="funcionario.endereco.uf" /></td>
							</tr>
						</table>
					</td>
				</tr>
				<tr><td class="linhaMedia"></td></tr>
				<tr>
					<td><form action="editarFuncionarioRedirect"><s:hidden name="funcionario.id" /><s:submit value="Editar dados do Colaborador" cssClass="submit" /></form></td>
				</tr>
			</table>
		</td>
	</tr>
</table>
<table class="mor">
	<tr>
		<th>Contratos</th>
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
				<legend>Cadastrar Contrato Colaborador</legend> 
				<s:form id="formInserirContrato" action="inserirContrato" method="post">
					<input type="hidden" name="contrato.professor.id" value="<s:property value="funcionario.id" />" />
					<input type="hidden" name="funcionario.id" value="<s:property value="funcionario.id" />" />
					<table class="formAdd">
						<tr><td class="linhaPequena"></td></tr>
						<tr>
							<td>
								<span id="erroAddContrato" class="error hidden"></span>
							</td>
						</tr>
						<tr>
							<td class="header">Dados do Contrato</td>
						</tr>
						<tr><td class="linhaPequena"></td></tr>
						<tr>
							<td>
								<table>
									<tr>
										<td><label>Modalidade:</label></td>
										<td>&nbsp;&nbsp;</td>
										<td><label>Percentual do Colaborador:</label></td>
									</tr>
									<tr>
										<td><s:select name="contrato.servico.id" cssClass="medio" list="modalidades" listKey="id" listValue="nome" /></td>
										<td></td>
										<td><s:textfield name="contrato.percentual" cssClass="pequeno decimal" /></td>
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
		<th>Modalidade</th>
		<th>Percentual do Colaborador</th>
		<th>Alterar</th>
		<th>Remover</th>
	</tr>
	<%
		List<String> classes = Arrays.asList("linhaEscura", "");
		int pointer = 0;
	%>
	<s:iterator value="contratos">
		<tr class="<%= classes.get(pointer % 2) %>">
			<td><s:property value="servico.nome" /></td>
			<td>
				<s:property value="%{getText('{0,number,#,##0.00}',{percentual})}" />
			</td>
			<td>
				<table>
					<tr>
						<td>
							<s:form cssClass="hidden editarContrato" action="editarContrato">
								<input type="hidden" name="contrato.id" value="<s:property value="id" />" />
								<input type="hidden" name="funcionario.id" value="<s:property value="funcionario.id" />" />
								<input type="text" name="contrato.percentual" class="pequeno decimal" value="<s:property value="percentual" />" />
								<s:submit value="salvar" cssClass="submit" />
							</s:form>
						</td>
						<td>
							<input type="button" value="alterar" class="submit alterarContrato" />
						</td>
					</tr>
				</table>
			</td>
			<td><a class="remover" href="removerContrato?funcionario.id=<s:property value="funcionario.id" />&contrato.id=<s:property value="id" />"><img src="img/delete.gif" /></a></td>
		</tr>
	<% pointer += 1; %>
	</s:iterator>
</table>
</div>
<s:include value="../geral/rodape.jsp" />
</body>
</html>