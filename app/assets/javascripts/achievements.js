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
	
	/**
	 * Load right template and data on change event
	 */
	
	$('#achievement_id').change(function (e) {
		var id = $(this).val();
		if (id) {
			var elm = $('input[data-id=' + id + ']')
			  , single = elm.data('single')
			  , name = elm.data('name')
			  , ach = achivements[name];
			
			if (Object.keys(ach).length) {
				if (single) {
					$('#formTmpl').empty().append(dropDownTemplate(ach)).append(actionsTemplate);
					if (max[name]) {
						var message = 'Hey! <strong>{user}</strong> in your team alreday did this achievement and did get <strong>{points}</strong> points!'
													.replace('{user}', max[name].user)
													.replace('{points}', max[name].points);
													
						$('.span8').html(alertTemplate('alert-success', message));
					} else {
						$('.span8').empty();
					}
				} else {
					// multi achievement
				}
			}
		} else {
			$('#formTmpl, .span8').empty();
		}
	});
	
});