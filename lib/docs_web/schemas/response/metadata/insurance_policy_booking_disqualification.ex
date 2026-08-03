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
            "Insurance coverage cannot be activated because one or more packages have already been picked up by the carrier. Coverage must be purchased before shipment begins."
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
