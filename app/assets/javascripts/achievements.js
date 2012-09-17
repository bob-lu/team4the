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
		}
	};
	
	/**
	 * Description template
	 */
	
	var descriptionTemplate = [
		'<div class="field">',
		'  <label class="bold">Description</label>',
	  '  <input type="text" name="archievement[description]" />',
		'</div>'
	].join('\n');
	
	/**
	 * Actions template with submit button
	 */
			
	var actionsTemplate = [
		'<div class="actions">',
		'  <input type="submit" value="Save" class="btn" />',
		'</div>'
	].join('\n');
	 
	/**
	 * Textbox template
	 */
	 
	var textBoxTemplate = [
		'<div class="field">', 
		'  <label>Value</label>',
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
		var tmpl = ['<div class="field">', '<select id="achievement_value" name="achievement[value]">', '<option>Please select</option>'];
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
			  
			if (achivements[name]) {
				formTmpl.append(dropDownTemplate(achivements[name]));
			} else if (!single) {
				formTmpl.append(textBoxTemplate);	
			}
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