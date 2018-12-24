accessing
callback
	"the function to be executed at each interval"
 	^ callback ifNil: [ callback := self defaultCallback ]