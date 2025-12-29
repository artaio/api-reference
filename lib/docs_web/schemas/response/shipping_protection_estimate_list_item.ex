defmodule DocsWeb.Schemas.Response.ShippingProtectionEstimateListItem do
  @moduledoc """
  Schema for Shipping Protection Estimate items in list responses.

  This is a lighter version of ShippingProtectionEstimate that excludes the `objects`
  field for performance reasons. The full object details are only returned when
  fetching a single estimate by ID.
  """
  alias DocsWeb.Schemas.Fields
  alias OpenApiSpex.Schema

  require OpenApiSpex

  OpenApiSpex.schema(%{
    title: "ShippingProtectionEstimateListItem",
    description: "A shipping protection estimate item as returned in list responses.",
    type: :object,
    properties: %{
      id: %Schema{
        type: "string",
        format: :uuid,
        example: "4da6d140-d33b-43c4-abe1-b04389fe6782",
        description: "The id of the shipping protection estimate in UUID format"
      },
      shortcode: %Schema{
        type: "string",
        description:
          "Human-readable unique identifier code containing `ORG-EST` prefix for tracking this estimate",
        example: "ORG-ESTABCDEFG"
      },
      created_at: %Schema{
        type: "string",
        format: "date-time",
        example: "2024-08-13T22:44:39.593704",
        description:
          "A NaiveDatetime-formatted timestamp describing when the estimate was created with microsecond precision"
      },
      insurance_policy: %Schema{
        type: "object",
        description: "Calculated coverage and premium.",
        properties: Fields.insurance_policy_fields()
      },
      tags: %Schema{
        type: "array",
        description: "A list of tags associated with this estimate",
        items: DocsWeb.Schemas.Response.Tag
      }
    },
    example: %{
      "id" => "ca68a18d-ae32-4beb-b258-a7d95c8129c1",
      "shortcode" => "DARKO-ESTLVESBPK",
      "created_at" => "2025-12-29T14:15:40.208426",
      "insurance_policy" => %{
        "coverage_type" => "client_shipping",
        "insurance_cost" => "64.54",
        "insurance_cost_currency" => "USD",
        "insured_value" => "3688.17",
        "insured_value_currency" => "USD"
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
