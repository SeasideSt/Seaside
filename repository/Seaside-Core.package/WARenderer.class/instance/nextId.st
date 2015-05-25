public
nextId
	"Answer an identifier string that is unique within this RenderContext."
	
	^ lastId := 'id', self callbacks advanceKey