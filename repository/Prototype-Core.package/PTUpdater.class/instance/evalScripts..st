options
evalScripts: aBoolean
	"This determines whether <script> elements in the response text are evaluated or not. The default implementation of Prototypes does not evaluate script, however this implementation changes this odd behavior."

	self options at: 'evalScripts' put: aBoolean