This continuation executes an action (any class that implements #value or #value:). If possible, the renderContext is passed in as an argument. When the action is complete, if a response hasn't been returned, control is passed to a render continuation.'

Instance Variables:
	action	<BlockClosure | BlockContext | GRDelayedSend | MessageSend | WAContinuation | WAPartialContinuation>