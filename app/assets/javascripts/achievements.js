$(function () {
	
	/**
	 * Achievements list
	 */
	
	var achivements = {
		chins: {
			'< 20': '4',
			'~ 30': '5',
			'> 30': '6'
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
		'  <input type="submit" value="Save" />',
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
	 * Load right template and data on change event
	 */
	
	$('#achievement_id').change(function (e) {
		var id = $(this).val();
		if (id) {
			var elm = $('input[data-id=' + id + ']')
			  , single = elm.data('single')
			  , ach = achivements[elm.data('name')];
			
			if (Object.keys(ach).length) {
				if (single) {
					$('#formTmpl').empty().append(dropDownTemplate(ach)).append(actionsTemplate);
				} else {
					// multi achievement
				}
			}
		} else {
			$('#formTmpl').empty();
		}
	});
	
});