defmodule DocsWeb.Schemas.Response.Metadata.ParcelTransportService do
  alias OpenApiSpex.Schema

  require OpenApiSpex

  OpenApiSpex.schema(%{
    title: "MetadataParcelTransportService",
    type: :array,
    items: %Schema{
      type: :object,
      properties: %{
        description: %Schema{
          type: :string,
          description: "A long form description",
          example:
            "Delivers the following business day once shipped. Available in the contiguous US and Puerto Rico."
        },
        id: %Schema{
          type: :string,
          description: "The ID representing the resource",
          example: "next_day_air"
        },
        name: %Schema{
          type: :string,
          description: "A brief title for the resource",
          example: "Next Day Air"
        }
      }
    }
  })
end
