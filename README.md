
# Drone Shuttles - Blogging Platform on Ghost

This solution lists the code required to setup a blogging platform powered by Ghost onto Azure. It also has a 'AdminService' which is a serverless function to delete all posts.
The solution is designed with key focus high availability in terms that, it can be deployed to 2 different regions (resource groups) and then connected with an Azure Front Door for load balancing and disaster recovery.


# Pre-requisites

1. Powershell - https://learn.microsoft.com/en-us/powershell/scripting/install/installing-powershell-on-windows?view=powershell-7.3
2. Az module - https://learn.microsoft.com/en-us/powershell/azure/install-az-ps?view=azps-9.3.0
3. Git

## Usage

1. Clone the repo
2. Open Powershell
3. Switch directory 
	```
	cd <cloned-repo>
	```
4. Connect to your Azure Subscription using Connect-AzAccount. You may use a user account or ServicePrincipal with at lease 'Contributor' role on the resource groups where you want to provision resources
5. You would need 2 Resource Groups, one primary which will host the application all times and a secondary resource group which will be replica of primary but for disaster recovery scenario. Below cmd deploys resources in primary region.
	```
	New-AzResourceGroupDeployment -ResourceGroupName <primary-resourcegroup-name> -TemplateParameterFile ".\Parameters\parameters-pri-prod.json" -TemplateFile .\template-deploy.bicep -Mode Incremental
	```
6. Run below to provision to secondary resource group. If you notice any error related to afdName, azFuncApp please ignore, as they are not part of deployment on secondary resource group.
```
	New-AzResourceGroupDeployment -ResourceGroupName <secondary-resourcegroup-name> -TemplateParameterFile ".\Parameters\parameters-sec-prod.json" -TemplateFile .\template-deploy.bicep -Mode Incremental
	```
7. Once 5 and 6 are successfully completed, navigate to your resource group and look for app services, wapp-pri-ghost-lab and wapp-sec-ghost-lab. Browse to https://wapp-pri-ghost-lab.azurewebsites.net/ and https://wapp-sec-ghost-lab.azurewebsites.net/ to see the ghost app running in different regions.


## Switch to another file

All your files and folders are presented as a tree in the file explorer. You can switch from one to another by clicking a file in the tree.

## Rename a file

You can rename the current file by clicking the file name in the navigation bar or by clicking the **Rename** button in the file explorer.

## Delete a file

You can delete the current file by clicking the **Remove** button in the file explorer. The file will be moved into the **Trash** folder and automatically deleted after 7 days of inactivity.

## Export a file

You can export the current file by clicking **Export to disk** in the menu. You can choose to export the file as plain Markdown, as HTML using a Handlebars template or as a PDF.


