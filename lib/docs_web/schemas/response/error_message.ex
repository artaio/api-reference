defmodule DocsWeb.Schemas.Response.ErrorMessage do
  @moduledoc """
  A refusal carrying one message under `error` that names what was at fault.

  `example:` is the message the operation being documented would return, since an endpoint names
  the parameters it takes in its own refusals, and is required for that reason.
  """

  alias OpenApiSpex.{Operation, Schema}

  @spec build(keyword()) :: Operation.response()
  def build(opts),
    do:
      Operation.response(
        "Bad Request",
        "application/json",
        %Schema{
          title: "ErrorMessage",
          type: :object,
          required: [:error],
          properties: %{
            error: %Schema{
              type: :string,
              description: "What was at fault in the request.",
              example: Keyword.fetch!(opts, :example)
            }
          }
        },
        headers: DocsWeb.ApiSpec.default_headers()
      )
end
