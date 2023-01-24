
param azFuncAsp string
param funcAppName string
param location string

resource ghostbackend 'Microsoft.Web/sites@2022-03-01' = {
  name: funcAppName
  kind: 'functionapp'
  location: location
 
  properties: {
    name: funcAppName
   
    enabled: true
    adminEnabled: true
    siteProperties: {
      metadata: null
      properties: [
        {
          name: 'LinuxFxVersion'
          value: ''
        }
        {
          name: 'WindowsFxVersion'
          value: null
        }
      ]
      appSettings: null
    }
    csrs: []
    serverFarmId: azFuncAsp
    siteConfig: {
      numberOfWorkers: 1
      linuxFxVersion: ''
      acrUseManagedIdentityCreds: false
      alwaysOn: false
      http20Enabled: false
      functionAppScaleLimit: 200
      minimumElasticInstanceCount: 0
    }
    sku: 'Dynamic'

    httpsOnly: true
    redundancyMode: 'None'
   
    storageAccountRequired: true
    keyVaultReferenceIdentity: 'SystemAssigned'
  }
  identity: {
    type: 'SystemAssigned'
  }
}

output azFuncMI string = ghostbackend.identity.principalId


