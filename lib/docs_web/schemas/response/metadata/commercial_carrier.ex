defmodule DocsWeb.Schemas.Response.Metadata.CommercialCarrier do
  alias OpenApiSpex.Schema

  require OpenApiSpex

  OpenApiSpex.schema(%{
    title: "MetadataCommercialCarrier",
    type: :array,
    items: %Schema{
      type: :object,
      properties: %{
        id: %Schema{
          type: :string,
          description: "The ID representing the carrier",
          example: "dhl_express"
        },
        name: %Schema{
          type: :string,
          description: "A brief label for the carrier",
          example: "DHL Express"
        }
      }
    },
    example: [
      %{
        "id" => "dhl_express",
        "name" => "DHL Express"
      },
      %{
        "id" => "fedex",
        "name" => "FedEx"
      },
      %{
        "id" => "ups",
        "name" => "UPS"
      },
      %{
        "id" => "usps",
        "name" => "USPS"
      }
    ]
  })
end
