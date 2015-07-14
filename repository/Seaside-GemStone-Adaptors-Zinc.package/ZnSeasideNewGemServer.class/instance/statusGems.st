service instance-control
statusGems
  | status |
  status := super statusGems.
  self maintenanceVm
    ifNotNil: [ :gemServer | 
      | maintStatus |
      maintStatus := gemServer statusGems.
      status := status , (maintStatus lines at: 2) ].
  ^ status