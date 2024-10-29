defmodule DocsWeb.Schemas.Response.Metadata.ApiVersion do
  alias OpenApiSpex.Schema

  require OpenApiSpex

  OpenApiSpex.schema(%{
    title: "MetadataApiVersion",
    type: :array,
    items: %Schema{
      type: :object,
      properties: %{
        description: %Schema{
          type: :string,
          description: "A long form description",
          example: "A key-authenticated API Version released on October 22, 2020."
        },
        authentication: %Schema{
          type: :array,
          description: "The list of authentication schema supported by this API version",
          items: %Schema{
            type: :string,
            example: "api_key"
          }
        },
        id: %Schema{
          type: :string,
          description: "The ID representing the resource",
          example: "2020-10-22"
        },
        status: %Schema{
          type: :string,
          description: "Indicates whether the API version is active, beta, or deprecated",
          example: "active"
        }
      }
    }
  })
end
