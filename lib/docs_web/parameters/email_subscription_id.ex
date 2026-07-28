defmodule DocsWeb.Parameters.EmailSubscriptionID do
  alias OpenApiSpex.{Parameter, Schema}

  @spec parameter() :: Parameter.t()
  def parameter(),
    do: %Parameter{
      name: "email_subscription_id",
      description: "email_subscription_id parameter",
      in: :path,
      required: true,
      schema: %Schema{
        type: "integer"
      }
    }
end
