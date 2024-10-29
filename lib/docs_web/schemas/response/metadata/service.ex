defmodule DocsWeb.Schemas.Response.Metadata.Service do
  alias OpenApiSpex.Schema

  require OpenApiSpex

  OpenApiSpex.schema(%{
    title: "MetadataService",
    type: :array,
    items: %Schema{
      type: :object,
      properties: %{
        description: %Schema{
          type: :string,
          description: "A long form description",
          example: "All handling for items at location and in transit."
        },
        id: %Schema{
          type: :string,
          description: "The ID representing the resource",
          example: "handling"
        },
        name: %Schema{
          type: :string,
          description: "A brief title for the resource",
          example: "Handling Services"
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
                example: "All installation services."
              },
              id: %Schema{
                type: :string,
                description: "The ID representing the resource",
                example: "installation"
              },
              name: %Schema{
                type: :string,
                description: "A brief title for the resource",
                example: "Installation"
              },
              sub_subtypes: %Schema{
                type: :array,
                description: "The subtypes for this resource",
                items: %Schema{
                  type: :object,
                  description: "An object subtype",
                  properties: %{
                    description: %Schema{
                      type: :string,
                      description: "A long form description",
                      example: "Object assembly at the destination"
                    },
                    id: %Schema{
                      type: :string,
                      description: "The ID representing the resource",
                      example: "assembly"
                    },
                    is_requestable: %Schema{
                      type: :boolean,
                      description: "Whether this service is requestable by the client",
                      example: true
                    },
                    name: %Schema{
                      type: :string,
                      description: "A brief title for the resource",
                      example: "Assembly"
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
  })
end
