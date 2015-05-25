rendering
renderQualifiedValues: aCollection on: html
	html definitionData: [
		aCollection isNil
			ifTrue: [ html text: 'N/A' ]
			ifFalse: [
				html orderedList: [
					aCollection do: [ :each |
						self renderQualifiedValue: each on: html ] ] ] ]