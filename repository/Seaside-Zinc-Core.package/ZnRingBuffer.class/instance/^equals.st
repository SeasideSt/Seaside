comparing
= aCollection
	1
		to: self size
		do: [ :index |
			(self at: index) ~= (aCollection at: index) ifTrue: [ ^ false ] ].
		
	^ true