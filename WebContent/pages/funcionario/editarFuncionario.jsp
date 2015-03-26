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
		setMaskCPF("form#formEditarFuncionario");
		setMaskDate("form#formEditarFuncionario");
		setMaskFone("form#formEditarFuncionario");
		setMaskCEP("form#formEditarFuncionario");
		setMaskNumerico("form#formEditarFuncionario");
		setCEP("form#formEditarFuncionario");
		$("input#cpf").blur(function(){
			runAjax("isCPFDisponviel", "cpf="+$(this).val(), "xml", procBuscaCPF);
		});
		function procBuscaCPF(xml){
			if($(xml).attr("status") == "false"){
				$("div#erroAddFuncionario").html("Já existe um Funcionário cadastrado com este mesmo CPF");
				$("div#erroAddFuncionario").show();
			}
		}
		$("form#formEditarFuncionario").submit(function(){
			clearBordasVermelhas($(this));
			var validado = (validaTXT($("input#nome")) && validaTXT($("input#cpf")));
			if(validado){
				tirarVirgulaPontos("form#formEditarFuncionario");
			}
			return validado;
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
		<th>Funcionário » <s:property value="funcionario.nome" /></th>
	</tr>
	<tr>
		<td class="linhaMedia"></td>
	</tr>
	<tr>
		<td>
			<s:form id="formEditarFuncionario" action="editarFuncionario" method="post">
				<s:hidden name="funcionario.id" />
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
									<td><s:select name="funcionario.sexoStr" value="funcionario.sexo" cssClass="pequeno" list="sexos" listKey="value" listValue="valor" /></td>
									<td></td>
									<td><s:textfield id="cpf" cssClass="pequeno cpf" name="funcionario.cpf" /></td>
									<td></td>
									<td><input type="text" class="pequeno data" name="funcionario.dataNascimentoStr" value="<s:date name="funcionario.dataNascimento" format="dd/MM/yyyy" />" /></td>
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
									<td><input type="checkbox" name="recepcionista" <s:if test="funcionario.tipoStr == 'RECEPCIONISTA'">checked="checked"</s:if> /> sim</td>
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
									<td><label>Senha (atual: <s:property value="funcionario.senha" />):</label></td>
								</tr>
								<tr>
									<td><s:password cssClass="pequeno" name="funcionario.senha" /></td>
								</tr>
							</table>
						</td>
					</tr>
					<tr><td class="linhaMedia"></td></tr>
					<tr>
						<td><s:submit value="salvar" cssClass="submit" /></td>
					</tr>
				</table>
			</s:form>
		</td>
	</tr>
</table>
</div>
<s:include value="../geral/rodape.jsp" />
</body>
</html>