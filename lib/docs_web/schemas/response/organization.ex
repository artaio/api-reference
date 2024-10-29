defmodule DocsWeb.Schemas.Response.Organization do
  alias OpenApiSpex.Schema

  require OpenApiSpex

  OpenApiSpex.schema(%{
    title: "Organization",
    type: :object,
    properties: %{
      api_version: %Schema{
        type: "string"
      },
      billing_terms: %Schema{
        type: "string"
      },
      company_name: %Schema{
        type: "string"
      },
      created_at: %Schema{
        type: "string"
      },
      display_name: %Schema{
        type: "string"
      },
      id: %Schema{
        type: "integer",
        format: "int64"
      },
      name: %Schema{
        type: "string"
      },
      shortcode: %Schema{
        type: "string"
      },
      status: %Schema{
        type: "string"
      },
      updated_at: %Schema{
        type: "string"
      }
    },
    example: %{
      "api_version" => "2021-01-01",
      "billing_terms" => "invoicing",
      "company_name" => "Hudson Street Collective LLC",
      "created_at" => "2022-10-23T13:39:12.504731",
      "display_name" => "Hudson Street",
      "id" => 4392,
      "name" => "Hudson Street Gallery",
      "shortcode" => "HSC",
      "status" => "active",
      "updated_at" => "2023-05-02T23:13:31.193097"
    }
  })
end
