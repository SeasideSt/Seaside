"
I ensure that there are no two versions with the same UUID. I'm a regression test for a bug in the Pharo/Squeak/Cog VM.
"
Class {
	#name : #WANoDuplicateUuidsTest,
	#superclass : #TestCase,
	#category : 'Seaside-Tests-Pharo-Development'
}

{ #category : #tests }
WANoDuplicateUuidsTest >> testNoDuplicateUuids [
	| workingCopies versionAncestries uuidsToVersion |
	workingCopies := WADevelopment allGRPackages
		collect: [ :each | WADevelopment workingCopyFor: each ].
	versionAncestries := workingCopies
		gather: [ :each | each ancestry breadthFirstAncestors ].
	uuidsToVersion := Dictionary new: versionAncestries size.
	versionAncestries do: [ :version |
		| uuid |
		uuid := version id.
		(uuidsToVersion includesKey: uuid)
			ifTrue: [ self signalFailure: version name, ' and ', (uuidsToVersion at: uuid) name , ' have duplicated UUIDs' ].
		uuidsToVersion at: uuid put: version ]
]
