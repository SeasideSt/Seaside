public
nextId
	"Answer an identifier string that is unique within this WARenderContext."
	
	^ lastId := 'id', self callbacks advanceKey