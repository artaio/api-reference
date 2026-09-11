defmodule DocsWeb.Parameters.Sort do
  alias OpenApiSpex.{Parameter, Schema}

  @description "An optional sort order for the returned collection."

  @searchable_description """


  Sorting is not applied to a request that also includes a `search` term. Those results are returned in order of \
  relevance to the search.\
  """

  @doc """
  The `sort` query parameter for a list endpoint.

  Pass `searchable: true` for an endpoint that also accepts `search`, which documents that a search term takes
  precedence over the requested sort order.
  """
  @spec parameter(keyword()) :: Parameter.t()
  def parameter(opts \\ []),
    do: %Parameter{
      name: "sort",
      description: description(Keyword.get(opts, :searchable, false)),
      in: :query,
      required: false,
      schema: %Schema{
        type: "string",
        enum: ["created_at_asc", "created_at_desc", "updated_at_asc", "updated_at_desc"]
      }
    }

  defp description(true), do: @description <> @searchable_description
  defp description(false), do: @description
end
