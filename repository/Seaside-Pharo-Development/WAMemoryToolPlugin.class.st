"
I display the memory usage tool.
"
Class {
	#name : 'WAMemoryToolPlugin',
	#superclass : 'WAToolPlugin',
	#category : 'Seaside-Pharo-Development-Core-Plugins',
	#package : 'Seaside-Pharo-Development',
	#tag : 'Core-Plugins'
}

{ #category : 'actions' }
WAMemoryToolPlugin >> execute [
	self open: WAMemory new
]

{ #category : 'accessing' }
WAMemoryToolPlugin >> label [
	^ 'Memory'
]

{ #category : 'accessing' }
WAMemoryToolPlugin >> priority [
	^ 500
]

{ #category : 'accessing' }
WAMemoryToolPlugin >> title [
	^ 'Session Memory Use'
]
