defmodule DocsWeb.Schemas.RequestBody.ApiKeyCreate do
  alias OpenApiSpex.Schema

  require OpenApiSpex

  OpenApiSpex.schema(%Schema{
    title: "ApiKeyCreate",
    type: :object,
    properties: %{
      api_key: %Schema{
        type: :object,
        properties: %{
          is_testing: %Schema{
            description: "Whether this API Key should operate in Live or Test mode.",
            default: false,
            type: :boolean,
            example: true
          }
        }
      }
    },
    required: ["api_key"],
    additionalProperties: false
  })
end
