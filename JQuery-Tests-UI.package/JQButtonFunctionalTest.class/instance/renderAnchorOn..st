rendering
renderAnchorOn: html
	html anchor
		onClick: (html javascript
			alert: 'Nothing to configure right now.');
		script: (html jQuery this button
			text: false;
			primaryIcon: 'ui-icon-gear');
		with: 'Configure'