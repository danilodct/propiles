<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<table class="formAdd">
	<tr>
		<td class="header">Ficha de Avaliação de Estética</td>
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
				<th class="linhaPequena"><label>ESTADO GERAL</label></th>
			</tr>
			<tr>
				<td class="linhaMedia"></td>
			</tr>
			<tr>
				<td><label>O que a levou a fazer um tratamento de estética na VITA CORPORE Studio Pilates:</label></td>
			</tr>
			<tr>
				<td>
					Celulite <s:checkbox name="avaliacaoEstetica.celulite" />
				 	Gordura localizada <s:checkbox name="avaliacaoEstetica.gorduraLocalizada" /> 
				 	Flacidez <s:checkbox name="avaliacaoEstetica.flacidez" /> 
				 	Estresse <s:checkbox name="avaliacaoEstetica.estresse" /> 
				 	Cravos e espinhas <s:checkbox name="avaliacaoEstetica.cravos" /><br />
					Outros: <s:textfield name="avaliacaoEstetica.outrosMotivos" cssClass="grande" />
				</td>
			</tr>
			<tr>
				<td class="linhaPequena"></td>
			</tr>
			<tr>
				<td><label>Já fez algum tratamento estético? Qual?</label></td>
			</tr>
			<tr>
				<td><s:textfield name="avaliacaoEstetica.jaFezAlgumTratamento" cssClass="grande" /></td>
			</tr>
			<tr>
				<td class="linhaPequena"></td>
			</tr>
			<tr>
				<td><label>Quais foram os resultados do tratamento realizado?</label></td>
			</tr>
			<tr>
				<td><s:textfield name="avaliacaoEstetica.quaisResultados" cssClass="grande" /></td>
			</tr>
			<tr>
				<td class="linhaPequena"></td>
			</tr>
			<tr>
				<td><label>Seu peso se modificou nos últimos 3 meses? </label></td>
			</tr>
			<tr>
				<td>
					<s:radio list="simNao" name="avaliacaoEstetica.pesoModificou" listKey="valor" listValue="nome" cssClass="radioIndicacao" ></s:radio>
				</td>
			</tr>
			<tr>
				<td class="linhaPequena"></td>
			</tr>
			<tr>
				<td><label>Tem prisão de ventre?</label></td>
			</tr>
			<tr>
				<td>
					<s:radio list="simNao" name="avaliacaoEstetica.prisaoVentre" listKey="valor" listValue="nome" cssClass="radioIndicacao" ></s:radio>
				</td>
			</tr>
			<tr>
				<td class="linhaPequena"></td>
			</tr>
			<tr>
				<td><label>Tem retenção de líquidos?</label></td>
			</tr>
			<tr>
				<td>
					<s:radio list="simNao" name="avaliacaoEstetica.retencaoLiquidos" listKey="valor" listValue="nome" cssClass="radioIndicacao" ></s:radio>
				</td>
			</tr>
			<tr>
				<td class="linhaPequena"></td>
			</tr>
			<tr>
				<td><label>Tem dificuldade de urinar?</label></td>
			</tr>
			<tr>
				<td>
					<s:radio list="simNao" name="avaliacaoEstetica.dificuldadeUrinar" listKey="valor" listValue="nome" cssClass="radioIndicacao" ></s:radio>
				</td>
			</tr>
			<tr>
				<td class="linhaPequena"></td>
			</tr>
			<tr>
				<td><label>Tem reação alérgica? A que?</label></td>
			</tr>
			<tr>
				<td><s:textfield name="avaliacaoEstetica.alergia" cssClass="grande" /></td>
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
				<th class="linhaPequena"><label>HÁBITOS DE VIDA</label></th>
			</tr>
			<tr>
				<td class="linhaMedia"></td>
			</tr>
			<tr>
				<td><label>Sedentário ou pratica atividade física?</label></td>
			</tr>
			<tr>
				<td><s:textfield name="avaliacaoEstetica.atividadeFisica" cssClass="grande" /></td>
			</tr>
			<tr>
				<td class="linhaPequena"></td>
			</tr>
			<tr>
				<td><label>Como está o sono? Horas diárias?</label></td>
			</tr>
			<tr>
				<td><s:textfield name="avaliacaoEstetica.sono" cssClass="grande" /></td>
			</tr>
			<tr>
				<td class="linhaPequena"></td>
			</tr>
			<tr>
				<td><label>Estado Emocional:</label></td>
			</tr>
			<tr>
				<td><s:textfield name="avaliacaoEstetica.estadoEmocional" cssClass="grande" /></td>
			</tr>
			<tr>
				<td class="linhaPequena"></td>
			</tr>
			<tr>
				<td><label>Tem cuidados faciais? Qual? Que freqüência?</label></td>
			</tr>
			<tr>
				<td><s:textfield name="avaliacaoEstetica.cuidadoFacial" cssClass="grande" /></td>
			</tr>
			<tr>
				<td class="linhaPequena"></td>
			</tr>
			<tr>
				<td><label>Tem cuidados corporais? Qual? Que freqüência?</label></td>
			</tr>
			<tr>
				<td><s:textfield name="avaliacaoEstetica.cuidadoCorporal" cssClass="grande" /></td>
			</tr>
		</table>
		<br />
		<table>
			<tr>
				<td class="linhaGrande"></td>
			</tr>
			<tr>
				<th class="linhaPequena"><label>NUTRIÇÃO</label></th>
			</tr>
			<tr>
				<td class="linhaMedia"></td>
			</tr>
			<tr>
				<td><label>Como considera sua alimentação:</label></td>
			</tr>
			<tr>
				<td>
					<s:radio list="alimentacao" name="avaliacaoEstetica.alimentacao" listKey="valor" listValue="nome" cssClass="radioIndicacao" ></s:radio>
				</td>
			</tr>
			<tr>
				<td class="linhaPequena"></td>
			</tr>
			<tr>
				<td><label>Quantidade:</label></td>
			</tr>
			<tr>
				<td>
					<s:radio list="quantidade" name="avaliacaoEstetica.quantidade" listKey="valor" listValue="nome" cssClass="radioIndicacao" ></s:radio>
				</td>
			</tr>
			<tr>
				<td class="linhaPequena"></td>
			</tr>
			<tr>
				<td><label>Quantidade de refeições ao dia:</label></td>
			</tr>
			<tr>
				<td><s:textfield name="avaliacaoEstetica.qtRefeicoes" cssClass="grande" /></td>
			</tr>
			<tr>
				<td class="linhaPequena"></td>
			</tr>
			<tr>
				<td><label>Dieta. Já Fez ou Faz? De que tipo?</label></td>
			</tr>
			<tr>
				<td><s:textfield name="avaliacaoEstetica.dieta" cssClass="grande" /></td>
			</tr>
			<tr>
				<td class="linhaPequena"></td>
			</tr>
			<tr>
				<td><label>Tem acompanhamento de nutricionista ou Endocrinologista? Houve/Há resultado? Especifique</label></td>
			</tr>
			<tr>
				<td><s:textfield name="avaliacaoEstetica.nutricionista" cssClass="grande" /></td>
			</tr>
			<tr>
				<td class="linhaPequena"></td>
			</tr>
			<tr>
				<td><label>Obesidade:</label></td>
			</tr>
			<tr>
				<td>
					<s:radio list="simNao" name="avaliacaoEstetica.obesidade" listKey="valor" listValue="nome" cssClass="radioIndicacao" ></s:radio>
				</td>
			</tr>
		</table>
		<br />
		<table>
			<tr>
				<td class="linhaGrande"></td>
			</tr>
			<tr>
				<th class="linhaPequena"><label>DOENÇAS</label></th>
			</tr>
			<tr>
				<td class="linhaMedia"></td>
			</tr>
			<tr>
				<td>
				<table>
					<tr>
						<td align="right">Hipertensão <s:checkbox name="avaliacaoEstetica.hipertensao" /></td>
						<td align="right">Câncer <s:checkbox name="avaliacaoEstetica.cancer" /></td>
						<td align="right">Marca-passo Cardíaco <s:checkbox name="avaliacaoEstetica.marcapasso" /></td>
						<td align="right">Hérnia <s:checkbox name="avaliacaoEstetica.hernia" /></td>
					</tr>
					<tr>
						<td align="right">Prótese Metálica <s:checkbox name="avaliacaoEstetica.protese" /> </td>
						<td align="right">Quelóide <s:checkbox name="avaliacaoEstetica.queloide" /> </td>
						<td align="right">Hemofilia <s:checkbox name="avaliacaoEstetica.hemofilia" /> </td>
						<td align="right">Varizes <s:checkbox name="avaliacaoEstetica.varizes" /></td>
					</tr>
					<tr>
						<td align="right">Doenças reumáticas <s:checkbox name="avaliacaoEstetica.reumatica" /></td>
						<td align="right">Alergia calor <s:checkbox name="avaliacaoEstetica.alergiaCalor" /></td>
						<td align="right">Ovário policístico <s:checkbox name="avaliacaoEstetica.ovario" /></td>
						<td align="right">Dermatite <s:checkbox name="avaliacaoEstetica.dermatite" /></td>
					</tr>
					<tr>
						<td align="right">Gastrite <s:checkbox name="avaliacaoEstetica.gastrite" /></td>
						<td align="right">Úlcera <s:checkbox name="avaliacaoEstetica.ulcera" /></td>
						<td align="right">Fragilidade capilar <s:checkbox name="avaliacaoEstetica.fragilidade" /></td>
						<td align="right">Alergia frio <s:checkbox name="avaliacaoEstetica.alergiaFrio" /></td>
					</tr>
					<tr>
						<td align="right">Doença infecciosa <s:checkbox name="avaliacaoEstetica.infecciosa" /></td>
						<td align="right">Diabetes <s:checkbox name="avaliacaoEstetica.diabetes" /></td>
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
				<th class="linhaPequena"><label>INTERVENÇÕES CIRÚRGICAS:</label></th>
			</tr>
			<tr>
				<td class="linhaMedia"></td>
			</tr>
			<tr>
				<td>
				<table>
					<tr>
						<td align="right">Rinoplastia <s:checkbox name="avaliacaoEstetica.rinoplastia" /></td>
						<td align="right">Lifting <s:checkbox name="avaliacaoEstetica.lifting" /></td>
						<td align="right">Rejuvenescimento facial <s:checkbox name="avaliacaoEstetica.rejuvenescimento" /></td>
						<td align="right">Mastectomia <s:checkbox name="avaliacaoEstetica.mastectomia" /></td>
					</tr>
					<tr>
						<td align="right">Abdominoplastia <s:checkbox name="avaliacaoEstetica.abdominoplastia" /> </td>
						<td align="right">Lipoescultura <s:checkbox name="avaliacaoEstetica.lipoescultura" /> </td>
						<td align="right">Botox <s:checkbox name="avaliacaoEstetica.botox" /> </td>
						<td align="right">Mamoplastia redução <s:checkbox name="avaliacaoEstetica.mamoplastiaReducao" /></td>
					</tr>
					<tr>
						<td align="right">Mentoplastia <s:checkbox name="avaliacaoEstetica.mentoplastia" /></td>
						<td align="right">Silicone seio <s:checkbox name="avaliacaoEstetica.siliconeSeio" /></td>
						<td align="right">Microcirurgia<s:checkbox name="avaliacaoEstetica.microcirurgia" /></td>
						<td align="right">Blefaroplastia <s:checkbox name="avaliacaoEstetica.blefaroplastia" /></td>
					</tr>
					<tr>
						<td align="right">Mamoplastia aumento <s:checkbox name="avaliacaoEstetica.mamoplastiaAumento" /></td>
						<td align="right">Lipoaspiração <s:checkbox name="avaliacaoEstetica.lipoaspiracao" /></td>
						<td align="right">Silicone bumbum <s:checkbox name="avaliacaoEstetica.siliconeBumbum" /></td>
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
				<th class="linhaPequena"><label>CARACTERÍSTICAS DA PELE:</label></th>
			</tr>
			<tr>
				<td class="linhaMedia"></td>
			</tr>
			<tr>
				<td><label>Cor:</label></td>
			</tr>
			<tr>
				<td>
					<s:radio list="cor" name="avaliacaoEstetica.cor" listKey="valor" listValue="nome" cssClass="radioIndicacao" ></s:radio>
				</td>
			</tr>
			<tr>
				<td class="linhaPequena"></td>
			</tr>
			<tr>
				<td><label>Qualidade:</label></td>
			</tr>
			<tr>
				<td>
					<s:radio list="qualidadePele" name="avaliacaoEstetica.qualidade" listKey="valor" listValue="nome" cssClass="radioIndicacao" ></s:radio>
				</td>
			</tr>
			<tr>
				<td class="linhaPequena"></td>
			</tr>
			<tr>
				<td><label>Lesões de pele:</label></td>
			</tr>
			<tr>
				<td>
					<s:radio list="lesoes" name="avaliacaoEstetica.lesoes" listKey="valor" listValue="nome" cssClass="radioIndicacao" ></s:radio>
				</td>
			</tr>
			<tr>
				<td class="linhaPequena"></td>
			</tr>
			<tr>
				<td><label>Acne:</label></td>
			</tr>
			<tr>
				<td>
					<s:radio list="acne" name="avaliacaoEstetica.acne" listKey="valor" listValue="nome" cssClass="radioIndicacao" ></s:radio>
				</td>
			</tr>
			<tr>
				<td class="linhaPequena"></td>
			</tr>
			<tr>
				<td><label>Tratamento:</label></td>
			</tr>
			<tr>
				<td>
					<s:textarea name="avaliacaoEstetica.tratamento" cssClass="grande" />
				</td>
			</tr>
			<tr>
				<td class="linhaPequena"></td>
			</tr>
		</table>
		</td>
	</tr>
</table>