rendering
renderSelectedCountryNameOn: html

	html text: (selectedCountryName
			 ifNil: [ 'No selected country' ]
			 ifNotNil: [ selectedCountryName , ' was selected' ])