defmodule DocsWeb.Schemas.Response.InvoicePayment do
  alias OpenApiSpex.Schema

  require OpenApiSpex

  OpenApiSpex.schema(%{
    title: "InvoicePayment",
    type: :object,
    properties: %{
      amount: %Schema{
        type: :string
      },
      amount_currency: %Schema{
        type: :string
      },
      created_at: %Schema{
        type: :string
      },
      id: %Schema{
        type: :integer
      },
      invoice_id: %Schema{
        type: :integer
      },
      payment_id: %Schema{
        type: :integer
      },
      shipment_id: %Schema{
        type: :string,
        nullable: true
      },
      updated_at: %Schema{
        type: :string
      }
    },
    example: %{
      "amount" => "502.25",
      "amount_currency" => "USD",
      "created_at" => "2021-02-19T19:09:57.971464",
      "id" => 1,
      "invoice_id" => 11,
      "payment_id" => 1,
      "shipment_id" => "45360593-6c6c-44ab-8a17-0fd198fff058",
      "updated_at" => "2021-02-19T19:09:57.971464"
    }
  })
end
