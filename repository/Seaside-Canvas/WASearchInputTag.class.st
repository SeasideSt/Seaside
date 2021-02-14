"
supported on:
- Safari 1.3 and 2.0
not (yet) part of HTML5
graceful degeneration to text input

http://weblogs.mozillazine.org/hyatt/archives/2004_07.html#005890
"
Class {
	#name : #WASearchInputTag,
	#superclass : #WAAbstractTextAreaTag,
	#category : 'Seaside-Canvas-Tags'
}

{ #category : #attributes }
WASearchInputTag >> autosave: aString [
	"The autosave attribute allows you to specify an autosave name for your search results in the dropdown. What's cool about the autosave is that it's global, which means that two Web sites could put up a search field with an autosave name of google and then they would share the search results. (Since the actual result values are not accessible to the page there is no privacy violation.)"
	self attributeAt: 'autosave' put: aString
]

{ #category : #attributes }
WASearchInputTag >> incremental: aBoolean [
	"The incremental attribute can be used to control whether or not the search is performed as you type."
	self attributeAt: 'incremental' put: aBoolean
]

{ #category : #events }
WASearchInputTag >> onSearch: aString [
	"The search DOM event fires at the precise time the search should be performed and obeys the heuristic for the control, so you don't have to trap key and click events at all. You can use the onsearch attribute on the control to respond when the search happens."

	self attributes at: 'onsearch' append: aString separator: ';'
]

{ #category : #attributes }
WASearchInputTag >> results: aNumber [
	"The results attribute allows you to specify how many results should be displayed in the dropdown."
	self attributeAt: 'results' put: aNumber
]

{ #category : #accessing }
WASearchInputTag >> type [
	^ 'search'
]
