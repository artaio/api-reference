defmodule DocsWeb.Parameters.TestModeTransformationResourceType do
  alias OpenApiSpex.{Parameter, Schema}
  require OpenApiSpex

  @spec parameter() :: Parameter.t()
  def parameter(),
    do: %Parameter{
      name: "type",
      description: "The type of resource to get transformation options for",
      in: :query,
      required: true,
      example: "shipment",
      schema: %Schema{
        type: "string",
        enum: ["shipment", "request"]
      }
    }
end
