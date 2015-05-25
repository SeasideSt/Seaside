accessing-properties
closeButtonEnabled
	^ self propertiesAt: #closeButton ifAbsent: [ true ]