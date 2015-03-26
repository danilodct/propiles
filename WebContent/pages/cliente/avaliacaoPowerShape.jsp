<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>

<div class="subtitulo-avaliacao">AVALIAÇÃO POWER SHAPE</div>

<jsp:include page="avaliacao.jsp" />

<div class="subtitulo-avaliacao">EXAME FÍSICO</div>
<div class="area-grande">
	<s:textarea name="cadastro.avaliacao.exameFisico" ></s:textarea>
</div>

<div class="area-grande">
	<label>Gordura Localizada:</label>
	<s:textarea name="avaliacaoPowerShape.gorduraLocalizada" ></s:textarea>
</div>

<div class="subtitulo-avaliacao">PERIMETRIA (cm):</div>
<div class="area-grande">
	<table>
		<tr>
			<th></th>
			<th>Avaliação:</th>
			<th>Perda:</th>
		</tr>
		<tr>
			<td align="right" valign="top">Mama:</td>
			<td style="width:360px;"><s:textfield name="avaliacaoPowerShape.mamaAvaliacao" cssStyle="width:360px;margin-right:10px;" />
				<s:textfield name="avaliacaoPowerShape.mamaAvaliacao2" cssStyle="width:360px;margin-right:10px;" />
				<s:textfield name="avaliacaoPowerShape.mamaAvaliacao3" cssStyle="width:360px;margin-right:10px;" />
				<s:textfield name="avaliacaoPowerShape.mamaAvaliacao4" cssStyle="width:360px;margin-right:10px;" />
				<s:textfield name="avaliacaoPowerShape.mamaAvaliacao5" cssStyle="width:360px;margin-right:10px;" /></td>
			<td valign="top"><s:textfield name="avaliacaoPowerShape.mamaPerda" cssStyle="width:80px" /></td>
		</tr>
		<tr>
			<td align="right" valign="top">Esterno:</td>
			<td style="width:360px;"><s:textfield name="avaliacaoPowerShape.esternoAvaliacao" cssStyle="width:360px;margin-right:10px;" />
				<s:textfield name="avaliacaoPowerShape.esternoAvaliacao2" cssStyle="width:360px;margin-right:10px;" />
				<s:textfield name="avaliacaoPowerShape.esternoAvaliacao3" cssStyle="width:360px;margin-right:10px;" />
				<s:textfield name="avaliacaoPowerShape.esternoAvaliacao4" cssStyle="width:360px;margin-right:10px;" />
				<s:textfield name="avaliacaoPowerShape.esternoAvaliacao5" cssStyle="width:360px;margin-right:10px;" /></td>
			<td valign="top"><s:textfield name="avaliacaoPowerShape.esternoPerda" cssStyle="width:80px" /></td>
		</tr>
		<tr>
			<td align="right" valign="top">Cintura:</td>
			<td style="width:360px;"><s:textfield name="avaliacaoPowerShape.cinturaAvaliacao" cssStyle="width:360px;margin-right:10px;" />
				<s:textfield name="avaliacaoPowerShape.cinturaAvaliacao2" cssStyle="width:360px;margin-right:10px;" />
				<s:textfield name="avaliacaoPowerShape.cinturaAvaliacao3" cssStyle="width:360px;margin-right:10px;" />
				<s:textfield name="avaliacaoPowerShape.cinturaAvaliacao4" cssStyle="width:360px;margin-right:10px;" />
				<s:textfield name="avaliacaoPowerShape.cinturaAvaliacao5" cssStyle="width:360px;margin-right:10px;" /></td>
			<td valign="top"><s:textfield name="avaliacaoPowerShape.cinturaPerda" cssStyle="width:80px" /></td>
		</tr>
		<tr>
			<td align="right" valign="top">Cicatriz Umbilical:</td>
			<td style="width:360px;"><s:textfield name="avaliacaoPowerShape.cicatrizUmbilicalAvaliacao" cssStyle="width:360px;margin-right:10px;" />
				<s:textfield name="avaliacaoPowerShape.cicatrizUmbilicalAvaliacao2" cssStyle="width:360px;margin-right:10px;" />
				<s:textfield name="avaliacaoPowerShape.cicatrizUmbilicalAvaliacao3" cssStyle="width:360px;margin-right:10px;" />
				<s:textfield name="avaliacaoPowerShape.cicatrizUmbilicalAvaliacao4" cssStyle="width:360px;margin-right:10px;" />
				<s:textfield name="avaliacaoPowerShape.cicatrizUmbilicalAvaliacao5" cssStyle="width:360px;margin-right:10px;" /></td>
			<td valign="top"><s:textfield name="avaliacaoPowerShape.cicatrizUmbilicalPerda" cssStyle="width:80px" /></td>
		</tr>
		<tr>
			<td align="right" valign="top">Crista Ilíaca:</td>
			<td style="width:360px;"><s:textfield name="avaliacaoPowerShape.cristaIliacaAvaliacao" cssStyle="width:360px;margin-right:10px;" />
				<s:textfield name="avaliacaoPowerShape.cristaIliacaAvaliacao2" cssStyle="width:360px;margin-right:10px;" />
				<s:textfield name="avaliacaoPowerShape.cristaIliacaAvaliacao3" cssStyle="width:360px;margin-right:10px;" />
				<s:textfield name="avaliacaoPowerShape.cristaIliacaAvaliacao4" cssStyle="width:360px;margin-right:10px;" />
				<s:textfield name="avaliacaoPowerShape.cristaIliacaAvaliacao5" cssStyle="width:360px;margin-right:10px;" /></td>
			<td valign="top"><s:textfield name="avaliacaoPowerShape.cristaIliacaPerda" cssStyle="width:80px" /></td>
		</tr>
		<tr>
			<td align="right" valign="top">Quadril:</td>
			<td style="width:360px;"><s:textfield name="avaliacaoPowerShape.quadrilAvaliacao" cssStyle="width:360px;margin-right:10px;" />
				<s:textfield name="avaliacaoPowerShape.quadrilAvaliacao2" cssStyle="width:360px;margin-right:10px;" />
				<s:textfield name="avaliacaoPowerShape.quadrilAvaliacao3" cssStyle="width:360px;margin-right:10px;" />
				<s:textfield name="avaliacaoPowerShape.quadrilAvaliacao4" cssStyle="width:360px;margin-right:10px;" />
				<s:textfield name="avaliacaoPowerShape.quadrilAvaliacao5" cssStyle="width:360px;margin-right:10px;" /></td>
			<td valign="top"><s:textfield name="avaliacaoPowerShape.quadrilPerda" cssStyle="width:80px" /></td>
		</tr>
		<tr>
			<td align="right" valign="top">Prega glútea:</td>
			<td style="width:360px;"><s:textfield name="avaliacaoPowerShape.pregaGluteaAvaliacao" cssStyle="width:360px;margin-right:10px;" />
				<s:textfield name="avaliacaoPowerShape.pregaGluteaAvaliacao2" cssStyle="width:360px;margin-right:10px;" />
				<s:textfield name="avaliacaoPowerShape.pregaGluteaAvaliacao3" cssStyle="width:360px;margin-right:10px;" />
				<s:textfield name="avaliacaoPowerShape.pregaGluteaAvaliacao4" cssStyle="width:360px;margin-right:10px;" />
				<s:textfield name="avaliacaoPowerShape.pregaGluteaAvaliacao5" cssStyle="width:360px;margin-right:10px;" /></td>
			<td valign="top"><s:textfield name="avaliacaoPowerShape.pregaGluteaPerda" cssStyle="width:80px" /></td>
		</tr>
	</table>
</div>

<div class="subtitulo-avaliacao">ANOTACOES RELEVANTES:</div>
<div class="area-grande">
	<s:textarea name="cadastro.avaliacao.observacoes" ></s:textarea>
</div>

<div class="subtitulo-avaliacao">TRATAMENTO FISIOTERAPÊUTICO PROPOSTO:</div>
<div class="area-grande">
	<s:textarea name="cadastro.avaliacao.tratamento" ></s:textarea>
</div>
