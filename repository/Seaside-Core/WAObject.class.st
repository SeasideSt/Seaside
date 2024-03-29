"
A WAObject is the base class for all portable Seaside classes. It provides convenience methods for accessing the current request context, session and application.
"
Class {
	#name : 'WAObject',
	#superclass : 'GRObject',
	#category : 'Seaside-Core-Base',
	#package : 'Seaside-Core',
	#tag : 'Base'
}

{ #category : 'error handling' }
WAObject class >> defaultErrorClass [
	^ WAError
]

{ #category : 'dynamic variables' }
WAObject >> requestContext [
	"Answer the current WARequestContext instance."

	^ WACurrentRequestContext value
]
