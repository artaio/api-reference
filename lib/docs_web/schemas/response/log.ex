defmodule DocsWeb.Schemas.Response.Log do
  alias OpenApiSpex.Schema

  require OpenApiSpex

  OpenApiSpex.schema(%{
    title: "Log",
    type: :object,
    properties: %{
      api_key_id: %Schema{
        type: :integer,
        format: "int64"
      },
      arta_version: %Schema{
        type: :string
      },
      end_at: %Schema{
        type: :string
      },
      id: %Schema{
        type: :integer,
        format: "int64"
      },
      created_at: %Schema{
        type: :string
      },
      method: %Schema{
        type: :string
      },
      path: %Schema{
        type: :string
      },
      query_params: %Schema{
        type: :string
      },
      request_body: %Schema{
        type: :string
      },
      request_id: %Schema{
        type: :string
      },
      response_body: %Schema{
        type: :string
      },
      start_at: %Schema{
        type: :string
      },
      status: %Schema{
        type: :integer,
        format: "int64"
      },
      updated_at: %Schema{
        type: :string
      }
    },
    example: %{
      "api_key_id" => 1,
      "arta_version" => "2020-10-22",
      "end_at" => "2020-10-23T20:34:28.816433",
      "id" => 320,
      "created_at" => "2020-10-23T20:34:29.066599",
      "method" => "POST",
      "path" => "/requests",
      "query_params" => "{}",
      "request_body" => "",
      "request_id" => "FkC5WHWtbZuuUtcAArFx",
      "response_body" => "",
      "start_at" => "2020-10-23T20:34:16.928374",
      "status" => 200,
      "updated_at" => "2020-10-23T20:34:29.066599"
    }
  })
end
