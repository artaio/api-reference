defmodule DocsWeb.Schemas.Response.ShipmentException do
  alias OpenApiSpex.Schema
  alias DocsWeb.Schemas.Fields

  require OpenApiSpex

  OpenApiSpex.schema(%{
    title: "ShipmentException",
    type: :object,
    properties:
      Fields.shipment_exception_base_fields()
      |> Map.put(:shipment_id, %Schema{
        type: :string,
        description: "The id of the shipment associated with this exception",
        format: :uuid
      }),
    example: %{
      "created_at" => "2023-05-26T19:33:19.693833",
      "exception_type_label" => nil,
      "hold_until" => nil,
      "id" => "d686ad3b-33fd-454c-a7aa-94b1ecbc539f",
      "package_id" => 4_366_794,
      "resolution" => nil,
      "shipment_id" => "a5cbb58c-43ab-4658-9999-98a33b0070d5",
      "source" => "api",
      "status" => "new",
      "type" => "held_at_customs",
      "updated_at" => "2023-05-26T19:33:19.693833"
    }
  })
end
