defmodule DocsWeb.Schemas.Payload.Location do
  alias DocsWeb.Schemas.Fields

  alias OpenApiSpex.Schema

  def call() do
    %Schema{
      type: :object,
      properties: Fields.location_fields()
    }
  end
end
