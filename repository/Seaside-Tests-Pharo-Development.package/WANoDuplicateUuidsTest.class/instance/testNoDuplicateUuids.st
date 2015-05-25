tests
testNoDuplicateUuids
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