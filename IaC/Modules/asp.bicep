param aspName string
param location string
param environmenttag string
param aspSKU string


@description('App Service Plan')
resource hostingPlan 'Microsoft.Web/serverfarms@2022-03-01' = {
  name: aspName
  kind: 'linux'
  location: location
  tags: {
    Environment: environmenttag
  }
  properties: {
    name: aspName
    workerSize: 'Default'
    currentWorkerSize: 'Default'
    currentNumberOfWorkers: 1
    planName: 'VirtualDedicatedPlan'
    computeMode: 'Dedicated'
    perSiteScaling: false
    elasticScaleEnabled: false
    maximumElasticWorkerCount: 4
    targetWorkerCount: 1
    isSpot: false
    kind: 'linux'
    reserved: true
  }
  sku: {
    name: aspSKU
    tier: 'Standard'
    size: aspSKU
    family: 'S'
    capacity: 1
  }
}



resource azFuncAsp 'Microsoft.Web/serverfarms@2022-03-01' = {
  name: 'asp-consumption'
  kind: 'functionapp'
  location: location
  properties: {
    planName: 'VirtualDedicatedPlan'
    kind: 'functionapp'
    reserved: false
    isXenon: false
    hyperV: false
    mdmId: 'waws-prod-blu-357_28628'
    targetWorkerCount: 0
    targetWorkerSizeId: 0
    zoneRedundant: false
  }
  sku: {
    name: 'Y1'
    tier: 'Dynamic'
    size: 'Y1'
    family: 'Y'
    capacity: 0
  }
}

output resourceId string = hostingPlan.id
output aspConsumptionId string = azFuncAsp.id
