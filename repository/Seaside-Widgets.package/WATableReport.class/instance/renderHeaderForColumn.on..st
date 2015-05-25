rendering
renderHeaderForColumn: aColumn on: html
	html tableHeading
		class: aColumn cssClass;
		with: [
			aColumn canSort
				ifTrue: [
					html anchor
						callback: [ self sortColumn: aColumn ];
						with: aColumn title ]
				ifFalse: [ html text: aColumn title ] ]