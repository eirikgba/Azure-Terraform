resource "azurerm_cosmosdb_account" "compute_db" {
    name                = "eirikgba-cosmos-db-${random_integer.ri.result}"
    location            = azurerm_resource_group.rg.location
    resource_group_name = azurerm_resource_group.rg.name
    offer_type          = "Standard"
    kind                = "MongoDB"

    enable_automatic_failover = true

    capabilities {
        name = "EnableAggregationPipeline"
    }

    capabilities {
        name = "mongoEnableDocLevelTTL"
    }

    capabilities {
        name = "MongoDBv3.4"
    }

    capabilities {
        name = "EnableMongo"
    }

    consistency_policy {
        consistency_level       = "BoundedStaleness"
        max_interval_in_seconds = 300
        max_staleness_prefix    = 100000
    }

    geo_location {
        location          = var.failover_location
        failover_priority = 1
    }

    geo_location {
        location          = azurerm_resource_group.rg.location
        failover_priority = 0
    }
}

resource "azurerm_cosmosdb_mongo_database" "example" {
    name                = "tfex-cosmos-mongo-db"
    resource_group_name = var.compute_resource_group_name
    account_name        = azurerm_cosmosdb_account.compute_db.name
    throughput          = 400
}