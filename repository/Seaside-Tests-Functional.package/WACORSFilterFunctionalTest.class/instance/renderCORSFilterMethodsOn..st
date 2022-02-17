rendering-configuration
renderCORSFilterMethodsOn: html

	html heading
		level2;
		with: 'Currently allowed Methods.'.
	self corsFilter allowedMethods
		ifEmpty: [ html text: 'None' ]
		ifNotEmpty: [ :allowed | html unorderedList list: allowed ].

	html form: [ 
		html button
			callback: [ 
				self corsFilter
					addAllowedMethod: 'DELETE' ];
			with: 'Allow DELETE'.
		html space.

		html button
			callback: [ self corsFilter removeAllMethods ];
			with: 'Remove all methods' ]