defmodule DocsWeb.Schemas.Response.Metadata.Quote do
  alias OpenApiSpex.Schema

  require OpenApiSpex

  OpenApiSpex.schema(%{
    title: "MetadataQuote",
    type: :array,
    items: %Schema{
      type: :object,
      properties: %{
        description: %Schema{
          type: :string,
          description: "A long form description",
          example: "Specialized climate-controlled transportation operated by trained technicians from wall-to-wall"
        },
        id: %Schema{
          type: :string,
          description: "The ID representing the resource",
          example: "premium"
        },
        name: %Schema{
          type: :string,
          description: "A brief title for the resource",
          example: "Arta Premium"
        }
      }
    }
  })
end
