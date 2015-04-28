<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<s:if test="url != null && url != '' ">
		<meta http-equiv="refresh" content="6;URL=<s:property value="url" />" /> 
	</s:if>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title><s:text name="TITULO_SISTEMA" /></title>
<link rel="stylesheet" type="text/css" href="v2.0/css/lib/jquery.ui.css" />
<link rel="stylesheet" type="text/css" href="v2.0/css/lib/semantic.css" />

<script type="text/javascript" src="v2.0/js/lib/jquery.semantic.js" ></script>
<script type="text/javascript" src="v2.0/js/lib/jquery.ui.mask.js" ></script>
<script type="text/javascript" src="v2.0/js/lib/scripts.js" ></script>

<s:if test="#session.profisio_user.tenant.tour">
	<link rel="stylesheet" type="text/css" href="v2.0/css/lib/hopscotch.css" />
	<script type="text/javascript" src="v2.0/js/lib/hopscotch.js" ></script>
	<script type="text/javascript">
	 	var linksLiberados = false;
		$(document).ready(function(){
			$(".menuCabecalho").find("a").each(function(){
				$(this).click(function(evt){
					if(!linksLiberados)
						evt.preventDefault();
				});
			});
			
			var tour = {
			  id: "tour",
			  steps: [
			    {
			      title: "Antes de começar",
			      content: "Para usarmos o ProPilEs da melhor forma vamos fazer um tour super rápido em nosso sistema. Siga até o fim com paciência e este guia não aparecerá mais. Aperte na barra de espaço do seu teclado ou clique no botão abaixo para prosseguir.",
			      target: "tourTitulo",
			      placement: "bottom",
			      onShow: function(){
			    	  $(".hopscotch-nav-button.next").focus();
			      }
			    },
			    {
			      title: "Menu de Navegação",
			      content: "No menu temos todas as funcionalidades organizadas por módulos.",
			      target: document.querySelector("#tourMenu img"),
			      placement: "bottom",
			      onShow: function(){
			    	  $(".tourAtivo").removeClass("tourAtivo");
			    	  $("#tourMenu").addClass("tourAtivo");
			      }
			    },
			    {
			      title: "Menu de Configurações",
			      content: "No menu de configurações temos as funcionalidades referentes ao seu usuário.",
			      target: document.querySelector("#tourConfig img"),
			      placement: "bottom",
			      onShow: function(){
			    	  $(".tourAtivo").removeClass("tourAtivo");
			    	  $("#tourConfig").addClass("tourAtivo");
			      }
			    },
			    {
			      title: "Dúvidas/Sugestões",
			      content: "Área para você entrar em contato conosco.",
			      target: document.querySelector("#tourDuvidas img"),
			      placement: "bottom",
			      onShow: function(){
			    	  $(".tourAtivo").removeClass("tourAtivo");
			    	  $("#tourDuvidas").addClass("tourAtivo");
			      }
			    },
			    {
			      title: "Menu Admin",
			      content: "No menu Admin temos as funcionalidades iniciais do sistema.",
			      target: document.querySelector("#tourAdmin img"),
			      placement: "bottom",
			      onShow: function(){
			    	  $(".tourAtivo").removeClass("tourAtivo");
			    	  $("#tourAdmin").addClass("tourAtivo");
			      }
			    },
			    {
			      title: "Menu Colaboradores",
			      content: "No menu Colaboradores temos as funcionalidades referentes aos seus colaboradores.",
			      target: document.querySelector("#tourColaboradores img"),
			      placement: "bottom",
			      onShow: function(){
			    	  $(".tourAtivo").removeClass("tourAtivo");
			    	  $("#tourColaboradores").addClass("tourAtivo");
			      }
			    },
			    {
			      title: "Detalhes do Colaborador",
			      content: "Página de detalhes do colaborador com os serviçoes prestados por ele.",
			      target: document.querySelector("#tourColaborador img"),
			      placement: "bottom",
			      onShow: function(){
			    	  $(".tourAtivo").removeClass("tourAtivo");
			    	  $("#tourColaborador").addClass("tourAtivo");
			      }
			    },
			    {
			      title: "Menu Geral",
			      content: "Veja os próximos aniversariantes, os últimos atendimentos feitos e veja todos os agendamentos já feitos para seus clientes.",
			      target: document.querySelector("#tourGeral img"),
			      placement: "bottom",
			      onShow: function(){
			    	  $(".tourAtivo").removeClass("tourAtivo");
			    	  $("#tourGeral").addClass("tourAtivo");
			      }
			    },
			    {
			      title: "Menu Cadastros",
			      content: "Veja as informações de todos os seus clientes.",
			      target: document.querySelector("#tourCadastro img"),
			      placement: "bottom",
			      onShow: function(){
			    	  $(".tourAtivo").removeClass("tourAtivo");
			    	  $("#tourCadastro").addClass("tourAtivo");
			      }
			    },
			    {
			      title: "Menu Vendas",
			      content: "Venda produtos em seu estabelecimento",
			      target: document.querySelector("#tourVendas img"),
			      placement: "bottom",
			      onShow: function(){
			    	  $(".tourAtivo").removeClass("tourAtivo");
			    	  $("#tourVendas").addClass("tourAtivo");
			      }
			    },
			    {
			      title: "Menu Fluxo de Caixa",
			      content: "Tudo que é necessário para gerenciar os dados financeiros de sua empresa",
			      target: document.querySelector("#tourFluxoCaixa img"),
			      placement: "bottom",
			      onShow: function(){
			    	  $(".tourAtivo").removeClass("tourAtivo");
			    	  $("#tourFluxoCaixa").addClass("tourAtivo");
			      }
			    },
			    {
			      title: "Menu Relatórios",
			      content: "Relatórios inteligentes com informações relevantes para o seu dia-a-dia.",
			      target: document.querySelector("#tourRelatorios img"),
			      placement: "bottom",
			      onShow: function(){
			    	  $(".tourAtivo").removeClass("tourAtivo");
			    	  $("#tourRelatorios").addClass("tourAtivo");
			      }
			    },
			    {
			      title: "Menu Análises de BI",
			      content: "Área com Análises de BI (Business Inteligence)",
			      target: document.querySelector("#tourAnalises img"),
			      placement: "bottom",
			      onShow: function(){
			    	  $(".tourAtivo").removeClass("tourAtivo");
			    	  $("#tourAnalises").addClass("tourAtivo");
			      }
			    },
			    {
			      title: "Vamos começar!?",
			      content: "Agora sim vamos começar a usar o ProPilEs! Sugerimos que comece pelo menu Admin",
			      target: document.querySelector("#subMenuGerenciamento"),
			      placement: "bottom",
			      onShow: function(){
			    	  $(".tourAtivo").removeClass("tourAtivo");
			    	  linksLiberados = true;
			    	  $("#hopscotch-done").focus();
			    	  runAjax("rodarTour", "", "text", doNothing);
			      }
			    }
			  ]
			};
			hopscotch.startTour(tour);
		});
	</script>
</s:if>

</head>
<body>
<s:include value="geral/cabecalho.jsp" />

<div class="ui hidden divider"></div>
<div class="ui hidden divider"></div>
<div class="ui hidden divider"></div>

<s:if test="!#session.profisio_user.tenant.tour">

	<!-- DASHBOARD 88888888888888888888888888888888888888888888888888888888888888888888888 -->
	<div class="fifteen wide column">
		<div class="ui two centered column grid">
			<div class="two column centered row" >
				<div class="column" >
					<h2 class="ui small header"><i class="<s:property value="#session.profisio_user.tenant.corFinal" /> feed icon"></i> Novidades do Sistema</h2>
					<div class="ui segment" >
						<div class="ui list">
						  	<div class="item">
							    <i class="top aligned right bar chart <s:property value="#session.profisio_user.tenant.corFinal" /> large circular icon"></i>
							    <div class="content">
							      <div class="header">Última Atualização</div>
							      20/03/2015 às 13:00
							      <div class="list">
							        <div class="item">
							          <i class="right triangle top aligned icon"></i>
							          <div class="content">
							            <b>Folha de pagamento</b>
							            <div class="description">No menu FINANCEIRO adicionamos uma área de FOLHA DE PAGAMENTO onde você poderá gerenciar os pagamentos aos seus colaboradores, analisando as porcentagens sobre cada atendimento feito. Após fazer suas análises gere uma conta a pagar diretamente em seu fluxo de caixa.</div>
							          </div>
							        </div>
							        <div class="item">
							          <i class="right triangle top aligned icon"></i>
							          <div class="content">
							            <b>Criação da agenda</b>
							            <div class="description">No menu GERAL foi criada uma área para agendamentos. Nesta área você poderá inserir os atendimentos futuros previstos e assim poder se programar com os atendimentos, salas e horários.</div>
							          </div>
							        </div>
							        <div class="item">
							          <i class="right triangle top aligned icon"></i>
							          <div class="content">
							            <b>Personalização dos serviços</b>
							            <div class="description">No menu ADMINISTRAÇÃO - SERVIÇOS você poderá informar se o serviço trabalha com base em quantidade de sessões e, em caso positivo, quantas sessões serão utilizadas. Isto servirá apenas para facilitar cadastros futuros, pois todos os valores podem ser alterados. Nenhum valor é fixo ou irrevogável.</div>
							          </div>
							        </div>
							      </div>
							    </div>
							  </div>
						  </div>
					</div>
				</div>
				<div class="column" >
				</div>
			</div>
		</div>
	</div>
</s:if><s:else>
	
	<!-- TOUR GUIDE 88888888888888888888888888888888888888888888888888888888888888888888888 -->
	<div class="thirteen wide column">
		<div class="ui centered column grid">
			<div class="column" >
				<h2 class="ui header" id="tourTitulo"><i class="<s:property value="#session.profisio_user.tenant.corFinal" /> sitemap icon"></i> Guia de Uso</h2>
				<div class="ui segment" >
					O ProPilEs foi desenvolvido tendo em vista uma usabilidade fácil e prática para o você, nosso usuário, portanto será bem fácil e intuitivo utilizá-lo.<br />
					<ol class="ui list tourList" >
						<li id="tourMenu">
							<p>Na parte superior temos o menu de navegação onde reunimos todas as funcionalidades:</p>
							<img src="v2.0/img/tour/tour-menu.jpg" />
						</li>
						<li id="tourConfig">
							<p>No lado superior direito temos o menu de configuração onde temos algumas funcionalidades referentes ao seu usuário no sistema. Você poderá alterar as cores e a logo utilizada no sistema para que fique com a aparência de sua empresa, alterar os seus dados de cadastro e sua senha de acesso e temos o botão para finalizar sua sessão no sistema.</p>
							<img src="v2.0/img/tour/tour-menu-config.jpg" />
						</li>
						<li id="tourDuvidas">
							<p>No lado direito teremos sempre uma área onde você poderá enviar-nos uma mensagem com críticas, dúvidas, sugestões ou problemas enfrentados. Isto servirá para que possamo lhe atender melhor, aprimorando cada vez mais nossa ferramenta</p>
							<img src="v2.0/img/tour/tour-duvidas.jpg" />
						</li>
						<li id="tourAdmin">
							<p>No menu "Admin" encontramos as funcionalidades referentes às informações de sua empresa. É de fundamental importância para o bom funcionamento do sistema que sejam cadastrados primeiramente estes dados antes de qualquer outro.</p> 
							<p>Os <u>Centros de Custo</u> devem ser cadastrados de tal forma que os serviçoes de sua empresa estejam organizados por tipo de serviço (ex.: Aquáticos, Fisioterápicos, Estética, etc.)</p>
							<p>Os <u>Serviços</u> devem refletir exatamente todos os serviços que seu estabelecimento oferece. Obs.: Lembre-se de associá-lo a um Centro de Custo já cadastrado.</p>
							<p>O <u>Saldo Caixa</u> é um valor que reflete o valor que você possui em caixa em determinado dia (ex.: hoje) e não deve ser alterado constantemente. Não é obrigatório. Este valor será utilizado para fazer batimento de caixa.</p>
							<img src="v2.0/img/tour/tour-menu-admin.jpg" />
						</li>
						<li id="tourColaboradores">
							<p>No menu "Colaboradores" reunimos todas as ações referentes aos colaboradores da sua empresa.</p> 
							<p>A) Todas as páginas internas do ProPilEs mantém uma mesma estrutura visual para facilitar o uso. O ponto A na imagem abaixo irá mostrar sempre qual parte do sistema está sendo acessada no momento.</p>
							<p>B) Sempre que vermos este botão com o símbolo "+" siginifica que podemos inserir no sistema alguma informação. No caso da imagem abaixo, como estamos na área de Colaboradores, poderemos cadastrar um novo colaborador.</p>
							<p>C) No meio da página, na parte superior, colocaremos sempre a opção de pesquisa referente aos dados listados abaixo.</p>
							<p>D) A listagem é feita por meio de tabelas, onde cada coluna representa uma informação da listagem. Ao clicar na informação principal (no caso abaixo o nome do colaborador) poderemos ter mais detalhes desta informação.</p>
							<p>E) Algumas tabelas, como a mostrada abaixo, terão a funcionalidade de remoção. Então ao clicar no ícone vermelho com o ícone "x" você poderá remover um colaborador.</p>
							<img src="v2.0/img/tour/tour-menu-colaboradores.jpg" />
						</li>
						<li id="tourColaborador">
							<p>No menu "Colaboradores", clicando em um dos colaboradores listado você poderá ver os detalhes daquele colaborador. Como mostrado na imagem abaixo, as telas de detalhamento possuem abas para melhor organizar as informações. No caso de Colaborador temos duas abas: a primeira contém suas informações pessoais e a segunda referente aos serviços prestados na clínica, onde você deve informar o serviço que ele presta e se irá receber alguma porcentagem financeira sobre cada atendimento feito para este serviço.</p> 
							<img src="v2.0/img/tour/tour-menu-colaborador.jpg" />
						</li>
						<li id="tourGeral">
							<p>No menu "Geral" encontramos três áreas bastante úteis: a primeira é uma lista com os próximos clientes e colaboradores aniversariantes; a segunda é uma lista com as últimas frequências registradas em todos os serviços na sua clínica; a terceira é a sua agenda onde você poderá cadastrar e ver todos os agendamentos já feitos com os seus clientes.</p> 
							<img src="v2.0/img/tour/tour-menu-geral.jpg" />
						</li>
						<li id="tourCadastro">
							<p>No menu "Cadastros", clicando em um dos cadastros listado você poderá ver os detalhes daquele cliente. Utilizamos o termo "Cadastro" porque nem todos listados se tornaram clientes, podendo ter feito apenas uma avaliação gratúita dos seus serviços. Assim como na tela de detalhamento do Colaborador aqui temos também algumas abas para organizarmos as informações do Cliente.</p>
							<p>Na aba "Atividades na Clínica" vemos todas as atividades que este cliente faz ou já fez e as fichas de avaliação para cada serviço.</p> 
							<p>Na aba "Pagamentos" temos todos os pagamentos já feitos por este cliente com informação de valores, data, descontos, formas de pagamento, etc.</p> 
							<p>Na aba "Frequências" você irá controlar todas as frequências deste cliente, controlando assim as visitas dele ao seu estabelecimento.</p> 
							<p>Na aba "Agendamentos" você irá visualizar na sua agenda apenas os agendamentos deste cliente.</p> 
							<img src="v2.0/img/tour/tour-menu-cadastro.jpg" />
						</li>
						<li id="tourVendas">
							<p>No menu "Vendas" você poderá gerenciar o estoque de produtos que você venha a vender em seu estabelecimento. Esta venda pode ser feita de forma avulsa ou em um determinado atendimento.</p>
							<img src="v2.0/img/tour/tour-menu-vendas.jpg" />
						</li>
						<li id="tourFluxoCaixa">
							<p>No menu "Fluxo de Caixa" você terá tudo que é necessário para controlar o financeiro da sua empresa. Controle todas as Contas a Pagar (saídas) e Contas a Receber (entradas), gere a folha de pagamento dos seus colaboradores já com a porcentagem estabelecida para cada atendimento feito e no submenu "Caixa" você terá um extrato diário de tudo que entra ou sai, expressando a sua real situação bancária.</p>
							<img src="v2.0/img/tour/tour-menu-fluxocaixa.jpg" />
						</li>
						<li id="tourRelatorios">
							<p>No menu "Relatórios" temos alguns relatórios inteligentes que irão fornecer informações relevantes para o seu negócio. Por exemplo, você poderá saber quais clientes fizeram certo serviço em determinado período do ano, qual a sua taxa de efetividade, isto é, de todos os cadastros feitos quantos destes se tornaram realmente clientes ativos, além do Demonstrativo de Resultado que fornece indicadores financeiros como a Lucratividade, Ticket Médio, Ponto de Equilíbrio, Margem de Contribuição, Receitas Brutas, Custos Fixos e Variáveis.</p>
							<img src="v2.0/img/tour/tour-menu-relatorios.jpg" />
						</li>
						<li id="tourAnalises">
							<p>No menu "Análise" de BI (Business Inteligence) é uma área especial onde temos análises gerenciais do seu negócio que servem de apoio para tomada de decisão. Dentre as análises temos: visão do perfil da clientela, taxa de efetividade e captação de clientes; análise dos atendimentos por serviço e diversas análises financeiras.</p>
							<img src="v2.0/img/tour/tour-menu-analises.jpg" />
						</li>
					</ol>
				</div>
			</div>
		</div>
	</div>
</s:else>

<div class="ui hidden divider"></div>
<div class="ui hidden divider"></div>
<div class="ui hidden divider"></div>

<s:include value="geral/rodape.jsp" />
</body>
</html>