defmodule DocsWeb.Parameters.SelfShipCollectionID do
  alias OpenApiSpex.{Parameter, Schema}
  require OpenApiSpex

  @spec parameter() :: Parameter.t()
  def parameter(),
    do: %Parameter{
      name: "self_ship_collection_id",
      description: "Self Ship Collection Id parameter",
      in: :path,
      required: true,
      schema: %Schema{
        type: "string"
      }
    }
end
