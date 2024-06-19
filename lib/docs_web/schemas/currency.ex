defmodule DocsWeb.Schemas.Currency do
  alias OpenApiSpex.Schema
  require OpenApiSpex

  def schema(),
    do: %Schema{
      title: "currency",
      type: "string",
      default: "USD",
      description:
        "ISO 4217 three-letter alphabetic currency code. Options are defined in the Currencies metadata endpoint",
      pattern: "^[A-Z]{3}$",
      maxLength: 3,
      minLength: 3,
      example: "USD"
    }
end
