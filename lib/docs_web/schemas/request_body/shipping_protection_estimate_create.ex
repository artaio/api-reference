defmodule DocsWeb.Schemas.RequestBody.ShippingProtectionEstimateCreate do
  alias DocsWeb.Schemas.Fields
  alias OpenApiSpex.Schema

  require OpenApiSpex

  OpenApiSpex.schema(%Schema{
    title: "ShippingProtectionEstimateCreate",
    description: "Create a new shipping protection estimate",
    type: :object,
    properties: %{
      shipping_protection_estimate: %Schema{
        type: :object,
        required: ["objects"],
        properties: Fields.shipping_protection_estimate_request_fields()
      }
    },
    required: ["shipping_protection_estimate"]
  })
end
