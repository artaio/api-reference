defmodule DocsWeb.Parameters.TransactionalMailingSort do
  @moduledoc """
  The `sort` query parameter for the Transactional Mailing collection, which orders by the one
  column that collection opens.
  """

  alias OpenApiSpex.{Parameter, Schema}

  @spec parameter() :: Parameter.t()
  def parameter(),
    do: %Parameter{
      name: "sort",
      description: "An optional sort order for the returned collection. Another value is rejected with a `400`.",
      in: :query,
      required: false,
      schema: %Schema{
        type: "string",
        enum: ["created_at_asc", "created_at_desc"]
      }
    }
end
