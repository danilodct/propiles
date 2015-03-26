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
		setMaskNumerico("form#formEditarProduto");
		$("form#formEditarProduto").submit(function(){
			clearBordasVermelhas($(this));
			var validado = (validaTXT($("input#nome")));
			if(validado){
				tirarVirgulaPontos("form#formEditarProduto");
			}
			return validado;
		});
		$("a.cancelar").click(function(evt){
			evt.preventDefault();
			history.back();
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
		<th>Editar Produto</th>
	</tr>
	<tr>
		<td class="linhaMedia"></td>
	</tr>
	<tr>
		<td>
		<div class="formAdd">
			<fieldset>
				<legend>Editar Produto</legend> 
				<s:form id="formEditarProduto" action="editarProduto" method="post">
					<s:hidden name="produto.id" />
					<table class="formAdd">
						<tr><td class="linhaPequena"></td></tr>
						<tr>
							<td><label>Nome:</label></td>
						</tr>
						<tr>
							<td><s:textfield id="nome" name="produto.nome" cssClass="grande" /></td>
						</tr>
						<tr><td class="linhaMedia"></td></tr>
						<tr>
							<td>
								<table>
									<tr>
										<td><label>Categoria:</label></td>
										<td><label>Valor (R$):</label></td>
									</tr>
									<tr>
										<td><s:textfield id="categoria" name="produto.categoria" cssClass="medio" /></td>
										<td><s:textfield id="valor" name="produto.valorStr" cssClass="decimal medio" /></td>
									</tr>
								</table>
							</td>
						</tr>
						<tr><td class="linhaMedia"></td></tr>
						<tr>
							<td><s:submit value="salvar" cssClass="submit" /> <input type="button" class="cancelar submit" value="cancelar" /></td>
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
<s:include value="../geral/rodape.jsp" />
</body>
</html>