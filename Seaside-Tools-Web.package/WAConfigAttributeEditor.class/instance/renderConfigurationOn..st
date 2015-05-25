rendering
renderConfigurationOn: html
	html table: [
		attributes do: [ :attribute |
			self renderAttribute: attribute on: html ] ] 