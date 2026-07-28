defmodule DocsWeb.Parameters.InvoicePaymentID do
  alias OpenApiSpex.{Parameter, Schema}

  @spec parameter() :: Parameter.t()
  def parameter(),
    do: %Parameter{
      name: "invoice_payment_id",
      description: "invoice_payment_id parameter",
      in: :path,
      required: true,
      schema: %Schema{
        type: "integer"
      }
    }
end
