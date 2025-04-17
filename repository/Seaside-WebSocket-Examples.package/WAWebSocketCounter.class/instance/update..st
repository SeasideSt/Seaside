updating
update: anAspect
	"Update the counter in all connected web browsers. 
	Only the first 3 lines are really needed, the rest adds some eye-candy and can simply be removed if not needed."

	self pusher javascript: [ :script |
		script << (script jQuery: #count) 
			text: self model count;
			append: [ :html |
				html span: [
					html html: (anAspect = #increase
						ifTrue: [ '&uarr;' ]
						ifFalse: [ '&darr;' ]) ] ];
			find: 'span'; fadeOut: 'slow' ]