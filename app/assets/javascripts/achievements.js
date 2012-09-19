$(function () {
	
	/**
	 * Achievements list
	 */
	
	var achivements = {
		'hare': {
			'Ett ben': 1,
			'Båda benen': 2
		},
		'koppla': {
			'En sida': 1,
			'Båda sidorna': 2
		},
		'heal': {
			'Prova på': 0,
			'Klarade på första försöket': 1,
			'Klarade på fem försök': 5
		},
		'pasde': {
			'Prova på': 0,
			'Klarade på första försöket': 1,
			'Klarade på fem försök': 5
		},
		'dans': {
			"Genomförde momentet": 0,
			"En åtta": 1,
			"Två åttor": 2,
			"Tre åttor": 3,
			"Fyra åttor": 4
		}
	};

	var messages = {
		"springa": "Skriv in din tid i minuter",
		"simma": "Skriv in din tid i formatet minut.sekunder (ex. 10.39)",
		"cindy": "Skriv in din totala tid i minuter",
		"a_cindy": "Skriv in din totala tid i minuter",
		"jonglering": "Hur många varv klarade du?",
		"hopprep": "Hur många varv klarade du?",
		"chins": "Hur många chins klarade du?",
		"rings": "Hur många klarade du?"
	};
	
	/**
	 * Description template
	 */
	
	var descriptionTemplate = [
		'<div class="field">',
		'  <label class="bold">Beskrivning</label>',
	  '  <input type="text" name="archievement[description]" />',
		'</div>'
	].join('\n');
	
	/**
	 * Actions template with submit button
	 */
			
	var actionsTemplate = [
		'<div class="actions">',
		'  <input type="submit" value="Spara" class="btn" />',
		'</div>'
	].join('\n');
	 
	/**
	 * Textbox template
	 */
	 
	var textBoxTemplate = [
		'<div class="field">', 
		'  <label>Värde</label>',
		'  <input type="text" name="achievement[value]" id="achievement_value" />', 
		'</div>'
	].join('\n');
	 
	/** 
	 * Generate dropdown template for object
	 *
	 * @param {Object} data
	 * @return {String}
	 */
	
	function dropDownTemplate(data) {
		var tmpl = ['<div class="field">', '<select id="achievement_value" name="achievement[value]">', '<option>Välj...</option>'];
		for (var key in data)	tmpl.push('<option value="' + data[key] + '">' + key + '</option>');
		tmpl.push('</select></div>');
		return tmpl.join('\n');
	}
	
	/**
	 * Alert template
	 *
	 * @param {String} klass CSS class
	 * @param {String} html
	 * @return {String}
	 */
	
	function alertTemplate(klass, html) {
		var tmpl = ['<div class="alert ' + klass + '">', '<a href="#" class="close" data-dismiss="alert">x</a>'];
		tmpl.push(html);
		tmpl.push('</div>');
		return tmpl.join('\n');
	}
	
	/**
	 * Load right template and data on change event
	 */
	
	$('#achievement_id').change(function (e) {
		var id = $(this).val();
		if (id) {
			var elm = $('input[data-id=' + id + ']')
			  , single = elm.data('single')
			  , name = elm.data('name')
			  , formTmpl = $('#formTmpl').empty();
			
			if(messages[name]) {
				var $msg = $('<div class="alert alert-info"></div>');
				$msg.text(messages[name]);
				formTmpl.append($msg);
			}

			if (achivements[name]) {
				formTmpl.append(dropDownTemplate(achivements[name]));
			} else if (!single) {
				if(name != "tryout" && name != "luftstol" && name != "plankan")
					formTmpl.append(textBoxTemplate);	
				else
				{
					var input = '<input type="hidden" name="achievement[value]" id="achievement_value" value="0" />';
					formTmpl.append(input);
				}
			}
			//formTmpl.append(descriptionTemplate);
			formTmpl.append(actionsTemplate);
		} else {
			$('#formTmpl, .span8').empty();
		}
	});
	
	/**
	 * Show error if the field value isn't a numeric value
	 */
	 
	$('body').on('keyup', '#achievement_value', function (e) {
		var val = $(this).val(),
				span = $('.span8').empty();
		if (val !== '') {
			if (/[^0-9+]$/.test(val)) span.append(alertTemplate('alert-error', 'Not a numeric value. Fix it!'));
		}
	});
});