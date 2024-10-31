defmodule DocsWeb.Schemas.Response.WebhookSecretToken do
  alias OpenApiSpex.Schema

  require OpenApiSpex

  OpenApiSpex.schema(%Schema{
    type: :object,
    properties: %{
      secret_token: %Schema{
        type: :string,
        example: "zASePCHfe2FYKjXl1YhFukNY5T7hCqgX0RRBUVi_289ubnhBvN9U03uOqG8oB2Oz",
        description: "The secret token associated with the webhook endpoint"
      }
    }
  })
end
