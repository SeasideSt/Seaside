copying
postCopy
	super postCopy.
	"Since our handlers are dynamically registered and temporary, it makes
	sense not to copy them."
	cache := self createCache