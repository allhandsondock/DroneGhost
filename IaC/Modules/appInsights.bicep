param appInsightName string
param location string
param environmenttag string



@description('App insight for app service')
resource appInsight 'Microsoft.Insights/components@2020-02-02' = {
  name: appInsightName
  location: location
  tags: {
    Environment: environmenttag
  }
  kind: 'web'
  properties: {
    Application_Type: 'web'
    Flow_Type: 'Redfield'
  }
}


output key string = appInsight.properties.InstrumentationKey
output connString string = appInsight.properties.ConnectionString


