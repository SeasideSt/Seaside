control
addServerOfClass: aServerClass withName: aUniqueName on: anArrayOfPortNumbers

	self addServer: (WAGemStoneSmalltalkServer createServerOfClass: aServerClass withName: aUniqueName on: anArrayOfPortNumbers).