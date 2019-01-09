initialization
initialize
  | vmName |
  super initialize.
  vmName := self defaultMaintenanceVmName.
  self
    maintenanceVm:
      ((self class gemServerNamed: vmName)
        ifNil: [ MaintenanceVmGemServer register: vmName ])