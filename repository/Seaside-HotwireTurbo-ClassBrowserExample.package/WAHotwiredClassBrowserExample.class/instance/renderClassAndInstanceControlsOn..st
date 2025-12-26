rendering
renderClassAndInstanceControlsOn: html

	| label |
	label := classSide ifTrue:[ 'Class' ] ifFalse: [ 'Instance' ].
	html anchor
		class: 'btn elevated';
		turboAction: 'replace';
		callback: [ self classSide: classSide not ];
		with: label