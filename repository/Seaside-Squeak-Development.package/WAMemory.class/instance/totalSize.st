accessing
totalSize
	^ instances inject: 0 into: [ :sum :each | sum + each size ]