defmodule DocsWeb.Schemas.Response.Object do
  alias DocsWeb.Schemas.Fields

  require OpenApiSpex

  OpenApiSpex.schema(%{
    type: :object,
    properties: Fields.object_fields_with_response_fields()
  })
end
