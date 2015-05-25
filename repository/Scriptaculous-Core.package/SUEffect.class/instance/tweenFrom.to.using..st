effects
tweenFrom: aFromInteger to: aToInteger using: aStringOrFunction
	"This effect tweens between two values and sets a property or calls a method on an object; or allows for a callback method, which will be automatically bound to the object."

	self create; method: 'Tween'; arguments: self arguments , (Array with: aFromInteger with: aToInteger with: aStringOrFunction)