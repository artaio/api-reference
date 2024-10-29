defmodule DocsWeb.Schemas.Response.Metadata.Object do
  alias OpenApiSpex.Schema

  require OpenApiSpex

  OpenApiSpex.schema(%{
    title: "MetadataObject",
    type: :array,
    items: %Schema{
      type: :object,
      properties: %{
        description: %Schema{
          type: :string,
          description: "A long form description",
          example: "Works of art various media including paintings, sculpture, or works on paper."
        },
        id: %Schema{
          type: :string,
          description: "The ID representing the resource",
          example: "art"
        },
        name: %Schema{
          type: :string,
          description: "A brief title for the resource",
          example: "Works of art"
        },
        subtypes: %Schema{
          type: :array,
          description: "The subtypes for this resource",
          items: %Schema{
            type: :object,
            description: "An object subtype",
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
        }
      }
    }
  })
end
