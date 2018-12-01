Class {
	#name : #WAInputElementContainer,
	#superclass : #WAComponent,
	#instVars : [
		'textInput',
		'textArea',
		'singleSelection',
		'singleSelectionOptional',
		'singleSelectionCustom',
		'multiSelection',
		'nestedSelection',
		'nestedMultiSelection',
		'checkbox',
		'radio',
		'upload',
		'hiddenInput',
		'radioCustom'
	],
	#category : 'Seaside-Tests-Functional'
}

{ #category : #accessing }
WAInputElementContainer >> elements [
	^ #( Quito Dakar Sydney Bamako )
]

{ #category : #accessing }
WAInputElementContainer >> nestedElements [
	^ #(('Functional' ('Haskell ' 'Lisp' 'ML')) ('Dataflow' ('Hartmann pipelines' 'G' 'Max' 'Prograph')) ('Fourth-generation' ('Today' 'Ubercode' 'Uniface')))
]

{ #category : #'rendering-elements' }
WAInputElementContainer >> renderCheckboxOn: html [
	self
		renderLabel: 'Checkbox'
		input: [
			html label: [
				html checkbox
					value: checkbox;
					callback: [ :value | checkbox := value ].
				html text: 'Checked' ] ]
		output: checkbox printString
		on: html
]

{ #category : #rendering }
WAInputElementContainer >> renderContentOn: html [
	self renderHeadingOn: html.
	self renderTextInputOn: html.
	self renderTextAreaOn: html.
	self renderHiddenInputOn: html.
	self renderCheckboxOn: html.
	self renderRadioButtonsOn: html.
	self renderRadioButtonsCustomOn: html.
	self renderSingleSelectionOn: html.
	self renderSingleSelectionCustomOn: html.
	self renderSingleSelectionOptionalOn: html.
	self renderMultiSelectionOn: html.
	self renderNestedSelectionOn: html.
	self renderNestedMultiSelectionOn: html.
	self renderUploadOn: html
]

{ #category : #rendering }
WAInputElementContainer >> renderHeadingOn: html [
	html tableRow: [
		html tableHeading.
		html tableHeading: 'Control'.
		html tableHeading: 'Print String' ]
]

{ #category : #'rendering-elements' }
WAInputElementContainer >> renderHiddenInputOn: html [
	| string |
	string := hiddenInput ifNil: [ 'Seaside' ].
	self
		renderLabel: 'Hidden Input'
		input: [
			html render: string.			
			html hiddenInput
				value: string;
				callback: [ :value | hiddenInput := value ] ]
		output: hiddenInput printString
		on: html
]

{ #category : #rendering }
WAInputElementContainer >> renderLabel: aString input: anInputBlock output: anOutputBlock on: html [
	html tableRow: [
		html tableHeading: aString.
		html tableData: anInputBlock.
		html tableData: anOutputBlock ]
]

{ #category : #'rendering-elements' }
WAInputElementContainer >> renderMultiSelectionOn: html [ 
	self 
		renderLabel: 'Multi Selection'
		input: [
			html multiSelect
				list: self elements;
				titles: [ :each | 'Title: ' , each greaseString ];
				selected: multiSelection;
				callback: [ :value | multiSelection := value ] ]
		output: [
			multiSelection isEmptyOrNil ifFalse: [
				"empty lists are invalid HTML"
				html unorderedList list: multiSelection ] ]
		on: html
]

{ #category : #'rendering-elements' }
WAInputElementContainer >> renderNestedMultiSelectionOn: html [
	| selectTag |
	self
		renderLabel: 'Nested Multi Selection'
		input: [
			selectTag := html multiSelect.
			selectTag
				size: 6;
				callback: [ :value | nestedMultiSelection := value ];
				selected: nestedMultiSelection;
				with: [
					self nestedElements do: [ :list |
						html optionGroup
							label: list first;
							with: [
								list second do: [ :each |
									html option
										value: each with: selectTag ;
										with: each ] ] ] ] ]
		output: [ nestedMultiSelection isNil ifFalse: [ html unorderedList list: nestedMultiSelection ] ]
		on: html
]

{ #category : #'rendering-elements' }
WAInputElementContainer >> renderNestedSelectionOn: html [
	| selectTag |
	self
		renderLabel: 'Nested Selection'
		input: [
			selectTag := html select.
			selectTag
				callback: [ :value | nestedSelection := value ];
				selected: nestedSelection;
				with: [
					self nestedElements do: [ :list |
						html optionGroup
							label: list first;
							with: [
								list second do: [ :each |
									html option
										value: each with: selectTag;
										with: each ] ] ] ] ]
		output: nestedSelection printString
		on: html
]

{ #category : #'rendering-elements' }
WAInputElementContainer >> renderRadioButtonsCustomOn: html [
	self
		renderLabel: 'Radiogroup (Custom)'
		input: [
			html radioGroup: [ :group |
					self elements do: [ :each |
						html label: [ 
							html radioButton
								group: group;
								selected: radioCustom = each;
								callback: [ radioCustom := each ].
							html text: each ].
						html break ] ] ]
		output: radioCustom printString
		on: html
]

{ #category : #'rendering-elements' }
WAInputElementContainer >> renderRadioButtonsOn: html [
	self
		renderLabel: 'Radiogroup'
		input: [
			html radioGroup
				callback: [ :value | radio := value ];
				selected: radio;
				with: [ :group |
					self elements do: [ :each |
						html label: [ 
							group radioButton value: each.
							html text: each ].
						html break ] ] ]
		output: radio printString
		on: html
]

{ #category : #'rendering-elements' }
WAInputElementContainer >> renderSingleSelectionCustomOn: html [ 
	self 
		renderLabel: 'Single Selection (Custom)'
		input: [
			html select
				dispatchCallback;
				with: [
					self elements do: [ :each |
						html option
							label: 'Short: ', (each copyFrom: 1 to: 3);
							callback: [ singleSelectionCustom := each ];
							selected: (singleSelectionCustom = each);
							with: 'Custom:', each greaseString  ] ] ]
		output: singleSelectionCustom printString
		on: html
]

{ #category : #'rendering-elements' }
WAInputElementContainer >> renderSingleSelectionOn: html [ 
	self 
		renderLabel: 'Single Selection'
		input: [
			html select
				list: self elements;
				titles: [ :each | 'Title: ' , each greaseString ];
				selected: singleSelection;
				callback: [ :value | singleSelection := value ] ]
		output: singleSelection printString
		on: html
]

{ #category : #'rendering-elements' }
WAInputElementContainer >> renderSingleSelectionOptionalOn: html [
	self
		renderLabel: 'Single Selection (Optional)'
		input: [
			html select
				beOptional;
				list: self elements;
				optionalLabel: '(none)';
				selected: singleSelectionOptional;
				callback: [ :value | singleSelectionOptional := value ] ]
		output: singleSelectionOptional printString
		on: html
]

{ #category : #'rendering-elements' }
WAInputElementContainer >> renderTextAreaOn: html [
	self
		renderLabel: 'Text Area'
		input: [
			html textArea
				rows: 3;
				columns: 17;
				value: textArea;
				callback: [ :value | textArea := value ] ]
		output: textArea printString
		on: html
]

{ #category : #'rendering-elements' }
WAInputElementContainer >> renderTextInputOn: html [
	self
		renderLabel: 'Text Input'
		input: [
			html textInput
				value: textInput;
				callback: [ :value | textInput := value ] ]
		output: textInput printString
		on: html
]

{ #category : #'rendering-elements' }
WAInputElementContainer >> renderUploadOn: html [
	self
		renderLabel: 'Upload'
		input: [ html fileUpload callback: [ :file | upload := file ] ]
		output: upload printString
		on: html
]
