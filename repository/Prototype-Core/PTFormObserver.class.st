"
This class corresponds to the Form.Observer class in the prototype.js library. It is typically instantiated via a canvas, e.g. (html scriptaculous formObserver).

See the comment on SUTimedObserver for more details.
"
Class {
	#name : #PTFormObserver,
	#superclass : #PTTimedObserver,
	#category : 'Prototype-Core-Observers'
}

{ #category : #defaults }
PTFormObserver >> defaultPrototype [
	^ 'Form.Observer'
]
