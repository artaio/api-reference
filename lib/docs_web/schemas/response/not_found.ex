defmodule DocsWeb.Schemas.Response.NotFound do
  alias OpenApiSpex.{Schema, Operation}

  def build(),
    do:
      Operation.response(
        "Not Found",
        "application/json",
        %Schema{
          title: "NotFound",
          type: :object,
          properties: %{
            errors: %Schema{
              type: :object,
              properties: %{
                detail: %Schema{
                  type: :string,
                  example: "string"
                }
              }
            }
          }
        },
        headers: DocsWeb.ApiSpec.default_headers()
      )
end
