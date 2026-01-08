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
          description: "A long form description",
          example: "Coverage for shipments handled through Arta's shipping services"
        },
        id: %Schema{
          type: :string,
          description: "The ID representing the resource",
          example: "arta_shipping"
        },
        name: %Schema{
          type: :string,
          description: "A brief title for the resource",
          example: "Arta Shipping"
        }
      }
    }
  })
end
