"
I open a browser on the component class.
"
Class {
	#name : #WABrowserHaloPlugin,
	#superclass : #WAHaloPlugin,
	#category : 'Seaside-Pharo-Development-Core-Plugins'
}

{ #category : #actions }
WABrowserHaloPlugin >> execute [
	self open: (WABrowser fullOnClass: self root class)
]

{ #category : #accessing }
WABrowserHaloPlugin >> label [
	^ 'Browser'
]

{ #category : #accessing }
WABrowserHaloPlugin >> priority [
	^ 500
]

{ #category : #accessing }
WABrowserHaloPlugin >> tooltip [
	^ 'Class Browser'
]
