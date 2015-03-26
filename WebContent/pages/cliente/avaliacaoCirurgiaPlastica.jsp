<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>

<div class="subtitulo-avaliacao">AVALIAÇÃO CIRURGIA PLÁSTICA</div>

<jsp:include page="avaliacao.jsp" />

<div class="subtitulo-avaliacao">EXAME FÍSICO</div>
<div class="area-grande">
	<s:textarea name="cadastro.avaliacao.exameFisico" ></s:textarea>
</div>

<div class="area-grande">
	<label>Cirurgia Plástica</label>
	<s:textarea name="avaliacaoCirurgiaPlastica.cirurgiaPlastica" ></s:textarea>
</div>
<div class="area-grande">
	<label>Médico acompanhante</label>
	<s:textarea name="avaliacaoCirurgiaPlastica.medicoAcompanhante" ></s:textarea>
</div>
<div class="area-grande">
	<label>Ato cirúrgico</label>
	<s:textarea name="avaliacaoCirurgiaPlastica.atoCirurgico" ></s:textarea>
</div>
<div class="area-grande">
	<label>Edema</label>
	<s:textarea name="avaliacaoCirurgiaPlastica.edema" ></s:textarea>
</div>
<div class="area-grande">
	<label>Equimose</label>
	<s:textarea name="avaliacaoCirurgiaPlastica.equimose" ></s:textarea>
</div>
<div class="area-grande">
	<label>Fibrose</label>
	<s:textarea name="avaliacaoCirurgiaPlastica.fibrose" ></s:textarea>
</div>
<div class="area-grande">
	<label>FPO</label>
	<s:textarea name="avaliacaoCirurgiaPlastica.fpo" ></s:textarea>
</div>
<div class="area-grande">
	<label>Seroma</label>
	<s:textarea name="avaliacaoCirurgiaPlastica.seroma" ></s:textarea>
</div>
<div class="area-grande">
	<label>DescenciaCirurgica</label>
	<s:textarea name="avaliacaoCirurgiaPlastica.descenciaCirurgica" ></s:textarea>
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
			<td style="width:360px;"><s:textfield name="avaliacaoCirurgiaPlastica.mamaAvaliacao" cssStyle="width:360px;margin-right:10px;" />
				<s:textfield name="avaliacaoCirurgiaPlastica.mamaAvaliacao2" cssStyle="width:360px;margin-right:10px;" />
				<s:textfield name="avaliacaoCirurgiaPlastica.mamaAvaliacao3" cssStyle="width:360px;margin-right:10px;" />
				<s:textfield name="avaliacaoCirurgiaPlastica.mamaAvaliacao4" cssStyle="width:360px;margin-right:10px;" />
				<s:textfield name="avaliacaoCirurgiaPlastica.mamaAvaliacao5" cssStyle="width:360px;margin-right:10px;" /></td>
			<td valign="top"><s:textfield name="avaliacaoCirurgiaPlastica.mamaPerda" cssStyle="width:80px" /></td>
		</tr>
		<tr>
			<td align="right" valign="top">Esterno:</td>
			<td style="width:360px;"><s:textfield name="avaliacaoCirurgiaPlastica.esternoAvaliacao" cssStyle="width:360px;margin-right:10px;" />
				<s:textfield name="avaliacaoCirurgiaPlastica.esternoAvaliacao2" cssStyle="width:360px;margin-right:10px;" />
				<s:textfield name="avaliacaoCirurgiaPlastica.esternoAvaliacao3" cssStyle="width:360px;margin-right:10px;" />
				<s:textfield name="avaliacaoCirurgiaPlastica.esternoAvaliacao4" cssStyle="width:360px;margin-right:10px;" />
				<s:textfield name="avaliacaoCirurgiaPlastica.esternoAvaliacao5" cssStyle="width:360px;margin-right:10px;" /></td>
			<td valign="top"><s:textfield name="avaliacaoCirurgiaPlastica.esternoPerda" cssStyle="width:80px" /></td>
		</tr>
		<tr>
			<td align="right" valign="top">Cintura:</td>
			<td style="width:360px;"><s:textfield name="avaliacaoCirurgiaPlastica.cinturaAvaliacao" cssStyle="width:360px;margin-right:10px;" />
				<s:textfield name="avaliacaoCirurgiaPlastica.cinturaAvaliacao2" cssStyle="width:360px;margin-right:10px;" />
				<s:textfield name="avaliacaoCirurgiaPlastica.cinturaAvaliacao3" cssStyle="width:360px;margin-right:10px;" />
				<s:textfield name="avaliacaoCirurgiaPlastica.cinturaAvaliacao4" cssStyle="width:360px;margin-right:10px;" />
				<s:textfield name="avaliacaoCirurgiaPlastica.cinturaAvaliacao5" cssStyle="width:360px;margin-right:10px;" /></td>
			<td valign="top"><s:textfield name="avaliacaoCirurgiaPlastica.cinturaPerda" cssStyle="width:80px" /></td>
		</tr>
		<tr>
			<td align="right" valign="top">Cicatriz Umbilical:</td>
			<td style="width:360px;"><s:textfield name="avaliacaoCirurgiaPlastica.cicatrizUmbilicalAvaliacao" cssStyle="width:360px;margin-right:10px;" />
				<s:textfield name="avaliacaoCirurgiaPlastica.cicatrizUmbilicalAvaliacao2" cssStyle="width:360px;margin-right:10px;" />
				<s:textfield name="avaliacaoCirurgiaPlastica.cicatrizUmbilicalAvaliacao3" cssStyle="width:360px;margin-right:10px;" />
				<s:textfield name="avaliacaoCirurgiaPlastica.cicatrizUmbilicalAvaliacao4" cssStyle="width:360px;margin-right:10px;" />
				<s:textfield name="avaliacaoCirurgiaPlastica.cicatrizUmbilicalAvaliacao5" cssStyle="width:360px;margin-right:10px;" /></td>
			<td valign="top"><s:textfield name="avaliacaoCirurgiaPlastica.cicatrizUmbilicalPerda" cssStyle="width:80px" /></td>
		</tr>
		<tr>
			<td align="right" valign="top">Crista Ilíaca:</td>
			<td style="width:360px;"><s:textfield name="avaliacaoCirurgiaPlastica.cristaIliacaAvaliacao" cssStyle="width:360px;margin-right:10px;" />
				<s:textfield name="avaliacaoCirurgiaPlastica.cristaIliacaAvaliacao2" cssStyle="width:360px;margin-right:10px;" />
				<s:textfield name="avaliacaoCirurgiaPlastica.cristaIliacaAvaliacao3" cssStyle="width:360px;margin-right:10px;" />
				<s:textfield name="avaliacaoCirurgiaPlastica.cristaIliacaAvaliacao4" cssStyle="width:360px;margin-right:10px;" />
				<s:textfield name="avaliacaoCirurgiaPlastica.cristaIliacaAvaliacao5" cssStyle="width:360px;margin-right:10px;" /></td>
			<td valign="top"><s:textfield name="avaliacaoCirurgiaPlastica.cristaIliacaPerda" cssStyle="width:80px" /></td>
		</tr>
		<tr>
			<td align="right" valign="top">Quadril:</td>
			<td style="width:360px;"><s:textfield name="avaliacaoCirurgiaPlastica.quadrilAvaliacao" cssStyle="width:360px;margin-right:10px;" />
				<s:textfield name="avaliacaoCirurgiaPlastica.quadrilAvaliacao2" cssStyle="width:360px;margin-right:10px;" />
				<s:textfield name="avaliacaoCirurgiaPlastica.quadrilAvaliacao3" cssStyle="width:360px;margin-right:10px;" />
				<s:textfield name="avaliacaoCirurgiaPlastica.quadrilAvaliacao4" cssStyle="width:360px;margin-right:10px;" />
				<s:textfield name="avaliacaoCirurgiaPlastica.quadrilAvaliacao5" cssStyle="width:360px;margin-right:10px;" /></td>
			<td valign="top"><s:textfield name="avaliacaoCirurgiaPlastica.quadrilPerda" cssStyle="width:80px" /></td>
		</tr>
		<tr>
			<td align="right" valign="top">Prega glútea:</td>
			<td style="width:360px;"><s:textfield name="avaliacaoCirurgiaPlastica.pregaGluteaAvaliacao" cssStyle="width:360px;margin-right:10px;" />
				<s:textfield name="avaliacaoCirurgiaPlastica.pregaGluteaAvaliacao2" cssStyle="width:360px;margin-right:10px;" />
				<s:textfield name="avaliacaoCirurgiaPlastica.pregaGluteaAvaliacao3" cssStyle="width:360px;margin-right:10px;" />
				<s:textfield name="avaliacaoCirurgiaPlastica.pregaGluteaAvaliacao4" cssStyle="width:360px;margin-right:10px;" />
				<s:textfield name="avaliacaoCirurgiaPlastica.pregaGluteaAvaliacao5" cssStyle="width:360px;margin-right:10px;" /></td>
			<td valign="top"><s:textfield name="avaliacaoCirurgiaPlastica.pregaGluteaPerda" cssStyle="width:80px" /></td>
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
