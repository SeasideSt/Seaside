accessing-dynamic
handler
	"Answer the current RequestHandler or nil."

	^ self handlers isEmpty ifFalse: [ self handlers first ]