defmodule DocsWeb.Schemas.APIKey do
  alias OpenApiSpex.Schema

  require OpenApiSpex

  OpenApiSpex.schema(%{
    title: "APIKey",
    type: :object,
    properties: %{
      id: %Schema{
        type: :integer,
        format: :int64,
        example: 2
      },
      created_at: %Schema{
        type: :string,
        example: "2021-01-21T17:22:08.818747"
      },
      is_testing: %Schema{
        type: :boolean,
        default: false
      },
      token: %Schema{
        type: :string,
        example: "******************eQ0Rqp"
      },
      updated_at: %Schema{
        type: :string,
        example: "2021-01-21T17:22:08.818747"
      }
    }
  })
end
