Class {
	#name : #JQButtonFunctionalTest,
	#superclass : #JQUiFunctionalTest,
	#instVars : [
		'locked',
		'number'
	],
	#category : 'JQuery-Tests-UI-Functional'
}

{ #category : #initialization }
JQButtonFunctionalTest >> initialize [
	super initialize.
	locked := false.
	number := 1
]

{ #category : #rendering }
JQButtonFunctionalTest >> renderAnchorOn: html [
	html anchor
		onClick: (html javascript
			alert: 'Nothing to configure right now.');
		script: (html jQuery this button
			text: false;
			primaryIcon: 'ui-icon-gear');
		with: 'Configure'
]

{ #category : #rendering }
JQButtonFunctionalTest >> renderCheckboxOn: html [
	html checkbox
		value: locked;
		callback: [ :value | locked := value ];
		onChange: (html jQuery ajax serializeForm);
		script: (html jQuery this button
			text: false;
			primaryIcon: 'ui-icon-locked').
	html label
		for: html lastId;
		with: 'Lock'
]

{ #category : #rendering }
JQButtonFunctionalTest >> renderContentOn: html [
	html form 
		id: 'toolbar';
		class: 'ui-widget-header';
		class: 'ui-corner-all'; 
		with: [ 
			self renderAnchorOn: html.
			self renderCheckboxOn: html.
			self renderOptionOn: html ]
]

{ #category : #rendering }
JQButtonFunctionalTest >> renderOptionOn: html [
	html span
		script: (html jQuery this buttonset);
		with: [ 
			html radioGroup
				selected: number; 
				callback: [ :value | number := value ];
				with: [ :group |
					#(1 2 3) do: [ :each |
						group radioButton
							onChange: (html jQuery ajax serializeForm);
							value: each;
							ensureId.
						html label
							for: html lastId;
							with: each ] ] ]
]

{ #category : #accessing }
JQButtonFunctionalTest >> selectors [
	^ #(renderContentOn: renderAnchorOn: renderCheckboxOn: renderOptionOn:)
]

{ #category : #hooks }
JQButtonFunctionalTest >> style [
	^ '#toolbar { padding: 4px 4px; }
.ui-button { margin-right: 4px; }'
	
]

{ #category : #accessing }
JQButtonFunctionalTest >> title [
	^ 'Button'
]

{ #category : #accessing }
JQButtonFunctionalTest >> url [
	^ 'http://docs.jquery.com/UI/Button'
]
