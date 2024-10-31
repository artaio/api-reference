defmodule DocsWeb.Schemas.RequestBody.WebhookCreate do
  alias OpenApiSpex.Schema

  require OpenApiSpex

  OpenApiSpex.schema(%Schema{
    title: "WebhookCreate",
    type: :object,
    properties: %{
      webhook: %Schema{
        type: :object,
        properties: %{
          name: %Schema{
            type: :string,
            description: "The name for this Webhook.",
            example: "Production webhooks endpoint"
          },
          url: %Schema{
            type: :string,
            description: "The URL for this Webhook.",
            example: "https://notifications.example.com/"
          }
        }
      }
    },
    required: ["webhook"],
    additionalProperties: false
  })
end
