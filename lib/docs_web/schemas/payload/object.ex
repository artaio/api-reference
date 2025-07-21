defmodule DocsWeb.Schemas.Payload.Object do
  alias DocsWeb.Schemas.Fields

  alias OpenApiSpex.Schema

  def call(context \\ nil)

  def call(nil) do
    %Schema{
      type: :object,
      properties: Fields.object_fields(),
      required: [
        :depth,
        :height,
        :subtype,
        :width,
        :unit_of_measurement,
        :weight_unit,
        :value,
        :value_currency
      ]
    }
  end

  def call(:track) do
    %Schema{
      type: :object,
      properties: Fields.object_fields()
    }
  end

  def call(:inbound_booking_session) do
    %Schema{
      type: :object,
      properties: Fields.object_fields(),
      required: [
        :subtype,
        :value
      ]
    }
  end
end
