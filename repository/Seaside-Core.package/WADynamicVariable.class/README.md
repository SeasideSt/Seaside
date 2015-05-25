A WADynamicVariable is a variable that is visible only in the stackframes outgoing from this one.

Example:

WADynamicVariable
	use: 'Seaside'
	during: [ self compilcatedCalculation ]
	
Whenever
WADynamicVariable value
gets evaluated somewhere inside [ self compilcatedCalculation ] or a method invoked directly or indirectly by it, its value will be 'Seaside'. If no #use:during: handler is around the current stack frame, then the value will be the return value of #defaultValue.

Do not use WADynamicVariable directly, instead create a subclass for each variable you want to use.