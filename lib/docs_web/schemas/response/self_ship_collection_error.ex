defmodule DocsWeb.Schemas.Response.SelfShipCollectionError do
  @moduledoc """
  Error responses returned by the self-ship collection endpoints.

  These endpoints do not use the `{"errors": {"detail": "..."}}` shape documented for most of the API:

    * `error_list/2` — `{"errors": ["..."]}`: messages that apply to the request as a whole, such as an
      unsupported pickup country, an unmet carrier-specific requirement, or a rejection reported by the
      carrier.
    * `field_errors/2` — `{"errors": {"<path>": ["..."]}}`: messages keyed by the offending field path
      (`location/region`, `service/carrier`, ...) or by `#` for whole-request errors.
    * `validation_errors/2` — either of the above: a `422` on create is field-keyed for schema and
      consistency failures, but a flat list when a value could not be converted for the carrier.
  """

  alias OpenApiSpex.{Operation, Schema}

  @default_list_example ["Only UK and US are supported for FedEx self-ship collections"]
  @default_field_example %{"location/region" => ["is not a valid US state/territory code"]}

  @spec error_list(String.t(), keyword()) :: OpenApiSpex.Response.t()
  def error_list(description, opts \\ []),
    do: respond(description, error_list_schema(Keyword.get(opts, :example, @default_list_example)))

  @spec field_errors(String.t(), keyword()) :: OpenApiSpex.Response.t()
  def field_errors(description, opts \\ []),
    do: respond(description, field_errors_schema(Keyword.get(opts, :example, @default_field_example)))

  @spec validation_errors(String.t(), keyword()) :: OpenApiSpex.Response.t()
  def validation_errors(description, opts \\ []) do
    respond(description, %Schema{
      title: "SelfShipCollectionValidationErrors",
      oneOf: [
        field_errors_schema(Keyword.get(opts, :field_example, @default_field_example)),
        error_list_schema(Keyword.get(opts, :list_example, @default_list_example))
      ]
    })
  end

  defp respond(description, schema),
    do: Operation.response(description, "application/json", schema, headers: DocsWeb.ApiSpec.default_headers())

  defp error_list_schema(example) do
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
      example: %{"errors" => example}
    }
  end

  defp field_errors_schema(example) do
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
      example: %{"errors" => example}
    }
  end
end
