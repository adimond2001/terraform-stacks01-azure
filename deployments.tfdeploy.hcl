identity_token "azurerm" {
  audience = ["api://AzureADTokenExchange"]
}

deployment "dev" {
  inputs = {
    location    = "uksouth"
    name_suffix = "dev"

    identity_token  = identity_token.azurerm.jwt
    client_id       = "09d7c511-4378-42f7-85d0-1994a1bde869"
    subscription_id = "03f3b267-28f2-4d43-aa90-29bec475f445"
    tenant_id       = "b25b83c2-7aa4-4d52-b0c9-fc813c289693"
  }
}

deployment "prod" {
  inputs = {
    location    = "uksouth"
    name_suffix = "prod"

    identity_token  = identity_token.azurerm.jwt
    client_id       = "09d7c511-4378-42f7-85d0-1994a1bde869"
    subscription_id = "c341a77c-49cb-4fb1-ad58-9b9187633433"
    tenant_id       = "b25b83c2-7aa4-4d52-b0c9-fc813c289693"
  }
}

deployment "test" {
  inputs = {
    location    = "uksouth"
    name_suffix = "test"

    identity_token  = identity_token.azurerm.jwt
    client_id       = "09d7c511-4378-42f7-85d0-1994a1bde869"
    subscription_id = "cc3b4038-d458-4889-8e97-3e7fa8ad5e64"
    tenant_id       = "b25b83c2-7aa4-4d52-b0c9-fc813c289693"
  }
}

orchestrate "auto_approve" "applyable" {
  check {
    condition = context.plan.applyable
    reason    = "Changes are not applyable"
  }
}

