defmodule DocsWeb.Schemas.Response.Metadata.PackageStatus do
  alias OpenApiSpex.Schema

  require OpenApiSpex

  OpenApiSpex.schema(%{
    title: "MetadataPackageStatus",
    type: :array,
    items: %Schema{
      type: :object,
      properties: %{
        description: %Schema{
          type: :string,
          description: "A long form description",
          example: "Item has shipped from originating and is en route to its destination"
        },
        id: %Schema{
          type: :string,
          description: "The ID representing this status",
          example: "transit"
        },
        name: %Schema{
          type: :string,
          description: "A brief title for the resource",
          example: "Transit"
        }
      }
    }
  })
end
