defmodule DocsWeb.Schemas.Response.Metadata.Packing do
  alias OpenApiSpex.Schema

  require OpenApiSpex

  OpenApiSpex.schema(%{
    title: "MetadataPacking",
    type: :array,
    items: %Schema{
      type: :object,
      properties: %{
        description: %Schema{
          type: :string,
          description: "A long form description",
          example: "Object is packed in plastic or bubble only"
        },
        id: %Schema{
          type: :string,
          description: "The ID representing the resource",
          example: "soft_wrap"
        },
        name: %Schema{
          type: :string,
          description: "A brief title for the resource",
          example: "Soft Wrap"
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
                example: "Wraped in dartek film."
              },
              id: %Schema{
                type: :string,
                description: "The ID representing the resource",
                example: "dartek_only"
              },
              name: %Schema{
                type: :string,
                description: "A brief title for the resource",
                example: "Dartek only"
              }
            }
          }
        }
      }
    }
  })
end
