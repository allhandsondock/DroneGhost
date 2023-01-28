
param afdname string
param isPrimary bool


@description('Azure Front door')
resource afdghost 'Microsoft.Cdn/profiles@2022-05-01-preview' = if(isPrimary) {
  name: afdname
  location: 'Global'
  tags: {
  }
  sku: {
    name: 'Standard_AzureFrontDoor'
  }
  properties: {
    originResponseTimeoutSeconds: 60
    extendedProperties: {
    }
  }
}

resource afdendpoint 'Microsoft.Cdn/profiles/afdEndpoints@2022-05-01-preview' = {
  name: afdname
  location: 'Global'
  parent: afdghost
  properties: {
    enabledState: 'Enabled'
  }
  dependsOn: [
    afdghost
  ]
}

output afdfqdn string = afdendpoint.properties.hostName
output afdResourceId string = afdghost.id
