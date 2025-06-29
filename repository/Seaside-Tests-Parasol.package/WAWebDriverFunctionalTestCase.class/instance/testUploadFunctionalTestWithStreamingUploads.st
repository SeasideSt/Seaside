testing
testUploadFunctionalTestWithStreamingUploads
	| originalStreamUploadsSetting |
	
	"skip if Zinc not present, for example on Squeak"
	self hasZinc ifFalse: [ ^ self ].
	
	originalStreamUploadsSetting := self zincServer streamUploads.
	[ 
		self zincServer streamUploads: true.
		self testUploadFunctionalTest
	] ensure: [ self zincServer streamUploads: originalStreamUploadsSetting. ]