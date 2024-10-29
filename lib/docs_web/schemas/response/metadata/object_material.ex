defmodule DocsWeb.Schemas.Response.Metadata.ObjectMaterial do
  alias OpenApiSpex.Schema

  require OpenApiSpex

  OpenApiSpex.schema(%{
    title: "MetadataObjectMaterial",
    type: :array,
    items: %Schema{
      type: :object,
      properties: %{
        description: %Schema{
          type: :string,
          description: "A long form description of the currency",
          example:
            "a strong, coarse unbleached cloth made from hemp, flax, cotton, or a similar yarn"
        },
        id: %Schema{
          type: :string,
          description: "The ID representing the resource",
          example: "canvas"
        },
        name: %Schema{
          type: :string,
          description: "A brief label for the resource",
          example: "Canvas"
        }
      }
    }
  })
end
