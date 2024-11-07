defmodule DocsWeb.Parameters.InvoiceID do
  alias OpenApiSpex.{Parameter, Schema}
  require OpenApiSpex

  @spec parameter() :: Parameter.t()
  def parameter(),
    do: %Parameter{
      name: "invoice_id",
      description: "invoice_id parameter",
      in: :path,
      required: true,
      schema: %Schema{
        type: "integer"
      }
    }
end
