service instance-control
stopGems
  super stopGems.
  self maintenanceVm ifNotNil: [ :gemServer | gemServer stopGems ]