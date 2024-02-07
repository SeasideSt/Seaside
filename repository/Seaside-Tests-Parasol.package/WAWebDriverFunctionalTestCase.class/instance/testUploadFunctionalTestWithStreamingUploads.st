testing
testUploadFunctionalTestWithStreamingUploads

	| originalStreamUploadsSetting |
	originalStreamUploadsSetting := WAAdmin serverAdaptors first server streamUploads.
	[ 
		WAAdmin serverAdaptors first server streamUploads: true.
		self testUploadFunctionalTest
	] ensure: [  WAAdmin serverAdaptors first server streamUploads: originalStreamUploadsSetting. ]