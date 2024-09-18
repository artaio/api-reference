defmodule DocsWeb.Schemas.MinimalLocation do
  alias OpenApiSpex.Schema
  require OpenApiSpex

  def schema(),
    do: %Schema{
      type: :object,
      title: "MinimalLocation",
      description: "A minimal representation of the destination address for the shipment",
      properties: %{
        city: %Schema{
          type: :string,
          description: "The destination address city",
          example: "Los Angeles",
          nullable: true
        },
        country: %Schema{
          type: :string,
          description: "The destination address country in 2-digit ISO 3166-1 alpha-2 format",
          example: "US"
        },
        postal_code: %Schema{
          type: :string,
          description: "The destination address postal code",
          example: "90024",
          nullable: true
        },
        region: %Schema{
          type: :string,
          description: "The destination address region",
          example: "CA",
          nullable: true
        }
      }
    }
end
