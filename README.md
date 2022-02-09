# Azure-Terraform
Terrafrom to provison Azure Infrastructure

Directory Structure
| Dir   |   Description     |
| :---  |   :---:           |
| lvl1  | Set up a basic VM |
| lvl2  | Set up a Linux VM |
| lvl3  | Set up a VM Scaleset runing Linux |
| lvl4  | Set up a basic WebPage infra <br> (VM, SQL server & db) |
| lvl5  | TBD |
| lvl6  | TBD |


Commands to run the terraform code
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
