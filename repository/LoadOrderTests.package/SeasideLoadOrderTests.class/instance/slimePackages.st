packages
slimePackages
	^ (Smalltalk hasClassNamed: #RBLintRule)
		ifFalse: [ OrderedCollection new ]
		ifTrue: [
			OrderedCollection new
				add: seaside30 -> 'Grease-Slime-jok.5.mcz';
				add: seaside30 -> 'Seaside-Slime-lr.78.mcz';
				add: seaside30 -> 'Grease-Tests-Slime-jok.5.mcz';
				add: seaside30 -> 'Seaside-Tests-Slime-lr.42.mcz';
				yourself ]