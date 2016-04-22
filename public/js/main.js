
(function(){
	"use strict";

/*
		On load init
*/
	$('.dropdown').tooltip({
		container: 'body'
	});
// $('#eq_mode').on('load', function(event, value, caption) {

function reviveFirstDropdown(){
	var whoAmI = $('#eq_mode > button').attr('id');

		$.ajax({
			url: 'http://localhost/configurator/ajax.php',
			method: 'post',
			data: {
				controller_name: 'ConfigureAjax',
				action_name: 'getAllEqMode'
		},
		success: function(data){
			$('.jumbotron').html(data);
			$('#eq_mode ul').html(data);
			reviveItself();
		}
	});

}
// });

reviveFirstDropdown();


/*
	main API
 */

var Core = {
	eqModeID: null
}

function reviveNextParam(nextParam){

	switch(nextParam){
		case 2: reviveAccuracy(); break;
		case 3: reviveSpecialVersion(); break;
		case 4: reviveSomething(); break;
	}
	// secondDropDown();
}

// function revive(dd_ul, ){
// 	dd_ul.on('click', 'li', function(){

// 	}
// }

function reviveItself(){

	$('#eq_mode ul').on('click', 'li', function(value, caption){
		var eqModeID = this.value;
		Core.eqModeID = eqModeID;

		var eqModeTitle = this.innerText;
		var dropdownTitle = $('#eq_mode button').text(eqModeTitle);
		var accuracyBtn = $('#accuracy button'),
				nextParam = +accuracyBtn.attr('id');

		//clear accuracy label
		// accuracyBtn.text('');



		$.ajax({
			url: 'http://localhost/configurator/ajax.php',
			method: 'post',
			data: {
				controller_name: 'ConfigureAjax',
				action_name: 'getAccuracyClassesByEqModeID',
				eq_mode_id: eqModeID
			},
		success: function(data){
			if (data != "no data") {
				blink(2, '#ABFCB2');
				accuracyBtn.removeAttr('disabled');
				$('.jumbotron').html(data);
				$('#accuracy ul').html(data);
				reviveNextParam(nextParam);
			} else {
				blink(2, '#FFA0A0')
			}
		}
	});

});

}

function reviveAccuracy(){
	$('#accuracy ul').on('click', 'li', function(){

		//need eqModeID
		//may be get from global object?
		//or search from 'eq_mode' ul>li-selected;

		var thisBtn = $('#special_version button');

		var accuracyID = this.value, //now it's not needed
				accuracyTitle = this.innerText,
				nextParam = +thisBtn.attr('id');

		//set Title to Dropdown
		$('#accuracy button').text(accuracyTitle);

		$.ajax({
			url: 'http://localhost/configurator/ajax.php',
			method: 'post',
			data: {
				controller_name: 'ConfigureAjax',
				action_name: 'getSpecialVersionsByEqModeID',
				eq_mode_id: Core.eqModeID
			},
			success: function(data){
				if (data != 'no data'){
					blink(nextParam, '#ABFCB2')
					thisBtn.removeAttr('disabled');
					$('#special_version ul').html(data); //append
					reviveNextParam(nextParam);
				} else {
					blink(nextParam, '#FFA0A0');
				}
			}
		});


	});
}


function reviveSpecialVersion(){
	$('#special_version ul').on('click', 'li', function(){

		var specialVersionID = this.value,
				specialVersionTitle = this.innerText,
				thisBtn = $('#measurement_range button'),
				nextParam = +thisBtn.attr('id');

		//set Title to Dropdown
		$('#special_version button').text(specialVersionTitle);

		$.ajax({
			url: 'http://localhost/configurator/ajax.php',
			method: 'post',
			data: {
				controller_name: 'ConfigureAjax',
				action_name: 'getMeasurementRangesByEqModeIDAndAccuracyID',
				eq_mode_id: Core.eqModeID
			},
			success: function(data){
				if (data != 'no data'){
					blink(nextParam, '#ABFCB2')
					thisBtn.removeAttr('disabled');
					$('#measurement_range ul').html(data); //append
					// reviveNextParam(nextParam);
				} else {
					blink(nextParam, '#FFA0A0');
				}
			}
		});
	});
}


$('.dropdown ul').on('click', function(){
	var currListID = this.id,
			nextListID = +currListID + 1;


	//if next Dropwdown selected we reset all Dropdonws since next Dropdonw
	if ($('button#' + nextListID).text() != ''){
		for (var i = nextListID; i<=9; i++){
			console.log($('.dropdown button#' + i));
			$('.dropdown button#' + i).text('');
			$('.dropdown button#' + i + ' + ul').empty();
		}
	}

});

/*
	helpers API
 */

function blink(dropDownID, color){
	var btn = $('button#' + dropDownID);
	btn.animate(
	{
		backgroundColor: color,
		// opacity: 1
	},
	{
		duration: 200,
		complete: function(){
			btn.animate({backgroundColor: '#fff'}, 200)
		}
	});
}

/*
	Temprary
 */
$('button').removeAttr('disabled');


})();