param location string
param afdFQDN string
param afdResourceUri string
param serverFarmUri string

resource autoscalesettings 'Microsoft.Insights/autoscalesettings@2022-10-01' = {
  name:'ghostautoscale'
  location:location
  
  properties: {
    enabled: true
    name: 'ghostautoscale'

    profiles: [
      {
        capacity: {
          default: '1'
          maximum: '10'
          minimum: '1'
        }
        name: 'ghostautoscale'
        rules: [
          {
            metricTrigger: {
              dimensions: [
                {
                  DimensionName: 'Endpoint'
                  Operator: 'Equals'
                  Values: [
                    afdFQDN 
                  ]
                }
              ]
              dividePerInstance: false
              metricName: 'OriginRequestCount'
              metricNamespace: 'microsoft.cdn/profiles'
              metricResourceUri: afdResourceUri
              operator: 'GreaterThan'
              statistic: 'Sum'
              threshold: 50
              timeAggregation: 'Average'
              timeGrain: 'PT1M'
              timeWindow: 'PT2M'
              
            }
            scaleAction: {
              cooldown: 'PT5M'
              direction: 'Increase'
              type: 'ChangeCount'
              value: '1'
            }
          }
        ]
      }
    ]
   // targetResourceLocation: 'string'
    targetResourceUri: serverFarmUri
}

}
