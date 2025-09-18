defmodule DocsWeb.Schemas.RequestBody.ShippingProtectionPolicyPurchaseCoverage do
  alias DocsWeb.Schemas.Fields
  alias OpenApiSpex.Schema

  require OpenApiSpex

  OpenApiSpex.schema(%Schema{
    title: "ShippingProtectionPolicyPurchaseCoverage",
    description: "Purchase coverage for a shipping protection policy",
    type: :object,
    properties: %{
      shipping_protection_policy: %Schema{
        type: :object,
        required: ["insurance_policy_id"],
        properties: Fields.purchase_coverage_request_fields()
      }
    },
    required: ["shipping_protection_policy"]
  })
end
