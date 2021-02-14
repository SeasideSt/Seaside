Extension { #name : #SentButNotImplementedTest }

{ #category : #'*seaside-gemstone-core' }
SentButNotImplementedTest >> nonImplementedSelectorsSeasideCore [
  ^ #(#'javascript:' #'internalServerErrorMessage:')	"WAScriptGenerator>>writeLoadScriptsOn: is the bad boy for javascript: and GRGemStonePlatform>>seasideProcessRequest:adaptor:resultBlock: is bad boy for internalServerErrorMessage:"
]
