defmodule DocsWeb.Schemas.Response.EmailSubscription do
  alias OpenApiSpex.Schema

  require OpenApiSpex

  OpenApiSpex.schema(%{
    title: "EmailSubscription",
    type: :object,
    properties: %{
      email_address: %Schema{
        type: :string
      },
      email_notification_ids: %Schema{
        type: :array,
        items: %Schema{
          type: :string
        }
      },
      id: %Schema{
        type: :integer,
        format: "int64"
      },
      created_at: %Schema{
        type: :string
      },
      name: %Schema{
        type: :string
      },
      updated_at: %Schema{
        type: :string
      }
    },
    example: %{
      "email_address" => "notifications@shiparta.com",
      "email_notification_ids" => ["booking", "complete", "scheduling"],
      "id" => 6,
      "created_at" => "2020-10-14T15:25:48.298369",
      "name" => "Arta Notifications",
      "updated_at" => "2020-10-14T15:25:48.298369"
    }
  })
end
