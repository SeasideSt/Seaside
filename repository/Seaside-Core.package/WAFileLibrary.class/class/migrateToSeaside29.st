migrating
migrateToSeaside29
	"migrates only the receiver to Seaside 2.9"
	(self default fileSelectors intersection: self selectors) do: [ :each |
		| contents |
		contents := (self default perform: each).
		(contents isKindOf: ByteArray) ifTrue: [
			| file |
			file := WAFile new
				contents: contents;
				fileName: (self default asFilename: each);
				yourself.
			self default addFile: file ] ]