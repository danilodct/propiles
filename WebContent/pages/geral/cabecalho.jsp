<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<div id="cabecalho">
	<div id="logo">
		<img src="img/cabecalho/logo.png" />
	</div>
	<div id="area-menu">
		<div id="menu">
			<s:if test="#session.pilates_user != null">
				<ul id="cssdropdown">
					<li class="headlink"><a href="#">GERAL</a>
						<ul>
							<li><a href="aniversariantes">ANIVERSARIANTES</a></li>
							<li><a href="frequencia">FREQUÊNCIA</a></li>
						</ul>
					</li>
					<li class="headlink"><img src="img/cabecalho/separador_pontilhado.png" /></li>
					<li class="headlink"><a href="clientes">CADASTROS</a></li>
					<li class="headlink"><img src="img/cabecalho/separador_pontilhado.png" /></li>
				<s:if test="#session.pilates_user.tipo.value != 'PROFESSOR'">
					<li class="headlink"><a href="#">VENDAS</a>
						<ul>
							<li><a href="produtos">PRODUTOS</a></li>
							<li><a href="estoque">ESTOQUE</a></li>
						</ul>
					</li>
					<li class="headlink"><img src="img/cabecalho/separador_pontilhado.png" /></li>
					<li class="headlink"><a href="funcionarios">COLABORADORES</a></li>
					<li class="headlink"><img src="img/cabecalho/separador_pontilhado.png" /></li>
				</s:if>
				<s:if test="#session.pilates_user.tipo.value == 'ADMINISTRADOR' || #session.pilates_user.tipo.value == 'AUX_ADMINISTRATIVO'">
					<li class="headlink"><a href="#">FLUXO DE CAIXA</a>
						<ul>
							<li><a href="contasPagar">CONTAS A PAGAR</a></li>
							<li><a href="contasReceber">CONTAS A RECEBER</a></li>
							<li><a href="caixa">CAIXA</a></li>
						</ul>
					</li>
				</s:if>
				<s:if test="#session.pilates_user.tipo.value == 'ADMINISTRADOR' ">
					<li class="headlink"><img src="img/cabecalho/separador_pontilhado.png" /></li>
					<li class="headlink"><a href="#">RELATÓRIOS</a>
						<ul>
						<!-- 
							<li><a href="relatorioAlunosRedirect">CADASTROS</a></li>
						 -->
							<li><a href="relatorioAlunosAtivosRedirect">FREQUENTES</a></li>
							<li><a href="relatorioEfetividade">EFETIVIDADE</a></li>
							<li><a href="relatorioLucroRedirect">LUCRO</a></li>
							<li><a href="relatorioDemonstrativoResultadoRedirect">DEMONSTRATIVO RESULTADO</a></li>
							<li><a href="relatorioFormaPagamentoRedirect">FORMA DE PAGAMENTO</a></li>
							<li><a href="relatorioMidia">MÍDIAS</a></li>
						</ul>
					</li>
					<li class="headlink"><img src="img/cabecalho/separador_pontilhado.png" /></li>
					<li class="headlink"><a href="#">GESTÃO</a>
						<ul>
							<li><a href="gestaoClientesRedirect">CLIENTES</a></li>
							<li><a href="gestaoFinanceiraRedirect">FINANCEIRA</a></li>
						</ul>
					</li>
					<li class="headlink"><img src="img/cabecalho/separador_pontilhado.png" /></li>
					<li class="headlink"><a href="#">GERENCIAMENTO</a>
						<ul>
							<li><a href="gerenciarServicosRedirect">SERVIÇOS</a></li>
							<li><a href="gerenciarCentroCustoRedirect">CENTRO DE CUSTO</a></li>
							<li><a href="gerenciarCaixaRedirect">SALDO CAIXA</a></li>
						</ul>
					</li>
				</s:if>
					<li class="headlink"><img src="img/cabecalho/separador_pontilhado.png" /></li>
					<li class="headlink"><a href="logout">SAIR</a></li>
				</ul>
			</s:if>
		</div>
	</div>
</div>