defmodule DocsWeb.Parameters.WebhookDeliveryID do
  alias OpenApiSpex.{Parameter, Schema}

  @spec parameter() :: Parameter.t()
  def parameter(),
    do: %Parameter{
      name: "webhook_delivery_id",
      description: "webhook_delivery_id parameter",
      in: :path,
      required: true,
      schema: %Schema{
        type: "string"
      }
    }
end
