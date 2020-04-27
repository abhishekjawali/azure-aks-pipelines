# Pipelines to create AKS cluster using terraform and deploy apps to AKS

## Cluster creation

### Setup
#### Step 1: Create Azure service account, which is used to create AKS cluster
```
$ az login
## Note the Azure subscription id after login

$ az ad sp create-for-rbac --role="Contributor" --scopes="/subscriptions/<<azure_subscription_id>>"
## Securely store the output from above command. Note the 'appId' and 'password'
```

appId and password are used in the terraform scripts to AKS cluster creation.
 - client_id is the appId 
 - client_secret is the password.

The above values will be configured as variables in Azure pipelines. 

#### Step 2: Create ssh keys
 - Note the location where the key is generated.
 - Do not provide the passphrase. 
```
$ ssh-keygen -m PEM -t rsa -b 4096
```
 - The generated key will substitute for ssh_public_key in terraform script

Upload the generated key into the secure files of pipeline library. 


#### Step 3: Create service connection in Azure DevOps
Create a new service connection for the Azure DevOps project. 
 - Choose the connection type as 'Azure Resource Manager'
 - Authentication method as 'Service Principal'
 - Leave the Resource group name empty.

#### Step 4: Install the below 2 plugins from marketplace to the Azure organisation
 - [Terraform](https://marketplace.visualstudio.com/items?itemName=ms-devlabs.custom-terraform-tasks)
 - [Terraform build and release tasks](https://marketplace.visualstudio.com/items?itemName=charleszipp.azure-pipelines-tasks-terraform)

Above plugins will enable easier edit of the pipeline files in Azure pipelines.
