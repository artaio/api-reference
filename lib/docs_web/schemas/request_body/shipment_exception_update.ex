defmodule DocsWeb.Schemas.RequestBody.ShipmentExceptionUpdate do
  alias OpenApiSpex.Schema

  require OpenApiSpex

  OpenApiSpex.schema(%{
    title: "ShipmentExceptionUpdate",
    type: :object,
    properties: %{
      shipment_exception: %Schema{
        type: :object,
        properties: %{
          hold_until: %Schema{
            type: :string,
            description:
              "Optionally provide a date to hold collection for the shipment. Values should be in the `YYYY-MM-DD` format. Hold until dates must be fewer than 30 days from the shipment's `created_at` datetime."
          },
          status: %Schema{
            type: :string,
            description: "The current status for this exception",
            example: "resolved"
          }
        }
      }
    },
    required: ["shipment_exception"],
    example: %{
      shipment_exception: %{
        hold_until: "2023-08-15",
        status: "resolved"
      }
    }
  })
end
