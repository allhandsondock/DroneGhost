

# Drone Shuttles - Blogging Platform on Ghost

This solution lists the code required to setup a blogging platform powered by Ghost onto Azure. It also has a 'AdminService' which is a serverless function to delete all posts.
The solution is designed with key focus high availability in terms that, it can be deployed to 2 different regions (resource groups) and then connected with an Azure Front Door for load balancing and disaster recovery.


# Pre-requisites

1. Powershell - https://learn.microsoft.com/en-us/powershell/scripting/install/installing-powershell-on-windows?view=powershell-7.3
2. Az module - https://learn.microsoft.com/en-us/powershell/azure/install-az-ps?view=azps-9.3.0
3. Git


# Design
1. The ghost app is hosted in an App Service container. It uses the docker image 'ghost:4-alpine' from docker hub registry
2. The database of ghost is on Azure File share to make it persistent. Since there are 2 App Service in 2 different regions for handling disaster recovery, the db is synced using a Automation Runbook scheduled to run hourly.
3. An Azure front door is used for load balancing and high availability in case one region goes down.
4. Admin service which is hosted on Azure Function, is used to delete all posts, which is hosted in Azure Functions. It references the GhostAdmin API Key from Azure Key Vault for security purposes.

## Usage

1. Clone the repo
2. Open Powershell
3. Switch directory 
	```
	cd <cloned-repo>
	```
4. Connect to your Azure Subscription using Connect-AzAccount. You may use a user account or ServicePrincipal with at least 'Contributor' role on the resource groups where you want to provision resources
5. You would need 2 Resource Groups, one primary which will host the application all times and a secondary resource group which will be replica of primary but for disaster recovery scenario. Below cmd deploys resources in primary region.
	```
	New-AzResourceGroupDeployment -ResourceGroupName <primary-resourcegroup-name> -TemplateParameterFile ".\Parameters\parameters-pri-prod.json" -TemplateFile .\template-deploy.bicep -Mode Incremental
	```
6. Run below to provision to secondary resource group. If you notice any error related to afdName, azFuncApp please ignore, as they are not part of deployment on secondary resource group.
	```
	New-AzResourceGroupDeployment -ResourceGroupName <secondary-resourcegroup-name> -TemplateParameterFile ".\Parameters\parameters-sec-prod.json" -TemplateFile .\template-deploy.bicep -Mode Incremental
	```
7. Once 5 and 6 are successfully completed, navigate to your resource group and look for app services, wapp-pri-ghost-lab and wapp-sec-ghost-lab. Browse to https://wapp-pri-ghost-lab.azurewebsites.net/ and https://wapp-sec-ghost-lab.azurewebsites.net/ to see the ghost app running in different regions.








