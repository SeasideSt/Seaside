"
Please describe the package using the class comment of the included manifest class. The manifest class also includes other additional metadata for the package. These meta data are used by other tools such as the SmalllintManifestChecker and the critics Browser
"
Class {
	#name : 'ManifestJavascriptCore',
	#superclass : 'PackageManifest',
	#category : 'Javascript-Core-Manifest',
	#package : 'Javascript-Core',
	#tag : 'Manifest'
}

{ #category : 'code-critics' }
ManifestJavascriptCore class >> ruleTempsReadBeforeWrittenRuleV1FalsePositive [

	<ignoreForCoverage>
	^ #(#(#(#RGMethodDefinition #(#'JSStream class' #encodeString:on: #true)) #'2023-09-27T18:22:24.916405+02:00') )
]
