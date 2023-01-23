
@description('Generated from /subscriptions/5c4e7163-0d61-480b-ba50-5e899d45fb46/resourceGroups/rg-neu-ghost-primary/providers/Microsoft.Web/sites/app-neu-ghost-pri')
resource appneughostpri 'Microsoft.Web/sites@2022-03-01' = {
  name: 'app-neu-ghost-pri'
  kind: 'app,linux,container'
  location: 'North Europe'
  tags: {
  }
  properties: {
    name: 'app-neu-ghost-pri'
    webSpace: 'rg-neu-ghost-primary-NorthEuropewebspace-Linux'
    selfLink: 'https://waws-prod-db3-271.api.azurewebsites.windows.net:454/subscriptions/5c4e7163-0d61-480b-ba50-5e899d45fb46/webspaces/rg-neu-ghost-primary-NorthEuropewebspace-Linux/sites/app-neu-ghost-pri'
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
    hostNameSslStates: [
      {
        name: 'app-neu-ghost-pri.azurewebsites.net'
        sslState: 'Disabled'
        ipBasedSslState: 'NotConfigured'
        hostType: 'Standard'
      }
      {
        name: 'app-neu-ghost-pri.scm.azurewebsites.net'
        sslState: 'Disabled'
        ipBasedSslState: 'NotConfigured'
        hostType: 'Repository'
      }
    ]
    serverFarmId: '/subscriptions/5c4e7163-0d61-480b-ba50-5e899d45fb46/resourceGroups/rg-neu-ghost-primary/providers/Microsoft.Web/serverfarms/ASP-rgneughostprimary-bb44'
    reserved: true
    isXenon: false
    hyperV: false
    storageRecoveryDefaultState: 'Running'
    contentAvailabilityState: 'Normal'
    runtimeAvailabilityState: 'Normal'
    dnsConfiguration: {
    }
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
    deploymentId: 'app-neu-ghost-pri'
    sku: 'Standard'
    scmSiteAlsoStopped: false
    clientAffinityEnabled: false
    clientCertEnabled: false
    clientCertMode: 'Required'
    hostNamesDisabled: false
    customDomainVerificationId: 'FDA1A6C3F9B7DC81C9168B595051E60D3D8E77F97903DA86A19434C2328625DB'
    kind: 'app,linux,container'
    inboundIpAddress: '20.107.224.25'
    possibleInboundIpAddresses: '20.107.224.25'
    ftpUsername: 'app-neu-ghost-pri\\$app-neu-ghost-pri'
    ftpsHostName: 'ftps://waws-prod-db3-271.ftp.azurewebsites.windows.net/site/wwwroot'
    containerSize: 0
    dailyMemoryTimeQuota: 0
    siteDisabledReason: 0
    homeStamp: 'waws-prod-db3-271'
    tags: {
    }
    httpsOnly: true
    redundancyMode: 'None'
    privateEndpointConnections: []
    publicNetworkAccess: 'Enabled'
    eligibleLogCategories: 'AppServiceAppLogs,AppServiceAuditLogs,AppServiceConsoleLogs,AppServiceHTTPLogs,AppServiceIPSecAuditLogs,AppServicePlatformLogs,ScanLogs'
    storageAccountRequired: false
    keyVaultReferenceIdentity: 'SystemAssigned'
    defaultHostNameScope: 'Global'
  }
}
