function setNumberFormat(value){
	value = value.toString();
	var decimal = "";
	if(value.indexOf('.') != -1){
		var partes = value.split('.');
		decimal = ","+partes[1];
		if(decimal.length > 3){
			decimal = decimal.substring(0, 3);
		}
		value = partes[0];
	}
	var retorno = "";
	var casas = 0;
	for(var i = value.length - 1; i >= 0; i -= 1){
		if(casas == 3){
			retorno = "." + retorno;
			casas = 0;
		}else{
			casas += 1;
		}
		retorno = value.charAt(i) + retorno;
	}
	retorno += decimal;
	return retorno;
}

function showModal(div, close){
	if(close == null || close == undefined){
		close = true;
	}
	if(div == null || div == undefined){
		div = "div#divModal";
	}
	$(div).modal({
		onOpen : function(dialog) {
			dialog.data.slideDown('normal');
			dialog.overlay.fadeIn('normal', function() {
				dialog.container.fadeIn('normal');
			});
		},
		onClose : function(dialog) {
			dialog.data.fadeOut('normal', function() {
				dialog.container.hide('normal');
				$("div#divModal").hide();
			});
			dialog.overlay.fadeOut('normal', function() {
				$.modal.close();
				$("div#divModal").hide();
			});
		},
		opacity : 40,
		overlayCss : {
			backgroundColor : "#000"
		},
		overlayClose : close,
		escClose:close
	});
}

function corrigirData(form) {
	if(form == null){
		form = "";
	}
	$(form+" input.data").each(function(){
		var data = $(this).val();
		var partes = data.split("/");
		data = partes[2]+"-"+partes[1]+"-"+partes[0];
	});
}

function getById(id) {
	return document.getElementById(id);
}

function removeOptionsJquery(select) {
	$(select+" option").remove();
}

function removeOptions(select) {
	var obj = getById(select);
	var size = obj.options.length;
	for ( var i = 0; i < size; i += 1) {
		obj.remove(0);
	}
}

function tirarVirgulaPontos(form){
	if(form == null){
		form = "";
	}
	$(form+" input.decimal").each(function(){
		var cont = $(this).val();
		var contFinal = "";
		for(var i = 0; i < cont.length; i += 1){
			if(cont.charAt(i) == ","){
				contFinal += ".";
			}else if(cont.charAt(i) != "."){
				contFinal += cont.charAt(i);
			}
		}
		$(this).val(contFinal);
	});
}

function setPaginaPrincipal(){
	$("a.btAdd").click(function(evt){
		evt.preventDefault();
		$("div.formAdd").fadeIn();
	});
	$("input.cancelar").click(function(evt){
		evt.preventDefault();
		$(this).parent().parent().parent().parent().parent().parent().parent().fadeOut();
	});
	$("table.listagem tr").mouseover(function(){
		$(this).addClass("linhaHover");
	});
	$("table.listagem tr").mouseout(function(){
		$(this).removeClass("linhaHover");
	});
}
function setMaskNumerico(){
	$("input.decimal").each(function(){
		var partes = $(this).val().split(".");
		if(partes.length == 2){
			if(partes[1].length == 1){
				$(this).val($(this).val()+"0");
			}
		}
		$(this).setMask("decimal");
	});
}
function setMaskCPF(form){
	$(form+" input.cpf").each(function(){
		$(this).setMask("cpf");
	});
}
function setMaskDate(form){
	$(form+" input.data").each(function(){
		$(this).setMask("date");
	});
}
function setMaskFone(form){
	$(form+" input.fone").each(function(){
		$(this).setMask("phone");
	});
}
function setMaskCEP(form){
	$(form+" input.cep").each(function(){
		$(this).setMask("cep");
	});
}
function setCEP(form){
	$(form+" input#cep").blur(function(){
		runAjax("getCEP", "cep="+$(this).val(), "xml", procBuscaCEP);
	});
}

function procBuscaCEP(xml){
	var uf = "";
	$(xml).find("uf").each(function(){
		$("input#uf").val($(this).text());
	});
	var cidade = "";
	$(xml).find("localidade").each(function(){
		$("input#cidade").val(decodeURI(escape($(this).text())));
	});
	$(xml).find("bairro").each(function(){
		$("input#bairro").val(decodeURI(escape($(this).text())));
	});
/*
	var tipo_logradouro = "";
	$(xml).find("tipo_logradouro").each(function(){
		tipo_logradouro = $(this).text();
	});*/
	var logradouro = "";
	$(xml).find("logradouro").each(function(){
		logradouro = $(this).text();
	});
	$("input#logradouro").val(decodeURI(escape(logradouro)));
}
function clearBordasVermelhas(form){
	$(form).find("input, select, textarea").each(function(){
		$(this).removeClass("bordaVermelha");
	});
}
function validaTXT(txt){
	var retorno = true;
	if($(txt).val() == ""){
		retorno = false;
		$(txt).addClass("bordaVermelha");
		$(txt).focus();
	}
	return retorno;
}
function runAjax(url, datas, dataType, callBackSuccess) {
	$.ajax({
		type: "GET",
		url: url,
		data: datas,
		dataType: dataType,
		success: function(xml) {
		callBackSuccess(xml);
	},
	error : function(xhr, status, errorThrown) {
		if (xhr.status == "202") {
			callBackSuccess(xhr);
		}
		if (xhr.status == "12031") {
			alert("O servidor está fora do ar! Por favor aguarde um instante! Caso o problema persista, entre em contato com o suporte!");
		} else {
		}
	}
	});
}
