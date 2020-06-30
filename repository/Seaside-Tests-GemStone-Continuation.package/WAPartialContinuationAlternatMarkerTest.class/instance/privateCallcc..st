private
privateCallcc: aBlock
  ^ WAPartialContinuation currentDo: aBlock markerBlock: [ self callbackMarker ]