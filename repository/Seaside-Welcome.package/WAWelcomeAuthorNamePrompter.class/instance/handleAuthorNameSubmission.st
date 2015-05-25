private
handleAuthorNameSubmission
	"AuthorName appears to prefer no accented characters so a simple select block with 'char isLetter' is not sufficent"
	self authorName: (self authorName select: [ :char |
		'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz' includes: char ]).
	
	self authorName ifEmpty: [ self authorName: nil. ^ self ].
	
	GRPlatform current seasideSetAuthorName: self authorName.
	self answer