defmodule DocsWeb.Schemas.Response.Metadata.ShipmentStatus do
  alias OpenApiSpex.Schema

  require OpenApiSpex

  OpenApiSpex.schema(%{
    title: "MetadataShipmentStatus",
    type: :array,
    items: %Schema{
      type: :object,
      properties: %{
        description: %Schema{
          type: :string,
          description: "A long form description",
          example: "A quote has been booked and is awaiting confirmation by an Arta logistics specialist"
        },
        id: %Schema{
          type: :string,
          description: "The ID representing the resource",
          example: "pending"
        },
        name: %Schema{
          type: :string,
          description: "A brief title for the resource",
          example: "Pending"
        }
      }
    }
  })
end
