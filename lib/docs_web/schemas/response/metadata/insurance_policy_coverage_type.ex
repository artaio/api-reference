defmodule DocsWeb.Schemas.Response.Metadata.InsurancePolicyCoverageType do
  alias OpenApiSpex.Schema

  require OpenApiSpex

  OpenApiSpex.schema(%{
    title: "MetadataInsurancePolicyCoverageType",
    type: :array,
    items: %Schema{
      type: :object,
      properties: %{
        description: %Schema{
          type: :string,
          description: "A detailed description of the insurance policy coverage type",
          example: "Coverage for shipments handled through Arta's shipping services"
        },
        id: %Schema{
          type: :string,
          description: "The ID representing the insurance policy coverage type",
          example: "arta_shipping"
        },
        name: %Schema{
          type: :string,
          description: "A brief title for the coverage type",
          example: "Arta Shipping"
        }
      }
    }
  })
end
