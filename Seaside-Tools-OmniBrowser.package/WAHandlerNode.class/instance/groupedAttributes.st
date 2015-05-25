accessing
groupedAttributes
	| groups attributes |
	groups := Dictionary new.
	attributes := OrderedCollection new.
	handler configuration allAttributes do: [ :each |
		(groups
			at: each group
			ifAbsentPut: [ SortedCollection sortBlock: [ :a :b | a key <= b key ] ])
				add: each ].
	groups keys sorted do: [ :key |
		(groups at: key) do: [ :each | attributes add: (WAAttributeNode configuration: handler configuration attribute: each) ] ].
	^ attributes