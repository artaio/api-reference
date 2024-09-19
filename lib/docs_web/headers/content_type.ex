defmodule DocsWeb.Headers.ContentTypeAppJson do
  alias OpenApiSpex.{Header, Schema}
  require OpenApiSpex

  @spec header() :: Header.t()
  def header(),
    do: %Header{
      example: "application/json",
      schema: %Schema{
        type: "string"
      }
    }
end
