defmodule DocsWeb.Parameters.TagName do
  alias OpenApiSpex.{Parameter, Schema}
  require OpenApiSpex

  @spec parameter() :: Parameter.t()
  def parameter(),
    do: %Parameter{
      name: "tag_name",
      description: "The name field for a Tag resource",
      in: :path,
      required: true,
      schema: %Schema{
        type: "string"
      }
    }
end
