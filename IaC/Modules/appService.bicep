param appName string
param location string
param environmenttag string
param severFarmId string


resource appneughostpri 'Microsoft.Web/sites@2022-03-01' = {
  name: appName
  kind: 'app,linux,container'
  location: location
  tags: {
    Environment: environmenttag
  }
  properties: {
    name: appName
    enabled: true
    adminEnabled: true
    siteProperties: {
      metadata: null
      properties: [
        {
          name: 'LinuxFxVersion'
          value: 'DOCKER|ghost:4-alpine'
        }
        {
          name: 'WindowsFxVersion'
          value: null
        }
      ]
      appSettings: null
    }
    csrs: []
    serverFarmId: severFarmId
    vnetRouteAllEnabled: false
    vnetImagePullEnabled: false
    vnetContentShareEnabled: false
    siteConfig: {
      numberOfWorkers: 1
      linuxFxVersion: 'DOCKER|ghost:4-alpine'
      acrUseManagedIdentityCreds: false
      alwaysOn: true
      http20Enabled: false
      functionAppScaleLimit: 0
      minimumElasticInstanceCount: 0
    }
    sku: 'Standard'
    kind: 'app,linux,container'
    containerSize: 0
    httpsOnly: true
    publicNetworkAccess: 'Enabled'
  }
}


output appUrl string = 'https://${appneughostpri.properties.defaultHostName}'
