<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<table class="formAdd">
	<tr>
		<td class="header">Ficha de Avaliação de RPG</td>
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
				<th class="linhaPequena"><label>HISTÓRICO</label></th>
			</tr>
			<tr>
				<td class="linhaMedia"></td>
			</tr>
			<tr>
				<td><label>Solicitação Médica / Parecer Cardiológico</label></td>
			</tr>
			<tr>
				<td><s:textfield name="avaliacaoRPG.solicitacaoMedica" cssClass="grande" /></td>
			</tr>
			<tr>
				<td class="linhaPequena"></td>
			</tr>
			<tr>
				<td><label>Apresenta alguma doença? Qual? </label></td>
			</tr>
			<tr>
				<td><s:textfield name="avaliacaoRPG.doenca" cssClass="grande" /></td>
			</tr>
			<tr>
				<td class="linhaPequena"></td>
			</tr>
			<tr>
				<td><label>Histórico de Doença</label></td>
			</tr>
			<tr>
				<td><s:textarea name="avaliacaoRPG.historicoDoenca" cssClass="grande"></s:textarea></td>
			</tr>
			<tr>
				<td class="linhaPequena"></td>
			</tr>
			<tr>
				<td><label>Apresenta algum tipo de dor? Em que região?</label></td>
			</tr>
			<tr>
				<td><s:textfield name="avaliacaoRPG.regiaoDor" cssClass="grande" /></td>
			</tr>
			<tr>
				<td class="linhaPequena"></td>
			</tr>
			<tr>
				<td><label>Já praticou ou pratica alguma atividade física? Qual?</label></td>
			</tr>
			<tr>
				<td><s:textfield name="avaliacaoRPG.atividadeFisica" cssClass="grande" /></td>
			</tr>
			<tr>
				<td class="linhaPequena"></td>
			</tr>
			<tr>
				<td><label>Exames Complementares</label></td>
			</tr>
			<tr>
				<td><s:textfield name="avaliacaoRPG.examesComplementares" cssClass="grande" /></td>
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
				<th class="linhaPequena"><label>Quadro de Exame das Retrações</label></th>
			</tr>
			<tr>
				<td class="linhaMedia"></td>
			</tr>
			<tr>
				<td>
					<table border="1">
						<tr>
							<th><b>Zonas</b></th>
							<th><b>Valor</b></th>
						</tr>
						<tr>
							<td><label>Cervical</label></td>
							<td><s:select list="retracoes" name="avaliacaoRPG.cervical" listKey="value" listValue="valor" cssClass="sigla" /></td>
						</tr>
						<tr>
							<td><label>Dorso</label></td>
							<td><s:select list="retracoes" name="avaliacaoRPG.dorso" listKey="value" listValue="valor" cssClass="sigla" /></td>
						</tr>
						<tr>
							<td><label>Lombar</label></td>
							<td><s:select list="retracoes" name="avaliacaoRPG.lombar" listKey="value" listValue="valor" cssClass="sigla" /></td>
						</tr>
						<tr>
							<td><label>Quadril</label></td>
							<td><s:select list="retracoes" name="avaliacaoRPG.quadril" listKey="value" listValue="valor" cssClass="sigla" /></td>
						</tr>
						<tr>
							<td><label>Joelhos</label></td>
							<td><s:select list="retracoes" name="avaliacaoRPG.joelhos" listKey="value" listValue="valor" cssClass="sigla" /></td>
						</tr>
						<tr>
							<td><label>Pés</label></td>
							<td><s:select list="retracoes" name="avaliacaoRPG.pes" listKey="value" listValue="valor" cssClass="sigla" /></td>
						</tr>
					</table>
				</td>
			</tr>
		</table>
		<br />
		<table>
			<tr>
				<td class="linhaGrande"></td>
			</tr>
			<tr>
				<th class="linhaPequena"><label>Desvios Articulares:</label></th>
			</tr>
			<tr>
				<td class="linhaMedia"></td>
			</tr>
			<tr>
				<td>
					<table border="1" cellpadding="5" cellspacing="5">
						<tr>
							<td><label>Ombros:</label></td>
							<td>
								elevados <s:checkbox name="avaliacaoRPG.elevados" />
								enrolados verticalmente <s:checkbox name="avaliacaoRPG.enroladosVerticalmente" />   
								enrolados transversalmente <s:checkbox name="avaliacaoRPG.enroladosTransversalmente" />  
							</td>
						</tr>
						<tr>
							<td><label>Braços:</label></td>
							<td>
								obduzidos <s:checkbox name="avaliacaoRPG.obduzidos" />
								flexionados <s:checkbox name="avaliacaoRPG.flexionados" />
								pronados <s:checkbox name="avaliacaoRPG.pronados" />
							</td>
						</tr>
						<tr>
							<td><label>Sacro:</label></td>
							<td>
								normal <s:checkbox name="avaliacaoRPG.normal" />
								horizontal <s:checkbox name="avaliacaoRPG.horizontal" />
							</td>
						</tr>
					</table>
				</td>
			</tr>
		</table>
		<br />
		<table>
			<tr>
				<td class="linhaGrande"></td>
			</tr>
			<tr>
				<th class="linhaPequena"><label>Quadro de Avaliação:</label></th>
			</tr>
			<tr>
				<td class="linhaMedia"></td>
			</tr>
			<tr>
				<td>
					<table border="1">
						<tr>
							<td></td>
							<td><label>FOTO GERAL</label></td>
							<td><label>INTERROGATÓRIO</label></td>
							<td><label>EXAME LOCAL<br />DAS RETRAÇÕES</label></td>
							<td><label>REEQUILIBRAÇÃO</label></td>
							<td><label>RESULTADO</label></td>
						</tr>
						<tr>
							<td><label>Linha 1 ABBF</label></td>
							<td><s:textarea cssClass="sigla" name="avaliacaoRPG.abbfFotoGeral" /></td>
							<td><s:textarea cssClass="sigla" name="avaliacaoRPG.abbfInterrogatorio" /></td>
							<td><s:textarea cssClass="sigla" name="avaliacaoRPG.abbfExameLocal" /></td>
							<td><s:textarea cssClass="sigla" name="avaliacaoRPG.abbfReequilibracao" /></td>
							<td><s:textarea cssClass="sigla" name="avaliacaoRPG.abbfResultado" /></td>
						</tr>
						<tr>
							<td><label>Linha 2 ABBA</label></td>
							<td><s:textarea cssClass="sigla" name="avaliacaoRPG.abbaFotoGeral" /></td>
							<td><s:textarea cssClass="sigla" name="avaliacaoRPG.abbaInterrogatorio" /></td>
							<td><s:textarea cssClass="sigla" name="avaliacaoRPG.abbaExameLocal" /></td>
							<td><s:textarea cssClass="sigla" name="avaliacaoRPG.abbaReequilibracao" /></td>
							<td><s:textarea cssClass="sigla" name="avaliacaoRPG.abbaResultado" /></td>
						</tr>
						<tr>
							<td><label>Linha 3 FCBF</label></td>
							<td><s:textarea cssClass="sigla" name="avaliacaoRPG.fcbfFotoGeral" /></td>
							<td><s:textarea cssClass="sigla" name="avaliacaoRPG.fcbfInterrogatorio" /></td>
							<td><s:textarea cssClass="sigla" name="avaliacaoRPG.fcbfExameLocal" /></td>
							<td><s:textarea cssClass="sigla" name="avaliacaoRPG.fcbfReequilibracao" /></td>
							<td><s:textarea cssClass="sigla" name="avaliacaoRPG.fcbfResultado" /></td>
						</tr>
						<tr>
							<td><label>Linha 4 FCBA</label></td>
							<td><s:textarea cssClass="sigla" name="avaliacaoRPG.fcbaFotoGeral" /></td>
							<td><s:textarea cssClass="sigla" name="avaliacaoRPG.fcbaInterrogatorio" /></td>
							<td><s:textarea cssClass="sigla" name="avaliacaoRPG.fcbaExameLocal" /></td>
							<td><s:textarea cssClass="sigla" name="avaliacaoRPG.fcbaReequilibracao" /></td>
							<td><s:textarea cssClass="sigla" name="avaliacaoRPG.fcbaResultado" /></td>
						</tr>
					</table>
				</td>
			</tr>
		</table>
		<br />
		<table>
			<tr>
				<td class="linhaGrande"></td>
			</tr>
			<tr>
				<th class="linhaPequena"><label>TESTE DE FLEXIBILIDADE ESPECÍFICA:</label></th>
			</tr>
			<tr>
				<td class="linhaMedia"></td>
			</tr>
			<tr>
				<td>
					<table border="1">
						<tr>
							<td><s:textfield name="avaliacaoRPG.isquiosTibiais" cssClass="sigla" /> <label>Isquios tibiais</label> </td>
						</tr>
						<tr>
							<td><s:textfield name="avaliacaoRPG.gastrocnemios" cssClass="sigla" /> <label>Gastrocnêmios</label> </td>
						</tr>
						<tr>
							<td><s:textfield name="avaliacaoRPG.soleo" cssClass="sigla" /> <label>Sóleo</label></td>
						</tr>
						<tr>
							<td><s:textfield name="avaliacaoRPG.pelveTrocanterianosGluteos" cssClass="sigla" /> <label>Pelve trocanterianos e glúteos</label> </td>
						</tr>
						<tr>
							<td><s:textfield name="avaliacaoRPG.adutores" cssClass="sigla" /> <label>Adutores</label> </td>
						</tr>
					</table>
				</td>
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
				<td><s:textarea name="avaliacaoRPG.observacoes" cssClass="grande"></s:textarea></td>
			</tr>
		</table>
		<br />
		<table>
			<tr>
				<td class="linhaPequena"><label>Quantidade de Sessões necessárias:</label> <s:textfield name="avaliacaoRPG.qtSessoes" cssClass="sigla"></s:textfield></td>
			</tr>
		</table>
		</td>
	</tr>
</table>