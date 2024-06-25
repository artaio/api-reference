defmodule DocsWeb.Schemas.APIKey do
  alias OpenApiSpex.Schema

  require OpenApiSpex

  OpenApiSpex.schema(%{
    title: "APIKey",
    type: :object,
    properties: %{
      id: %Schema{
        type: :integer,
        format: :int64
      },
      created_at: %Schema{
        type: :string
      },
      is_testing: %Schema{
        type: :boolean,
        default: false
      },
      token: %Schema{
        type: :string
      },
      updated_at: %Schema{
        type: :string
      }
    }
  })
end
