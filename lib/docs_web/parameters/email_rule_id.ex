defmodule DocsWeb.Parameters.EmailRuleID do
  alias OpenApiSpex.{Parameter, Schema}
  require OpenApiSpex

  @spec parameter() :: Parameter.t()
  def parameter(),
    do: %Parameter{
      name: "email_rule_id",
      description: "email_rule_id parameter",
      in: :path,
      required: true,
      schema: %Schema{
        type: "string"
      }
    }
end
