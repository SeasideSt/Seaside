actions
renameFile: oldName to: newName
	| contents file |
	(self asSelector: oldName) = (self asSelector: newName)
		ifTrue: [ ^ nil ].
	contents := self perform: (self asSelector: oldName).
	file := WAFile new contents: contents.
	file fileName: newName.
	self addFile: file.
	self removeFile: oldName