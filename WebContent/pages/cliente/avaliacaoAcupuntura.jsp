<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<table class="formAdd">
	<tr>
		<td class="header">Ficha de Avaliação de Acupuntura</td>
	</tr>
	<tr>
		<td class="linhaPequena"></td>
	</tr>
	<tr>
		<td align="left"><jsp:include page="avaliacao.jsp" /></td>
	</tr>
	<tr>
		<td>
		<table>
			<tr>
				<td class="linhaGrande"></td>
			</tr>
			<tr>
				<th class="linhaPequena"><label>ASPECTO LOCAL</label></th>
			</tr>
			<tr>
				<td class="linhaMedia"></td>
			</tr>
			<tr>
				<td><label>Solicitação Médica</label></td>
			</tr>
			<tr>
				<td><s:textfield name="avaliacaoAcupuntura.solicitacaoMedica" cssClass="grande" /></td>
			</tr>
			<tr>
				<td class="linhaPequena"></td>
			</tr>
			<tr>
				<td><label>Qual o seu problema? Quando começou?</label></td>
			</tr>
			<tr>
				<td><s:textfield name="avaliacaoAcupuntura.problema" cssClass="grande" /></td>
			</tr>
			<tr>
				<td class="linhaPequena"></td>
			</tr>
			<tr>
				<td><label>O que você sente?</label></td>
			</tr>
			<tr>
				<td><s:textfield name="avaliacaoAcupuntura.queSente" cssClass="grande" /></td>
			</tr>
			<tr>
				<td class="linhaPequena"></td>
			</tr>
			<tr>
				<td><label>O que melhora sua dor? (frio, calor, vento, etc)</label></td>
			</tr>
			<tr>
				<td><s:textfield name="avaliacaoAcupuntura.queMelhoraDor" cssClass="grande" /></td>
			</tr>
			<tr>
				<td class="linhaPequena"></td>
			</tr>
			<tr>
				<td><label>O que piora?</label></td>
			</tr>
			<tr>
				<td><s:textfield name="avaliacaoAcupuntura.quePioraDor" cssClass="grande" /></td>
			</tr>
			<tr>
				<td class="linhaPequena"></td>
			</tr>
			<tr>
				<td><label>O que mais lhe incomoda?</label></td>
			</tr>
			<tr>
				<td><s:textfield name="avaliacaoAcupuntura.incomoda" cssClass="grande" /></td>
			</tr>
			<tr>
				<td class="linhaPequena"></td>
			</tr>
			<tr>
				<td><label>Faz uso de algum medicamento? Qual?</label></td>
			</tr>
			<tr>
				<td><s:textfield name="avaliacaoAcupuntura.medicamento" cssClass="grande" /></td>
			</tr>
			<tr>
				<td class="linhaPequena"></td>
			</tr>
			<tr>
				<td><label>Quais doenças você já teve?</label></td>
			</tr>
			<tr>
				<td><s:textfield name="avaliacaoAcupuntura.historicoDoenca" cssClass="grande" /></td>
			</tr>
			<tr>
				<td class="linhaPequena"></td>
			</tr>
			<tr>
				<td><label>Antecedentes familiares:</label></td>
			</tr>
			<tr>
				<td><s:textfield name="avaliacaoAcupuntura.antecendentes" cssClass="grande" /></td>
			</tr>
			<tr>
				<td class="linhaPequena"></td>
			</tr>
			<tr>
				<td><label>Já fez alguma cirurgia? Qual?</label></td>
			</tr>
			<tr>
				<td><s:textfield name="avaliacaoAcupuntura.cirurgia" cssClass="grande" /></td>
			</tr>
			<tr>
				<td class="linhaPequena"></td>
			</tr>
			<tr>
				<td><label>Como é sua respiração?</label></td>
			</tr>
			<tr>
				<td><s:textfield name="avaliacaoAcupuntura.respiracao" cssClass="grande" /></td>
			</tr>
			<tr>
				<td class="linhaPequena"></td>
			</tr>
			<tr>
				<td><label>Tem tosse, secreção, expectoração?</label></td>
			</tr>
			<tr>
				<td><s:textfield name="avaliacaoAcupuntura.tosse" cssClass="grande" /></td>
			</tr>
			<tr>
				<td class="linhaPequena"></td>
			</tr>
			<tr>
				<td><label>Algum problema de pele(P), mucosa(P), nos cabelos(R), unhas(F), ossos(R) e   dentes(R)?</label></td>
			</tr>
			<tr>
				<td><s:textfield name="avaliacaoAcupuntura.problemaPele" cssClass="grande" /></td>
			</tr>
			<tr>
				<td class="linhaPequena"></td>
			</tr>
			<tr>
				<td><label>Como está sua digestão e o funcionamento do intestino?</label></td>
			</tr>
			<tr>
				<td><s:textfield name="avaliacaoAcupuntura.digestao" cssClass="grande" /></td>
			</tr>
			<tr>
				<td class="linhaPequena"></td>
			</tr>
			<tr>
				<td><label>Algum problema circulatório?</label></td>
			</tr>
			<tr>
				<td><s:textfield name="avaliacaoAcupuntura.circulatorio" cssClass="grande" /></td>
			</tr>
			<tr>
				<td class="linhaPequena"></td>
			</tr>
			<tr>
				<td><label>Tem algum incômodo na cabeça, olhos (F), nariz (P), ouvidos (R), boca (BP), garganta(BPeF)?</label></td>
			</tr>
			<tr>
				<td><s:textfield name="avaliacaoAcupuntura.incomodoCabeca" cssClass="grande" /></td>
			</tr>
			<tr>
				<td class="linhaPequena"></td>
			</tr>
			<tr>
				<td><label>Tem  algum incômodo nas pernas, braços, articulações, coluna?</label></td>
			</tr>
			<tr>
				<td><s:textfield name="avaliacaoAcupuntura.incomodoPerna" cssClass="grande" /></td>
			</tr>
		</table>
		<table>
			<tr>
				<td class="linhaGrande"></td>
			</tr>
			<tr>
				<th class="linhaPequena"><label>ANAMNESE / ASPECTO GERAL:</label></th>
			</tr>
			<tr>
				<td class="linhaMedia"></td>
			</tr>
			<tr>
				<td><label>Exames Complementares: (Raio X, Ressonância Magnética, Densitometria óssea, Outros)</label></td>
			</tr>
			<tr>
				<td><s:textfield name="avaliacaoAcupuntura.examesComplementares" cssClass="grande" /></td>
			</tr>
			<tr>
				<td class="linhaPequena"></td>
			</tr>
			<tr>
				<td><label>Como é sua sede?</label></td>
			</tr>
			<tr>
				<td><s:textfield name="avaliacaoAcupuntura.sede" cssClass="grande" /></td>
			</tr>
			<tr>
				<td class="linhaPequena"></td>
			</tr>
			<tr>
				<td><label>Como é sua febre (se tiver)?</label></td>
			</tr>
			<tr>
				<td><s:textfield name="avaliacaoAcupuntura.febre" cssClass="grande" /></td>
			</tr>
			<tr>
				<td class="linhaPequena"></td>
			</tr>
			<tr>
				<td><label>Como se sente no frio e no calor?</label></td>
			</tr>
			<tr>
				<td><s:textfield name="avaliacaoAcupuntura.frioCalor" cssClass="grande" /></td>
			</tr>
			<tr>
				<td class="linhaPequena"></td>
			</tr>
			<tr>
				<td><label>Como é sua transpiração? Em que local sua mais?</label></td>
			</tr>
			<tr>
				<td><s:textfield name="avaliacaoAcupuntura.transpiracao" cssClass="grande" /></td>
			</tr>
			<tr>
				<td class="linhaPequena"></td>
			</tr>
			<tr>
				<td><label>Hábitos alimentares (aversões e desejos): Acido(F); Amargo(C); Doce(BP); Picante(P); Salgado(R)    Desejos (Insufiviência) – Aversão(Excesso)</label></td>
			</tr>
			<tr>
				<td><s:textfield name="avaliacaoAcupuntura.habitosAlimentares" cssClass="grande" /></td>
			</tr>
			<tr>
				<td class="linhaPequena"></td>
			</tr>
			<tr>
				<td><label>Como é o seu sono? A que horas desperta durante o sono? Tem sonhos repetitivos?</label></td>
			</tr>
			<tr>
				<td><s:textfield name="avaliacaoAcupuntura.sono" cssClass="grande" /></td>
			</tr>
			<tr>
				<td class="linhaPequena"></td>
			</tr>
			<tr>
				<td><label>Como é sua menstruação?</label></td>
			</tr>
			<tr>
				<td><s:textfield name="avaliacaoAcupuntura.menstruacao" cssClass="grande" /></td>
			</tr>
			<tr>
				<td class="linhaPequena"></td>
			</tr>
			<tr>
				<td><label>Como é sua disposição durante o dia e a noite?</label></td>
			</tr>
			<tr>
				<td><s:textfield name="avaliacaoAcupuntura.disposicao" cssClass="grande" /></td>
			</tr>
			<tr>
				<td class="linhaPequena"></td>
			</tr>
			<tr>
				<td><label>Aspecto Psíquico – F↑(irritabilidade, cólera)F↓(Falta de imaginação e cord. de idéias); C↑(alegria, riso exagerado) C↓(muitas queixas, falta de alegria, abatimento); P↑(agressividade, tristeza, romantismo) P↓(Depressão, falta força de vontade, desinteresse); R↑(Temor, autoritarismo) R↓(Indecisão, angustia, medo) BP↑(idéias fixas, reflete muito, passado) BP↓(esquecimento, desgosto, ansiedade):</label></td>
			</tr>
			<tr>
				<td><s:textfield name="avaliacaoAcupuntura.psiquico" cssClass="grande" /></td>
			</tr>
			<tr>
				<td class="linhaPequena"></td>
			</tr>
			<tr>
				<td><label>Como é sua personalidade?</label></td>
			</tr>
			<tr>
				<td><s:textfield name="avaliacaoAcupuntura.personalidade" cssClass="grande" /></td>
			</tr>
			<tr>
				<td class="linhaPequena"></td>
			</tr>
			<tr>
				<td><label>Como você se sente quando é ofendido?</label></td>
			</tr>
			<tr>
				<td><s:textfield name="avaliacaoAcupuntura.ofendido" cssClass="grande" /></td>
			</tr>
			<tr>
				<td class="linhaPequena"></td>
			</tr>
			<tr>
				<td><label>Como enfrente situações difíceis?</label></td>
			</tr>
			<tr>
				<td><s:textfield name="avaliacaoAcupuntura.dificeis" cssClass="grande" /></td>
			</tr>
			<tr>
				<td class="linhaPequena"></td>
			</tr>
			<tr>
				<td><label>Quais são os seus medos?</label></td>
			</tr>
			<tr>
				<td><s:textfield name="avaliacaoAcupuntura.medos" cssClass="grande" /></td>
			</tr>
			<tr>
				<td class="linhaPequena"></td>
			</tr>
			<tr>
				<td><label>Como você fica ao ser contrariado?</label></td>
			</tr>
			<tr>
				<td><s:textfield name="avaliacaoAcupuntura.contrariado" cssClass="grande" /></td>
			</tr>
			<tr>
				<td class="linhaPequena"></td>
			</tr>
		</table>
		<br />
		<table>
			<tr>
				<td class="linhaGrande"></td>
			</tr>
			<tr>
				<td class="linhaPequena"><label>Observações:</label></td>
			</tr>
			<tr>
				<td><s:textarea name="avaliacaoAcupuntura.observacoes" cssClass="grande"></s:textarea></td>
			</tr>
		</table>
		<br />
		<table>
			<tr>
				<td class="linhaPequena"><label>Quantidade de Sessões necessárias:</label> <s:textfield name="avaliacaoAcupuntura.qtSessoes" cssClass="sigla"></s:textfield></td>
			</tr>
		</table>
		</td>
	</tr>
</table>