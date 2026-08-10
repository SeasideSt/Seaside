private
subSeparatorIndex
	"Aswers the index of the last '+' separator in the sub(type), or 0 if not present."
	
    ^self sub lastIndexOf: $+