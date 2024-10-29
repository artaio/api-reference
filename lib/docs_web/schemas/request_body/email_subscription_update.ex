defmodule DocsWeb.Schemas.RequestBody.EmailSubscriptionUpdate do
  alias OpenApiSpex.Schema

  require OpenApiSpex

  OpenApiSpex.schema(%Schema{
    title: "EmailSubscriptionUpdate",
    type: :object,
    properties: %{
      email_subscription: %Schema{
        type: :object,
        required: ["recipients"],
        properties: %{
          recipients: %Schema{
            type: :array,
            items: %Schema{
              type: :string
            },
            description: "The list of recipients for this Email Subscription.",
            example: ["destination", "origin"]
          }
        }
      }
    },
    required: ["email_subscription"],
    additionalProperties: false
  })
end
