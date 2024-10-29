defmodule DocsWeb.Schemas.Response.Payment do
  alias OpenApiSpex.Schema

  require OpenApiSpex

  OpenApiSpex.schema(%{
    title: "Payment",
    type: :object,
    properties: %{
      amount: %Schema{
        type: "string"
      },
      amount_currency: %Schema{
        type: "string"
      },
      created_at: %Schema{
        type: "string"
      },
      context: %Schema{
        type: "string"
      },
      id: %Schema{
        type: "integer"
      },
      paid_on: %Schema{
        type: "string",
        nullable: true
      },
      updated_at: %Schema{
        type: "string"
      }
    },
    example: %{
      "amount" => "502.25",
      "amount_currency" => "USD",
      "context" => "hosted_checkout",
      "created_at" => "2021-02-19T19:09:57.954437",
      "id" => 1,
      "paid_on" => "2021-02-19",
      "updated_at" => "2021-02-19T19:09:57.954437"
    }
  })
end
