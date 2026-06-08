defmodule DocsWeb.Parameters.ShippingProtectionEstimateID do
  alias OpenApiSpex.{Parameter, Schema}
  require OpenApiSpex

  @spec parameter() :: Parameter.t()
  def parameter(),
    do: %Parameter{
      name: "id",
      description: "UUID of the Shipping Protection Estimate",
      in: :path,
      required: true,
      schema: %Schema{
        type: "string",
        format: "uuid"
      }
    }
end
