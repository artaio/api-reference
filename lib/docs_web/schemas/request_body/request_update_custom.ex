defmodule DocsWeb.Schemas.RequestBody.RequestUpdateCustom do
  alias OpenApiSpex.Schema

  require OpenApiSpex

  OpenApiSpex.schema(%Schema{
    title: "RequestUpdateCustom",
    type: :object,
    properties: %{
      note: %Schema{
        type: "string",
        description:
          "An optional note providing additional context for the Arta team about your custom quote request."
      }
    }
  })
end
