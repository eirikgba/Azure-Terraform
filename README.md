# Azure-Terraform
Terrafrom to provison Azure Infrastructure

Directory Structure
| Dir   |   Description     |
| :---  |   :---:           |
| lvl1  | Set up a basic VM |
| lvl2  | Set up a Linux VM |
| lvl3  | Set up a VM Scaleset runing Linux |
| lvl4  | Set up a basic WebPage infra <br> (VM, SQL server & db) |
| lvl5  | Impoved WebPage <br> (AppService, SQL server & db, cache) |
| lvl6  | TBD |


### Commands to Authenticate to Azure via a Microsoft Account

```
terraform -version
az login
az account show
                    #Swap the <text in brackets>
az account list --query "[?user.name=='<microsoft_account_email>'].{Name:name, ID:id, Default:isDefault}" --output Table
az account set --subscription "<subscription_id_or_subscription_name>"
```
All the info on how to set up is in [Micorsoft docs](https://docs.microsoft.com/en-us/azure/developer/terraform/get-started-windows-powershell?tabs=bash) describing how to install terraform on windows with azure PowerShell



### Commands to run the terraform code
```
terraform init
terraform fmt                   //fomat the code in the dir for best readability and consistancy
terrafomr validate
terraform plan                  //Shows what the code will do
 terraform graph                //show the dependecies
terraform aplly                 //Run the Code
terraform output
terraform show                  //the current state 
terraform state list
```
