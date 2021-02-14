Class {
	#name : #WAObjectLogTableReport,
	#superclass : #WATableReport,
	#category : 'Seaside-GemStone-Tools-Production-ObjectLog'
}

{ #category : #rendering }
WAObjectLogTableReport >> renderColumn: aColumn row: aRow on: html [
	| text |
	aColumn canRender ifTrue: [
		^html tableData: [aColumn renderValue: aRow on: html]].
	text := aColumn textForRow: aRow.
	text isEmpty ifTrue: [ text := ' ' ].
	html tableData: [
		aColumn canChoose
			ifFalse: [ html render: text ]
			ifTrue: [
				html anchor
					callback: [ self chooseRow: aRow column: aColumn ];
					with: text ] ]
]
