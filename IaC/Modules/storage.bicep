param strgSKU string
param storageAccountName string
param location string
param environmenttag string
param shareName string


@description('Storage account')
resource strgneughostpri 'Microsoft.Storage/storageAccounts@2022-05-01' = {
  sku: {
    name: strgSKU //'Standard_RAGZRS'
  }
  kind: 'StorageV2'
  name: storageAccountName
  location: location
  tags: {
    Environment: environmenttag
  }
  properties: {
    dnsEndpointType: 'Standard'
    defaultToOAuthAuthentication: false
    publicNetworkAccess: 'Enabled'
    allowCrossTenantReplication: true
    minimumTlsVersion: 'TLS1_2'
    allowBlobPublicAccess: true
    allowSharedKeyAccess: true
    supportsHttpsTrafficOnly: true
    accessTier: 'Hot'
  }
}


resource fileShare 'Microsoft.Storage/storageAccounts/fileServices@2022-05-01' = {
  name: 'default'
  parent: strgneughostpri
  properties: {
  
  }
  dependsOn:[
    strgneughostpri
  ]
}

resource fileStorage 'Microsoft.Storage/storageAccounts/fileServices/shares@2022-05-01' = {
  name: shareName
  parent: fileShare
  properties: {
    accessTier: 'TransactionOptimized'
    enabledProtocols: 'SMB'
    metadata: {}
    shareQuota: 1

  }
}

output apiVersion string = strgneughostpri.apiVersion
output strgAccId string = strgneughostpri.id

