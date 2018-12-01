Class {
	#name : #SUFormTest,
	#superclass : #SUFunctionalTest,
	#instVars : [
		'textInput',
		'textArea',
		'checkBox',
		'radioButton',
		'selectList',
		'multiSelectList'
	],
	#category : 'Scriptaculous-Tests-Core-Functional'
}

{ #category : #initialization }
SUFormTest >> initialize [
	super initialize.
	textInput := 'Text Input'.
	textArea := 'Text Area'.
	checkBox := false.
	radioButton := 1.
	selectList := 1.
	multiSelectList := 1 to: 2
]

{ #category : #'rendering-elements' }
SUFormTest >> renderCheckBoxOn: html [
	self
		renderLabel: 'Check-Box'
		control: [ :fid :mid |
			html checkbox
				value: checkBox;
				callback: [ :value | checkBox := value ];
				onClick: (html scriptaculous updater
					id: mid;
					triggerForm: fid;
					callback: [ :r | r render: checkBox ]) ]
		model: checkBox
		on: html
]

{ #category : #rendering }
SUFormTest >> renderContentOn: html [
	self renderTextInputOn: html.
	self renderTextAreaOn: html.
	self renderCheckBoxOn: html.
	self renderRadioButtonOn: html.
	self renderSelectListOn: html.
	self renderMultiSelectListOn: html
]

{ #category : #'rendering-utilities' }
SUFormTest >> renderLabel: aString control: aBlock model: anObject on: html [
	| fid mid |
	fid := mid := nil.
	html div class: 'row'; with: [
		html div class: 'label'; with: aString.
		html div class: 'control'; with: [
			html form
				id: (fid := html nextId);
				with: [ html div: [ aBlock value: fid value: (mid := html nextId) ] ] ].
		html div class: 'model'; id: mid; with: anObject.
		html div class: 'clear' ]
]

{ #category : #'rendering-elements' }
SUFormTest >> renderMultiSelectListOn: html [ 
	self 
		renderLabel: 'Multi-Select-List'
		control: [ :fid :mid | 
			html multiSelect
				size: 3;
				list: (1 to: 9);
				selected: multiSelectList;
				callback: [ :value | multiSelectList := value ];
				onChange: (html scriptaculous updater
						id: mid;
						triggerForm: fid;
						callback: [ :r | r render: multiSelectList ]) ]
		model: multiSelectList
		on: html
]

{ #category : #'rendering-elements' }
SUFormTest >> renderRadioButtonOn: html [
	self
		renderLabel: 'Radio-Button'
		control: [ :fid :mid |
			html radioGroup
				callback: [ :value | radioButton := value ];
				selected: radioButton;
				with: [ :group |
					1 to: 3 do: [ :each |
						html label: [
							html radioButton
								group: group;
								value: each;
								onChange: (html scriptaculous updater
									id: mid;
									triggerForm: fid;
									callback: [ :r | r render: radioButton ]).
						 		html text: each ].
						html break ] ] ]
		model: radioButton
		on: html
]

{ #category : #'rendering-elements' }
SUFormTest >> renderSelectListOn: html [
	self
		renderLabel: 'Select-List'
		control: [ :fid :mid |
			html select
				list: (1 to: 9);
				selected: selectList;
				callback: [ :value | selectList := value ];
				onChange: (html scriptaculous updater
					id: mid;
					triggerForm: fid;
					callback: [ :r | r render: selectList ]) ]
		model: selectList
		on: html
]

{ #category : #'rendering-elements' }
SUFormTest >> renderTextAreaOn: html [
	self
		renderLabel: 'Text-Area'
		control: [ :fid :mid |
			html textArea columns: 20;
				value: textArea;
				callback: [ :value | textArea := value ];
				onChange: (html scriptaculous updater
					id: mid;
					triggerForm: fid;
					callback: [ :r | r render: textArea ]) ]
		model: textArea
		on: html
]

{ #category : #'rendering-elements' }
SUFormTest >> renderTextInputOn: html [
	self
		renderLabel: 'Text-Input'
		control: [ :fid :mid |
			html textInput
				value: textInput;
				callback: [ :value | textInput := value ];
				onChange: (html scriptaculous updater
					id: mid;
					triggerForm: fid;
					callback: [ :r | r render: textInput ]) ]
		model: textInput
		on: html
]

{ #category : #hooks }
SUFormTest >> style [
	^ 'div.row { margin: 5px; }
div.label { float: left; width: 20%; font-weight: bold; }
div.control { float: left; width: 50% }
div.model { float: left; width: 30%; }
div.clear { clear: both; }
select { width: 100px; }'
]
