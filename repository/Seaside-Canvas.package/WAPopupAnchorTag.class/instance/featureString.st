private
featureString
	^ String streamContents:  [ :stream | 
		features associations do: [ :association | 
				stream
					nextPutAll: association key;
					nextPut: $=.
				stream nextPutAll: (association value == true 
						ifTrue: [ 'yes' ]
						ifFalse: [
							association value == false 
								ifTrue: [ 'no' ]
								ifFalse: [ association value greaseString ] ]) ]
			separatedBy: [ stream nextPut: $, ] ]