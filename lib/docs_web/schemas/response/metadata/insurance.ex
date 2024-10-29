defmodule DocsWeb.Schemas.Response.Metadata.Insurance do
  alias OpenApiSpex.Schema

  require OpenApiSpex

  OpenApiSpex.schema(%{
    title: "MetadataInsurance",
    type: :array,
    items: %Schema{
      type: :object,
      properties: %{
        description: %Schema{
          type: :string,
          description: "A long form description",
          example: "Arta full risk coverage transit insurance."
        },
        id: %Schema{
          type: :string,
          description: "The ID representing the resource",
          example: "arta_transit_insurance"
        },
        name: %Schema{
          type: :string,
          description: "A brief title for the resource",
          example: "Arta Full Risk"
        }
      }
    }
  })
end
