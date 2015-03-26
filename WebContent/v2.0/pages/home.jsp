<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title><s:text name="TITULO_SISTEMA" /></title>
<link rel="stylesheet" type="text/css" href="v2.0/css/lib/jquery.ui.css" />
<link rel="stylesheet" type="text/css" href="v2.0/css/lib/semantic.css" />
<script type="text/javascript" src="v2.0/js/lib/jquery.ui.mask.js" ></script>
<script type="text/javascript" src="v2.0/js/lib/jquery.semantic.js" ></script>
<script type="text/javascript" src="v2.0/js/lib/scripts.js" ></script>
</head>
<body>
<s:include value="geral/cabecalho.jsp" />

<div class="ui hidden divider"></div>
<div class="ui hidden divider"></div>
<div class="ui hidden divider"></div>

<!-- DASHBOARD 88888888888888888888888888888888888888888888888888888888888888888888888 -->
<div class="fifteen wide column">
	<div class="ui two centered column grid">
		<div class="two column centered row" >
			<div class="column" >
				<h2 class="ui small header"><i class="teal feed icon"></i> Novidades do Sistema</h2>
				<div class="ui segment" >
					<div class="ui list">
					  	<div class="item">
						    <i class="top aligned right bar chart teal large circular icon"></i>
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

<div class="ui hidden divider"></div>
<div class="ui hidden divider"></div>
<div class="ui hidden divider"></div>

<s:include value="geral/rodape.jsp" />
</body>
</html>