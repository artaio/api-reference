defmodule DocsWeb.Schemas.Response.Webhook do
  alias OpenApiSpex.Schema

  require OpenApiSpex

  OpenApiSpex.schema(%Schema{
    type: :object,
    properties: %{
      created_at: %Schema{
        type: :string
      },
      id: %Schema{
        type: :integer,
        format: "int64"
      },
      name: %Schema{
        type: :string
      },
      updated_at: %Schema{
        type: :string
      },
      url: %Schema{
        type: :string
      }
    },
    example: %{
      "id" => 4,
      "created_at" => "2020-10-22T21:12:48.839165",
      "name" => "Notifications Endpoint",
      "updated_at" => "2020-10-22T21:12:48.839165",
      "url" => "https://notifications.example.com/hooks/"
    }
  })
end
