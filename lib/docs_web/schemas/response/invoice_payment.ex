defmodule DocsWeb.Schemas.Response.InvoicePayment do
  alias OpenApiSpex.Schema

  require OpenApiSpex

  OpenApiSpex.schema(%{
    title: "InvoicePayment",
    type: :object,
    properties: %{
      amount_owed: %Schema{
        type: :string
      },
      amount_owed_currency: %Schema{
        type: :string
      },
      amount_paid: %Schema{
        type: :string
      },
      amount_paid_currency: %Schema{
        type: :string
      },
      created_at: %Schema{
        type: :string
      },
      invoice_url: %Schema{
        type: :string,
        nullable: true
      },
      id: %Schema{
        type: :integer
      },
      issued_on: %Schema{
        type: :string,
        nullable: true
      },
      shipment_id: %Schema{
        type: :string,
        nullable: true
      },
      status: %Schema{
        type: :string
      },
      updated_at: %Schema{
        type: :string
      }
    },
    example: %{
      "amount_owed" => "276.91",
      "amount_owed_currency" => "USD",
      "amount_paid" => "276.91",
      "amount_paid_currency" => "USD",
      "created_at" => "2021-03-10T20:15:34.096258",
      "invoice_url" => nil,
      "id" => 2216,
      "issued_on" => "2021-03-10",
      "shipment_id" => "53d6bdec-1eae-46e2-97c2-3e56b1a1095d",
      "status" => "closed",
      "updated_at" => "2021-03-10T20:16:10.202836"
    }
  })
end
