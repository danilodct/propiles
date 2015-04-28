<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<div class="ui centered grid">
<div class="sixteen wide column">
<div class="ui menu menuCabecalho">
    
	<div class="menu">
		<div class="ui image tiny item">
			<a href="home">
				<s:if test="#session.profisio_user.tenant.logo == null || #session.profisio_user.tenant.logo == '' ">
					<img src="v2.0/img/logo.jpg" />
				</s:if><s:else>
					<img src="logos/<s:property value="#session.profisio_user.tenant.logo" />" />
				</s:else>
			</a>
		</div>
	<s:if test="#session.profisio_user.tipo.value != 'PROFESSOR'">
		<div class="ui dropdown item" id="subMenuGerenciamento">
			<i class="dropdown icon"></i> 
			<span class="text">Admin</span>
			<div class="menu">
				<div class="item"><a href="centrosCusto" id="menuCentroCusto">Centro de Custo</a></div>
				<div class="item"><a href="servicos" id="menuServicos">Serviços</a></div>
				<div class="item"><a href="gerenciarCaixa" id="menuSaldoCaixa">Saldo Caixa</a></div>
			</div>
		</div>
	    <a class="item" href="colaboradores" id="menuColaboradores">Colaboradores</a>
	</s:if>
		<div class="ui dropdown item" id="subMenuGeral">
			<i class="dropdown icon"></i> 
			<span class="text">
				<!-- <i class="star small yellow hint icon right" data-html="Nova Atualização!" data-variation="inverted"></i> -->
				Geral
			</span>
			<div class="menu">
				<div class="item"><a href="aniversariantes" id="menuAniversariantes">Aniversariantes</a></div>
				<div class="item"><a href="frequencia" id="menuFrequencia">Últimos atendimentos</a></div>
				<div class="item">
					<a href="agenda" id="menuAgenda">
						Agenda
					</a>
				</div>
			</div>
		</div>
	    <a class="item" href="cadastros" id="menuCadastros">Cadastros</a>
	<s:if test="#session.profisio_user.tipo.value != 'PROFESSOR'">
		<div class="ui dropdown item" id="subMenuVendas">
			<i class="dropdown icon"></i> 
			<span class="text">Vendas</span>
			<div class="menu">
				<div class="item"><a href="produtos" id="menuProdutos">Produtos</a></div>
				<div class="item"><a href="estoque" id="menuEstoque">Estoque</a></div>
				<div class="item"><a href="vendidos" id="menuVendidos">Vendidos</a></div>
			</div>
		</div>
	</s:if>
	<s:if test="#session.profisio_user.tipo.value == 'ADMINISTRADOR' || #session.profisio_user.tipo.value == 'AUX_ADMINISTRATIVO'">
		<div class="ui dropdown item" id="subMenuFluxoCaixa">
			<i class="dropdown icon"></i> 
			<span class="text">
				Fluxo de Caixa
			</span>
			<div class="menu">
				<div class="item"><a href="contasPagar" id="menuContasPagar">Contas a Pagar</a></div>
				<div class="item"><a href="contasReceber" id="menuContasReceber">Contas a Receber</a></div>
				<div class="item">
					<a href="folhaPagamento" id="menuFolhaPagamento">
						Folha de pagamento
					</a>
				</div>
				<div class="item"><a href="caixa" id="menuCaixa">Caixa</a></div>
			</div>
		</div>
	</s:if>
	<s:if test="#session.profisio_user.tipo.value == 'ADMINISTRADOR'">
		<div class="ui dropdown item" id="subMenuRelatorios">
			<i class="dropdown icon"></i> 
			<span class="text">Relatórios</span>
			<div class="menu">
				<div class="item"><a href="relatorioFrequentes" id="menuFrequentes">Frequentes</a></div>
				<div class="item"><a href="relatorioEfetividade" id="menuEfetividade">Efetividade</a></div>
				<!-- <div class="item"><a href="relatorioLucro" id="menuLucro">Lucro</a></div> -->
				<div class="item"><a href="relatorioDRE" id="menuDemonstrativo">Demonstrativo Resultado</a></div>
				<!-- <div class="item"><a href="relatorioFormaPagamento" id="menuFormaPagamento">Forma de Pagamento</a></div> -->
			</div>
		</div>
		<div class="ui dropdown item" id="subMenuAnalises">
		<!--  
		 -->
			<i class="dropdown icon"></i>
			<span class="text">Análises</span>
			<div class="menu">
				<div class="item">
					<i class="vaiLeft dropdown icon"></i> 
					<span class="text">Clientes</span>
					<div class="vaiLeft menu">
						<div class="item"><a href="BIPerfilClientes" id="menuPerfil">Perfil Clientes</a></div>
						<div class="item"><a href="BIEfetividade" id="menuEfetividadeBI">Efetividade</a></div>
						<div class="item"><a href="BICaptacao" id="menuCaptacao">Captação</a></div>
					</div>
				</div>
				<div class="item">
					<i class="vaiLeft dropdown icon"></i> 
					<span class="text">
						Atendimentos
					</span>
					<div class="vaiLeft menu">
						<div class="item"><a href="BIVisaoGeralServicos" id="menuVisaoGeralServicos">Por Serviço</a></div>
						<div class="item"><a href="BICrescimentoServicos" id="menuServicosCrescimento">Evolutivo</a></div>
					</div>
				</div>
				<div class="item">
					<i class="vaiLeft dropdown icon"></i> 
					<span class="text">
						Financeiro
					</span>
					<div class="vaiLeft menu">
						<div class="item"><a href="BIEntradas" id="menuEntradas">Entradas</a></div>
						<div class="item"><a href="BIDespesas" id="menuDespesas">Despesas</a></div>
						<div class="item"><a href="BIEvolutivoDespesas" id="menuEvolutivoDespesas">Evolutivo despesas</a></div>
					</div>
				</div>
			</div>
		</div>
	</s:if>
		<div class="ui dropdown item right" id="subMenuPreferencias" title="<s:property value="#session.profisio_user.tenant.nome" /> [<s:property value="#session.profisio_user.nomeUser" />]">
			<div class="text">Olá <s:property value="#session.profisio_user.nomeUser" /> [<s:property value="#session.profisio_user.tenant.nome" />]</div>
			<i class="setting icon"></i>
			<i class="dropdown icon"></i>
			<div class="menu">
				<div class="item nome"><a href="#" class="text">Olá <s:property value="#session.profisio_user.nomeUser" /> [<s:property value="#session.profisio_user.tenant.nome" />]</a></div>
				<div class="divider nome"></div>
				<s:if test="#session.profisio_user.tipo.value == 'ADMINISTRADOR'">
					<div class="item"><a href="aparencia" id="aparencia"><i class="icon unhide"></i>Mudar aparência</a></div>
					<div class="divider"></div>
				</s:if>
				<div class="item"><a href="dados" id="dados"><i class="icon edit"></i>Alterar dados</a></div>
				<div class="divider"></div>
				<div class="item"><a href="alterarSenha" id="alterarSenha"><i class="icon unlock alternate"></i>Alterar senha</a></div>
				<div class="divider"></div>
				<div class="item"><a href="logout" id="logout"><i class="icon sign out"></i>Sair</a></div>
			</div>
		</div>
	</div>
</div>
</div>


<s:if test="hasActionErrors()">
	<div class="seven wide column">
		<div class="ui error message">
			<i class="close icon"></i>
			<div class="header">Opss...</div>
			<ul class="list">
				<s:iterator value="actionErrors">
					<li><s:property escape="false" /></li>
				</s:iterator>
			</ul>
		</div>
	</div>
	<div class="ui hidden divider"></div>
</s:if>

<s:if test="hasActionMessages()">
	<div class="seven wide column">
		<div class="ui info message">
			<i class="close icon"></i>
			<div class="header">Info</div>
			<ul class="list">
				<s:iterator value="actionMessages">
					<li><s:property escape="false" /></li>
				</s:iterator>
			</ul>
		</div>
	</div>
	<div class="ui hidden divider"></div>
</s:if>
