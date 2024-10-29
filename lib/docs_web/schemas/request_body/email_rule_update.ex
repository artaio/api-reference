defmodule DocsWeb.Schemas.RequestBody.EmailRuleUpdate do
  alias OpenApiSpex.Schema

  require OpenApiSpex

  OpenApiSpex.schema(%Schema{
    title: "EmailRuleUpdate",
    type: :object,
    properties: %{
      email_rule: %Schema{
        type: :object,
        required: ["recipients"],
        properties: %{
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
