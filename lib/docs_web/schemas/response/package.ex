defmodule DocsWeb.Schemas.Response.Package do
  alias DocsWeb.Schemas.Fields

  require OpenApiSpex

  OpenApiSpex.schema(%{
    title: "Package",
    type: :object,
    properties: Fields.package_fields_for_response()
  })
end
