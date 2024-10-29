defmodule DocsWeb.Parameters.RequestID do
  alias OpenApiSpex.{Parameter, Schema}
  require OpenApiSpex

  @spec parameter() :: Parameter.t()
  def parameter(),
    do: %Parameter{
      name: "request_id",
      description: "request_id parameter",
      in: :path,
      required: true,
      schema: %Schema{
        type: "string"
      }
    }
end
