defmodule DocsWeb.Schemas.Response.Metadata.InsurancePolicyBookingDisqualification do
  alias OpenApiSpex.Schema

  require OpenApiSpex

  OpenApiSpex.schema(%{
    title: "MetadataInsurancePolicyBookingDisqualification",
    type: :array,
    items: %Schema{
      type: :object,
      properties: %{
        description: %Schema{
          type: :string,
          description: "A long form description",
          example:
            "Insurance coverage cannot be activated because the package is already in transit."
        },
        id: %Schema{
          type: :string,
          description: "The ID representing the resource",
          example: "package_in_transit"
        },
        name: %Schema{
          type: :string,
          description: "A brief title for the resource",
          example: "Package in transit"
        }
      }
    }
  })
end
