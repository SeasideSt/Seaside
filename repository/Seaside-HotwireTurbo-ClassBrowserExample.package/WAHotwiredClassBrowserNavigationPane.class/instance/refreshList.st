accessing
refreshList

	list := labelsBlock
		        ifNil: [ elementsBlock value sorted ]
		        ifNotNil: [ elementsBlock value sorted: [ :a :b | (labelsBlock value: a) <= (labelsBlock value: b) ] ].
	(filterTerm notNil and: [ filterTerm notEmpty ])
		ifTrue:[ list := list select: [:e | (labelsBlock value: e) includesSubstring: filterTerm caseSensitive: false ] ].
	(list includes: selected) ifFalse: [ selected := nil ]