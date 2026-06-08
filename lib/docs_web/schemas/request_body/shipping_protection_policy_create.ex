defmodule DocsWeb.Schemas.RequestBody.ShippingProtectionPolicyCreate do
  alias DocsWeb.Schemas.Fields
  alias OpenApiSpex.Schema

  require OpenApiSpex

  OpenApiSpex.schema(%Schema{
    title: "ShippingProtectionPolicyCreate",
    description: "Create a new shipping protection policy",
    type: :object,
    properties: %{
      shipping_protection_policy: %Schema{
        type: :object,
        required: ["origin", "destination", "packages"],
        properties: Fields.shipping_protection_policy_request_fields()
      }
    },
    required: ["shipping_protection_policy"]
  })
end
