accessing
adaptorClass

	adaptorClass == nil
		ifTrue: [ 
			Smalltalk at: #WAFastCGIAdaptor ifPresent: [:cl | ^cl ].
			Smalltalk at: #WAGsZincAdaptor ifPresent: [:cl | ^cl ].
			Smalltalk at: #WAGsSwazooAdaptor ifPresent: [:cl | ^cl ].
			Smalltalk at: #WASwazooAdaptor ifPresent: [:cl | ^cl ]].
	^adaptorClass