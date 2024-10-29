defmodule DocsWeb.Schemas.RequestBody.EmailSubscriptionCreate do
  alias OpenApiSpex.Schema

  require OpenApiSpex

  OpenApiSpex.schema(%Schema{
    title: "EmailSubscriptionCreate",
    type: :object,
    properties: %{
      email_subscription: %Schema{
        type: :object,
        properties: %{
          email_address: %Schema{
            type: :string,
            description: "The email_address for this Email Subscription.",
            example: "hello@shiparta.com"
          },
          email_notification_ids: %Schema{
            type: :array,
            description: "The list of Email Notification IDs for this Email Subscription.",
            items: %Schema{
              type: :string
            },
            example: ["booking", "scheduling"]
          },
          name: %Schema{
            type: :string,
            description:
              "The name for this Email Subscription. This name will be used in conjunction with the email address field to build the recipient when delivering email notifications.",
            example: "Arta"
          }
        }
      }
    },
    required: ["email_subscription"],
    additionalProperties: false
  })
end
