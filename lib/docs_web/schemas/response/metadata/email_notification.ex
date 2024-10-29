defmodule DocsWeb.Schemas.Response.Metadata.EmailNotification do
  alias OpenApiSpex.Schema

  require OpenApiSpex

  OpenApiSpex.schema(%{
    title: "MetadataEmailNotification",
    type: :array,
    items: %Schema{
      type: :object,
      properties: %{
        description: %Schema{
          type: :string,
          description: "A long form description",
          example: "Delivered when a shipment is confirmed."
        },
        optional_recipients: %Schema{
          type: :array,
          description: "The list of configurable recipients for this notification",
          items: %Schema{
            type: :string,
            example: "destination"
          }
        },
        id: %Schema{
          type: :string,
          description: "The ID representing the resource",
          example: "booking"
        },
        name: %Schema{
          type: :string,
          description: "A brief title for the resource",
          example: "Booking Confirmation"
        }
      }
    }
  })
end
