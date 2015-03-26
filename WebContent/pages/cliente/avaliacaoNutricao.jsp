<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>

<div class="subtitulo-avaliacao">AVALIAÇÃO NUTRIÇÃO</div>


<div class="area-terco">
	<label>Peso atual:</label>
	<input type="text" name="cadastro.avaliacao.pesoStr" class="decimal" value="<s:property value="avaliacaoNutricao.peso" />" />
</div>
<div class="area-terco">
	<label>Altura:</label>
	<input type="text" name="cadastro.avaliacao.alturaStr" class="decimal" value="<s:property value="avaliacaoNutricao.altura" />" />
</div>
<div class="area-terco">
	<label>Bíceps:</label>
	<s:textfield name="avaliacaoNutricao.biceps" cssClass=""  />
</div>
<div class="area-terco">
	<label>Fletido:</label>
	<s:textfield name="avaliacaoNutricao.fletido" cssClass=""  />
</div>
<div class="area-terco">
	<label>Peso máximo:</label>
	<s:textfield name="avaliacaoNutricao.pesoMax" cssClass="decimal"  />
</div>
<div class="area-terco">
	<label>IMC:</label>
	<s:textfield name="avaliacaoNutricao.imc" cssClass=""  />
</div>
<div class="area-terco">
	<label>Tríceps:</label>
	<s:textfield name="avaliacaoNutricao.triceps" cssClass=""  />
</div>
<div class="area-terco">
	<label>Axilar:</label>
	<s:textfield name="avaliacaoNutricao.axilar" cssClass=""  />
</div>
<div class="area-terco">
	<label>Peso mínimo:</label>
	<s:textfield name="avaliacaoNutricao.pesoMin" cssClass="decimal"  />
</div>
<div class="area-terco">
	<label>Cintura:</label>
	<s:textfield name="avaliacaoNutricao.cintura" cssClass=""  />
</div>
<div class="area-terco">
	<label>Subescapular:</label>
	<s:textfield name="avaliacaoNutricao.subescapular" cssClass=""  />
</div>
<div class="area-terco">
	<label>Abdominal:</label>
	<s:textfield name="avaliacaoNutricao.abdominal" cssClass=""  />
</div>
<div class="area-terco">
	<label>Peso desejado:</label>
	<s:textfield name="avaliacaoNutricao.pesoDesejado" cssClass="decimal"  />
</div>
<div class="area-terco">
	<label>Quadril:</label>
	<s:textfield name="avaliacaoNutricao.quadril" cssClass=""  />
</div>
<div class="area-terco">
	<label>Suprailiaca:</label>
	<s:textfield name="avaliacaoNutricao.suprailiaca" cssClass=""  />
</div>
<div class="area-terco">
	<label>Coxa:</label>
	<s:textfield name="avaliacaoNutricao.coxa" cssClass=""  />
</div>
<div class="area-terco">
	<label>Braço:</label>
	<s:textfield name="avaliacaoNutricao.branco" cssClass=""  />
</div>
<div class="area-terco">
	<label>Ante-braço:</label>
	<s:textfield name="avaliacaoNutricao.antebraco" cssClass=""  />
</div>
<div class="area-terco">
	<label>Peitoral:</label>
	<s:textfield name="avaliacaoNutricao.peitoral" cssClass=""  />
</div>
<div class="area-terco">
	<label>Gordura (%):</label>
	<s:textfield name="avaliacaoNutricao.gordura" cssClass=""  />
</div>

<div class="area-grande">
	<label>Qual tipo de exercícios que você pratica? </label>
	<s:textfield name="avaliacaoNutricao.exercicio" cssClass=""  />
</div>

<div class="area-grande">
	<label>Qual a frequência e duração?</label>
	<s:textfield name="avaliacaoNutricao.frequenciaExercicio" cssClass=""  />
</div>

<div class="area-grande">
	<label>Faz algum tratamento médico?</label>
	<input type="checkbox" name="avaliacaoNutricao.fazTratamentoStr" <s:if test="avaliacaoNutricao.fazTratamento">checked="checked"</s:if> /> SIM
	<input type="checkbox" name="" <s:if test="!avaliacaoNutricao.fazTratamento">checked="checked"</s:if> /> NÃO
</div>

<div class="area-grande">
	<label>Como é seu sono?</label>
	<input type="checkbox" name="avaliacaoNutricao.sonoTranquiloStr" <s:if test="avaliacaoNutricao.sonoTranquilo">checked="checked"</s:if> /> Tranquilo
	<input type="checkbox" name="" <s:if test="!avaliacaoNutricao.sonoTranquilo">checked="checked"</s:if> /> Agitado
</div>

<div class="area-grande">
	<label>Quantas horas de sono?</label>
	<s:textfield name="avaliacaoNutricao.horasSono" cssClass=""  />
</div>

<div class="area-grande">
	<label>Se acha compulsivo em relação à comida?</label>
	<input type="checkbox" name="avaliacaoNutricao.achaCompulsivoStr" <s:if test="avaliacaoNutricao.achaCompulsivo">checked="checked"</s:if> /> SIM
	<input type="checkbox" name="" <s:if test="!avaliacaoNutricao.achaCompulsivo">checked="checked"</s:if> /> NÃO
</div>

<div class="area-grande">
	<label>Sente vontade de "comer doce" no final da tarde ou a noite?</label>
	<input type="checkbox" name="avaliacaoNutricao.vontadeComerDoceStr" <s:if test="avaliacaoNutricao.vontadeComerDoce">checked="checked"</s:if> /> SIM
	<input type="checkbox" name="" <s:if test="!avaliacaoNutricao.vontadeComerDoce">checked="checked"</s:if> /> NÃO
</div>

<div class="area-grande">
	<label>Sente cançaso com frequência?</label>
	<input type="checkbox" name="avaliacaoNutricao.cansacoStr" <s:if test="avaliacaoNutricao.cansaco">checked="checked"</s:if> /> SIM
	<input type="checkbox" name="" <s:if test="!avaliacaoNutricao.cansaco">checked="checked"</s:if> /> NÃO
</div>

<div class="area-grande">
	<label>Em que momento?</label>
	<s:textfield name="avaliacaoNutricao.cansacoMomento" cssClass=""  />
</div>

<div class="area-grande">
	<label>Usa algum suplemento? Qual(is)?</label>
	<s:textfield name="avaliacaoNutricao.suplemento" cssClass=""  />
</div>

<div class="area-grande">
	<label>Seu peso se alterou nos últimos 3 meses? Você sabe por que?</label>
	<s:textfield name="avaliacaoNutricao.alterouPeso" cssClass=""  />
</div>

<div class="area-grande">
	<label>Intestino:</label>
	<input type="checkbox" name="avaliacaoNutricao.intestinoPresoStr" <s:if test="avaliacaoNutricao.intestinoPreso">checked="checked"</s:if> /> CONSTIPADO (PRESO)
	<input type="checkbox" name="" <s:if test="!avaliacaoNutricao.intestinoPreso">checked="checked"</s:if> /> NORMAL
</div>

<div class="subtitulo-avaliacao">DÊ EXEMPLO DO QUE CONSUMIU ONTEM (COLOQUE QUANTIDADE E O QUE COMEU):</div>

<div class="area-grande">
	<label>Café da manhã:</label>
	<s:textfield name="avaliacaoNutricao.consumoCafe" cssClass=""  />
</div>

<div class="area-grande">
	<label>Lanche:</label>
	<s:textfield name="avaliacaoNutricao.consumoLanche1" cssClass=""  />
</div>

<div class="area-grande">
	<label>Almoço:</label>
	<s:textfield name="avaliacaoNutricao.consumoAlmoco" cssClass=""  />
</div>

<div class="area-grande">
	<label>Lanche:</label>
	<s:textfield name="avaliacaoNutricao.consumoLanche2" cssClass=""  />
</div>

<div class="area-grande">
	<label>Jantar:</label>
	<s:textfield name="avaliacaoNutricao.consumoJantar" cssClass=""  />
</div>

<div class="area-grande">
	<label>Lanche:</label>
	<s:textfield name="avaliacaoNutricao.consumoLanche3" cssClass=""  />
</div>

<div class="subtitulo-avaliacao">ANOTAÇÕES:</div>
<div class="area-grande">
	<s:textarea name="cadastro.avaliacao.observacoes" ></s:textarea>
</div>

<div class="subtitulo-avaliacao">TRATAMENTO:</div>
<div class="area-grande">
	<s:textarea name="cadastro.avaliacao.tratamento" ></s:textarea>
</div>
