<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>

<div class="subtitulo-avaliacao">AVALIAÇÃO GESTANTE</div>

<jsp:include page="avaliacao.jsp" />

<div class="area-terca">
	<label>Número de semanas</label>
	<s:textarea name="avaliacaoGestante.numeroSemanas" ></s:textarea>
</div>
<div class="area-terca">
	<label>Médico acompanhante</label>
	<s:textarea name="avaliacaoGestante.medicoAcompanhante" ></s:textarea>
</div>

<div class="subtitulo-avaliacao">EXAME FÍSICO</div>
<div class="area-grande">
	<s:textarea name="cadastro.avaliacao.exameFisico" ></s:textarea>
</div>

<div class="area-grande">
	<label>MID</label>
	<s:textarea name="avaliacaoGestante.mid" ></s:textarea>
</div>
<div class="area-grande">
	<label>MIE</label>
	<s:textarea name="avaliacaoGestante.mie" ></s:textarea>
</div>

<div class="subtitulo-avaliacao">ANOTACOES RELEVANTES:</div>
<div class="area-grande">
	<s:textarea name="cadastro.avaliacao.observacoes" ></s:textarea>
</div>

<div class="subtitulo-avaliacao">TRATAMENTO FISIOTERAPÊUTICO PROPOSTO:</div>
<div class="area-grande">
	<s:textarea name="cadastro.avaliacao.tratamento" ></s:textarea>
</div>
