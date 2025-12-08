Class {
	#name : 'CTReportItem',
	#superclass : 'GRObject',
	#instVars : [
		'name',
		'phone'
	],
	#category : 'Comet-Examples',
	#package : 'Comet-Examples'
}

{ #category : 'accessing' }
CTReportItem >> name [
	^ name
]

{ #category : 'accessing' }
CTReportItem >> name: aString [
	name := aString
]

{ #category : 'accessing' }
CTReportItem >> phone [
	^ phone
]

{ #category : 'accessing' }
CTReportItem >> phone: aString [
	phone := aString
]
