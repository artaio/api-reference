defmodule DocsWeb.Parameters.PageSize do
  alias OpenApiSpex.{Parameter, Schema}
  require OpenApiSpex

  @spec parameter() :: Parameter.t()
  def parameter(),
    do: %Parameter{
      name: "page_size",
      description: "Results per page (max 50)",
      in: :query,
      schema: %Schema{
        type: "integer",
        default: 20
      }
    }
end
