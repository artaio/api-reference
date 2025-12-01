defmodule DocsWeb.Schemas.Response.Metadata.InsurancePolicyStatus do
  alias OpenApiSpex.Schema

  require OpenApiSpex

  OpenApiSpex.schema(%{
    title: "MetadataInsurancePolicyStatus",
    type: :array,
    items: %Schema{
      type: :object,
      properties: %{
        description: %Schema{
          type: :string,
          description: "A long form description",
          example: "The insurance policy is currently active and providing coverage."
        },
        id: %Schema{
          type: :string,
          description: "The ID representing the resource",
          example: "active"
        },
        name: %Schema{
          type: :string,
          description: "A brief title for the resource",
          example: "Active"
        }
      }
    }
  })
end
