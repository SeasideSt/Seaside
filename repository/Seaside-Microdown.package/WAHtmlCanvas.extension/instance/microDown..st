*Seaside-Microdown
microDown: aMicroDownText

	(WAMicroDownRenderer on: self) visit: (Microdown parse: aMicroDownText)