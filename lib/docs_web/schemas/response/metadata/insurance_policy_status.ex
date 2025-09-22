defmodule DocsWeb.Schemas.Response.Metadata.InsurancePolicyStatus do
  alias OpenApiSpex.Schema

  require OpenApiSpex

  OpenApiSpex.schema(%{
    title: "MetadataInsurancePolicyStatus",
    type: :array,
    items: %Schema{
      type: :object,
      properties: %{
        id: %Schema{
          type: :string,
          description: "The ID representing the insurance policy status",
          example: "active"
        },
        name: %Schema{
          type: :string,
          description: "A brief title for the status",
          example: "Active"
        },
        description: %Schema{
          type: :string,
          description: "A detailed description of the insurance policy status",
          example: "in transit state"
        }
      }
    }
  })
end
