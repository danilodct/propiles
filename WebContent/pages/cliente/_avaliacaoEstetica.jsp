<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
				<td class="linhaPequena"></td>
			</tr>
			<tr>
				<td><label>Já praticou ou pratica alguma atividade física? Qual?</label></td>
			</tr>
			<tr>
				<td><s:textfield name="avaliacaoEstetica.atividadeFisica" cssClass="grande" /></td>
			</tr>
			<tr>
				<td class="linhaPequena"></td>
			</tr>
			<tr>
				<td><label>Sono (quantidade de horas diárias):</label></td>
			</tr>
			<tr>
				<td><s:textfield name="avaliacaoEstetica.sono" cssClass="pequeno inteiro" /></td>
			</tr>
			<tr>
				<td class="linhaPequena"></td>
			</tr>
			<tr>
				<td><label>Estado Emocional (ansiedade, estresse, depressão):</label></td>
			</tr>
			<tr>
				<td><s:textfield name="avaliacaoEstetica.estadoEmocional" cssClass="grande" /></td>
			</tr>
			<tr>
				<td class="linhaPequena"></td>
			</tr>
			<tr>
				<td><label>Cuidados Faciais Habituais (Que tipo? Freqüência?)</label></td>
			</tr>
			<tr>
				<td><s:textfield name="avaliacaoEstetica.cuidadosFaciais" cssClass="grande" /></td>
			</tr>
			<tr>
				<td class="linhaPequena"></td>
			</tr>
			<tr>
				<td><label>Cuidados corporais habituais (Que tipo? Freqüência?)</label></td>
			</tr>
			<tr>
				<td><s:textfield name="avaliacaoEstetica.cuidadosCorporais" cssClass="grande" /></td>
			</tr>
			<tr>
				<td class="linhaPequena"></td>
			</tr>
			<tr>
				<td><label>Exposição ao tempo/clima (Com que freqüência?)</label></td>
			</tr>
			<tr>
				<td><s:textfield name="avaliacaoEstetica.exposicaoClima" cssClass="grande" /></td>
			</tr>
			<tr>
				<td class="linhaMedia"></td>
			</tr>
			<tr>
				<td><label>HISTÓRIA PATOLÓGICA PREGRESSA</label></td>
			</tr>
			<tr>
				<td>
					<table>
						<tr>
							<td><label>Diabetes:</label> <s:checkbox name="avaliacaoEstetica.diabetes" /></td>
							<td>&nbsp;&nbsp;</td>
							<td><label>Quelóides:</label> <s:checkbox name="avaliacaoEstetica.queloide" /></td>
							<td>&nbsp;&nbsp;</td>
							<td><label>Hemofilia:</label> <s:checkbox name="avaliacaoEstetica.hemofilia" /></td>
							<td>&nbsp;&nbsp;</td>
							<td><label>Prótese Metálica:</label> <s:checkbox name="avaliacaoEstetica.proteseMetalica" /></td>
							<td>&nbsp;&nbsp;</td>
							<td><label>Marcapasso:</label> <s:checkbox name="avaliacaoEstetica.marcapasso" /></td>
							<td>&nbsp;&nbsp;</td>
							<td><label>Alergias:</label> <s:checkbox name="avaliacaoEstetica.alergias" /></td>
						</tr>
					</table>
				</td>
			</tr>
			<tr>
				<td class="linhaMedia"></td>
			</tr>
			<tr>
				<td><label>Intervenções Cirúrgicas:</label></td>
			</tr>
			<tr>
				<td>
					<table>
						<tr>
							<td><label>Lifting:</label> <s:checkbox name="avaliacaoEstetica.lifting" /></td>
							<td><label>Blefaropastia:</label> <s:checkbox name="avaliacaoEstetica.blefaropastiae" /></td>
							<td><label>Rinoplastia:</label> <s:checkbox name="avaliacaoEstetica.rinoplastia" /></td>
							<td><label>Lipoaspiração:</label> <s:checkbox name="avaliacaoEstetica.lipoaspiracao" /></td>
							<td><label>Rejuvenescimento Facial:</label> <s:checkbox name="avaliacaoEstetica.rejuvenescimento" /></td>
						</tr>
						<tr>
							<td><label>Dermolipectomia (Abdominoplastia):</label> <s:checkbox name="avaliacaoEstetica.dermolipectomia" /></td>
							<td><label>Mamoplastia de Redução:</label> <s:checkbox name="avaliacaoEstetica.mamoplastiaReducao" /></td>
							<td><label>Mastectomia:</label> <s:checkbox name="avaliacaoEstetica.mastectomia" /></td>
							<td><label>Mentoplastia:</label> <s:checkbox name="avaliacaoEstetica.mentoplastia" /></td>
							<td><label>Mamoplastia de Aumento:</label> <s:checkbox name="avaliacaoEstetica.mamoplastiaAumento" /></td>
						</tr>
						<tr>
							<td><label>Lipoescultura:</label> <s:checkbox name="avaliacaoEstetica.lipoescultura" /></td>
							<td><label>Microcirurgia:</label> <s:checkbox name="avaliacaoEstetica.microcirurgia" /></td>
							<td><label>Otoplastia/ Rinosseptoplastia:</label> <s:checkbox name="avaliacaoEstetica.otoplastia" /></td>
							<td><label>Implante de silicone:</label> <s:checkbox name="avaliacaoEstetica.silicone" /></td>
							<td><label>Aplicação de Botox:</label> <s:checkbox name="avaliacaoEstetica.botox" /></td>
						</tr>
					</table>
				</td>
			</tr>
			<tr>
				<td class="linhaMedia"></td>
			</tr>
			<tr>
				<td><label>FATORES ALIMENTÍCIOS:</label></td>
			</tr>
			<tr>
				<td><label>Tipo de Alimentação</label></td>
			</tr>
			<tr>
				<td><s:textfield name="avaliacaoEstetica.alimentacao" cssClass="grande" /></td>
			</tr>
			<tr>
				<td class="linhaPequena"></td>
			</tr>
			<tr>
				<td><label>Quantidade:</label></td>
			</tr>
			<tr>
				<td>
					<s:radio list="qtsAlimentacao" name="avaliacaoEstetica.qtAlimentacaoStr" listKey="valor" listValue="nome" ></s:radio>
				</td>
			</tr>
			<tr>
				<td class="linhaPequena"></td>
			</tr>
			<tr>
				<td>
					<label>Quantidade de refeições ao dia:</label>
				</td>
			</tr>
			<tr>
				<td><s:textfield name="avaliacaoEstetica.qtAlimentacaoDiaria" cssClass="grande inteiro" /></td>
			</tr>
			<tr>
				<td class="linhaPequena"></td>
			</tr>
			<tr>
				<td>
					<label>Dieta (Já Fez? De que Tipo? Houve Resultado?):</label>
				</td>
			</tr>
			<tr>
				<td><s:textarea name="avaliacaoEstetica.dieta" cssClass="grande" ></s:textarea></td>
			</tr>
			<tr>
				<td class="linhaPequena"></td>
			</tr>
			<tr>
				<td><label>Obesidade:</label> <s:checkbox name="avaliacaoEstetica.obesidade" /></td>
			</tr>
			<tr>
				<td class="linhaMedia"></td>
			</tr>
			<tr>
				<td><label>CARACTERÍSTICAS DA PELE:</label></td>
			</tr>
			<tr>
				<td><label>Cor da Pele:</label></td>
			</tr>
			<tr>
				<td>
					<s:radio list="coresPele" name="avaliacaoEstetica.corPeleStr" listKey="valor" listValue="nome" ></s:radio>
				</td>
			</tr>
			<tr>
				<td class="linhaPequena"></td>
			</tr>
			<tr>
				<td><label>Qualidade da Pele:</label></td>
			</tr>
			<tr>
				<td>
					<s:radio list="qualidadesPele" name="avaliacaoEstetica.qualidadePeleStr" listKey="valor" listValue="nome" ></s:radio>
				</td>
			</tr>
			<tr>
				<td class="linhaPequena"></td>
			</tr>
			<tr>
				<td><label>Lesões de Pele:</label></td>
			</tr>
			<tr>
				<td>
					<table>
						<tr>
							<td><label>Máculas:</label> <s:checkbox name="avaliacaoEstetica.maculas" /></td>
							<td>&nbsp;&nbsp;</td>
							<td><label>Pápulas:</label> <s:checkbox name="avaliacaoEstetica.papulas" /></td>
							<td>&nbsp;&nbsp;</td>
							<td><label>Comedão:</label> <s:checkbox name="avaliacaoEstetica.comedao" /></td>
							<td>&nbsp;&nbsp;</td>
							<td><label>Pústula:</label> <s:checkbox name="avaliacaoEstetica.pustula" /></td>
							<td>&nbsp;&nbsp;</td>
							<td><label>Ceratose:</label> <s:checkbox name="avaliacaoEstetica.ceratose" /></td>
							<td>&nbsp;&nbsp;</td>
							<td><label>Nódulo:</label> <s:checkbox name="avaliacaoEstetica.nodulo" /></td>
							<td>&nbsp;&nbsp;</td>
							<td><label>Quelóides:</label> <s:checkbox name="avaliacaoEstetica.queloideLesao" /></td>
						</tr>
						<tr>
							<td><label>Hematoma:</label> <s:checkbox name="avaliacaoEstetica.hematoma" /></td>
							<td>&nbsp;&nbsp;</td>
							<td><label>Vesícula:</label> <s:checkbox name="avaliacaoEstetica.vesicula" /></td>
							<td>&nbsp;&nbsp;</td>
							<td><label>Bolha:</label> <s:checkbox name="avaliacaoEstetica.bolha" /></td>
							<td>&nbsp;&nbsp;</td>
							<td><label>Abscesso:</label> <s:checkbox name="avaliacaoEstetica.abscesso" /></td>
							<td>&nbsp;&nbsp;</td>
							<td><label>Crosta:</label> <s:checkbox name="avaliacaoEstetica.crosta" /></td>
							<td>&nbsp;&nbsp;</td>
							<td><label>Ulceração:</label> <s:checkbox name="avaliacaoEstetica.ulceracao" /></td>
							<td>&nbsp;&nbsp;</td>
							<td><label>Fissura:</label> <s:checkbox name="avaliacaoEstetica.fissura" /></td>
							<td>&nbsp;&nbsp;</td>
							<td><label>Cicatriz:</label> <s:checkbox name="avaliacaoEstetica.cicatriz" /></td>
						</tr>
					</table>
				</td>
			</tr>
			<tr>
				<td class="linhaPequena"></td>
			</tr>
			<tr>
				<td><label>ACNE:</label></td>
			</tr>
			<tr>
				<td>
					<table>
						<tr>
							<td><label>Comedônica:</label> <s:checkbox name="avaliacaoEstetica.comedonica" /></td>
							<td>&nbsp;&nbsp;</td>
							<td><label>Papulosa:</label> <s:checkbox name="avaliacaoEstetica.papulosa" /></td>
							<td>&nbsp;&nbsp;</td>
							<td><label>Pustulosa:</label> <s:checkbox name="avaliacaoEstetica.flemonosa" /></td>
							<td>&nbsp;&nbsp;</td>
							<td><label>Flemonosa:</label> <s:checkbox name="avaliacaoEstetica.pustulosa" /></td>
							<td>&nbsp;&nbsp;</td>
							<td><label>Cicatriz pós-acne:</label> <s:checkbox name="avaliacaoEstetica.cicatrizposacne" /></td>
						</tr>
					</table>
				</td>
			</tr>
			<tr>
				<td class="linhaPequena"></td>
			</tr>
			<tr>
				<td><label>Alterações de Pigmentação:</label></td>
			</tr>
			<tr>
				<td>
					<table>
						<tr>
							<td><label>Efélides:</label> <s:checkbox name="avaliacaoEstetica.efelides" /></td>
							<td>&nbsp;&nbsp;</td>
							<td><label>Vitiligo:</label> <s:checkbox name="avaliacaoEstetica.vitiligo" /></td>
							<td>&nbsp;&nbsp;</td>
							<td><label>Manchas senis:</label> <s:checkbox name="avaliacaoEstetica.manchassenis" /></td>
							<td>&nbsp;&nbsp;</td>
							<td><label>Nevos pigmentários:</label> <s:checkbox name="avaliacaoEstetica.nevospigmentarios" /></td>
							<td>&nbsp;&nbsp;</td>
							<td><label>Fotosensibilidade:</label> <s:checkbox name="avaliacaoEstetica.fotosensibilidade" /></td>
							<td>&nbsp;&nbsp;</td>
							<td><label>Melasmas:</label> <s:checkbox name="avaliacaoEstetica.melasmas" /></td>
						</tr>
					</table>
				</td>
			</tr>
			<tr>
				<td class="linhaMedia"></td>
			</tr>
			<tr>
				<td><label>RUGAS:</label></td>
			</tr>
			<tr>
				<td class="linhaPequena"></td>
			</tr>
			<tr>
				<td><label>Localização:</label></td>
			</tr>
			<tr>
				<td>
					<table>
						<tr>
							<td><label>Nasogeniana:</label> <s:checkbox name="avaliacaoEstetica.nasogeniana" /></td>
							<td>&nbsp;&nbsp;</td>
							<td><label>Peribucais:</label> <s:checkbox name="avaliacaoEstetica.peribucais" /></td>
							<td>&nbsp;&nbsp;</td>
							<td><label>Glabelares:</label> <s:checkbox name="avaliacaoEstetica.glabelares" /></td>
							<td>&nbsp;&nbsp;</td>
							<td><label>Periorbiculares:</label> <s:checkbox name="avaliacaoEstetica.periorbiculares" /></td>
							<td>&nbsp;&nbsp;</td>
							<td><label>Palpebrais:</label> <s:checkbox name="avaliacaoEstetica.palpebrais" /></td>
							<td>&nbsp;&nbsp;</td>
							<td><label>Transversais:</label> <s:checkbox name="avaliacaoEstetica.transversais" /></td>
						</tr>
					</table>
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
					<s:radio list="tiposRuga" name="avaliacaoEstetica.tipoRugaStr" listKey="valor" listValue="nome" ></s:radio>
				</td>
			</tr>
			<tr>
				<td class="linhaPequena"></td>
			</tr>
			<tr>
				<td><label>Categoria:</label></td>
			</tr>
			<tr>
				<td>
					<s:radio list="categoriasRuga" name="avaliacaoEstetica.categoriaRugaStr" listKey="valor" listValue="nome" ></s:radio>
				</td>
			</tr>
			<tr>
				<td class="linhaMedia"></td>
			</tr>
			<tr>
				<td><label>ESTRIAS:</label></td>
			</tr>
			<tr>
				<td class="linhaMedia"></td>
			</tr>
			<tr>
				<td><label>Aparecimento:</label></td>
			</tr>
			<tr>
				<td>
					<s:radio list="estriasAparecimento" name="avaliacaoEstetica.estriaAparecimentoStr" listKey="valor" listValue="nome" ></s:radio>
				</td>
			</tr>
			<tr>
				<td class="linhaPequena"></td>
			</tr>
			<tr>
				<td>
					<table>
						<tr>
							<td><label>Coloração Inicial:</label></td>
							<td width="10px"></td>
							<td><label>Coloração Final:</label></td>
						</tr>
						<tr>
							<td>
								<s:textfield name="avaliacaoEstetica.coloracaoInicial" cssClass="medio" />
							</td>
							<td></td>
							<td>
								<s:textfield name="avaliacaoEstetica.coloracaoFinal" cssClass="medio" />
							</td>
						</tr>
					</table>
				</td>
			</tr>
			<tr>
				<td class="linhaPequena"></td>
			</tr>
			<tr>
				<td><label>Localização:</label></td>
			</tr>
			<tr>
				<td>
					<s:textfield name="avaliacaoEstetica.estriaLocalizacao" cssClass="grande" />
				</td>
			</tr>
			<tr>
				<td class="linhaMedia"></td>
			</tr>
			<tr>
				<td><label>CELULITE (FIBRO EDEMA GELOIDE): </label></td>
			</tr>
			<tr>
				<td class="linhaMedia"></td>
			</tr>
			<tr>
				<td><label>Graus:</label></td>
			</tr>
			<tr>
				<td>
					<s:radio list="grausCelulite" name="avaliacaoEstetica.grauCeluliteStr" listKey="valor" listValue="nome" ></s:radio>
				</td>
			</tr>
			<tr>
				<td class="linhaPequena"></td>
			</tr>
			<tr>
				<td><label>Tipos:</label></td>
			</tr>
			<tr>
				<td>
					<s:radio list="tiposCelulite" name="avaliacaoEstetica.tipoCeluliteStr" listKey="valor" listValue="nome" ></s:radio>
				</td>
			</tr>
			<tr>
				<td class="linhaPequena"></td>
			</tr>
			<tr>
				<td><label>Aspecto da Pele:</label></td>
			</tr>
			<tr>
				<td>
					<s:radio list="aspectosPele" name="avaliacaoEstetica.aspectoPeleStr" listKey="valor" listValue="nome" ></s:radio>
				</td>
			</tr>
			<tr>
				<td class="linhaPequena"></td>
			</tr>
			<tr>
				<td><label>Dor:</label></td>
			</tr>
			<tr>
				<td>
					<s:textfield name="avaliacaoEstetica.dor" cssClass="grande" />
				</td>
			</tr>
			<tr>
				<td class="linhaPequena"></td>
			</tr>
			<tr>
				<td><label>Localização:</label></td>
			</tr>
			<tr>
				<td>
					<s:textfield name="avaliacaoEstetica.localizacao" cssClass="grande" />
				</td>
			</tr>
			<tr>
				<td class="linhaMedia"></td>
			</tr>
		</table>
		</td>
	</tr>
</table>
