"
Form is a namespace and a module for all things form-related, packed with form manipulation and serialization goodness. While it holds methods dealing with forms as whole, its submodule Form.Element deals with specific form controls.
"
Class {
	#name : #PTForm,
	#superclass : #PTElement,
	#category : 'Prototype-Core-Elements'
}

{ #category : #actions }
PTForm >> disable [
	"Disables the form as whole. Form controls will be visible but uneditable."

	self call: 'disable'
]

{ #category : #enumerating }
PTForm >> elements [
	"Returns a collection of all form controls within a form."

	^ self call: 'getElements'; enumerator
]

{ #category : #actions }
PTForm >> enable [
	"Enables a fully or partially disabled form."

	self call: 'enable'
]

{ #category : #querying }
PTForm >> findFirstElement [
	"Finds first non-hidden, non-disabled form control."

	self call: 'findFirstElement'
]

{ #category : #actions }
PTForm >> focusFirstElement [
	"Gives keyboard focus to the first element of the form."

	self call: 'focusFirstElement'
]

{ #category : #enumerating }
PTForm >> inputs [
	"Returns a collection of all INPUT elements in a form. Use optional type and name arguments to restrict the search on these attributes."

	^ self call: 'getInputs'; enumerator
]

{ #category : #actions }
PTForm >> request [
	"A convenience method for serializing and submitting the form via an SURequest to the URL of the form's action attribute."

	self call: 'request'
]

{ #category : #actions }
PTForm >> reset [
	"Resets a form to its default values."

	self call: 'reset'
]

{ #category : #querying }
PTForm >> serialize [
	"Serialize form data to a string suitable for Ajax requests (default behavior) or, if optional getHash evaluates to true, an object hash where keys are form control names and values are data."

	self call: 'serialize'
]

{ #category : #actions }
PTForm >> submit [
	self call: 'submit'
]
