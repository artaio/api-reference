defmodule DocsWeb.Schemas.Payload.NullableLocation do
  alias DocsWeb.Schemas.Fields

  alias OpenApiSpex.Schema

  def call(description) do
    %Schema{
      type: :object,
      properties: Fields.location_fields(),
      description: description,
      nullable: true
    }
  end
end
