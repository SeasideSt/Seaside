private 
initializeSampleData

	^ sampleData := ((1 to: 10) collect: [ :index | 
		                 Dictionary new
			                 at: 'id' put: index;
			                 at: 'title'
			                 put: ('Item <1p>' expandMacrosWith: 2);
			                 yourself ]) asOrderedCollection