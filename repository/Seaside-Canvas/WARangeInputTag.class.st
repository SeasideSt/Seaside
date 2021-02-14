"
supported on:
- Safari 2.0 (slider)
graceful degeneration to text input

For this type, step defaults to 1, min defaults to 0, max defaults to 100, and value  defaults to the min value.

Volume controls and brightness controls would be good examples of ""range"" data controls.
"
Class {
	#name : #WARangeInputTag,
	#superclass : #WAClosedRangeTag,
	#category : 'Seaside-Canvas-Tags'
}

{ #category : #accessing }
WARangeInputTag >> type [
	^ 'range'
]
