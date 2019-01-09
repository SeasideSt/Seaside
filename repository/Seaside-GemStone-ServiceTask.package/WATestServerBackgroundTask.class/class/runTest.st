Instance Creation
runTest
	| originalTransactionMode |
	originalTransactionMode := System transactionMode.
	
	"Need to set to manual transaction mode so that I can manually #commitTransaction and
	#abortTransaction. I #commitTransaction to update instance variable, and #abortTransaction to
	receive updates from the background service task.
	
	Note: I tried System #continueTransaction (see GS64-ProgGuide-2.4.pdf p.137), instead of 
	#abortTransaction, but that didn't appear to work."
	^ [
		System transactionMode: #manualBegin.
		self default runTest
	] ensure: [ 
		System transactionMode: originalTransactionMode]