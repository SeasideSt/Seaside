options
sync: aBoolean
	"Sets whether the effect should render new frames automatically (which it does by default). If true, you can render frames manually by calling the render() instance method of an effect. This is used by Effect.Parallel()."

	self optionAt: 'sync' put: aBoolean