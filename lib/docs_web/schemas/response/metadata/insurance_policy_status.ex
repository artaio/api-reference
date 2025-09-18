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
          description: "A detailed description of the insurance policy status",
          example: "in transit state"
        },
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
        sequence: %Schema{
          type: [:integer, :null],
          description:
            "The order sequence number for status flow. Null for non-sequential statuses",
          example: 3,
          nullable: true
        },
        terminal: %Schema{
          type: :boolean,
          description: "Whether this is a final/terminal state that cannot be changed",
          example: false
        }
      }
    }
  })
end
