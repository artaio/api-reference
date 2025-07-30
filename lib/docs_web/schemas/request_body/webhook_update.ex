defmodule DocsWeb.Schemas.RequestBody.WebhookUpdate do
  alias OpenApiSpex.Schema

  require OpenApiSpex

  OpenApiSpex.schema(%Schema{
    title: "WebhookUpdate",
    type: :object,
    properties: %{
      webhook: %Schema{
        type: :object,
        properties: %{
          name: %Schema{
            type: :string,
            description: "The name for this Webhook.",
            example: "hello@shiparta.com"
          },
          url: %Schema{
            type: :string,
            description: "The URL for this Webhook.",
            example: "Arta"
          }
        }
      }
    },
    required: ["webhook"],
    additionalProperties: false
  })
end
