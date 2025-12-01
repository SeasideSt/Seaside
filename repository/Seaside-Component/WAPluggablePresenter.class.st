Class {
	#name : 'WAPluggablePresenter',
	#superclass : 'WAComponent',
	#instVars : [
		'block'
	],
	#category : 'Seaside-Component-Base',
	#package : 'Seaside-Component',
	#tag : 'Base'
}

{ #category : 'accessing' }
WAPluggablePresenter >> block: aBlock [
	block := aBlock
]

{ #category : 'rendering' }
WAPluggablePresenter >> renderContentOn: html [
	block value: html
]
