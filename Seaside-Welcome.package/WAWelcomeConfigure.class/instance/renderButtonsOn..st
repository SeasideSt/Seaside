rendering-parts
renderButtonsOn: html
	html div class: 'buttons'; with: [
		html anchor
			url: '/config';
			script: (html jQuery this button
				primaryIcon: 'ui-icon-gear');
			with: 'Advanced Configuration'.
		html anchor
			callback: [ self answer ];
			script: (html jQuery this button
				primaryIcon: 'ui-icon-arrowreturnthick-1-w');
			title: 'Go back';
			with: 'Back' ]