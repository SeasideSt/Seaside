service instance-control
startGems
  super startGems.
  self maintenanceVm ifNotNil: [ :gemServer | gemServer startGems ]