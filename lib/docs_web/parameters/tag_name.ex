defmodule DocsWeb.Parameters.TagName do
  alias OpenApiSpex.{Parameter, Schema}
  require OpenApiSpex

  @spec parameter() :: Parameter.t()
  def parameter(),
    do: %Parameter{
      name: "tag_name",
      description: "tag_name parameter",
      in: :path,
      required: true,
      schema: %Schema{
        type: "string"
      }
    }
end
