rendering-configuration
renderCORSFilterMaxAgeOn: html

	| maxAgeValue |
	html heading
		level2;
		with: 'Current Access-Control-Max-Age header:'.
	html paragraph
		id: 'maxage';
		with:[
			self corsFilter maxAge
				ifNil: [ html text: 'None' ]
				ifNotNil: [ :maxAge | html text: maxAge greaseString ] ].

	html form: [ 
		html textInput
			placeholder: 'Enter maxAge (seconds)';
			callback: [ :value | maxAgeValue := value greaseInteger ];
			with: ''.
		html space.
		html button
			callback: [ 
				self corsFilter maxAge: maxAgeValue ];
			with: 'Set Max-Age'.
		html space.
		html button
			callback: [ self corsFilter maxAge: nil ];
			with: 'Remove Max-Age' ]