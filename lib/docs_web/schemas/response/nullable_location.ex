defmodule DocsWeb.Schemas.Response.NullableLocation do
  alias DocsWeb.Schemas.Fields

  require OpenApiSpex

  OpenApiSpex.schema(%{
    title: "NullableLocation",
    type: :object,
    properties: Fields.location_fields(),
    nullable: true
  })
end
