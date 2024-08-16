defmodule DocsWeb.Schemas.MonetaryAmount do
  alias OpenApiSpex.Schema

  require OpenApiSpex

  def schema(),
    do: %Schema{
      title: "MonetaryAmount",
      type: "string",
      pattern: "^(0|([1-9]+[0-9]*))(\\.[0-9]{1,2})?$",
      example: "2500.00"
    }
end
