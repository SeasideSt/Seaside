Class {
	#name : #SUTitlePane,
	#superclass : #WAComponent,
	#instVars : [
		'title',
		'body',
		'open',
		'uid',
		'loaded',
		'alwaysRefresh'
	],
	#category : 'Scriptaculous-Components-Core'
}

{ #category : #accessing }
SUTitlePane >> alwaysRefresh [
	"Answer the value of alwaysRefresh"

	^ alwaysRefresh
]

{ #category : #accessing }
SUTitlePane >> alwaysRefresh: anObject [
	"Set the value of alwaysRefresh"

	alwaysRefresh := anObject
]

{ #category : #accessing }
SUTitlePane >> body [
	"Answer the value of body"

	^ body
]

{ #category : #accessing }
SUTitlePane >> body: anObject [
	"Set the value of body"

	body := anObject
]

{ #category : #hooks }
SUTitlePane >> children [
	^ (body isKindOf: WAComponent)
		ifTrue: [ Array with: body ]
		ifFalse: [ #() ]
]

{ #category : #accessing }
SUTitlePane >> cssClass [
	^ 'titlePane'
]

{ #category : #initialization }
SUTitlePane >> initialize [
	super initialize.
	open := false.
	loaded := false.
	alwaysRefresh := true
]

{ #category : #accessing }
SUTitlePane >> loaded [
	"Answer the value of loaded"

	^ loaded
]

{ #category : #accessing }
SUTitlePane >> loaded: anObject [
	"Set the value of loaded"

	loaded := anObject
]

{ #category : #accessing }
SUTitlePane >> mainId [
	^ 'main' , uid
]

{ #category : #accessing }
SUTitlePane >> open [
	"Answer the value of open"

	^ open
]

{ #category : #accessing }
SUTitlePane >> open: anObject [
	"Set the value of open"

	open := anObject
]

{ #category : #rendering }
SUTitlePane >> renderBodyOn: html [
	html div
		id: uid;
		class: 'body';
		class: 'closed' if: open not;
		with: [ open ifTrue: [ html render: body ] ]
]

{ #category : #rendering }
SUTitlePane >> renderContentOn: html [
	uid := html nextId.
	html div
		id: self mainId;
		class: self cssClass;
		with: [ 
			html div: [ 
				self renderTitleOn: html.
				self renderBodyOn: html ] ]
]

{ #category : #rendering }
SUTitlePane >> renderTitleOn: html [
	html anchor class: 'title'; 
		callback: [ open := open not ];
		onClick: (html prototype evaluator
						callback: [ :script | self scriptToggleOn: script ];
						return: false);
		 with: [
			html table
				style: 'width:100%';
				cellspacing: 0;
				with: [
					html tableRow: [
						html tableData
							class: 'label';
							with: title.
						html tableData: [
							html div
								id: 'gfx',uid;
								class: 'gfxopen' if: open;
								class: 'gfx' if: open not ] ] ] ]
]

{ #category : #scripting }
SUTitlePane >> scriptToggleOn: script [
	open
		ifTrue: [ 
			(script scriptaculous effect)
				id: uid;
				duration: 0.3;
				blindUp.
			(script prototype element)
				id: 'gfx' , uid;
				removeClassName: 'gfxopen';
				addClassName: 'gfx' ]
		ifFalse: [ 
			(loaded not or: [ alwaysRefresh ])
				ifTrue: [ 
					(script prototype element)
						id: uid;
						update: body.
					loaded := true ].
			(script prototype element)
				id: uid;
				removeClassName: 'closed'.
			(script prototype element)
				id: 'gfx' , uid;
				removeClassName: 'gfx';
				addClassName: 'gfxopen'.
			(script scriptaculous effect)
				id: uid;
				duration: 0.3;
				blindDown ].
	open := open not
]

{ #category : #public }
SUTitlePane >> startOpen [
	"Set the value of open and loaded"
	"use this if the content should be open and rendered at startup"

	open := true.
	loaded := true
]

{ #category : #accessing }
SUTitlePane >> title [
	"Answer the value of title"

	^ title
]

{ #category : #accessing }
SUTitlePane >> title: anObject [
	"Set the value of title"

	title := anObject
]

{ #category : #accessing }
SUTitlePane >> uid [
	"Answer the value of uid"

	^ uid
]

{ #category : #accessing }
SUTitlePane >> uid: anObject [
	"Set the value of uid"

	uid := anObject
]
