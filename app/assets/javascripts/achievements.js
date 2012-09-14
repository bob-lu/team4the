$(function () {
	
	/**
	 * Achievements list
	 */
	
	var achivements = {};
	
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
		'  <input type="text" name="achievement[value] id="achievement_value" />', 
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
	 * Get team achievements direct when the page is loaded
	 * and get the max point for each achivement.
	 *
	
	$.getJSON('/achievements.json', function (data) {
		var i = 0
		  , max = {};
		  
		for (; i < data.length; i++) {
			if (!max[data[i].name]) max[data[i].name] = { points: 0, user: '' };
			if (max[data[i].name].points < data[i].points) {
				max[data[i].name] = { points: data[i].points, user: data[i].user }
			}
		}
		
		window.max = max;
	});
	*/
	
	/**
	 * Load right template and data on change event
	 */
	
	$('#achievement_id').change(function (e) {
		var id = $(this).val();
		if (id) {
			var elm = $('input[data-id=' + id + ']')
			  , single = elm.data('single')
			  , name = elm.data('name');
			  
			var formTmpl = $('#formTmpl').empty();
			if (!single) {
				formTmpl.append(textBoxTemplate);
			}
			formTmpl.append(actionsTemplate);
		} else {
			$('#formTmpl, .span8').empty();
		}
	});
	
});