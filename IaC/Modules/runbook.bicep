
param location string

resource ghostdbsync 'Microsoft.Automation/automationAccounts@2022-08-08' = {
  name: 'psghostdbsync'
  location: location
  identity: {
    type: 'SystemAssigned'
  }
  properties: {
    publicNetworkAccess: true
    disableLocalAuth: false
    sku: {
      name: 'Basic'
    }
    encryption: {
      keySource: 'Microsoft.Automation'
      identity: {
      }
    }
    RuntimeConfiguration: {
      powershell: {
        builtinModules: {
          Az: '8.0.0'
        }
      }
      powershell7: {
        builtinModules: {
          Az: '8.0.0'
        }
      }
    }
  }
}
