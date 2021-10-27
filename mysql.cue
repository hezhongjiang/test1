parameter:{
    capacity: string
}
output:{
    kind: ersistentVolumeClaim
    spec: {
        if parameter.capacity != _|_ {
           resources: requests: storage: parameter.capacity
        }
    }
}
output:{
  kind:       "StatefulSet"
    template: {
      spec: {

}


VendorCommunity:
	cue:
		impl: mysql
		paramter:
            certificate:
            capacity:
            scale:
		New:
		AutoBackup(snapshot interval):
		RWSplitting:
		DoubleMaster:
		HighAvailable:
