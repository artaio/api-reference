defmodule DocsWeb.Schemas do
  alias OpenApiSpex.Schema

  defmodule ApiKey do
    require OpenApiSpex

    OpenApiSpex.schema(%{
      title: "apiKey",
      type: :object,
      properties: %{
        id: %Schema{type: :integer, description: "API Key ID"},
        created_at: %Schema{
          type: :string,
          description: "Creation timestamp",
          format: :"date-time"
          },
        updated_at: %Schema{type: :string, description: "Update timestamp", format: :"date-time"},
        is_testing: %Schema{type: :boolean, description: "Testing mode", default: false},
        token: %Schema{type: :string, description: "token"}

      },
      example: %{
        "id" => 123,
        "is_testing" => true,
        "token" => "eysss",
        "created_at" => "2017-09-12T12:34:55Z",
        "updated_at" => "2017-09-13T10:11:12Z"
      }
    })
  end

end
