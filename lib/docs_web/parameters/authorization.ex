defmodule DocsWeb.Parameters.Authorization do
  alias OpenApiSpex.{Parameter, Schema}
  require OpenApiSpex

  @spec parameter() :: Parameter.t()
  def parameter(),
    do: %Parameter{
      name: "page",
      description: "Authorize your API calls with an Arta API token",
      in: :header,
      required: true,
      example: "ARTA_APIKey s0e1t2e3c4a5s6t7r8o9n10o11m12y",
      schema: %Schema{
        type: "string"
      }
    }
end
