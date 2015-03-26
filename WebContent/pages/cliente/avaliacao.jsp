<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>

<table class="formAdd">
	<tr>
		<td class="header">Ficha de Avaliação</td>
	</tr>
	<tr>
		<td class="linhaPequena"></td>
	</tr>
	<tr>
	<td align="left">
	
	
	
<div class="subtitulo-avaliacao">ANAMNESE</div>
<div class="area-grande">
	<label>Motivo da consulta / Queixa principal:</label>
	<s:textarea name="cadastro.avaliacao.objetivo"></s:textarea>
</div>
<div class="area-terco">
	<label>Peso:</label>
	<s:textfield name="cadastro.avaliacao.peso" cssClass="decimal"  />
</div>
<div class="area-terco">
	<label>Altura:</label>
	<s:textfield name="cadastro.avaliacao.altura" cssClass="decimal" />
</div>
<div class="area-terco">
	<label>PA:</label>
	<s:textfield name="cadastro.avaliacao.pa"  />
</div>
<div class="area-terco">
	<label>Atividade física:</label>
	<input type="checkbox" name="cadastro.avaliacao.atividadeFisicaStr" <s:if test="cadastro.avaliacao.atividadeFisica">checked="checked"</s:if> />
</div>
<div class="area-terco">
	<label>Dorme bem:</label>
	<input type="checkbox" name="cadastro.avaliacao.dormeBemStr" <s:if test="cadastro.avaliacao.dormeBem">checked="checked"</s:if>  />
</div>
<div class="area-terco">
	<label>Fuma:</label>
	<input type="checkbox" name="cadastro.avaliacao.tabagismoStr" <s:if test="cadastro.avaliacao.tabagismo">checked="checked"</s:if>  />
</div>
<div class="area-terco">
	<label>Alcólico:</label>
	<input type="checkbox" name="cadastro.avaliacao.alcolicoStr" <s:if test="cadastro.avaliacao.alcolico">checked="checked"</s:if>  />
</div>
<div class="area-terco">
	<label>Diabetes:</label>
	<input type="checkbox" name="cadastro.avaliacao.diabetesStr" <s:if test="cadastro.avaliacao.diabetes">checked="checked"</s:if>  />
</div>
<div class="area-terco">
	<label>Hipertensão:</label>
	<input type="checkbox" name="cadastro.avaliacao.hipertensaoStr" <s:if test="cadastro.avaliacao.hipertensao">checked="checked"</s:if>  />
</div>
<div class="area-grande">
	<label>Cuidados faciais habituais (que tipo e frequência):</label>
	<s:textfield  name="cadastro.avaliacao.cuidadosFaciais" />
</div>
<div class="area-grande">
	<label>Cuidados corporais habituais (que tipo e frequência):</label>
	<s:textfield  name="cadastro.avaliacao.cuidadosCorporais" />
</div>
<div class="area-grande">
	<label>Medicação habitual:</label>
	<s:textfield  name="cadastro.avaliacao.medicacao" />
</div>
<div class="area-grande">
	<label>Alterações hormonais (não; sim, qual?):</label>
	<s:textfield  name="cadastro.avaliacao.alteracaoHormonal" />
</div>
<div class="area-grande">
	<label>Alergias (não; sim, qual?):</label>
	<s:textfield  name="cadastro.avaliacao.alergias" />
</div>
<div class="area-terco">
	<label>Propensão a queloides:</label>
	<input type="checkbox" name="cadastro.avaliacao.queloidesStr" <s:if test="cadastro.avaliacao.queloides">checked="checked"</s:if>   />
</div>
<div class="area-grande">
	<label>Próteses metálicas:</label>
	<s:textfield  name="cadastro.avaliacao.proteseMetalica" />
</div>

<div class="subtitulo-avaliacao">ANTECEDENTES FAMILIARES</div>
<div class="area-grande">
	<s:textarea name="cadastro.avaliacao.antecedentes" ></s:textarea>
</div>

<div class="subtitulo-avaliacao">HISTÓRIA GINECOLÓGICA</div>
<div class="area-grande">
	<label>Tensão pré-menstrual:</label>
	<s:textfield  name="cadastro.avaliacao.tensaoPremenstrual" />
</div>
<div class="area-grande">
	<label>Quantidade de G/ P/ A:</label>
	<s:textfield  name="cadastro.avaliacao.quantidadeGPA" />
</div>
<div class="area-grande">
	<label>Método anticonceptivo:</label>
	<s:textfield  name="cadastro.avaliacao.anticonceptivo" />
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
			<td style="width:360px;"><s:textfield name="cadastro.avaliacao.mamaAvaliacao" cssStyle="width:360px;margin-right:10px;" />
				<s:textfield name="cadastro.avaliacao.mamaAvaliacao2" cssStyle="width:360px;margin-right:10px;" />
				<s:textfield name="cadastro.avaliacao.mamaAvaliacao3" cssStyle="width:360px;margin-right:10px;" />
				<s:textfield name="cadastro.avaliacao.mamaAvaliacao4" cssStyle="width:360px;margin-right:10px;" />
				<s:textfield name="cadastro.avaliacao.mamaAvaliacao5" cssStyle="width:360px;margin-right:10px;" /></td>
			<td valign="top"><s:textfield name="cadastro.avaliacao.mamaPerda" cssStyle="width:80px" /></td>
		</tr>
		<tr>
			<td align="right" valign="top">Esterno:</td>
			<td style="width:360px;"><s:textfield name="cadastro.avaliacao.esternoAvaliacao" cssStyle="width:360px;margin-right:10px;" />
				<s:textfield name="cadastro.avaliacao.esternoAvaliacao2" cssStyle="width:360px;margin-right:10px;" />
				<s:textfield name="cadastro.avaliacao.esternoAvaliacao3" cssStyle="width:360px;margin-right:10px;" />
				<s:textfield name="cadastro.avaliacao.esternoAvaliacao4" cssStyle="width:360px;margin-right:10px;" />
				<s:textfield name="cadastro.avaliacao.esternoAvaliacao5" cssStyle="width:360px;margin-right:10px;" /></td>
			<td valign="top"><s:textfield name="cadastro.avaliacao.esternoPerda" cssStyle="width:80px" /></td>
		</tr>
		<tr>
			<td align="right" valign="top">Cintura:</td>
			<td style="width:360px;"><s:textfield name="cadastro.avaliacao.cinturaAvaliacao" cssStyle="width:360px;margin-right:10px;" />
				<s:textfield name="cadastro.avaliacao.cinturaAvaliacao2" cssStyle="width:360px;margin-right:10px;" />
				<s:textfield name="cadastro.avaliacao.cinturaAvaliacao3" cssStyle="width:360px;margin-right:10px;" />
				<s:textfield name="cadastro.avaliacao.cinturaAvaliacao4" cssStyle="width:360px;margin-right:10px;" />
				<s:textfield name="cadastro.avaliacao.cinturaAvaliacao5" cssStyle="width:360px;margin-right:10px;" /></td>
			<td valign="top"><s:textfield name="cadastro.avaliacao.cinturaPerda" cssStyle="width:80px" /></td>
		</tr>
		<tr>
			<td align="right" valign="top">Cicatriz Umbilical:</td>
			<td style="width:360px;"><s:textfield name="cadastro.avaliacao.cicatrizUmbilicalAvaliacao" cssStyle="width:360px;margin-right:10px;" />
				<s:textfield name="cadastro.avaliacao.cicatrizUmbilicalAvaliacao2" cssStyle="width:360px;margin-right:10px;" />
				<s:textfield name="cadastro.avaliacao.cicatrizUmbilicalAvaliacao3" cssStyle="width:360px;margin-right:10px;" />
				<s:textfield name="cadastro.avaliacao.cicatrizUmbilicalAvaliacao4" cssStyle="width:360px;margin-right:10px;" />
				<s:textfield name="cadastro.avaliacao.cicatrizUmbilicalAvaliacao5" cssStyle="width:360px;margin-right:10px;" /></td>
			<td valign="top"><s:textfield name="cadastro.avaliacao.cicatrizUmbilicalPerda" cssStyle="width:80px" /></td>
		</tr>
		<tr>
			<td align="right" valign="top">Crista Ilíaca:</td>
			<td style="width:360px;"><s:textfield name="cadastro.avaliacao.cristaIliacaAvaliacao" cssStyle="width:360px;margin-right:10px;" />
				<s:textfield name="cadastro.avaliacao.cristaIliacaAvaliacao2" cssStyle="width:360px;margin-right:10px;" />
				<s:textfield name="cadastro.avaliacao.cristaIliacaAvaliacao3" cssStyle="width:360px;margin-right:10px;" />
				<s:textfield name="cadastro.avaliacao.cristaIliacaAvaliacao4" cssStyle="width:360px;margin-right:10px;" />
				<s:textfield name="cadastro.avaliacao.cristaIliacaAvaliacao5" cssStyle="width:360px;margin-right:10px;" /></td>
			<td valign="top"><s:textfield name="cadastro.avaliacao.cristaIliacaPerda" cssStyle="width:80px" /></td>
		</tr>
		<tr>
			<td align="right" valign="top">Quadril:</td>
			<td style="width:360px;"><s:textfield name="cadastro.avaliacao.quadrilAvaliacao" cssStyle="width:360px;margin-right:10px;" />
				<s:textfield name="cadastro.avaliacao.quadrilAvaliacao2" cssStyle="width:360px;margin-right:10px;" />
				<s:textfield name="cadastro.avaliacao.quadrilAvaliacao3" cssStyle="width:360px;margin-right:10px;" />
				<s:textfield name="cadastro.avaliacao.quadrilAvaliacao4" cssStyle="width:360px;margin-right:10px;" />
				<s:textfield name="cadastro.avaliacao.quadrilAvaliacao5" cssStyle="width:360px;margin-right:10px;" /></td>
			<td valign="top"><s:textfield name="cadastro.avaliacao.quadrilPerda" cssStyle="width:80px" /></td>
		</tr>
		<tr>
			<td align="right" valign="top">Prega glútea:</td>
			<td style="width:360px;"><s:textfield name="cadastro.avaliacao.pregaGluteaAvaliacao" cssStyle="width:360px;margin-right:10px;" />
				<s:textfield name="cadastro.avaliacao.pregaGluteaAvaliacao2" cssStyle="width:360px;margin-right:10px;" />
				<s:textfield name="cadastro.avaliacao.pregaGluteaAvaliacao3" cssStyle="width:360px;margin-right:10px;" />
				<s:textfield name="cadastro.avaliacao.pregaGluteaAvaliacao4" cssStyle="width:360px;margin-right:10px;" />
				<s:textfield name="cadastro.avaliacao.pregaGluteaAvaliacao5" cssStyle="width:360px;margin-right:10px;" /></td>
			<td valign="top"><s:textfield name="cadastro.avaliacao.pregaGluteaPerda" cssStyle="width:80px" /></td>
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


</td>
</tr>
</table>