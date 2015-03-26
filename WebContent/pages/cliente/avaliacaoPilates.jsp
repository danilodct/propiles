<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<table class="formAdd">
	<tr>
		<td class="header">Ficha de Avaliação do Pilates</td>
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
				<td class="linhaPequena"></td>
			</tr>
			<tr>
				<td><label>Quem indicou o Pilates?</label></td>
			</tr>
			<tr>
				<td>
					<s:radio list="indicacoes" name="avaliacaoPilates.indicouPilates" listKey="valor" listValue="nome" cssClass="radioIndicacao" ></s:radio>
				</td>
			</tr>
			<tr>
				<td class="linhaPequena"></td>
			</tr>
			<tr>
				<td><label>Já praticou ou pratica alguma atividade física? Qual?</label></td>
			</tr>
			<tr>
				<td><s:textfield name="avaliacaoPilates.atividadeFisica" cssClass="grande" /></td>
			</tr>
			<tr>
				<td class="linhaPequena"></td>
			</tr>
			<tr>
				<td><label>Apresenta algum tipo de dor? Em que região?</label></td>
			</tr>
			<tr>
				<td><s:textfield name="avaliacaoPilates.regiaoDor" cssClass="grande" /></td>
			</tr>
			<tr>
				<td class="linhaPequena"></td>
			</tr>
			<tr>
				<td><label>Apresenta alguma doença? Qual? </label></td>
			</tr>
			<tr>
				<td><s:textfield name="avaliacaoPilates.doenca" cssClass="grande" /></td>
			</tr>
			<tr>
				<td class="linhaPequena"></td>
			</tr>
			<tr>
				<td><label>Histórico de Doença</label></td>
			</tr>
			<tr>
				<td><s:textarea name="avaliacaoPilates.historicoDoenca" cssClass="grande"></s:textarea></td>
			</tr>
			<tr>
				<td class="linhaPequena"></td>
			</tr>
			<tr>
				<td><label>Solicitação Médica / Parecer Cardiológico</label></td>
			</tr>
			<tr>
				<td><s:textfield name="avaliacaoPilates.solicitacaoMedica" cssClass="grande" /></td>
			</tr>
			<tr>
				<td class="linhaMedia"></td>
			</tr>
			<tr>
				<td><label>MUSCULATURA ENCURTADA:</label></td>
			</tr>
			<tr>
				<td class="linhaMedia"></td>
			</tr>
			<tr>
				<td>
					<table>
						<tr>
							<td><label>Posterior:</label> <s:checkbox name="avaliacaoPilates.posterior" /></td>
							<td>&nbsp;&nbsp;</td>
							<td><label>Anterior:</label> <s:checkbox name="avaliacaoPilates.anterior" /></td>
							<td>&nbsp;&nbsp;</td>
							<td><label>Lateral:</label> <s:checkbox name="avaliacaoPilates.lateral" /></td>
						</tr>
					</table>
				</td>
			</tr>
			<tr>
				<td class="linhaPequena"></td>
			</tr>
			<tr>
				<td><label>Observação (Musculatura Encurtada)</label></td>
			</tr>
			<tr>
				<td><s:textarea name="avaliacaoPilates.musculaturaEncurtadaObs" cssClass="grande"></s:textarea></td>
			</tr>
			<tr>
				<td class="linhaMedia"></td>
			</tr>
			<tr>
				<td><label>BOA FORÇA MUSCULAR:</label></td>
			</tr>
			<tr>
				<td class="linhaMedia"></td>
			</tr>
			<tr>
				<td>
					<table>
						<tr>
							<td><label>MMII:</label> <s:checkbox name="avaliacaoPilates.mmii" /></td>
							<td>&nbsp;&nbsp;</td>
							<td><label>MMSS:</label> <s:checkbox name="avaliacaoPilates.mmss" /></td>
							<td>&nbsp;&nbsp;</td>
							<td><label>Abdome:</label> <s:checkbox name="avaliacaoPilates.abdome" /></td>
							<td>&nbsp;&nbsp;</td>
							<td><label>Coluna:</label> <s:checkbox name="avaliacaoPilates.colunaForcaMuscular" /></td>
						</tr>
					</table>
				</td>
			</tr>
			<tr>
				<td class="linhaPequena"></td>
			</tr>
			<tr>
				<td>
					<label>Simetria Corporal</label>
				</td>
			</tr>
			<tr>
				<td>
					<table>
						<tr>
							<td class="linhaPequena"></td>
						</tr>
						<tr>
							<td>&nbsp;&nbsp;&nbsp;</td>
							<td>
								<table>
									<tr>
										<td><label>Pés</label></td>
									</tr>
									<tr>
										<td><s:textfield name="avaliacaoPilates.pes" cssClass="grande" /></td>
									</tr>
									<tr>
										<td class="linhaPequena"></td>
									</tr>
									<tr>
										<td><label>Joelhos</label></td>
									</tr>
									<tr>
										<td><s:textfield name="avaliacaoPilates.joelhos" cssClass="grande" /></td>
									</tr>
									<tr>
										<td class="linhaPequena"></td>
									</tr>
									<tr>
										<td><label>Pelve</label></td>
									</tr>
									<tr>
										<td><s:textfield name="avaliacaoPilates.pelve" cssClass="grande" /></td>
									</tr>
									<tr>
										<td class="linhaPequena"></td>
									</tr>
									<tr>
										<td><label>Coluna</label></td>
									</tr>
									<tr>
										<td><s:textfield name="avaliacaoPilates.coluna" cssClass="grande" /></td>
									</tr>
									<tr>
										<td class="linhaPequena"></td>
									</tr>
									<tr>
										<td><label>Ombros/Clavícula</label></td>
									</tr>
									<tr>
										<td><s:textfield name="avaliacaoPilates.ombrosClavicula" cssClass="grande" /></td>
									</tr>
									<tr>
										<td class="linhaPequena"></td>
									</tr>
									<tr>
										<td><label>Escápulas</label></td>
									</tr>
									<tr>
										<td><s:textfield name="avaliacaoPilates.escapulas" cssClass="grande" /></td>
									</tr>
									<tr>
										<td class="linhaPequena"></td>
									</tr>
									<tr>
										<td><label>Cabeça</label></td>
									</tr>
									<tr>
										<td><s:textfield name="avaliacaoPilates.cabeca" cssClass="grande" /></td>
									</tr>
									<tr>
										<td class="linhaPequena"></td>
									</tr>
									<tr>
										<td><label>Exames Complementares</label></td>
									</tr>
									<tr>
										<td><s:textfield name="avaliacaoPilates.examesComplementares" cssClass="grande" /></td>
									</tr>
									<tr>
										<td class="linhaPequena"></td>
									</tr>
									<tr>
										<td><label>Observações</label></td>
									</tr>
									<tr>
										<td><s:textarea name="avaliacaoPilates.observacoes" cssClass="grande"></s:textarea></td>
									</tr>
								</table>
							</td>
						</tr>
					</table>
				</td>
			</tr>
		</table>
		</td>
	</tr>
</table>