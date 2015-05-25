initialization
initialize
	super initialize.
	tieredList := SUTieredList new
		labels: [ :value | value fullName ];
		children: [ :value | 
			value subclasses
				asSortedCollection: [ :a :b | a name < b name ] ];
		selection: (OrderedCollection with: Collection);
		yourself