<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>

<!-- DUVIDAS -->
<div id="duvidas" class="ui column <s:property value="#session.profisio_user.tenant.corFinal" />">
	<a href="#"></a>
</div>

<div class="ui small modal" id="modalDuvidas">
	<i class="close icon"></i>
	<div class="header">Envie-nos sua dúvida/sugestão/problema</div>
	<div class="content">
		<h2>Ajude-nos a melhor o ProPilEs!</h2>
		<p>Sua opinião, sugestão e feedback são muito importantes para nós. Assim poderemos melhorar as funcionalidades que já temos, criar outras e corrir eventuais problemas.</p>
			
		<div class="ui hidden divider"></div>
		<div class="ui hidden divider"></div>
			
		<s:form action="#" cssClass="ui form" >
			<div class="required field">
				<label>Digite abaixo sua dúvida, sugestão ou problema enfrentado:</label>
				<s:textarea name="mensagem" id="mensagem"></s:textarea>
			</div>
			<div class="ui actions buttons right floated">
				<div class="ui button">Cancelar</div>
				<div class="or" data-text="ou"></div>
				<s:submit cssClass="ui positive right submit button" value="Enviar" />
			</div>
		</s:form>
	</div>
</div>
<div class="ui small modal" id="modalMsgDuvidas">
	<i class="close icon"></i>
	<div class="header"></div>
	<div class="content">
			<h3>Obrigado!</h3>
			Estaremos analisando sua mensagem e entraremos em contato o mais breve possível, se for o caso. Envie-nos uma mensagem sempre que necessário. <br /><br />Nosso objeto é atender nossos clientes cada vez melhor.
			<div class="ui hidden divider"></div>
			<div class="ui hidden divider"></div>
	</div>
</div>


<!-- POPUP PERSONALIZADO -->
<div class="ui small modal modalPersonalizado">
	<i class="close icon"></i>
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
	<i class="close icon"></i>
	<div class="header">Upgrade</div>
	<div class="content">
		<s:form action="upgrade" method="post" >
			<input type="hidden" name="plano" value="PLANO_3" />
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

<!-- POPUP UPGRADE PLANO1 -->
<div class="ui small modal modalPlano1">
	<i class="close icon"></i>
	<div class="header">Upgrade</div>
	<div class="content">
		<s:form action="upgrade" method="post" >
			<input type="hidden" name="plano" value="PLANO_2" />
			<h3>Parabéns!</h3>
			Você está prestes a dar um upgrade na sua versão. Com ela os seus colaboradores poderão acessar o sistema e inserir informações também.
			
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
		<i class="close icon"></i>
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