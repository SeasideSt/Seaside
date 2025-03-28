private
seasideIcebergRepository

	^ IceRepository registry 
		detect: [ :repository | repository workingCopy packages anySatisfy:[ :p | p packageName = 'Seaside-Core' ] ] 
		ifNone: [ Error signal: 'Could not find the Seaside repository.' ]