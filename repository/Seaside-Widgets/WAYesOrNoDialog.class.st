"
WAYesOrNoDialog displays a yes/no dialog. Returns boolean indicating user selection. See WAComponent>>confirm: for sample usage and easy way to use WAYesOrNoDialog.
"
Class {
	#name : #WAYesOrNoDialog,
	#superclass : #WAFormDialog,
	#category : 'Seaside-Widgets-Components'
}

{ #category : #examples }
WAYesOrNoDialog class >> exampleComponent [
	^ self new
]

{ #category : #accessing }
WAYesOrNoDialog >> buttons [
	^ #(yes no)
]

{ #category : #accessing }
WAYesOrNoDialog >> no [
	self answer: false
]

{ #category : #accessing }
WAYesOrNoDialog >> yes [
	self answer: true
]
