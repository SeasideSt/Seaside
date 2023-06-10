(WAAdmin defaultDispatcher handlerAt:'Yesplan') addFilter: NPObjectsReadToolFilter new.

((WAAdmin defaultDispatcher handlerAt:'Yesplan') filters select:[:e | e class == NPObjectsReadToolFilter]) do:[:e |
	(WAAdmin defaultDispatcher handlerAt:'Yesplan') removeFilter: e ].