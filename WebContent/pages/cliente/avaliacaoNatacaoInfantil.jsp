<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>

<div class="subtitulo-avaliacao">AVALIAÇÃO NATAÇÃO INFANTIL</div>

<jsp:include page="avaliacao.jsp" />

<div class="subtitulo-avaliacao">ANOTACOES RELEVANTES:</div>
<div class="area-grande">
	<s:textarea name="cadastro.avaliacao.observacoes" ></s:textarea>
</div>

<div class="subtitulo-avaliacao">TRATAMENTO FISIOTERAPÊUTICO PROPOSTO:</div>
<div class="area-grande">
	<s:textarea name="cadastro.avaliacao.tratamento" ></s:textarea>
</div>

<input type="hidden" name="avaliacaoNatacaoInfantil.dataStr" value="0000-00-00"/>