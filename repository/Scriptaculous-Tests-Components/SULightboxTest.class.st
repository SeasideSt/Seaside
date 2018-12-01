Class {
	#name : #SULightboxTest,
	#superclass : #SUFunctionalTest,
	#instVars : [
		'value'
	],
	#category : 'Scriptaculous-Tests-Components'
}

{ #category : #'user interface' }
SULightboxTest >> inform: aString [
	self lightbox: (WAFormDialog new addMessage: aString; yourself).
	self lightbox: (WAFormDialog new addMessage: 'Back for more'; yourself)
]

{ #category : #rendering }
SULightboxTest >> renderContentOn: html [
	html form
		style: 'text-align: center';
		with:[
			html div: [
				html text: 'What is your favorite transportation system ?'.
				3 timesRepeat: [ html break ].
				html select
					list: #(Automobile Airplane Truck Boat Bicycle Horse Walking Swimming);
					selected: value;
					callback: [ :v | value := v ].
				html submitButton value: 'Ok'; callback: [ self inform: value ] ] ]
]

{ #category : #hooks }
SULightboxTest >> style [
	^ '
div#lightbox {
	background: white;
	border: 1px solid #0000e8;
	padding: 2em;
	width: 40em;
	text-align: center;
}
div#overlay {
	background-color: black;
	filter: alpha(opacity=30);
	-moz-opacity: 0.3;
	opacity: 0.3;
}
'
]
