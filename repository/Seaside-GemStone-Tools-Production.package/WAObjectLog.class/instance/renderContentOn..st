rendering
renderContentOn: html

	| rows |
	html heading: 'Object Log [', self objectLogEntries size printString, ']'.
	self renderSummaryOn: html.
	self renderFormOn: html.
	rows := self objectLogEntries reversed.
	filter notNil ifTrue: [
		| index |
		index := self labels indexOf: filter.
		rows := rows select: [:each | each priority = index].
	].
	report rows: rows.
	html render: report