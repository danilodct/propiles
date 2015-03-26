<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>

<div class="subtitulo-avaliacao">AVALIAÇÃO GORDURA LOCALIZADA</div>

<jsp:include page="avaliacao.jsp" />

<div class="subtitulo-avaliacao">EXAME FÍSICO</div>
<div class="area-grande">
	<s:textarea name="cadastro.avaliacao.exameFisico" ></s:textarea>
</div>

<div class="area-grande">
	<label>Gordura Localizada:</label>
	<s:textarea name="avaliacaoGorduraLocalizada.gorduraLocalizada" ></s:textarea>
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
			<td style="width:360px;"><s:textfield name="avaliacaoGorduraLocalizada.mamaAvaliacao" cssStyle="width:360px;margin-right:10px;" />
				<s:textfield name="avaliacaoGorduraLocalizada.mamaAvaliacao2" cssStyle="width:360px;margin-right:10px;" />
				<s:textfield name="avaliacaoGorduraLocalizada.mamaAvaliacao3" cssStyle="width:360px;margin-right:10px;" />
				<s:textfield name="avaliacaoGorduraLocalizada.mamaAvaliacao4" cssStyle="width:360px;margin-right:10px;" />
				<s:textfield name="avaliacaoGorduraLocalizada.mamaAvaliacao5" cssStyle="width:360px;margin-right:10px;" /></td>
			<td valign="top"><s:textfield name="avaliacaoGorduraLocalizada.mamaPerda" cssStyle="width:80px" /></td>
		</tr>
		<tr>
			<td align="right" valign="top">Esterno:</td>
			<td style="width:360px;"><s:textfield name="avaliacaoGorduraLocalizada.esternoAvaliacao" cssStyle="width:360px;margin-right:10px;" />
				<s:textfield name="avaliacaoGorduraLocalizada.esternoAvaliacao2" cssStyle="width:360px;margin-right:10px;" />
				<s:textfield name="avaliacaoGorduraLocalizada.esternoAvaliacao3" cssStyle="width:360px;margin-right:10px;" />
				<s:textfield name="avaliacaoGorduraLocalizada.esternoAvaliacao4" cssStyle="width:360px;margin-right:10px;" />
				<s:textfield name="avaliacaoGorduraLocalizada.esternoAvaliacao5" cssStyle="width:360px;margin-right:10px;" /></td>
			<td valign="top"><s:textfield name="avaliacaoGorduraLocalizada.esternoPerda" cssStyle="width:80px" /></td>
		</tr>
		<tr>
			<td align="right" valign="top">Cintura:</td>
			<td style="width:360px;"><s:textfield name="avaliacaoGorduraLocalizada.cinturaAvaliacao" cssStyle="width:360px;margin-right:10px;" />
				<s:textfield name="avaliacaoGorduraLocalizada.cinturaAvaliacao2" cssStyle="width:360px;margin-right:10px;" />
				<s:textfield name="avaliacaoGorduraLocalizada.cinturaAvaliacao3" cssStyle="width:360px;margin-right:10px;" />
				<s:textfield name="avaliacaoGorduraLocalizada.cinturaAvaliacao4" cssStyle="width:360px;margin-right:10px;" />
				<s:textfield name="avaliacaoGorduraLocalizada.cinturaAvaliacao5" cssStyle="width:360px;margin-right:10px;" /></td>
			<td valign="top"><s:textfield name="avaliacaoGorduraLocalizada.cinturaPerda" cssStyle="width:80px" /></td>
		</tr>
		<tr>
			<td align="right" valign="top">Cicatriz Umbilical:</td>
			<td style="width:360px;"><s:textfield name="avaliacaoGorduraLocalizada.cicatrizUmbilicalAvaliacao" cssStyle="width:360px;margin-right:10px;" />
				<s:textfield name="avaliacaoGorduraLocalizada.cicatrizUmbilicalAvaliacao2" cssStyle="width:360px;margin-right:10px;" />
				<s:textfield name="avaliacaoGorduraLocalizada.cicatrizUmbilicalAvaliacao3" cssStyle="width:360px;margin-right:10px;" />
				<s:textfield name="avaliacaoGorduraLocalizada.cicatrizUmbilicalAvaliacao4" cssStyle="width:360px;margin-right:10px;" />
				<s:textfield name="avaliacaoGorduraLocalizada.cicatrizUmbilicalAvaliacao5" cssStyle="width:360px;margin-right:10px;" /></td>
			<td valign="top"><s:textfield name="avaliacaoGorduraLocalizada.cicatrizUmbilicalPerda" cssStyle="width:80px" /></td>
		</tr>
		<tr>
			<td align="right" valign="top">Crista Ilíaca:</td>
			<td style="width:360px;"><s:textfield name="avaliacaoGorduraLocalizada.cristaIliacaAvaliacao" cssStyle="width:360px;margin-right:10px;" />
				<s:textfield name="avaliacaoGorduraLocalizada.cristaIliacaAvaliacao2" cssStyle="width:360px;margin-right:10px;" />
				<s:textfield name="avaliacaoGorduraLocalizada.cristaIliacaAvaliacao3" cssStyle="width:360px;margin-right:10px;" />
				<s:textfield name="avaliacaoGorduraLocalizada.cristaIliacaAvaliacao4" cssStyle="width:360px;margin-right:10px;" />
				<s:textfield name="avaliacaoGorduraLocalizada.cristaIliacaAvaliacao5" cssStyle="width:360px;margin-right:10px;" /></td>
			<td valign="top"><s:textfield name="avaliacaoGorduraLocalizada.cristaIliacaPerda" cssStyle="width:80px" /></td>
		</tr>
		<tr>
			<td align="right" valign="top">Quadril:</td>
			<td style="width:360px;"><s:textfield name="avaliacaoGorduraLocalizada.quadrilAvaliacao" cssStyle="width:360px;margin-right:10px;" />
				<s:textfield name="avaliacaoGorduraLocalizada.quadrilAvaliacao2" cssStyle="width:360px;margin-right:10px;" />
				<s:textfield name="avaliacaoGorduraLocalizada.quadrilAvaliacao3" cssStyle="width:360px;margin-right:10px;" />
				<s:textfield name="avaliacaoGorduraLocalizada.quadrilAvaliacao4" cssStyle="width:360px;margin-right:10px;" />
				<s:textfield name="avaliacaoGorduraLocalizada.quadrilAvaliacao5" cssStyle="width:360px;margin-right:10px;" /></td>
			<td valign="top"><s:textfield name="avaliacaoGorduraLocalizada.quadrilPerda" cssStyle="width:80px" /></td>
		</tr>
		<tr>
			<td align="right" valign="top">Prega glútea:</td>
			<td style="width:360px;"><s:textfield name="avaliacaoGorduraLocalizada.pregaGluteaAvaliacao" cssStyle="width:360px;margin-right:10px;" />
				<s:textfield name="avaliacaoGorduraLocalizada.pregaGluteaAvaliacao2" cssStyle="width:360px;margin-right:10px;" />
				<s:textfield name="avaliacaoGorduraLocalizada.pregaGluteaAvaliacao3" cssStyle="width:360px;margin-right:10px;" />
				<s:textfield name="avaliacaoGorduraLocalizada.pregaGluteaAvaliacao4" cssStyle="width:360px;margin-right:10px;" />
				<s:textfield name="avaliacaoGorduraLocalizada.pregaGluteaAvaliacao5" cssStyle="width:360px;margin-right:10px;" /></td>
			<td valign="top"><s:textfield name="avaliacaoGorduraLocalizada.pregaGluteaPerda" cssStyle="width:80px" /></td>
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
