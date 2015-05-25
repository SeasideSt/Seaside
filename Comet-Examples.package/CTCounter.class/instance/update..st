private
update: anAspect
	"Update the number in all connected web browser. Only the first 3 lines are really needed, the rest adds some eye-candy and can simply be removed if not needed."

	self pusher javascript: [ :script |
		script << (script jQuery: #count) 
			text: self model count;
			append: [ :html |
				html span: [
					html html: (anAspect = #increase
						ifTrue: [ '&uarr;' ]
						ifFalse: [ '&darr;' ]) ] ];
			find: 'span'; fadeOut: 'slow' ]