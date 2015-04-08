<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html lang="pt">
<head>
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
		$("input#login").focus();
		$(".fone").mask("(00) 00000-0000");
		$(".cadastrese").click(function(evt){
			evt.preventDefault();
			showModal("div.modalCadastro");
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
		
	});
	</script>
</head>
<body class="frontend">
    <nav class="ui menu inverted navbar page grid frontendTopo" style="margin-bottom: 0px">
        <a href="http://www.propiles.com.br" class="brand left item"><img src="img/logo.png" /></a>
        <div class="right menu">
            <a href="#planos" class="ui item">Nossos Planos</a>
            <a href="#contato" class="ui item">Entre em contato</a>
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
				      	<a href="#" class="">esqueceu a senha?</a>
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
  					<p>Grátis</p>
  					<p></p>
  				</div>
  				<div class="content centered">
	  				<a href="#" class="ui green degrade button cadastrese">Comece agora!</a>
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
  					<p>R$ 19,90 / mês</p>
  					<p></p>
  				</div>
  				<div class="content centered">
	  				<a href="" class="ui green degrade button ">Contrate já!</a>
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
  					<p>R$ 29,90 / mês</p>
  					<p></p>
  				</div>
  				<div class="content centered">
	  				<a href="" class="ui green degrade button ">Contrate já!</a>
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
  					<p>A combinar</p>
  					<p></p>
  				</div>
  				<div class="content centered">
	  				<a href="" class="ui green degrade button ">Contrate já!</a>
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
            	<s:form cssClass="ui form" action="contato" method="post">
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
					          <s:textfield name="email" placeholder="Seu e-mail" />
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
      
	<!-- ----------  MODAL  -------------  -->
	
	<div class="ui modal modalCadastro">
		<i class="close icon"></i>
		<div class="header">Cadastre-se</div>
		<div class="content">
			<s:form action="cadastre-se" cssClass="ui form" id="formCadastro" method="post" >
				<div class="required field">
					<label class="">Seu nome:</label>
					<s:textfield name="usuario.nome" cssClass="" />
				</div>
				<div class="required field">
					<label class="">Sua empresa:</label>
					<s:textfield name="tenant.nome" cssClass="" />
				</div>
				<div class="three fields">
					<div class="required field ">
						<label class="">E-mail:</label>
						<s:textfield name="usuario.login" cssClass="" />
					</div>
					<div class="required field">
						<label class="">Senha:</label>
						<s:password id="senhaCadastro" name="usuario.senha" cssClass="" />
					</div>
					<div class="required field">
						<label class="">Repita a senha:</label>
						<s:password id="repeteSenha" cssClass="" />
					</div>
				</div>
				<div class="ui actions buttons right floated">
					<div class="ui button">Cancelar</div>
					<div class="or" data-text="ou"></div>
					<s:submit cssClass="ui positive right submit button" value="Começar agora mesmo!" />
				</div>
			</s:form>
		</div>
	</div>


	<!-- MENSAGEM DE INFO E ERRO -->
	
	<s:if test="hasActionErrors()">
		<div class="ui small modal modalErro">
			<i class="close icon"></i>
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
			<i class="close icon"></i>
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
	
</body>
</html>