Class {
	#name : #WADispatcherEmptyPage,
	#superclass : #WADispatcherSubPage,
	#category : 'Seaside-Tools-Web'
}

{ #category : #'instance creation' }
WADispatcherEmptyPage class >> on: parentComponent [
	^ self new
		parent: parentComponent;
		yourself
]
