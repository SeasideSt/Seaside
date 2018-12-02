"
I open an inspector on the component class.
"
Class {
	#name : #WAInspectorHaloPlugin,
	#superclass : #WAHaloPlugin,
	#category : 'Seaside-Development-Plugins'
}

{ #category : #actions }
WAInspectorHaloPlugin >> execute [
	self open: (WAInspector current on: self root)
]

{ #category : #testing }
WAInspectorHaloPlugin >> isActive [
	^ WAInspector current notNil
]

{ #category : #accessing }
WAInspectorHaloPlugin >> label [
	^ 'Inspector'
]

{ #category : #accessing }
WAInspectorHaloPlugin >> priority [
	^ 600
]

{ #category : #accessing }
WAInspectorHaloPlugin >> tooltip [
	^ 'Object Inspector'
]
