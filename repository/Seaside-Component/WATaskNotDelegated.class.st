Class {
	#name : #WATaskNotDelegated,
	#superclass : #WAError,
	#category : 'Seaside-Component-Tasks'
}

{ #category : #accessing }
WATaskNotDelegated >> seasidePossibleCauses [
	^ #('The Task is embedded in another Component but has not been included in the list of child Components returned by the Component''s #children method.' 'The Task has an empty #go method.' 'The Task does not call another Component in its #go method.' 'The #go method is written to depend on the looping execution of Tasks. If the Task needs looping behaviour without calling a Component, implement the looping behaviour within the #go method.')
]
