defmodule DocsWeb.Headers.ContentTypeAppJson do
  alias OpenApiSpex.{Header, Schema}

  @spec header() :: Header.t()
  def header(),
    do: %Header{
      example: "application/json",
      schema: %Schema{
        type: "string"
      }
    }
end
