*Seaside-HotwireTurbo-Core
turboTarget: aString

	"data-turbo-frame identifies the Turbo Frame to navigate. Refer to the Frames documentation for further details."

	self dataAttributeAt: 'turbo-frame' put: aString