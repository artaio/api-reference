defmodule DocsWeb.Parameters.TransactionalMailingPaging do
  @moduledoc """
  The `page` and `page_size` parameters for the Transactional Mailing collection, which refuses a
  value outside its range rather than serving the nearest page it can.
  """

  alias OpenApiSpex.{Parameter, Schema}

  @spec page() :: Parameter.t()
  def page(),
    do: %Parameter{
      name: "page",
      description: "Page number of the results to fetch. A value outside 1 to 100 is rejected with a `400`.",
      in: :query,
      schema: %Schema{
        type: "integer",
        default: 1,
        minimum: 1,
        maximum: 100
      }
    }

  @spec page_size() :: Parameter.t()
  def page_size(),
    do: %Parameter{
      name: "page_size",
      description: "Results per page. A value outside 1 to 50 is rejected with a `400`.",
      in: :query,
      schema: %Schema{
        type: "integer",
        default: 20,
        minimum: 1,
        maximum: 50
      }
    }
end
