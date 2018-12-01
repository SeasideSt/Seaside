"
No known browser support.

The progress element represents the completion progress of a task. The progress is either indeterminate, indicating that progress is being made but that it is not clear how much more work remains to be done before the task is complete (e.g. because the task is waiting for a remote host to respond), or the progress is a number in the range zero to a maximum, giving the fraction of work that has so far been completed.

There are two attributes that determine the current task completion represented by the element.

The value attribute specifies how much of the task has been completed, and the max attribute specifies how much work the task requires in total. The units are arbitrary and not specified.

Instead of using the attributes, authors are recommended to simply include the current value and the maximum value inline as text inside the element.


"
Class {
	#name : #WAProgressTag,
	#superclass : #WATagBrush,
	#category : 'Seaside-Canvas-Tags'
}

{ #category : #attributes }
WAProgressTag >> max: anInteger [
	"The max attribute specifies how much work the task requires in total"
	self attributeAt: 'max' put: anInteger
]

{ #category : #accessing }
WAProgressTag >> tag [
	^ 'progress'
]

{ #category : #attributes }
WAProgressTag >> value: anInteger [
	"The value  attribute specifies how much of the task has been completed."
	self attributeAt: 'value' put: anInteger
]
