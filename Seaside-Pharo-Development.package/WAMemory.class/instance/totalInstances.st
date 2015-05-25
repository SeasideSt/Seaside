accessing
totalInstances
	^ instances inject: 0 into: [ :sum :each | sum + each count ]