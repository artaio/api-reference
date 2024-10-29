defmodule DocsWeb.Schemas.Response.BadRequest do
  alias OpenApiSpex.{Schema, Operation}

  def build(),
    do:
      Operation.response(
        "Bad Request",
        "application/json",
        %Schema{
          title: "BadRequest",
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
        }
      )
end
