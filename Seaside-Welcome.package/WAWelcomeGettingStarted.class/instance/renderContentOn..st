rendering
renderContentOn: html
	html heading
		level1;
		with: 'Getting started'.
			
	html heading
		level2
		with: 'Test the water with the steps below:'.
				
	html orderedList: [
		html listItem: [ self renderExamplesStepOn: html ].
		html listItem: [ self renderFirstComponentStepOn: html ].
		html listItem: [ self renderDocumentationStepOn: html ] ]
