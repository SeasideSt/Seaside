rendering
renderContentOn: html
	html unorderedList
		class: 'icons';
		class: 'ui-widget';
		class: 'ui-helper-clearfix';
		script: (html jQuery new
			find: 'li';
			hover: (html jQuery new 
				addClass: 'ui-state-hover')
			out: (html jQuery new
				removeClass: 'ui-state-hover'));
		with: [ self renderIconsOn: html ]