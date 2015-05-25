*seaside-renderloop
presenter
	^ self properties at: #presenter ifAbsent: [ nil ]