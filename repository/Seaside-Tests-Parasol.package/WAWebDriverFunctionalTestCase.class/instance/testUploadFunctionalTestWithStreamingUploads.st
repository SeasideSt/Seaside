testing
testUploadFunctionalTestWithStreamingUploads

	| originalStreamUploadsSetting |
	originalStreamUploadsSetting := self zincServer streamUploads.
	[ 
		self zincServer streamUploads: true.
		self testUploadFunctionalTest
	] ensure: [ self zincServer streamUploads: originalStreamUploadsSetting. ]