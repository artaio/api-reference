defmodule DocsWeb.Schemas.Response.Metadata.RequestStatus do
  alias OpenApiSpex.Schema

  require OpenApiSpex

  OpenApiSpex.schema(%{
    title: "MetadataRequestStatus",
    type: :array,
    items: %Schema{
      type: :object,
      properties: %{
        description: %Schema{
          type: :string,
          description: "A long form description",
          example: "Eligible shipment quotes have been added to the request"
        },
        id: %Schema{
          type: :string,
          description: "The ID representing the resource",
          example: "quoted"
        },
        name: %Schema{
          type: :string,
          description: "A brief title for the resource",
          example: "Quoted"
        }
      }
    }
  })
end
