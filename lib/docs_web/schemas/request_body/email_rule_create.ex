defmodule DocsWeb.Schemas.RequestBody.EmailRuleCreate do
  alias OpenApiSpex.Schema

  require OpenApiSpex

  OpenApiSpex.schema(%Schema{
    title: "EmailRuleCreate",
    type: :object,
    properties: %{
      email_rule: %Schema{
        type: :object,
        required: ["email_notification_id", "recipients"],
        properties: %{
          email_notification_id: %Schema{
            type: :string,
            description: "The ID belonging to the Email Notification for this Email Rule.",
            example: "booking"
          },
          recipients: %Schema{
            type: :array,
            items: %Schema{
              type: :string
            },
            description: "The list of recipients for this Email Rule.",
            example: ["destination", "origin"]
          }
        }
      }
    },
    required: ["email_rule"],
  })
end
