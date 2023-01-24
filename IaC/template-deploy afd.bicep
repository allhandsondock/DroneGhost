


@description('Azure Front door')
resource afdghost 'Microsoft.Cdn/profiles@2022-05-01-preview' = {
  name: 'afd-droneapp'
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
