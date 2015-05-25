accessing
groupedAttributes
	| groups attributes  |
	groups := Dictionary new.
	attributes := OrderedCollection new.
	^ self configuration 
		ifNil: [#()]
		ifNotNil: [:c|
			c allAttributes do: [ :each |
				(groups
					at: each group
					ifAbsentPut: [ SortedCollection sortBlock: [ :a :b | a key <= b key ] ])
						add: each ].
			groups associations sorted]