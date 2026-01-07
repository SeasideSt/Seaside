"
The slot HTML element—part of the Web Components technology suite—is a placeholder inside a web component that you can fill with your own markup, which lets you create separate DOM trees and present them together.
"
Class {
	#name : 'WASlotTag',
	#superclass : 'WATagBrush',
	#category : 'Seaside-Canvas-Tags',
	#package : 'Seaside-Canvas',
	#tag : 'Tags'
}

{ #category : 'attributes' }
WASlotTag >> name: aSring [
	"The slot's name."
	self attributeAt: 'name' put: aSring
]

{ #category : 'accessing' }
WASlotTag >> tag [
	^ 'slot'
]
