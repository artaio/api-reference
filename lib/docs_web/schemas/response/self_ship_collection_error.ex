defmodule DocsWeb.Schemas.Response.SelfShipCollectionError do
  @moduledoc """
  Error responses returned by the self-ship collection endpoints.

  These endpoints do not use the `{"errors": {"detail": "..."}}` shape documented for most of the API:

    * `error_list/2` — `{"errors": ["..."]}`: messages that apply to the request as a whole, such as an
      unsupported pickup country or a rejection reported by the carrier.
    * `field_errors/2` — `{"errors": {"<path>": ["..."]}}`: messages keyed by the offending field path
      (`location/region`, `service/carrier`, ...) or by `#` for whole-request errors.
  """

  alias OpenApiSpex.{Operation, Schema}

  @spec error_list(String.t(), keyword()) :: OpenApiSpex.Response.t()
  def error_list(description, opts \\ []) do
    Operation.response(
      description,
      "application/json",
      %Schema{
        title: "SelfShipCollectionErrorList",
        type: :object,
        required: [:errors],
        properties: %{
          errors: %Schema{
            type: :array,
            description: "Human-readable error messages that apply to the request as a whole",
            items: %Schema{type: :string}
          }
        },
        example: %{
          "errors" => Keyword.get(opts, :example, ["Only UK and US are supported for FedEx self-ship collections"])
        }
      },
      headers: DocsWeb.ApiSpec.default_headers()
    )
  end

  @spec field_errors(String.t(), keyword()) :: OpenApiSpex.Response.t()
  def field_errors(description, opts \\ []) do
    Operation.response(
      description,
      "application/json",
      %Schema{
        title: "SelfShipCollectionFieldErrors",
        type: :object,
        required: [:errors],
        properties: %{
          errors: %Schema{
            type: :object,
            description:
              "Human-readable error messages keyed by the path of the offending field, for example `location/region` or `service/carrier`. Messages that apply to the request as a whole are keyed by `#`.",
            additionalProperties: %Schema{type: :array, items: %Schema{type: :string}}
          }
        },
        example: %{
          "errors" => Keyword.get(opts, :example, %{"location/region" => ["is not a valid US state/territory code"]})
        }
      },
      headers: DocsWeb.ApiSpec.default_headers()
    )
  end
end
