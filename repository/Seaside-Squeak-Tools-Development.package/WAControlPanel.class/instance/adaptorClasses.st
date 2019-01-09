accessing
adaptorClasses
	^ (WAServerAdaptor allSubclasses reject: [:each | each isAbstract])
		sorted: [:a :b | a name < b name]