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
		setMaskCPF("form#formEditarCliente");
		setMaskDate("form#formEditarCliente");
		setMaskFone("form#formEditarCliente");
		setMaskCEP("form#formEditarCliente");
		setCEP("form#formEditarCliente");
		$("input.radioConhecimento").change(function(){
			if($(this).attr("id") == "radioFormaOutro"){
				$("input#outro").show();	
			}else{
				$("input#outro").hide();	
			}
		});
		$("input#cpf").blur(function(){
			runAjax("isCPFDisponviel", "cpf="+$(this).val(), "xml", procBuscaCPF);
		});
		function procBuscaCPF(xml){
			if($(xml).attr("status") == "false"){
				$("div#erroAddCliente").html("Já existe um Cliente cadastrado com este mesmo CPF");
				$("div#erroAddCliente").show();
			}
		}
		$("form#formEditarCliente").submit(function(){
			clearBordasVermelhas($(this));
			return (validaTXT($("input#nome")) && validaTXT($("input#cpf")));
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
		<th>Cadastro » <s:property value="cliente.nome" /></th>
	</tr>
	<tr>
		<td class="linhaMedia"></td>
	</tr>
	<tr>
		<td>
			<s:form id="formEditarCliente" action="editarCliente" method="post">
				<s:hidden name="cliente.id" />
				<s:hidden name="cliente.dataCadastro" />
				<table class="formAdd">
					<tr><td class="linhaPequena"></td></tr>
					<tr>
						<td>
							<span id="erroAddCliente" class="error hidden"></span>
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
						<td><s:textfield id="nome" name="cliente.nome" cssClass="grande" /></td>
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
									<td><s:select name="cliente.sexoStr" value="cliente.sexo" cssClass="pequeno" list="sexos" listKey="value" listValue="valor" /></td>
									<td></td>
									<td><s:textfield id="cpf" cssClass="pequeno cpf" name="cliente.cpf" /></td>
									<td></td>
									<td><input type="text" class="pequeno data" name="cliente.dataNascimentoStr" value="<s:date name="cliente.dataNascimento" format="dd/MM/yyyy" />" /></td>
									<td></td>
									<td><s:textfield cssClass="pequeno" name="cliente.email" /></td>
								</tr>
							</table>
						</td>
					</tr>
					<tr>
						<td>
							<table>
								<tr>
									<td><label>Estado Civil:</label></td>
									<td>&nbsp;&nbsp;</td>
									<td><label>Fone Fixo:</label></td>
									<td>&nbsp;&nbsp;</td>
									<td><label>Fone Celular:</label></td>
									<td>&nbsp;&nbsp;</td>
									<td><label>Profissão:</label></td>
								</tr>
								<tr>
									<td><s:select name="cliente.estadoCivilStr" value="cliente.estadoCivil" cssClass="pequeno" list="estadosCivil" listKey="value" listValue="valor" /></td>
									<td></td>
									<td><s:textfield cssClass="pequeno fone" name="cliente.foneFixo" /></td>
									<td></td>
									<td><s:textfield cssClass="pequeno fone" name="cliente.foneCelular" /></td>
									<td></td>
									<td><s:textfield cssClass="pequeno" name="cliente.profissao" /></td>
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
									<td><s:textfield id="cep" cssClass="pequeno cep" name="cliente.endereco.cep" /></td>
									<td></td>
									<td><s:textfield cssClass="pequeno" name="cliente.endereco.numero" /></td>
									<td></td>
									<td><s:textfield cssClass="medio" name="cliente.endereco.complemento" /></td>
								</tr>
							</table>
						</td>
					</tr>
					<tr>
						<td><label>Logradouro:</label></td>
					</tr>
					<tr>
						<td><s:textfield name="cliente.endereco.logradouro" id="logradouro" cssClass="grande" /></td>
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
									<td><s:textfield cssClass="pequeno" id="bairro" name="cliente.endereco.bairro" /></td>
									<td></td>
									<td><s:textfield cssClass="pequeno" id="cidade" name="cliente.endereco.cidade" /></td>
									<td></td>
									<td><s:textfield cssClass="sigla" id="uf" maxlength="2" name="cliente.endereco.uf" /></td>
								</tr>
							</table>
						</td>
					</tr>
						
						
						<tr><td class="linhaMedia"></td></tr>
						<tr>
							<td class="header">Informações adicionais</td>
						</tr>
						<tr><td class="linhaPequena"></td></tr>
						<tr>
							<td>
								<s:radio list="formasConhecimento" name="cliente.conhecimentoStudio" listKey="nome" listValue="nome" id="radioForma" cssClass="radioConhecimento" ></s:radio>
								<div style="float:right">
									<s:textfield name="param" id="outro" cssClass="medio hidden" />
								</div>
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