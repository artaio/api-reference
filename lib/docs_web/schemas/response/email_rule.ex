defmodule DocsWeb.Schemas.Response.EmailRule do
  alias OpenApiSpex.Schema

  require OpenApiSpex

  OpenApiSpex.schema(%{
    title: "EmailRule",
    type: :object,
    properties: %{
      created_at: %Schema{
        type: :string,
        example: "2021-10-27T16:48:38.657228",
        readOnly: true
      },
      id: %Schema{
        type: :integer,
        example: 1942,
        readOnly: true
      },
      updated_at: %Schema{
        type: :string,
        example: "2021-10-27T16:48:38.657228",
        readOnly: true
      },
      email_notification_id: %Schema{
        type: :string,
        example: "complete"
      },
      recipients: %Schema{
        type: :array,
        items: %Schema{
          type: :string
        },
        example: ["destination"]
      }
    }
  })
end
