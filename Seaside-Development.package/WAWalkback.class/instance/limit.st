accessing
limit
	"The maximum number of frames to display."

	^ limit ifNil: [ limit := self defaultLimit min: self frameCount ]