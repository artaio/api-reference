defmodule DocsWeb.Schemas.RequestBody.ShipmentExceptionCreate do
  alias OpenApiSpex.Schema

  require OpenApiSpex

  OpenApiSpex.schema(%{
    title: "ShipmentExceptionCreate",
    type: :object,
    properties: %{
      shipment_exception: %Schema{
        type: :object,
        properties: %{
          type: %Schema{
            type: :string,
            description:
              "The type ID for this resource. Options are defined in the Shipment Exception Types metadata endpoint. Currently, the only accepted type for client-created shipment exceptions is `requested_hold_to_collect`.",
            example: "requested_hold_to_collect",
            enum: ["requested_hold_to_collect"]
          },
          shipment_id: %Schema{
            type: :string,
            description: "The ID for the shipment associated to the shipment exception"
          },
          hold_until: %Schema{
            type: :string,
            description:
              "Optionally provide a date to hold collection for the shipment. Values should be in the `YYYY-MM-DD` format. Hold until dates must be fewer than 30 days from the shipment's `created_at` datetime."
          }
        },
        required: ["type", "shipment_id"]
      }
    },
    required: ["shipment_exception"],
    example: %{
      shipment_exception: %{
        type: "requested_hold_to_collect",
        shipment_id: "5baff45a-281d-416e-9310-a4a7c637952e",
        hold_until: "2023-08-15"
      }
    }
  })
end
