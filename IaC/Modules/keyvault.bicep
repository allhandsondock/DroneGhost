param location string
param fnManagedIdentityId  string
param tenantId string


resource kvproddrone 'Microsoft.KeyVault/vaults@2022-07-01' = {
  name: 'kv-prod-drone'
  location: location
  tags: {
  }
  properties: {
    sku: {
      family: 'A'
      name: 'standard'
    }
    
    accessPolicies: [
      
      {
        tenantId: tenantId
        objectId: fnManagedIdentityId
        permissions: {
          certificates: []
          keys: []
          secrets: [
            'Get'
            'List'
            'Set'
            'Delete'
            'Recover'
            'Backup'
            'Restore'
          ]
        }
      }
    ]
    enabledForDeployment: false
    enabledForDiskEncryption: false
    enabledForTemplateDeployment: false
    enableSoftDelete: true
    softDeleteRetentionInDays: 90
    enableRbacAuthorization: false
    provisioningState: 'Succeeded'
    publicNetworkAccess: 'Enabled'
  }
}
