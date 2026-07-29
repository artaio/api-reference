defmodule DocsWeb.Parameters.Search do
  alias OpenApiSpex.{Parameter, Schema}

  @spec parameter() :: Parameter.t()
  def parameter(),
    do: %Parameter{
      name: "search",
      description: "An optional structured search query",
      in: :query,
      required: false,
      schema: %Schema{
        type: "string",
        nullable: true
      }
    }
end
