accessing
adaptorClasses
	^ (WAServerAdaptor allSubclasses reject: #isAbstract) sorted: #name ascending