defmodule DocsWeb.Schemas.Response.Metadata.TestModeTransformationType do
  alias OpenApiSpex.Schema

  require OpenApiSpex

  OpenApiSpex.schema(%{
    title: "MetadataTestModeTransformationType",
    type: :array,
    items: %Schema{
      type: :object,
      properties: %{
        description: %Schema{
          type: :string,
          description: "A description of what this transformation type does",
          example: "Confirms a shipment"
        },
        id: %Schema{
          type: :string,
          description: "The ID representing the transformation type",
          example: "confirm"
        },
        name: %Schema{
          type: :string,
          description: "A brief title for the transformation type",
          example: "Confirm"
        }
      }
    }
  })
end
