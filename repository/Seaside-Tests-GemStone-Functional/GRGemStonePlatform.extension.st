Extension { #name : #GRGemStonePlatform }

{ #category : #'*seaside-tests-gemstone-functional' }
GRGemStonePlatform >> seasideGarbageCollect [

	System _generationScavenge_vmMarkSweep.
	false "enable if you want a full repository GC"
		ifTrue: [ 
			(GsCurrentSession currentSession userProfile privileges includes: #GarbageCollection)
				ifTrue: [ 
					[	System commitTransaction.
						SystemRepository markForCollection ] 
							on: Error 
							do: [:ex |
								((ex gsNumber == 3020) _or: [ex gsNumber == 3006]) 
									ifFalse: [ ex pass ]]]]
]
