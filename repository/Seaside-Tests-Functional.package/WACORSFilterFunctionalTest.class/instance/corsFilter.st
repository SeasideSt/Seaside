private
corsFilter

	^ [ 
	  (WADispatcher default handlerAtAll: #( 'tests' 'corsData' ))
		  filters detect: [ :each | each isKindOf: WACORSFilter ] ]
		  on: Error
		  do: [ :ex | ex return: nil ]