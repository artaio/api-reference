defmodule DocsWeb.Schemas.Response.Metadata.ObjectComponent do
  alias OpenApiSpex.Schema

  require OpenApiSpex

  OpenApiSpex.schema(%{
    title: "MetadataObjectComponent",
    type: :array,
    items: %Schema{
      type: :object,
      properties: %{
        description: %Schema{
          type: :string,
          description: "A long form description",
          example: "A painting that is framed behind a glass face."
        },
        id: %Schema{
          type: :string,
          description: "The ID representing the resource",
          example: "painting_framed_glass"
        },
        name: %Schema{
          type: :string,
          description: "A brief title for the resource",
          example: "Painting (framed with glass)"
        }
      }
    }
  })
end
