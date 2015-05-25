rendering
renderIconsOn: html
	self iconClasses do: [ :each |
		html listItem
			title: each;
			class: 'ui-corner-all';
			class: 'ui-state-default';
			with: [
				html span
					class: 'ui-icon';
					class: each ] ]