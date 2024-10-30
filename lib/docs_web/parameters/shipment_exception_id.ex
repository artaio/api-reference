defmodule DocsWeb.Parameters.ShipmentExceptionID do
  alias OpenApiSpex.{Parameter, Schema}
  require OpenApiSpex

  @spec parameter() :: Parameter.t()
  def parameter(),
    do: %Parameter{
      name: "shipment_exception_id",
      description: "shipment_exception_id parameter",
      in: :path,
      required: true,
      schema: %Schema{
        type: "string"
      }
    }
end
