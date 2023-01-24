param location string
param environment string

// App Service Plan 
param aspName string

param aspSKU string

// Storage 
param storageAccountName string
param shareName string
param mountPath string
param strgSKU string

// App Service
param appName string


// App Insight
param appInsightName string

module hostingPlanModule 'Modules/asp.bicep'= {
  name: aspName
  params:{
    location: location
    environmenttag: environment
    aspSKU: aspSKU
    aspName: aspName
  }
}

module storageModule 'Modules/storage.bicep' = {
  name: storageAccountName
  params:{
    storageAccountName: storageAccountName
    strgSKU: strgSKU
    location: location
    environmenttag: environment
    shareName: shareName
  }
}

module appInsightsModule 'Modules/appInsights.bicep' = {
  name: appInsightName
  params:{
    location: location
    environmenttag: environment
    appInsightName: appInsightName
  }
}

module appService 'Modules/appService.bicep' = {
  name: appName
  params:{
    appName: appName
    location: location
    environmenttag: environment
    severFarmId: hostingPlanModule.outputs.resourceId
  }
  dependsOn:[
    hostingPlanModule
  ]
}

module appSettingsModule 'Modules/appSettingsConifg.bicep' = {
  name: 'appSettings'
  params: {
    appName: appName
    storageAccountName: storageAccountName
    shareName: shareName
    mountPath: mountPath
    storageAccountapiVersion: storageModule.outputs.apiVersion
    storageAccountid: storageModule.outputs.strgAccId
    aiConnectionString: appInsightsModule.outputs.connString
    aiKey: appInsightsModule.outputs.key

  }
  dependsOn:[
    storageModule
    appInsightsModule
    appService
  ]
}

module afd 'Modules/afd.bicep' = {
  name: 'afdapp'
  params:{
    afdname: 'afd-drone'
  }
}

module autoscale 'Modules/autoscale.bicep' = {
  name: 'appautoscale'
  params:{
    location: location
    afdFQDN: afd.outputs.afdfqdn
    afdResourceUri: afd.outputs.afdResourceId
    serverFarmUri: hostingPlanModule.outputs.resourceId
  }
  dependsOn: [
    hostingPlanModule
    afd
  ]
}


