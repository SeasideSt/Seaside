rendering
renderContentOn: html
	html heading level2; with: 'Create new cache'.
	html form: [
		html table: [
			self
				renderInputForSelector: #expiryPolicy
				withLabel: 'Expiry Policy'
				options: WACacheExpiryPolicy withAllSubclasses
				on: html.
			self
				renderInputForSelector: #reapingStrategy
				withLabel: 'Reaping Strategy'
				options: WACacheReapingStrategy withAllSubclasses
				on: html.
			self
				renderInputForSelector: #removalAction
				withLabel: 'Removal Action'
				options: WACacheRemovalAction withAllSubclasses
				on: html.
			self
				renderInputForSelector: #missStrategy
				withLabel: 'Cache Miss Strategy'
				options: WACacheMissStrategy withAllSubclasses
				on: html ].
		html break.
		html submitButton
			callback: [ self answer: self cache ];
			with: 'OK'.
		html button
			callback: [ self answer: nil ];
			with: 'Cancel' ] 