defmodule DocsWeb.Parameters.ArtaQuoteTimeout do
  alias OpenApiSpex.{Parameter, Schema}
  require OpenApiSpex

  @spec parameter() :: Parameter.t()
  def parameter(),
    do: %Parameter{
      name: "Arta-Quote-Timeout",
      description:
        "Optionally set a timeout boundary in milliseconds for creating quote requests.\n\nWhile Arta takes great care to return quotes quickly, several external services consumed during the process of creating quotes have varying response times. The `Arta-Quote-Timeout` header is particularly useful if your integration requires requests to return within a given time frame. When the timeout is reached, the Arta API will stop any tasks in progress and return the quotes that have already been completed. If building quotes for a particular quote type is incomplete at timeout, the API will return a disqualification message for that quote type with a `client_timeout_reached` `reason_code`.",
      in: :header,
      required: false,
      example: 6000,
      schema: %Schema{
        type: "integer"
      }
    }
end
