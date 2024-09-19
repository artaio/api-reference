defmodule DocsWeb.Headers.XArtaRequestID do
  alias OpenApiSpex.{Header, Schema}
  require OpenApiSpex

  @spec header() :: Header.t()
  def header(),
    do: %Header{
      description: "A unique identifier for the Arta API call",
      example: "FkBjuxbwLLTx4RoAARkx",
      schema: %Schema{
        type: "string"
      }
    }
end
