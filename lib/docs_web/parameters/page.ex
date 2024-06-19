defmodule DocsWeb.Parameters.Page do
  alias OpenApiSpex.{Parameter, Schema}
  require OpenApiSpex

  @spec parameter() :: Parameter.t()
  def parameter(),
    do: %Parameter{
      name: "page",
      description: "Page number of the results to fetch.",
      in: :query,
      schema: %Schema{
        type: "integer",
        default: 1
      }
    }
end
