<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="java.util.Arrays"%>
<%@page import="java.util.List"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title><s:text name="TITULO_SISTEMA" /></title>
<link rel="stylesheet" type="text/css" href="css/lib/jquery.ui.all.css" />
<link rel="stylesheet" type="text/css" href="css/lib/styles.css" />
<script type="text/javascript" src="js/lib/jquery.1.3.2.js"></script>
<script type="text/javascript" src="js/lib/jquery.mask.js"></script>
<script type="text/javascript" src="js/lib/jquery.datepicker.js"></script>
<script type="text/javascript" src="js/lib/scripts.js"></script>
<script type="text/javascript">
$(document).ready(function() {
	setPaginaPrincipal();
	setMaskNumerico();
	setMaskDate("form#formInserirCadastro");
	$("input.data").datepicker();
	$("form#formInserirCadastro").submit(function(){
		tirarVirgulaPontos("form#formInserirCadastro");
		return true;
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
		<th>Configurações do caixa</th>
	</tr>
	<tr>
		<td class="linhaMedia"></td>
	</tr>
	<tr>
		<td>
		<div class="formAdd ">
			<fieldset>
				<legend>Editar configurações iniciais do caixa</legend> 
				<s:form id="formInserirCadastro" action="editarCaixa" method="post" enctype="multipart/form-data">
					<table class="formAdd">
						<tr><td class="linhaPequena"></td></tr>
						<tr>
							<td><label>Valor inicial do caixa:</label></td>
							<td><label>Valor referente à data:</label></td>
						</tr>
						<tr>
							<td><s:textfield name="configuracoes.caixaValorInicial" cssClass="medio decimal" /></td>
							<td><s:textfield name="configuracoes.caixaDataInicialStr" cssClass="medio data final" /></td>
						</tr>
						<tr><td class="linhaMedia"></td></tr>
						<tr>
							<td>
								<div id="divAvaliacoes">
								</div>
							</td>
						</tr>
						<tr><td class="linhaMedia"></td></tr>
						<tr>
							<td><s:submit value="salvar" cssClass="submit" /> </td>
						</tr>
					</table>
				</s:form>
			</fieldset>
		</div>
		</td>
	</tr>
</table>
</div>




<s:include value="../geral/rodape.jsp" />
</body>
</html>