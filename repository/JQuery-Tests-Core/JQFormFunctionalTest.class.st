Class {
	#name : #JQFormFunctionalTest,
	#superclass : #JQFunctionalTest,
	#instVars : [
		'textInput',
		'textArea',
		'checkBox',
		'radioButton',
		'selectList',
		'multiSelectList',
		'fileInput',
		'fileInputs'
	],
	#category : 'JQuery-Tests-Core-Functional'
}

{ #category : #initialization }
JQFormFunctionalTest >> initialize [
	super initialize.
	textInput := 'Text Input'.
	textArea := 'Text Area'.
	checkBox := false.
	radioButton := 1.
	selectList := 1.
	multiSelectList := 1 to: 2
]

{ #category : #'rendering-elements' }
JQFormFunctionalTest >> renderCheckBoxOn: html [
	self
		renderLabel: 'Check-Box'
		control: [ :id :script |
			html checkbox
				id: id;
				value: checkBox;
				callback: [ :value | checkBox := value ];
				onChange: (script html: [ :h | h render: checkBox ]) ]
		model: checkBox
		on: html
]

{ #category : #rendering }
JQFormFunctionalTest >> renderContentOn: html [
	self renderTextInputOn: html.
	self renderTextAreaOn: html.
	self renderCheckBoxOn: html.
	self renderRadioButtonOn: html.
	self renderSelectListOn: html.
	self renderMultiSelectListOn: html.
	self renderFileUploadOn: html.
	self renderMultiFileUploadOn: html
]

{ #category : #'rendering-elements' }
JQFormFunctionalTest >> renderFileUploadOn: html [
	self
		renderLabel: 'File-Upload'
		control: [ :id :script |
			html fileUpload
				id: id;
				callback: [ :value | fileInput := value ].

			html submitButton
				onClick: (html jQuery ajax 
											serializeFileUpload: (html jQuery id: id);
											onSuccess: (((html jQuery id: id)	
																	parents: 'fieldset';
																	find: 'p') load html: [ :h | h render: fileInput fileName, '(', fileInput size greaseString, ' bytes)' ]));
				with: 'Upload!' ]
		model: (fileInput notNil ifTrue: [ fileInput fileName, '(', fileInput size greaseString, ' bytes)' ] ifFalse: [ nil ])
		on: html
]

{ #category : #'rendering-utilities' }
JQFormFunctionalTest >> renderLabel: aString control: aBlock model: anObject on: html [
	| id |
	html fieldSet: [
		html label
			for: (id := html nextId);
			with: aString.
		html span: [
			aBlock
				value: id
				" update the paragraph "
				value: ((html jQuery this	
					parents: 'fieldset';
					find: 'p') load
						" serialize all nearby form elements "
						serialize: (html jQuery this		
							parents: 'span';
							find: ':input')) ].
		html paragraph: anObject ]
]

{ #category : #'rendering-elements' }
JQFormFunctionalTest >> renderMultiFileUploadOn: html [

	| modelBlock |
	modelBlock := [ fileInputs notNil ifTrue: [
			String streamContents:[ :stream |
				fileInputs
					do: [ :file | 
						stream
							nextPutAll: file fileName;
							nextPutAll: '(';
							nextPutAll: file size greaseString;
							nextPutAll: ' bytes)' ]
					separatedBy: [ stream nextPutAll: '--' ] ] ]
			ifFalse: [ nil ] ].
	
	self
		renderLabel: 'Multiple File-Upload'
		control: [ :id :script |
			html fileUpload
				id: id;
				multipleValuesCallback: [ :value | fileInputs := value ].

			html submitButton
				onClick: (html jQuery ajax 
											serializeFileUpload: (html jQuery id: id);
											onSuccess: (((html jQuery id: id)	
																	parents: 'fieldset';
																	find: 'p') load html: [ :h | h render: modelBlock value ]));
				with: 'Upload!' ]
		model: modelBlock value
		on: html
]

{ #category : #'rendering-elements' }
JQFormFunctionalTest >> renderMultiSelectListOn: html [ 
	self 
		renderLabel: 'Multi-Select-List'
		control: [ :id :script | 
			html multiSelect
				id: id;
				size: 3;
				list: (1 to: 9);
				selected: multiSelectList;
				callback: [ :value | multiSelectList := value ];
				onChange: (script html: [ :h | h render: multiSelectList ]) ]
		model: multiSelectList
		on: html
]

{ #category : #'rendering-elements' }
JQFormFunctionalTest >> renderRadioButtonOn: html [
	self
		renderLabel: 'Radio-Button'
		control: [ :id :script |
			html radioGroup
				callback: [ :value | radioButton := value ];
				selected: radioButton;
				with: [ :group |
				1 to: 3 do: [ :each |
					html label: [
						html radioButton
							group: group;
							value: each;
							onChange: (script html: [ :h | h render: radioButton ]).
						html text: each ].
					html break ] ] ]
		model: radioButton
		on: html
]

{ #category : #'rendering-elements' }
JQFormFunctionalTest >> renderSelectListOn: html [
	self
		renderLabel: 'Select-List'
		control: [ :id :script |
			html select
				id: id;
				list: (1 to: 9);
				selected: selectList;
				callback: [ :value | selectList := value ];
				onChange: (script html: [ :h | h render: selectList ]) ]
		model: selectList
		on: html
]

{ #category : #'rendering-elements' }
JQFormFunctionalTest >> renderTextAreaOn: html [
	self
		renderLabel: 'Text-Area'
		control: [ :id :script |
			html textArea
				id: id;
				columns: 20;
				value: textArea;
				callback: [ :value | textArea := value ];
				onChange: (script html: [ :h | h render: textArea ]) ]
		model: textArea
		on: html
]

{ #category : #'rendering-elements' }
JQFormFunctionalTest >> renderTextInputOn: html [
	self
		renderLabel: 'Text-Input'
		control: [ :id :script |
			html textInput
				id: id;
				value: textInput;
				callback: [ :value | textInput := value ];
				onChange: (script html: [ :h | h render: textInput ]).
			"the following code checks if a manual submit does a correct encoding:"
			html submitButton
				onClick: (html jQuery ajax
					callback: [ :value | textInput := value ] value: (html jQuery id: id) value;
					script: [ :s | s alert: 'The submitted value is: "' , textInput , '".' ]);
				with: 'Manual Submit' ]
		model: textInput
		on: html
]

{ #category : #accessing }
JQFormFunctionalTest >> selectors [
	^ #(renderLabel:control:model:on: renderTextInputOn: renderTextAreaOn: renderCheckBoxOn: renderRadioButtonOn: renderSelectListOn: renderMultiSelectListOn: #renderFileUploadOn:)
]

{ #category : #hooks }
JQFormFunctionalTest >> style [
	^ 'fieldset { border: none; margin: 1em 0; padding: 0; }
fieldset label, fieldset span, fieldset p { display: block; float: left; width: 33%; margin: 0; padding: 0; }
fieldset span label { display: inline; float: none; }
fieldset span input.text, fieldset span select, fieldset span textarea { width: 80% }
fieldset p { background-color: #ddd; padding: 2px; }'
]

{ #category : #accessing }
JQFormFunctionalTest >> title [
	^ 'Form and Form Elements'
]
