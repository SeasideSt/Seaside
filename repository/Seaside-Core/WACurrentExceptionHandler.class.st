"
I hold a reference to the current WAExceptionHandler. This may be needed when nesting exception handlers so that the look up of an exception handler from within an exception handler block still succeeds.
"
Class {
	#name : #WACurrentExceptionHandler,
	#superclass : #WADynamicVariable,
	#category : 'Seaside-Core-Filter'
}
