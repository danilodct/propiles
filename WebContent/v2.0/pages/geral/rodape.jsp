<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>


<!-- POPUP PERSONALIZADO -->
<div class="ui small modal modalPersonalizado">
	<div class="header">Upgrade</div>
	<div class="content">
		<s:form action="personalizado" method="post" >
			<h3>Parabéns!</h3>
			Você está prestes a adquirir uma versão personalizada do nosso sistema. Para isso, basta confirmar no botão abaixo e entraremos em contato com você por e-mail para darmos prosseguimento ao atendimento.
			
			<div class="ui hidden divider"></div>
			<div class="ui hidden divider"></div>
			
			<div class="ui actions buttons right floated">
				<div class="ui button">Cancelar</div>
				<div class="or" data-text="ou"></div>
				<s:submit cssClass="ui positive right submit button" value="Confirmar" />
			</div>
		</s:form>
	</div>
</div>

<!-- POPUP UPGRADE -->
<div class="ui small modal modalUpgrade">
	<div class="header">Upgrade</div>
	<div class="content">
		<s:form action="upgrade" method="post" >
			<h3>Parabéns!</h3>
			Você está prestes a dar um upgrade na sua versão. Com ela você poderá acessar todos os módulos do ProPilEs.
			
			<div class="ui hidden divider"></div>
			<div class="ui hidden divider"></div>
			
			<div class="ui actions buttons right floated">
				<div class="ui button">Cancelar</div>
				<div class="or" data-text="ou"></div>
				<s:submit cssClass="ui positive right submit button" value="Continuar" />
			</div>
		</s:form>
	</div>
</div>

<s:if test="url != null && url != '' ">
	<div class="ui small modal modalRedirecionando">
		<div class="header">Upgrade</div>
		<div class="content">
			<h2>O upgrade da sua versão foi feito com sucesso!</h2>
			<p><img src="img/logo_pagseguro.png" style="float:right; padding-left:5px;" />Estamos te redirecionando agora para a página do PagSeguro onde seu pagamento será feito com toda segurança, confiabilidade e comodidade.</p>
			<br />
			Por favor aguarde...<br /><br /><br />
		</div>
	</div>
	<script type="text/javascript">
		showModal("div.modalRedirecionando");
	</script>
</s:if>

</div>
<div class="ui grid">
	<div class="column">
		<div class="ui hidden divider"></div>
		<div class="ui hidden divider"></div>
		<div class="ui hidden divider"></div>
		<div class="ui hidden divider"></div>
		<div class="ui horizontal <s:property value="#session.profisio_user.tenant.corFinal" /> divider">ProPilEs 2015</div>
	</div>
</div>