"
I display the class name of the component class.
"
Class {
	#name : #WAClassnameHaloPlugin,
	#superclass : #WAHaloPlugin,
	#category : 'Seaside-Development-Plugins'
}

{ #category : #accessing }
WAClassnameHaloPlugin >> priority [
	^ 100
]

{ #category : #rendering }
WAClassnameHaloPlugin >> renderContentOn: html [
	html div class: self cssClass; with: self root className
]
