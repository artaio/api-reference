defmodule DocsWeb.Schemas.Response.Location do
  alias DocsWeb.Schemas.Fields

  require OpenApiSpex

  OpenApiSpex.schema(%{
    title: "Location",
    type: :object,
    properties: Fields.location_fields()
  })
end
