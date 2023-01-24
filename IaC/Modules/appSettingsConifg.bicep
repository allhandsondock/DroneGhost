param appName string
param storageAccountName string
param shareName string
param mountPath string
param storageAccountid string
param storageAccountapiVersion string
param aiConnectionString string
param aiKey string


resource storageSetting 'Microsoft.Web/sites/config@2021-01-15' = {
  name: '${appName}/azurestorageaccounts'
  properties: {
    '${shareName}': {
      type: 'AzureFiles'
      shareName: shareName
      mountPath: mountPath
      accountName: storageAccountName
      accessKey: listKeys(storageAccountid, storageAccountapiVersion).keys[0].value
    }
    APPINSIGHTS_INSTRUMENTATIONKEY: aiKey
    APPLICATIONINSIGHTS_CONNECTION_STRING: aiConnectionString

  }
}
