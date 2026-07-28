defmodule DocsWeb.Parameters.ShipmentID do
  alias OpenApiSpex.{Parameter, Schema}

  @spec parameter() :: Parameter.t()
  def parameter(),
    do: %Parameter{
      name: "shipment_id",
      description: "shipment_id parameter",
      in: :path,
      required: true,
      schema: %Schema{
        type: "string"
      }
    }
end
