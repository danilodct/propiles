$(document).ready(function(){
	doSemanticInitials();
	setCabecalho();
});

$(window).resize(function() {
	setAlturaGraficos();
	setCabecalho();
});

function setCabecalho(){
	var width = $(window).innerWidth();
	if(width < 1100){
		$(".vaiLeft").addClass("left");
	}else{
		$(".vaiLeft").removeClass("left");
	}
	if(width < 1200){
		$("div#subMenuPreferencias .text").hide();
		$("div#subMenuPreferencias .menu .nome").show();
		$("div#subMenuPreferencias .menu .nome .text").show();
	}else{
		$("div#subMenuPreferencias .text").show();
		$("div#subMenuPreferencias .menu .nome").hide();
		$("div#subMenuPreferencias .menu .nome .text").hide();
	}
}

// SEMANTIC UI 888888888888888888888888888888888888888888888888888888888888888888
function doSemanticInitials(){
	$('.ui.dropdown').each(function(){
		if($(this).hasClass("disabled")){
			$(this).dropdown("destroy");
		}else{
			$(this).dropdown({allowCategorySelection: true});
		}
	});
	$('.message .close').on('click', function() {
		$(this).closest('.message').fadeOut();
	});
	$('.ui.checkbox').checkbox();
	$('.transparent input[type=text]').each(function(){
		$(this).attr("readonly", "true");
	});
	$('.ui.accordion').accordionUI();
	$('.hint').popup({
	    inline   : true,
	    hoverable: true,
	    inverted: true,
	    position : 'bottom left'
	  });
	$('.tabular.menu .item').tab();
	//setar altera dos amcharts
	setAlturaGraficos();
}

//AMCHART 8888888888888888888888888888888888888888888888888888888888888888888888888
function createChart(dataProvider, categoryField){
	var chart = new AmCharts.AmSerialChart();
	chart.dataProvider = dataProvider;
	chart.categoryField = categoryField;
	chart.numberFormatter = {precision:2, decimalSeparator:',', thousandsSeparator:'.'};
	chart.startEffect = '>';
	chart.startDuration = 0.7;
	//chart.addTitle(title, titleSize, "black", 1, true);
	chart.angle = 15;
	chart.depth3D = 15;
	chart.pathToImages = "v2.0/js/lib/amcharts/images/";
	chart.mouseWheelZoomEnabled = false;
	chart.maxSelectedSeries = 10;
	return chart;
}

function createPieChart(dados, categoryField, valueField, colorField){
	chart = new AmCharts.AmPieChart();
    chart.dataProvider = dados;
    chart.titleField = categoryField;
    chart.valueField = valueField;
	chart.lineColor = colorField;
    chart.outlineAlpha = 0.4;
    chart.depth3D = 15;
    chart.balloonText = "[[title]]<br><b>[[value]]</b> ([[percents]]%)";
    chart.angle = 30;
	//chart.addTitle(title, 18, "black", 1, true);
    chart.labelText = "[[title]]:\n[[value]] ([[percents]]%)";
    chart.margins = 5;	
	return chart;
}

function createBarGraph(valueField, multiColor){
	var graph = new AmCharts.AmGraph();
	graph.valueField = valueField;
	graph.type = "column"; 
	graph.fillAlphas = 0.9;
	graph.labelText = '[[value]]';
	graph.labelPosition = 'top';
	graph.fontSize = 10;
	if(multiColor){
		graph.colorField = "cor";
		graph.lineColor = "cor";
	}
	graph.balloonText = "[[category]]: <b>[[value]]</b>";
	return graph;
}

function createLineGraph(valueField){
	var graphLine = new AmCharts.AmGraph();
	graphLine.valueField = valueField;
	graphLine.bullet = "round",
	graphLine.bulletBorderAlpha =  1,
	graphLine.bulletColor =  "#FFFFFF",
	graphLine.bulletSize =  7,
	graphLine.useLineColorForBulletBorder =  true,
	graphLine.lineThickness =  6,
	graphLine.lineAlpha =  1,
	graphLine.lineColor = "#00B5AD";
	graphLine.fillAlphas = 0;
	graphLine.labelText = '[[value]]';
	graphLine.labelPosition = 'top';
	graphLine.fontSize = 10;
	graphLine.color = 'black';
	return graphLine;
}

function createValueAxis(title){
    var valueAxis = new AmCharts.ValueAxis();
    valueAxis.dashLength = 4;
    valueAxis.axisAlpha = 0.5;
    valueAxis.title = title;
    return valueAxis;
}

function setConfBasicasCategoryAxis(categoryAxis, dados){
	categoryAxis.axisAlpha = 0.5;
	categoryAxis.dashLength = 4;
	categoryAxis.autoGridCount  = false;
	categoryAxis.gridCount = dados.length;
	categoryAxis.gridPosition = "start";
	categoryAxis.inside = false;
	categoryAxis.labelRotation = 45;
}

function createHorizontalScroll(){
	var chartScrollbar = new AmCharts.ChartScrollbar();
	chartScrollbar.hideResizeGrips = false;
	return chartScrollbar;
}

function createLegend(dados){
	var legend = new AmCharts.AmLegend();
	legend.data = dados;
	return legend;
}

var heightChart = 350;
function setAlturaGraficos(){
	if($("#chart1").length > 0){
		var width = $("#chart1").css("width");
		heightChart = parseFloat(width.substring(0, width.length - 2)) * 0.6;
		if(!$("#chart1").hasClass("estatico"))
			$("#chart1").css("height", heightChart+"px");
		if(!$("#chart2").hasClass("estatico"))
			$("#chart2").css("height", heightChart+"px");
		if(!$("#chart3").hasClass("estatico"))
			$("#chart3").css("height", heightChart+"px");
		if(!$("#chart4").hasClass("estatico"))
			$("#chart4").css("height", heightChart+"px");
	}
}

function createGuide(valueAxis, valor, label){
    var guide = new AmCharts.Guide();
    guide.value = valor;
    guide.lineColor = "#C00";
    guide.label = label;
    guide.lineAlpha = 1;
    guide.position = "right";
    guide.inside = true;
    guide.above = true;
    guide.lineThickness = 1;
    valueAxis.addGuide(guide);
}

//MENU 8888888888888888888888888888888888888888888888888888888888888888888888888

function setSubMenuAtivo(subMenu){
	$(subMenu).addClass("subActive");
}

function setMenuAtivo(menu){
	$(menu).parent().addClass("active");
}

// COMPONENTES 88888888888888888888888888888888888888888888888888888888888888888888888

function setSelectOutro(lista, outro){
	$(lista).change(function(){
		if($(this).val() == "-1"){
			$(outro).show();
		}else{
			$(outro).hide();
		}
	});
	if($(lista).val() != "-1")
		$(outro).hide();
}

function showModal(modal){
	$(modal).modal({allowMultiple: true}).modal('show');
}

function removeOptions(select){
	$(select+" option").remove();
}

function createAgenda(area, agendamentos, functionClick, functionDrop){
	$(area).fullCalendar({
		timeFormat: 'H(:mm)', // uppercase H for 24-hour clock
		selectHelper: true,
		eventDurationEditable: false,
		editable: true,
		eventLimit: true, // allow "more" link when too many events
		axisFormat: 'HH:mm',
		eventColor: '#00B5AD',
		events: agendamentos,
		header: {
			left: 'prev,next today',
			center: 'title',
			right: 'month,agendaWeek,agendaDay'
		},
		eventClick: functionClick,
	    eventDrop: functionDrop
	});
}

// BTS 88888888888888888888888888888888888888888888888888888888888888888888888888

function setBtPrint(){
	$("a.btPrint").click(function(evt){
		evt.preventDefault();
		window.print();
	});
}

function setBtRemover(){
	$("a.remover").click(function(evt){
		var confirmacao = true;
		var msg = "Tem certeza que deseja remover este item?";
		if(!confirm(msg)){
			confirmacao = false;
		}
		return confirmacao;
	});
}

function setBtCancelarPage(bt, url){
	$(bt).click(function(){
		document.location = url;
	});
}

function setBtAdd(){
	$(".btAdd").each(function(){
		$(this).click(function(evt){
			evt.preventDefault();
			var content = $(this).parent().parent();
			if($(content).find(".areaAdd").css('display') != 'block'){
				$(content).find(".areaSearch").hide();
				$(content).find(".areaAdd").show();
			}else{
				$(content).find(".areaSearch").show();
				$(content).find(".areaAdd").hide();
			}
			$(content).find(".areaAdd .cancelar").click(function(evt2){
				evt2.preventDefault();
				$(content).find(".areaSearch").show();
				$(content).find(".areaAdd").hide();
			});
		});
	});
}

function setBtEditar(campo){
	$(campo).click(function(evt){
		evt.preventDefault();
		var content = $(this).parent().parent().parent().parent();
		$(content).find(".transparent").addClass("transparentOld");
		$(content).find(".transparent").removeClass("transparent");
		$(content).find("input[type=text]").removeAttr("readonly");
		$(content).find(".dropdown.disabled").dropdown();
		$(content).find(".dropdown.disabled").addClass("disabledOld");
		$(content).find(".dropdown.disabled").removeClass("disabled");
		$(content).find(".read-only").addClass("read-onlyOld");
		$(content).find(".read-only").removeClass("read-only");
		$(content).find(".actions").hide();
		$(content).find(".buttons").removeClass("hide");
	});
}

function setBtCancelarEditar(campo, form){
	$(campo).click(function(evt){
		evt.preventDefault();
		var content = $(this).parent().parent().parent().parent();
		$(content).find(".transparentOld").addClass("transparent");
		$(content).find(".transparentOld").removeClass("transparentOld");
		$(content).find(form + " input[type=text]").attr("readonly", "true");
		$(content).find(".dropdown.disabledOld").dropdown("destroy");
		$(content).find(".dropdown.disabledOld").addClass("disabled");
		$(content).find(".dropdown.disabledOld").removeClass("disabledOld");
		$(content).find(".read-onlyOld").addClass("read-only");
		$(content).find(".read-onlyOld").removeClass("read-onlyOld");
		$(content).find(".actions").show();
		$(content).find(".buttons").addClass("hide");
	});
}

function setBtCancelarAdd(campo){
	$(campo).click(function(evt){
		evt.preventDefault();
		var areaAdd = $(this).parent().parent().parent().parent().parent();
		if(!$(areaAdd).hasClass("areaAdd"))
			areaAdd = $(areaAdd).parent();
		$(areaAdd).hide();
	});
}

// MASK 88888888888888888888888888888888888888888888888888888888888888888888888

function setMaskDate(campo){
	$(campo).each(function(){
		var data = $(this).val();
		$(this).mask("00/00/0000");
		$(this).datepicker();
		$(this).datepicker("option", "dateFormat", "dd/mm/yy");
		$(this).val(data);
	});
}

function setMaskHora(campo){
	$(campo).each(function(){
		var data = $(this).val();
		$(this).mask("00:00");
		$(this).val(data);
	});
}

function setMaskNumerico(campo){
	$(campo).mask("##0.##0,00", {reverse: true});
}

function setMaskInteiro(campo){
	$(campo).mask("##0.###.000", {reverse: true});
}

function setMaskFone(campo){
	$(campo).mask("(00) 0000-0000");
}

function setMaskCEP(campo){
	$(campo).mask("00000-000");
}
function setMaskCPF(campo){
	$(campo).mask("000.000.000-00");
}

function isEmail(emailField) {
  var regex = /^([a-zA-Z0-9_.+-])+\@(([a-zA-Z0-9-])+\.)+([a-zA-Z0-9]{2,4})+$/;
  var email = $(emailField).val();
  return regex.test(email);
}

// AJAX  8888888888888888888888888888888888888888888888888888888888888888888888

function setCEP(campo){
	$(campo).blur(function(){
		runAjax("getCEP", "cep="+$(this).val(), "xml", procBuscaCEP);
	});
}
function procBuscaCEP(xml){
	$(xml).find("uf").each(function(){
		var uf = $(this).text();
		if(uf != "")
			$("input#uf").val(uf);
	});
	$(xml).find("localidade").each(function(){
		var loca = decodeURI(escape($(this).text()));
		if(loca != "")
			$("input#cidade").val(loca);
	});
	$(xml).find("bairro").each(function(){
		var bairro = decodeURI(escape($(this).text()));
		if(bairro != "")
			$("input#bairro").val(bairro);
	});
	var logradouro = "";
	$(xml).find("logradouro").each(function(){
		logradouro = $(this).text();
	});
	logradouro = decodeURI(logradouro);
	if(logradouro != "")
		$("input#logradouro").val(logradouro);
}

//FUNÇÕES GERAIS  8888888888888888888888888888888888888888888888888888888888888

function runAjax(url, datas, dataType, callBackSuccess) {
	$.ajax({
		type: "GET",
		url: url,
		data: datas,
		dataType: dataType
	}).always(function(data){callBackSuccess(data);});
}
function doNothing(text){}
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
	}else{
		decimal = ",00";
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
function parseStringToNumber(value){
	if(value != null){
		value = value.replace(".", "");
		value = value.replace(",", ".");
	}
	return value;
}

function getCurrentDate(){
	var today = new Date();
    var dd = today.getDate();
    var mm = today.getMonth()+1;
    var yyyy = today.getFullYear();
    if(dd<10)
        dd = '0' + dd;
    if(mm<10)
        mm = '0' + mm;
    return dd+'/'+mm+'/'+yyyy;
} 
