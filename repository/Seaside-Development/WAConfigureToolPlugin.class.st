"
I display the configuration dialog for the currently active application
"
Class {
	#name : #WAConfigureToolPlugin,
	#superclass : #WAToolPlugin,
	#category : 'Seaside-Development-Plugins'
}

{ #category : #actions }
WAConfigureToolPlugin >> execute [
	self open: (WAPluggableTool on: self application configurationComponent)
]

{ #category : #accessing }
WAConfigureToolPlugin >> label [
	^ 'Configure'
]

{ #category : #accessing }
WAConfigureToolPlugin >> priority [
	^ 200
]
