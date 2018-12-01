"
WATrail implements breadcrumbs for pages generated using a sequence of WAComponent>>call: methods. Each component in the call sequence that is to appear in the breadcrumb must implement the method ""trailName"", which returns the text displayed in the breadcrumb. 

Instantiate (WATrail on: rootComponent) an WATrail object on the first component (root) of the breadcrumb. When the root component, or subsequent component, transfers control via ""self call:"" the WATrail object is automatically updated and will display the correct call sequence in the breadcrumb. When a user clicks on a link in the breadcrumb the call sequence is automatically updated.

The breadcrumb is placed in a div with class ""trail"" and each crumb is separated with the character '>', which is inside a span of class ""separator"" to aid in using CSS to format the breadcrumbs.

Instance Variables:
	root	<WAComponent>	first component in the breadcrumb and in the call sequence.


"
Class {
	#name : #WATrail,
	#superclass : #WACanvasWidget,
	#instVars : [
		'root'
	],
	#category : 'Seaside-Widgets-Components'
}

{ #category : #'instance creation' }
WATrail class >> on: anObject [
	^ self new root: anObject
]

{ #category : #rendering }
WATrail >> renderContentOn: html [
	| last selected |
	last := nil.
	html div
		class: 'trail';
		with: [
			root visiblePresentersDo: [ :each | 
				(each isDecoration and: [ each isDelegation ]) ifTrue: [
					(each decoratedComponent respondsTo: #trailName) ifTrue: [
						last := each.
						html anchor
							callback: [ each remove ];
							with: (each decoratedComponent perform: #trailName).
						html span
							class: 'separator';
							with: self separator ] ] ].
			selected := last isNil
				ifTrue: [ root ]
				ifFalse: [ last delegate ].
			(selected respondsTo: #trailName) ifTrue: [
				html text: (selected perform: #trailName) ] ]
]

{ #category : #accessing }
WATrail >> root: anObject [
	root := anObject
]

{ #category : #accessing }
WATrail >> separator [
	^ ' > '
]
