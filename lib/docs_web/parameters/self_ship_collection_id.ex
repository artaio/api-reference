defmodule DocsWeb.Parameters.SelfShipCollectionID do
  alias OpenApiSpex.{Parameter, Schema}

  @spec parameter() :: Parameter.t()
  def parameter(),
    do: %Parameter{
      name: "self_ship_collection_id",
      description: "self_ship_collection_id parameter",
      in: :path,
      required: true,
      schema: %Schema{
        type: "string"
      }
    }
end
