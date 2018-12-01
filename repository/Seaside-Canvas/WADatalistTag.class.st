"
datalist together with the a new list attribute for input is used to make comboboxes:

<input list=browsers>
<datalist id=browsers>
 <option value=""Safari"">
 <option value=""Internet Explorer"">
 <option value=""Opera"">
 <option value=""Firefox"">
</datalist>


"
Class {
	#name : #WADatalistTag,
	#superclass : #WACollectionTag,
	#instVars : [
		'valueBlock'
	],
	#category : 'Seaside-Canvas-Tags'
}

{ #category : #private }
WADatalistTag >> renderListItem: anObject labelled: labelString [
	canvas option
		value: (self valueFor: anObject);
		selected: (self isSelected: anObject);
		with: labelString
]

{ #category : #accessing }
WADatalistTag >> tag [
	^ 'datalist'
]

{ #category : #private }
WADatalistTag >> valueFor: anObject [
	^ valueBlock isNil
		ifTrue: [ anObject ]
		ifFalse: [ valueBlock value: anObject ]
]

{ #category : #accessing }
WADatalistTag >> values: aBlock [
	"Allows to customize the rendering of list items by passing a one argument block that converts each option to a string for use in the 'value' attribute. If you need to do more customized html rendering for the options use #with: or override #renderOn: in your objects."

	valueBlock := aBlock fixCallbackTemps
]
