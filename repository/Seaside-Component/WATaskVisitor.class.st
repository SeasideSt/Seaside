Class {
	#name : 'WATaskVisitor',
	#superclass : 'WAPainterVisitor',
	#category : 'Seaside-Component-Visitors',
	#package : 'Seaside-Component',
	#tag : 'Visitors'
}

{ #category : 'visiting' }
WATaskVisitor >> visitTask: aTask [
	super visitTask: aTask.
	aTask isExecuting ifFalse: [
		[ aTask execute ]
			on: WARenderNotification
			do: [ :n | ] ]
]
