defmodule DocsWeb.Schemas.Response.Metadata.PaymentProcessType do
  alias OpenApiSpex.Schema

  require OpenApiSpex

  OpenApiSpex.schema(%{
    title: "MetadataPaymentProcessType",
    type: :array,
    items: %Schema{
      type: :object,
      properties: %{
        description: %Schema{
          type: :string,
          description: "A long form description",
          example: "The total is paid to Arta through an Arta Checkout payment."
        },
        id: %Schema{
          type: :string,
          description: "The ID representing the resource",
          example: "checkout"
        },
        name: %Schema{
          type: :string,
          description: "A brief title for the resource",
          example: "Checkout"
        }
      }
    }
  })
end
