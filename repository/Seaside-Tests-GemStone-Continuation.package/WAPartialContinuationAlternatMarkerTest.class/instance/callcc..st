private
callcc: aBlock
  | result |
  "The use of privateCallcc: is a workaround to be able to restore the process environment when restoring a partial continuation. It could be removed and inlined if the process environment is restored as part of the primitive that restores a partial continuation. See also GRGemStonePlatform>>seasideSuspendFlowDo:"
  result := self privateCallcc: aBlock.
  ^ result isProcessEnvironmentWrapper
    ifTrue: [ result restoreEnvironmentAndReturnValue ]
    ifFalse: [ result ]