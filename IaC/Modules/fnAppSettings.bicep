param fnAppName string
param aiKey string
param strgConn string

resource fnappSetting 'Microsoft.Web/sites/config@2021-01-15' = {
  name: '${fnAppName}/appsettings'
  properties: {
    APPINSIGHTS_INSTRUMENTATIONKEY: aiKey
    AzureWebJobsStorage: strgConn
    FUNCTIONS_EXTENSION_VERSION: '~4'
    FUNCTIONS_WORKER_RUNTIME: 'node'
    WEBSITE_NODE_DEFAULT_VERSION: '~16'
    apiKey: '@Microsoft.KeyVault(SecretUri=https://kv-pri-prod.vault.azure.net/secrets/ghostAPIKey/)'
  }
}
