defmodule DocsWeb.Schemas.Response.Log do
  alias OpenApiSpex.Schema

  require OpenApiSpex

  OpenApiSpex.schema(%{
    title: "Log",
    type: :object,
    properties: %{
      api_key_id: %Schema{
        type: :integer,
        format: "int64"
      },
      arta_version: %Schema{
        type: :string
      },
      end_at: %Schema{
        type: :string
      },
      id: %Schema{
        type: :integer,
        format: "int64"
      },
      created_at: %Schema{
        type: :string
      },
      method: %Schema{
        type: :string
      },
      path: %Schema{
        type: :string
      },
      query_params: %Schema{
        type: :string
      },
      request_body: %Schema{
        type: :string
      },
      request_id: %Schema{
        type: :string
      },
      response_body: %Schema{
        type: :string
      },
      start_at: %Schema{
        type: :string
      },
      status: %Schema{
        type: :integer,
        format: "int64"
      },
      updated_at: %Schema{
        type: :string
      }
    }
  })
end
