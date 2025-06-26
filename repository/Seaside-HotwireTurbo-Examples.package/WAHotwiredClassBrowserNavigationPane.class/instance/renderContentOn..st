rendering
renderContentOn: html

			html orderedList
				class: 'code-navigation';
				class: cssClass if: cssClass notNil;
				with: [ 
					self list do:[:item |
						html listItem
							class: 'option-selected' if: self selectedItem = item;
							with: [ 
								html anchor
									"callback: [ self selectedItem: item ];"
									turboStreamCallback: [ :ts | self selectedItem: item. onSelectBlock value: ts ];
									with: (labelsBlock ifNil:[ item ] ifNotNil: [ labelsBlock value: item ]) ] ] ]
				