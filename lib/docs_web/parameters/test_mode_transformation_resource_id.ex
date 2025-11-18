defmodule DocsWeb.Parameters.TestModeTransformationResourceID do
  alias OpenApiSpex.{Parameter, Schema}
  require OpenApiSpex

  @spec parameter() :: Parameter.t()
  def parameter(),
    do: %Parameter{
      name: "id",
      description:
        "The ID of the resource (shipment or request) to get transformation options for",
      in: :query,
      required: true,
      example: "506d79b6-1e5e-4e8c-a266-74658fdaf4ee",
      schema: %Schema{
        type: "string"
      }
    }
end
