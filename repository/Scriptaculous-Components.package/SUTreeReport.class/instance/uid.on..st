private
uid: anObject on: html
	^ uids at: anObject ifAbsentPut: [ html nextId ]