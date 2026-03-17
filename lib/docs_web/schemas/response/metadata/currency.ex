defmodule DocsWeb.Schemas.Response.Metadata.Currency do
  alias OpenApiSpex.Schema

  require OpenApiSpex

  OpenApiSpex.schema(%{
    title: "MetadataCurrency",
    type: :array,
    items: %Schema{
      type: :object,
      properties: %{
        symbol: %Schema{
          type: :string,
          description: "The symbol used to denote that a number is a monetary value in a particular currency",
          example: "$"
        },
        id: %Schema{
          type: :string,
          description: "The ID representing the resource",
          example: "USD"
        },
        name: %Schema{
          type: :string,
          description: "A brief label for the currency",
          example: "US Dollar"
        }
      }
    }
  })
end
