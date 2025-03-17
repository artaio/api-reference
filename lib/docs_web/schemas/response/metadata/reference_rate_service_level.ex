defmodule DocsWeb.Schemas.Response.Metadata.ReferenceRateServiceLevel do
  alias OpenApiSpex.Schema

  require OpenApiSpex

  OpenApiSpex.schema(%{
    title: "MetadataReferenceRateServiceLevel",
    type: :array,
    items: %Schema{
      type: :object,
      properties: %{
        id: %Schema{
          type: :string,
          description: "The ID representing the service level",
          example: "ups_2nd_day_air"
        },
        name: %Schema{
          type: :string,
          description: "A brief label for the service level",
          example: "UPS 2nd Day Air"
        }
      }
    },
    example: [
      %{
        "id" => "arta",
        "name" => "Arta"
      },
      %{
        "id" => "dhl_express_worldwide",
        "name" => "DHL Express"
      },
      %{
        "id" => "fedex_2_day",
        "name" => "FedEx Priority"
      },
      %{
        "id" => "fedex_ground",
        "name" => "FedEx Ground"
      },
      %{
        "id" => "ups_ground",
        "name" => "UPS Ground"
      }
    ]
  })
end
