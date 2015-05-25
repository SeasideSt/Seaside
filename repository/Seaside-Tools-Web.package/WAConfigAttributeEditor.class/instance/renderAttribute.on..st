rendering
renderAttribute: anAttribute on: html
	[ (anAttribute isAdvanced not or: [ self displayAdvancedAttributes ])
		ifTrue: [
			html tableRow: [
				html tableHeading: [
					html label
						title: anAttribute comment;
						with: anAttribute label ].
				html tableData: [
					(self isCollectionAttribute: anAttribute)
						ifTrue: [
							self renderCollectionFieldForAttribute: anAttribute on: html ]
						ifFalse: [
							self renderFieldForAttribute: anAttribute on: html ] ] ] ] ] on:  WAAttributeNotFound do: [ :ex | html text: ex ]