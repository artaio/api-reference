defmodule DocsWeb.Parameters.ShippingProtectionPolicyID do
  alias OpenApiSpex.{Parameter, Schema}
  require OpenApiSpex

  @spec parameter() :: Parameter.t()
  def parameter(),
    do: %Parameter{
      name: "id",
      description: "UUID of the Shipping Protection Policy",
      in: :path,
      required: true,
      schema: %Schema{
        type: "string",
        format: "uuid"
      }
    }
end
