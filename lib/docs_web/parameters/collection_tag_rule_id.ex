defmodule DocsWeb.Parameters.CollectionTagRuleID do
  alias OpenApiSpex.{Parameter, Schema}
  require OpenApiSpex

  @spec parameter() :: Parameter.t()
  def parameter(),
    do: %Parameter{
      name: "collection_tag_rule_id",
      description: "collection_tag_rule_id parameter",
      in: :path,
      required: true,
      schema: %Schema{
        type: "string",
        format: "uuid"
      }
    }
end
