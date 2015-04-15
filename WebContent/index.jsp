<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html lang="pt">
<head>
	<s:if test="url != null && url != '' ">
		<meta http-equiv="refresh" content="5;URL=<s:property value="url" />" /> 
	</s:if>
    <meta charset="utf-8">
    <title><s:text name="TITULO_SISTEMA" /></title>
    <meta name="description" content="<s:text name="TITULO_SISTEMA" />">
    <meta name=viewport content="width=device-width, initial-scale=1">
    <meta name="mobile-web-app-capable" content="yes">

	<link href='http://fonts.googleapis.com/css?family=Roboto:400,100,300&subset=latin,latin-ext' rel='stylesheet' type='text/css'>
	<link rel="stylesheet" type="text/css" href="v2.0/css/lib/jquery.ui.css" /> 
	<link rel="stylesheet" type="text/css" href="v2.0/css/lib/semantic.css" />
	<link rel="stylesheet" type="text/css" href="css/frontend.css" />
    <link href='//fonts.googleapis.com/css?family=Open+Sans:400,700,300&subset=latin,vietnamese' rel='stylesheet' type='text/css'>
    
	<script type="text/javascript" src="v2.0/js/lib/jquery.semantic.js" ></script>
	<script type="text/javascript" src="v2.0/js/lib/jquery.ui.mask.js" ></script>
	<script type="text/javascript" src="v2.0/js/lib/scripts.js" ></script>
	<script type="text/javascript">
	$(document).ready(function(){
		$("input#e-mail").focus();
		$("a.esqueceuSenha").click(function(evt){
			evt.preventDefault();
			$("div.modalEsqueceuSenha").modal("hide dimmer").modal("show");
		});
		$(".cadastrese").click(function(evt){
			evt.preventDefault();
			showModal("div.modalCadastro");
			$('.modalCadastro2').modal('attach events', '.modalCadastro .btAvancar');
		});
		$("input#radioGratis").change(function(evt){$("input#plano").val("PLANO_1");});
		$("input#radioPlano1").change(function(evt){$("input#plano").val("PLANO_2");});
		$("input#radioPlano2").change(function(evt){$("input#plano").val("PLANO_3");});
		$("input#radioPlano3").change(function(evt){$("input#plano").val("PLANO_4");});
		
		$("form#formContato").submit(function(evt){
			var sucesso = true;
			if(!isEmail("input#emailContato")){
				sucesso = false;
				alert("Digite um e-mail válido!");
				showModal("div.modalContato");
				$("input#emailContato").focus();
			}
			return sucesso;
		});
		
		$("form#formCadastro").submit(function(evt){
			var sucesso = true;
			if($("input#senhaCadastro").val() != $("input#repeteSenha").val() || $("input#senhaCadastro").val() == ""){
				sucesso = false;
				alert("Verifique a sua senha!");
				showModal("div.modalCadastro");
			}
			return sucesso;
		});
		
		$("form#formLogin").submit(function(evt){
			var sucesso = true;
			if($("input#e-mail").val().trim() == ""){
				sucesso = false;
				$("input#e-mail").focus();
			}else if($("input#senha").val().trim() == ""){
				sucesso = false;
				$("input#senha").focus();
			}
			return sucesso;
		});
		
		$("a.btGratis").click(function(evt){
			evt.preventDefault();
			$("input#plano").val("PLANO_1");
			showModal("div.modalCadastro2");
		});
		$("a.btPlano1").click(function(evt){
			evt.preventDefault();
			$("input#plano").val("PLANO_2");
			showModal("div.modalCadastro2");
		});
		$("a.btPlano2").click(function(evt){
			evt.preventDefault();
			$("input#plano").val("PLANO_3");
			showModal("div.modalCadastro2");
		});
		$("a.btPlano3").click(function(evt){
			evt.preventDefault();
			$("input#plano").val("PLANO_4");
			showModal("div.modalCadastro2");
		});
		
	});
	</script>
</head>
<body class="frontend">

<s:if test="url != null && url != '' ">
	<div class="ui small modal modalRedirecionando">
		<div class="header">Confirmação de cadastro</div>
		<div class="content">
			<h2>Seu cadastro foi confirmado com sucesso!</h2>
			Estamos te redirecionando agora para a página do PagSeguro onde seu pagamento será feito com toda segurança, confiabilidade e comodidade.<br />
			Por favor aguarde...
		</div>
	</div>
	<script type="text/javascript">
		showModal("div.modalRedirecionando");
	</script>
</s:if>

    <nav class="ui menu inverted navbar page grid frontendTopo" style="margin-bottom: 0px">
        <a href="http://www.propiles.com.br" class="brand left item"><img src="img/logo.png" /></a>
        <div class="right menu">
            <a href="#planos" class="ui item">Nossos Planos</a>
            <a href="#contato" class="ui item btContato">Entre em contato</a>
            <a href="" class="ui green degrade button cadastrese">Cadastre-se agora!</a>
        </div>
    </nav>
    <div class="ui page grid frontendSlide">
    	<div class="one column row">
            <div class="column">
            	<s:form action="login" method="post" id="formLogin">
	            	<div class="ui form segment login right floated">
				      <div class="field">
				        <label>Faça seu login:</label>
				        <div class="ui left icon input">
				          <input type="text" placeholder="e-mail" id="e-mail" name="usuario.login" />
				          <i class="user icon"></i>
				        </div>
				      </div>
				      <div class="field">
				        <div class="ui left icon input">
				          <input type="password" placeholder="senha" id="senha" name="usuario.senha" />
				          <i class="lock icon"></i>
				        </div>
				      </div>
				      <s:submit cssClass="ui blue submit button right floated" value="Entrar" />
				      <div class="item">
				      	<a href="#" class="esqueceuSenha">esqueceu a senha?</a>
				      </div>
				    </div>
            	</s:form>
            </div>
        </div>
    </div>
    <script type="text/javascript">
		var qtdSlide = 3;
		var numeroSlide = Math.floor((Math.random() * qtdSlide) + 1);
		$("div.frontendSlide").addClass("slide"+numeroSlide);
    </script>
	<!-- ----------  HEADINGS -------------  -->
	
    <div class="ui page grid headings">
	    <div class="ui hidden divider"></div>
	    <div class="ui hidden divider"></div>

        <div class="three column row">
            <div class="column">
                <div class="ui header">
  					<i class="circular teal users icon"></i>
  					<div class="content">Para quem?</div>
  				</div>
                <p>O ProPilEs foi idealizado inicialmente com o foco de atender às necessidades de Stúdios de Pilates e de Clínicas de Estética. Porém o sistema foi implementado de tal forma que outros estabelecimentos (stúdio/salão de beleza, academia, etc.) podem fazer uso com total contentamento.</p>
            </div>
            <div class="column">
                <div class="ui header">
  					<i class="circular teal list icon"></i>
  					<div class="content">O que faz?</div>
  				</div>
                <p>Gerencia as atividades diárias, o cadastro dos seus colaboradores e clientes, as contas a pagar e contas a receber, as anotações de cada atendimento (ficha de avaliação), gerando relatórios para o seu negócio e fazendo várias análises no módulo de Análise BI onde que o gestor pode tomar decisões referentes ao seu negócio.</p>
            </div>
            <div class="column">
                <div class="ui header">
  					<i class="circular teal desktop icon"></i>
  					<div class="content">Como faz?</div>
  				</div>
                <p>O ProPilES foi desenvolvido 100% online, isto é, totalmente na internet sem necessidade de instalação. Desta forma, onde quer que esteja o gestor poderá visualizar, alterar e fazer análises sobre os dados do seu estabelecimento, tudo isso com a segurança dos dados garantida e rapidez no acesso à informação.</p>
            </div>
        </div>
        
	    <div class="ui hidden divider"></div>
	    <div class="ui hidden divider"></div>
    </div>

	<!-- ----------  FAIXA 2 -------------  -->
	
    <div class="ui page grid faixa faixa2">
    	<div class="two column row">
            <div class="column"> 
            	<img src="img/faixa3.png" />
            </div>
            <div class="column"> 
                <div class="ui header">
  					<i class="money teal circular inverted icon"></i>
  					<div class="content">
  						Financeiro
	  					<div class="sub header">Controle suas finanças</div>
  					</div>
  				</div>
                <p>Com toda segurança e integridade dos dados, o ProPilEs oferece um módulo financeiro que permitirá acompanhar suas entradas e saídas, seu caixa, ter análises de resultados e muito mais. No final do mês gere relatórios para batimento de caixa com apenas um clique. Experimente a versão grátis e se surpreenda.</p>
            </div>
        </div>
    </div>

	<!-- ----------  FAIXA 1 -------------  -->
	
    <div class="ui page grid faixa faixa1">
    	<div class="three column row">
            <div class="column"> 
                <div class="ui header">
  					<i class="cloud teal circular inverted icon"></i>
  					<div class="content">
  						Na Nuvem
	  					<div class="sub header">Acesse em qualquer lugar</div>
  					</div>
  				</div>
                <p>Acesse todos os dados da sua clínica a qualquer hora e em qualquer lugar, no seu computador, notebook, tablet ou celular. Isso é possível, pois o ProPilEs foi todo desenvolvido para funcionar na Nuvem, isto é, na internet com toda segurança e comodidade.</p>
            </div>
        </div>
    </div>

	<!-- ----------  FAIXA 3 -------------  -->
	
    <div class="ui page grid faixa faixa3">
    	<div class="two column row">
            <div class="column"> 
            	<img src="img/faixa2.png" />
            </div>
            <div class="column"> 
                <div class="ui header">
  					<i class="bar chart teal circular inverted icon"></i>
  					<div class="content">
  						Análises BI
	  					<div class="sub header">Business Inteligence</div>
  					</div>
  				</div>
                <p>Um dos nossos grandes diferenciais é a existência do módulo de BI (Business Inteligence) onde o ProPilEs, através dos dados já tramitados no sistema, além de gerar vários relatórios faz análises das informações oferecendo assim vários cenários para que você, gestor, possa tomar decisões no seu negócio.</p>
            </div>
        </div>
    </div>

	<!-- ----------  PLANOS -------------  -->
	
    <div class="ui page four column grid planos"><a name="planos"></a>
	    <div class="ui hidden divider"></div>
	    <div class="ui hidden divider"></div>
	    <div class="ui hidden divider"></div>

       	<div class="column ui horizontal segment">
                <h2 class="ui centered header">
                	Plano Grátis
  				</h2>
  				<div class="centered">
  					<p>Grátis<br />&nbsp;</p>
  					<p></p>
  				</div>
  				<div class="content centered">
	  				<a href="#" class="ui green degrade button btGratis">Comece agora!</a>
  				</div>
  				<p></p>
  				<div class="centered">
	                <p>Total acesso ao sistema</p>
	                <p>Permite apenas um usuário</p>
	                <p>Não tem acesso aos módulos Relatório e Análise BI</p>
  				</div>
       	</div>
       	<div class="column ui horizontal segment ">
                <h2 class="ui centered header">
                	Plano 1
  				</h2>
  				<div class="centered">
  					<p>R$ 19,90 / mês<br />
			  		<span class="claro">ou R$ 228,00 / ano</span></p>
  					<p></p>
  				</div>
  				<div class="content centered">
	  				<a href="" class="ui green degrade button btPlano1">Contrate já!</a>
  				</div>
  				<p></p>
  				<div class="centered">
	                <p>Total acesso ao sistema</p>
	                <p>Quantidade ilimitada de usuários</p>
	                <p>Não tem acesso aos módulos Relatório e Análise BI</p>
  				</div>
       	</div>
       	<div class="column ui horizontal segment actived">
                <h2 class="ui centered header">
                	Plano 2
  				</h2>
  				<div class="centered">
  					<p>R$ 29,90 / mês<br />
			  		<span class="claro">ou R$ 339,00 / ano</span></p>
  					<p></p>
  				</div>
  				<div class="content centered">
	  				<a href="" class="ui green degrade button btPlano2">Contrate já!</a>
  				</div>
  				<p></p>
  				<div class="centered">
	                <p>Total acesso ao sistema</p>
	                <p>Quantidade ilimitada de usuários</p>
	                <p>Acesso à todos os módulos do sistema</p>
  				</div>
       	</div>
       	<div class="column ui horizontal segment last">
                <h2 class="ui centered header">
                	Plano 3
  				</h2>
  				<div class="centered">
  					<p>Valor a combinar<br />&nbsp;</p>
  					<p></p>
  				</div>
  				<div class="content centered">
	  				<a href="" class="ui green degrade button btPlano3">Contrate já!</a>
  				</div>
  				<p></p>
  				<div class="centered">
	                <p>Total acesso ao sistema com quantidade ilimitada de usuários</p>
	                <p>Possibilidade de adequar o sistema à sua necessidade com atendimento personalizado e individual</p>
  				</div>
       	</div>
    </div>
    
    <div class="ui hidden divider"></div>
    <div class="ui hidden divider"></div>
    <div class="ui hidden divider"></div>
    <div class="ui hidden divider"></div>
    <div class="ui hidden divider"></div>
       

	<!-- ----------  CONTATO -------------  -->
	
    <div class="ui page grid faixa contato"><a name="contato"></a>
    	<div class="one column row">
            <div class="column"> 
            	<s:form cssClass="ui form" id="formContato" action="contato" method="post">
				 	<h2 class="ui dividing header">Entre em contato e tire suas dúvidas</h2>
					<div class="two fields">
				        <div class="required field">
				            <s:textfield name="nome" placeholder="Seu nome" />
				        </div>
					    <div class="field">
					          <s:textfield  name="empresa" placeholder="Sua empresa" />
						</div>
				    </div>
					<div class="two fields">
				        <div class="required field">
				            <s:textfield name="fone" placeholder="Seu telefone" cssClass="fone" />
				        </div>
					    <div class="field">
					          <s:textfield name="email" placeholder="Seu e-mail" id="emailContato" />
						</div>
				    </div>
				    <div class="required field">
						<s:textarea name="mensagem" placeholder="Sua dúvida ou mensagem"></s:textarea>
					</div>
 					<s:submit cssClass="ui submit button" value="Enviar" />
				 </s:form>
            </div>
        </div>
       
    </div>
      
	<!-- ----------  RODAPE  -------------  -->
	
    <div class="ui page grid rodape">
		<div class="two column row">
          <div class="column">
				<span>&reg; ProPilEs 2015</span>
          </div>
          <div class="column right">
	            <a href="#planos" class="ui right item">Nossos Planos</a>
	            <a href="#contato" class="ui right item">Entre em contato</a>
	            <a href="" class="ui right item cadastrese">Cadastre-se agora!</a>
          </div>
        </div>
    </div>
      
	<!-- ----------  MODAL CADASTRO PLANOS -------------  -->
	
	<div class="ui modal modalCadastro">
		<div class="header headerModal">Escolha seu plano</div>
		<div class="content">
			<div class="ui four column grid planos step1">
		       	<div class="column ui horizontal segment">
		                <h2 class="ui centered header">
		                	<input type="radio" id="radioGratis" name="plano" value="PLANO_1" /><br />
		                	Plano Grátis
		  				</h2>
		  				<div class="centered">
		  					<p>Grátis<br />&nbsp;</p>
		  					<p></p>
		  				</div>
		  				<p></p>
		  				<div class="centered">
			                <p>Total acesso ao sistema<br />
			                Permite apenas um usuário<br />
			                Não tem acesso aos módulos Relatório e Análise BI</p>
		  				</div>
		       	</div>
		       	<div class="column ui horizontal segment ">
		                <h2 class="ui centered header">
		                	<input type="radio" id="radioPlano1" name="plano" value="PLANO_2" /><br />
		                	Plano 1
		  				</h2>
		  				<div class="centered">
		  					<p>R$ 19,90 / mês<br />
		  					<span class="claro">ou R$ 228,00 / ano</span></p>
		  					<p></p>
		  				</div>
		  				<p></p>
		  				<div class="centered">
			                <p>Total acesso ao sistema<br />
			                Quantidade ilimitada de usuários<br />
			                Não tem acesso aos módulos Relatório e Análise BI</p>
		  				</div>
		       	</div>
		       	<div class="column ui horizontal segment actived">
		                <h2 class="ui centered header">
		                	<input type="radio" id="radioPlano2" checked="checked" name="plano" value="PLANO_3" /><br />
		                	Plano 2
		  				</h2>
		  				<div class="centered">
		  					<p>R$ 29,90 / mês<br />
		  					<span class="claro">ou R$ 339,00 / ano</span></p>
		  					<p></p>
		  				</div>
		  				<p></p>
		  				<div class="centered">
			                <p>Total acesso ao sistema<br />
			                Quantidade ilimitada de usuários<br />
			                Acesso à todos os módulos do sistema</p>
		  				</div>
		       	</div>
		       	<div class="column ui horizontal segment last">
					<h2 class="ui centered header">
		                	<input type="radio" id="radioPlano3" name="plano" value="PLANO_4" /><br />
		            	Plano 3
		  			</h2>
		  			<div class="centered">
		  				<p>Valor a combinar<br />&nbsp;</p>
		  				<p></p>
		  			</div>
		  			<p></p>
		  			<div class="centered">
			        	<p>Total acesso ao sistema com quantidade ilimitada de usuários<br />
			        	Possibilidade de adequar o sistema à sua necessidade com atendimento personalizado e individual</p>
		  			</div>
		       	</div>
		    </div>
		    
			<div class="ui hidden divider step1"></div>
			<div class="ui hidden divider step1"></div>
			
			<div class="ui actions buttons right floated step1">
				<div class="ui button">Cancelar</div>
				<div class="or" data-text="ou"></div>
				<div class="ui right labeled teal icon button btAvancar">
			      <i class="right arrow icon"></i>
			      Avançar
			    </div>
			</div>
		</div>
	</div>
      
	<!-- ----------  MODAL CADASTRO  -------------  -->
	
	<div class="ui modal modalCadastro2">
		<div class="header headerModal">Informe seus dados</div>
		<div class="content">
			<s:form action="cadastre-se" cssClass="ui form" id="formCadastro" method="post" >
				<s:hidden name="plano" id="plano" />
				<div class="required field step2">
					<label class="">Seu nome:</label>
					<s:textfield name="usuario.nomeUser" cssClass="" />
				</div>
				<div class="required field step2">
					<label class="">Sua empresa:</label>
					<s:textfield name="tenant.nome" cssClass="" />
				</div>
				<div class="three fields step2">
					<div class="required field ">
						<label class="">E-mail:</label>
						<s:textfield name="usuario.login" cssClass="" />
					</div>
					<div class="required field step2">
						<label class="">Senha:</label>
						<s:password id="senhaCadastro" name="usuario.senha" cssClass="" />
					</div>
					<div class="required field step2">
						<label class="">Repita a senha:</label>
						<s:password id="repeteSenha" cssClass="" />
					</div>
				</div>
				
				<div class="ui hidden divider step2"></div>
				
				<div class="ui actions buttons right floated step2">
					<div class="ui button">Cancelar</div>
					<div class="or" data-text="ou"></div>
					<s:submit cssClass="ui positive right submit button" value="Começar agora mesmo!" />
				</div>
			</s:form>
		</div>
	</div>
      
	<!-- ----------  MODAL ESQUECEU SENHA  -------------  -->
	
	<div class="ui small modal modalEsqueceuSenha">
		<div class="header">Esqueceu sua senha?</div>
		<div class="content">
			<s:form action="esqueceuSenha" cssClass="ui form" id="formEsqueceuSenha" method="post" >
				<div class="required field ">
					<label class="">Informe seu e-mail de cadastro:</label>
					<s:textfield name="usuario.login" cssClass="" />
				</div>
				<div class="ui actions buttons right floated">
					<div class="ui button">Cancelar</div>
					<div class="or" data-text="ou"></div>
					<s:submit cssClass="ui positive right submit button" value="Reenviar minha senha" />
				</div>
			</s:form>
		</div>
	</div>


	<!-- MENSAGEM DE INFO E ERRO -->
	
	<s:if test="hasActionErrors()">
		<div class="ui small modal modalErro">
			<div class="header">Ops.. Ocorreu um erro!</div>
			<div class="content">
				<ul>
				<s:iterator value="actionErrors">
					<li><s:property escape="false" /></li>
				</s:iterator>
				</ul>
				<div class="ui actions buttons right floated">
					<div class="ui positive right submit button" >Ok</div>
				</div>
			</div>
		</div>
		<script type="text/javascript">
			showModal("div.modalErro");
			<s:if test="page == 'cadastro' ">
				$("div.modalCadastro").modal('attach events', '.modalErro .button');
			</s:if>
		</script>
	</s:if>
	<s:if test="hasActionMessages()">
		<div class="ui small modal modalInfo">
			<div class="header">Info!</div>
			<div class="content">
				<ul>
				<s:iterator value="actionMessages">
					<li><s:property escape="false" /></li>
				</s:iterator>
				</ul>
				<div class="ui actions buttons right floated">
					<div class="ui positive right submit button" >Ok</div>
				</div>
			</div>
		</div>
		<script type="text/javascript">
			showModal("div.modalInfo");
		</script>
	</s:if>
	
	
	<!-- CASO TENHA ENVIADO ALGUMA MSG VAI DIRETO PRA AREA DE MSG -->
	
	<s:if test="page == 'contato'">
		<script type="text/javascript">
			location.href = "#contato";
		</script>
	</s:if>
	
</body>
</html>