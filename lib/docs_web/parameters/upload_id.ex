defmodule DocsWeb.Parameters.UploadID do
  alias OpenApiSpex.{Parameter, Schema}

  @spec parameter() :: Parameter.t()
  def parameter(),
    do: %Parameter{
      name: "upload_id",
      description: "upload_id parameter",
      in: :path,
      required: true,
      schema: %Schema{
        type: "integer"
      }
    }
end
