defmodule DocsWeb.Schemas.Response.Error do
  alias OpenApiSpex.Schema

  require OpenApiSpex

  OpenApiSpex.schema(%{
    title: "Error",
    type: :object,
    properties: %{
      errors: %Schema{
        type: :object,
        properties: %{
          detail: %Schema{
            type: :string,
            description: "A human-readable explanation specific to this occurrence of the problem"
          }
        }
      }
    }
  })
end
