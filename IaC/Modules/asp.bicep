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


output resourceId string = hostingPlan.id
