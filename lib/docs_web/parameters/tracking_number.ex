defmodule DocsWeb.Parameters.TrackingNumber do
  alias OpenApiSpex.{Parameter, Schema}
  require OpenApiSpex

  @spec parameter() :: Parameter.t()
  def parameter(),
    do: %Parameter{
      name: "tracking_number",
      description: "tracking_number parameter",
      in: :path,
      required: true,
      schema: %Schema{
        type: "string"
      }
    }
end
