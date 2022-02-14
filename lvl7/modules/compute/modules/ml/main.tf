resource "azurerm_application_insights" "ml_insight" {
    name                = "workspace-application_insight"
    location            = var.location
    resource_group_name = var.resource_group_name
    application_type    = "web"
}

resource "azurerm_key_vault" "example" {
    name                     = "workspaceexamplekeyvault"
    location                 = var.location
    resource_group_name      = var.resource_group_name
    tenant_id                = data.azurerm_client_config.current.tenant_id
    sku_name                 = "standard"
    purge_protection_enabled = true
}

resource "azurerm_key_vault_access_policy" "example" {
    key_vault_id = azurerm_key_vault.example.id
    tenant_id    = data.azurerm_client_config.current.tenant_id
    object_id    = data.azurerm_client_config.current.object_id

    key_permissions = [
        "Create",
        "Get",
        "Delete",
        "Purge",
    ]
}

resource "azurerm_key_vault_key" "key_vault" {
    name         = "workspacekeyvaultkey"
    key_vault_id = azurerm_key_vault.example.id
    key_type     = "RSA"
    key_size     = 2048

    key_opts = [
        "decrypt",
        "encrypt",
        "sign",
        "unwrapKey",
        "verify",
        "wrapKey",
    ]

    depends_on = [azurerm_key_vault.example, azurerm_key_vault_access_policy.example]
}

resource "azurerm_storage_account" "ml_sa" {
    name                     = "workspacestorageaccount"
    location                 = var.location
    resource_group_name      = var.resource_group_name
    account_tier             = "Standard"
    account_replication_type = "GRS"
}



resource "azurerm_machine_learning_workspace" "ml_workspace" {
    name                    = "ml_workspace"
    location                = var.location
    resource_group_name     = var.resource_group_name
    application_insights_id = azurerm_application_insights.ml_insight.id
    key_vault_id            = azurerm_key_vault.key_vault.id
    storage_account_id      = azurerm_storage_account.ml_sa.id
    identity {
        type = "SystemAssigned"
    }
}



resource "azurerm_ssh_public_key" "ml" {
    name                = "ml-ssh-public-key"
    resource_group_name = var.resource_group_name
    location            = var.location
    public_key          = file("~/.ssh/id_rsa.pub")
}

resource "azurerm_machine_learning_compute_instance" "example" {
    name                          = "example"
    location                      = var.location
    machine_learning_workspace_id = azurerm_machine_learning_workspace.example.id
    virtual_machine_size          = "STANDARD_DS2_V2"
    ssh {
        public_key = azurerm_ssh_public_key.ml
    }
    subnet_resource_id = var.subnet_id
}