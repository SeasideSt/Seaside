rendering
renderThemeOn: html
	html form id: 'theme'; with: [
		html label: 'Theme: '.
		html select
			list: self themes;
			selected: self theme;
			labels: [ :each | each themeName ];
			callback: [ :value | theme := value ];
			onChange: (html jQuery this
				closest: 'form';
				triggerSubmit) ]