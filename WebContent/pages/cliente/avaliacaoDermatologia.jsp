<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>

<div class="subtitulo-avaliacao">AVALIAÇÃO DERMATOLOGIA</div>

<div class="subtitulo-avaliacao">ANAMNESE</div>
<div class="area-grande">
	<label>Motivo da consulta / Queixa principal:</label>
	<s:textarea name="cadastro.avaliacao.objetivo"></s:textarea>
</div>

<div class="subtitulo-avaliacao">ANTECEDENTES FAMILIARES</div>
<div class="area-grande">
	<s:textarea name="cadastro.avaliacao.antecedentes" ></s:textarea>
</div>


<div class="subtitulo-avaliacao">EXAME FÍSICO</div>
<div class="area-grande">
	<s:textarea name="cadastro.avaliacao.exameFisico" ></s:textarea>
</div>

<div class="area-grande">
	<label>Aspectos da pele:</label>
	<s:textarea name="avaliacaoDermatologia.aspectosPele" ></s:textarea>
</div>

<div style="float:left; margin-top:10px;">
	<label>História pessoal de CA de pele:</label>
	<div class="clear"></div>
	<input type="checkbox" name="avaliacaoDermatologia.historiaStr" <s:if test="avaliacaoDermatologia.historia">checked="checked"</s:if>  /> Não
	<input type="checkbox" name="avaliacaoDermatologia.melanomaStr" <s:if test="avaliacaoDermatologia.melanoma">checked="checked"</s:if>  /> Melanoma
	<input type="checkbox" name="avaliacaoDermatologia.cancerPeleMelanomaStr" <s:if test="avaliacaoDermatologia.cancerPeleMelanoma">checked="checked"</s:if>  /> Câncer de pele não melanoma 
	<input type="checkbox" name="avaliacaoDermatologia.lesaoBenignaStr" <s:if test="avaliacaoDermatologia.lesaoBenigna">checked="checked"</s:if>  /> Lesão benigna excisada
</div>

<div style="float:left; margin-top:10px;">
	<label>História familiar (primeiro grau):</label>
	<div class="clear"></div>
	<input type="checkbox" name="avaliacaoDermatologia.historiaFamiliarStr" <s:if test="avaliacaoDermatologia.historiaFamiliar">checked="checked"</s:if>  /> Não
	<input type="checkbox" name="avaliacaoDermatologia.melanoma2Str" <s:if test="avaliacaoDermatologia.melanoma2">checked="checked"</s:if>  /> Melanoma
	<input type="checkbox" name="avaliacaoDermatologia.cancerPeleMelanoma2Str" <s:if test="avaliacaoDermatologia.cancerPeleMelanoma2">checked="checked"</s:if>  /> Câncer de pele não melanoma 
	<input type="checkbox" name="avaliacaoDermatologia.nevosStr" <s:if test="avaliacaoDermatologia.nevos">checked="checked"</s:if>  /> Nevos múltiplos
</div>

<div class="area-grande">
	<label>Fototipo (1, 2, 3, 4, 5, 6):</label>
	<s:textfield  name="avaliacaoDermatologia.fototipo" />
</div>

<div class="area-grande">
	<label>Cor dos olhos:</label>
	<div class="clear"></div>
	<input type="checkbox" name="avaliacaoDermatologia.azulStr" <s:if test="avaliacaoDermatologia.azul">checked="checked"</s:if>  /> Azul
	<input type="checkbox" name="avaliacaoDermatologia.verdeStr" <s:if test="avaliacaoDermatologia.verde">checked="checked"</s:if>  /> Verde ou cinza
	<input type="checkbox" name="avaliacaoDermatologia.marromStr" <s:if test="avaliacaoDermatologia.marrom">checked="checked"</s:if>  /> Marrom ou preto 
</div>

<div class="area-grande">
	<label>Pele fotodanificada:</label>
	<div class="clear"></div>
	<input type="checkbox" name="avaliacaoDermatologia.fotodanificadaStr" <s:if test="avaliacaoDermatologia.fotodanificada">checked="checked"</s:if> /> SIM
	<input type="checkbox" name="" <s:if test="!avaliacaoDermatologia.fotodanificada">checked="checked"</s:if> /> NÃO 
</div>

<div class="area-grande">
	<label>Presença de Lentigos ou efélides:</label>
	<div class="clear"></div>
	<input type="checkbox" name="avaliacaoDermatologia.lentigosStr" <s:if test="avaliacaoDermatologia.lentigos">checked="checked"</s:if> /> SIM
	<input type="checkbox" name="" <s:if test="!avaliacaoDermatologia.lentigos">checked="checked"</s:if> /> NÃO 
</div>

<div class="area-grande">
	<label>Número total de nevos (0-10, 11-50, 51-100, >100):</label>
	<s:textfield  name="avaliacaoDermatologia.numeroNevos" />
</div>

<div class="area-grande">
	<label>Número de nevos atípicos (>6mm, +1 assimetria, borda irregular, várias cores) (0, 1-5, >5):</label>
	<s:textfield  name="avaliacaoDermatologia.numeroNevosAtipicos" />
</div>

<div class="area-grande">
	<label>Intervenção:</label>
	<div class="clear"></div>
	<input type="checkbox" name="avaliacaoDermatologia.nenhumaStr" <s:if test="avaliacaoDermatologia.nenhuma">checked="checked"</s:if>  /> Nenhuma  
	<input type="checkbox" name="avaliacaoDermatologia.monitoramentoStr" <s:if test="avaliacaoDermatologia.monitoramento">checked="checked"</s:if>  /> Monitoramento  
	<input type="checkbox" name="avaliacaoDermatologia.excisaoStr" <s:if test="avaliacaoDermatologia.excisao">checked="checked"</s:if>  /> Excisão e biópsia 
</div>

<div class="area-terco">
	<label>Exame Físico:</label>
	<input type="file" class="medio" name="avaliacao" />
	<s:hidden name="avaliacaoDermatologia.avaliacao" /> 
	<br />
</div>
<div class="area-grande">
	<span class="error">Recomendo imagens com tamanho pequeno para evitar sobrecarga</span>
</div>
<s:if test="avaliacaoDermatologia.avaliacao != null && avaliacaoDermatologia.avaliacao != ''">
	<div class="area-terco">
		<label>Imagem atual:</label>
	</div>
	<div class="area-terco">
		<a target="_blank" href="img/avaliacoes/<s:property value="avaliacaoDermatologia.avaliacao" />">
			<img src="img/avaliacoes/<s:property value="avaliacaoDermatologia.avaliacao" />" style="max-width:100px; border:1px solid #ccc; padding: 1px;" />
		</a>		 
	</div>
</s:if>

<!-- 
<div class="area-grande">
	<label>Exame Físico:</label>
	<div class="clear"></div>
	<div style="width:750px; height: 296px; background-image: url('img/avaliacoes/quadro-exercicio-fisico-1.jpg'); clear: both; padding-top: 20px;">
		<div style="position: relative; width: 750px; height: 296px;">
			<input type="checkbox" name="avaliacaoDermatologia.frontalStr" <s:if test="avaliacaoDermatologia.frontal">checked="checked"</s:if> style="position:absolute; left: 80px;bottom: 45px;" />
			<input type="checkbox" name="avaliacaoDermatologia.posteriorStr" <s:if test="avaliacaoDermatologia.posterior">checked="checked"</s:if> style="position:absolute; left: 220px;bottom: 45px;" />
			<input type="checkbox" name="avaliacaoDermatologia.facePerfilStr" <s:if test="avaliacaoDermatologia.facePerfil">checked="checked"</s:if> style="position:absolute; left: 320px;bottom: 205px;" />
			<input type="checkbox" name="avaliacaoDermatologia.faceStr" <s:if test="avaliacaoDermatologia.face">checked="checked"</s:if> style="position:absolute; left: 320px;bottom: 100px;" />
			<input type="checkbox" name="avaliacaoDermatologia.plantarStr" <s:if test="avaliacaoDermatologia.plantar">checked="checked"</s:if> style="position:absolute; left: 430px;bottom: 150px;" />
			<input type="checkbox" name="avaliacaoDermatologia.pesStr" <s:if test="avaliacaoDermatologia.pes">checked="checked"</s:if> style="position:absolute; left: 470px;bottom: 90px;" />
			<input type="checkbox" name="avaliacaoDermatologia.maosStr" <s:if test="avaliacaoDermatologia.maos">checked="checked"</s:if> style="position:absolute; left: 640px;bottom: 30px;" />
			<input type="checkbox" name="avaliacaoDermatologia.palmarStr" <s:if test="avaliacaoDermatologia.palmar">checked="checked"</s:if> style="position:absolute; left: 640px;bottom: 190px;" />
		</div>
	</div>
</div>
 -->




<div class="subtitulo-avaliacao">ANOTACOES RELEVANTES:</div>
<div class="area-grande">
	<s:textarea name="cadastro.avaliacao.observacoes" ></s:textarea>
</div>

<div class="subtitulo-avaliacao">TRATAMENTO PROPOSTO:</div>
<div class="area-grande">
	<s:textarea name="cadastro.avaliacao.tratamento" ></s:textarea>
</div>
