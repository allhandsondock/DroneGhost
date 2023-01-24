param location string
param fnManagedIdentityId  string



resource kvproddrone 'Microsoft.KeyVault/vaults@2022-07-01' = {
  name: 'kv-pri-prod'
  location: location
  
  properties: {
    sku: {
      family: 'A'
      name: 'standard'
    }
    accessPolicies: [
      {
        objectId: fnManagedIdentityId
        tenantId: subscription().tenantId
        permissions: {
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
    tenantId: subscription().tenantId
  }
}


// resource keyVaultAccessPolicy 'Microsoft.KeyVault/vaults/accessPolicies@2021-10-01' = {
//   name: 'kv-prod/add'
//   properties: {
   
//   }
//   dependsOn:[
//     kvproddrone
//   ]
// }
