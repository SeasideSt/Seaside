printing
renderOn: html

	html text: request url asString.
	html break.
	lines do:[ :block |
		| homeMethod inClass |
		homeMethod := block method.
		inClass := homeMethod methodClass.
		html anchor
			callback: [ block inspect ];
			with: ('[] in {1}>>#{2}' format: { inClass name. homeMethod selector }) ]