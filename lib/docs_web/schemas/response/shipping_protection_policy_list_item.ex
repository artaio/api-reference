defmodule DocsWeb.Schemas.Response.ShippingProtectionPolicyListItem do
  @moduledoc """
  Schema for Shipping Protection Policy items in list responses.
  """
  alias DocsWeb.Schemas.Fields
  alias OpenApiSpex.Schema

  require OpenApiSpex

  OpenApiSpex.schema(%{
    title: "ShippingProtectionPolicyListItem",
    description: "A shipping protection policy item as returned in list responses.",
    type: :object,
    properties: %{
      id: %Schema{
        type: "string",
        format: :uuid,
        example: "4da6d140-d33b-43c4-abe1-b04389fe6782",
        description: "The id of the shipping protection policy in UUID format"
      },
      shortcode: %Schema{
        type: "string",
        description: "Human-readable unique identifier code containing `ORG-SP` prefix for tracking this policy",
        example: "ORG-SPABCDEFG"
      },
      created_at: %Schema{
        type: "string",
        format: "date-time",
        example: "2024-08-13T22:44:39.593704",
        description:
          "A NaiveDatetime-formatted timestamp describing when the policy was created with microsecond precision"
      },
      shipment_id: %Schema{
        type: "string",
        format: :uuid,
        description: "UUID of the associated shipment, or null if no shipment is associated.",
        example: "37b972c1-deb7-43f8-8ccc-9138a35278f0",
        nullable: true
      },
      insurance_policy: %Schema{
        type: "object",
        description: "Calculated coverage and premium with status.",
        properties: Fields.insurance_policy_response_fields()
      },
      tags: %Schema{
        type: "array",
        description: "A list of tags associated with this policy",
        items: DocsWeb.Schemas.Response.Tag
      }
    },
    example: %{
      "id" => "abb504fc-2518-4586-8589-96e0591ce6ea",
      "shortcode" => "ARTA-SP9GRA9XN",
      "created_at" => "2025-10-14T17:18:17.027926",
      "shipment_id" => "37b972c1-deb7-43f8-8ccc-9138a35278f0",
      "insurance_policy" => %{
        "created_by" => nil,
        "status" => "confirmed",
        "status_changed_at" => "2025-10-14T17:21:56.521730",
        "coverage_type" => "client_shipping",
        "insured_value" => "1000.00",
        "insured_value_currency" => "USD",
        "insurance_cost" => "17.50",
        "insurance_cost_currency" => "USD",
        "disqualifications" => []
      },
      "tags" => [
        %{
          "color" => "ffffff",
          "created_at" => "2025-07-30T10:09:31.897922",
          "created_by" => 381,
          "description" => "premium",
          "id" => "710e3c48-d83a-4337-b055-394884cfcfba",
          "is_active" => true,
          "name" => "premium",
          "updated_at" => "2025-07-30T10:09:31.897922",
          "updated_by" => nil
        }
      ]
    }
  })
end
