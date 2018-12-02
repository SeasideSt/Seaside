"
I open the style editor on the component class.
"
Class {
	#name : #WAStylesHaloPlugin,
	#superclass : #WAHaloPlugin,
	#category : 'Seaside-Development-Plugins'
}

{ #category : #actions }
WAStylesHaloPlugin >> execute [
	self open: (WAPluggableTool on: (WAViewer on: self root))
]

{ #category : #accessing }
WAStylesHaloPlugin >> label [
	^ 'Styles'
]

{ #category : #accessing }
WAStylesHaloPlugin >> priority [
	^ 700
]

{ #category : #accessing }
WAStylesHaloPlugin >> tooltip [
	^ 'CSS Style Editor'
]
