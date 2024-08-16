defmodule DocsWeb.Schemas.Payload.Package do
  alias DocsWeb.Schemas.Fields

  alias OpenApiSpex.Schema

  def call(:track) do
    %Schema{
      type: :object,
      properties: Fields.package_fields_for_track_shipments()
    }
  end
end
