defmodule DocsWeb.Parameters.PaymentID do
  alias OpenApiSpex.{Parameter, Schema}
  require OpenApiSpex

  @spec parameter() :: Parameter.t()
  def parameter(),
    do: %Parameter{
      name: "payment_id",
      description: "payment_id parameter",
      in: :path,
      required: true,
      schema: %Schema{
        type: "string"
      }
    }
end
