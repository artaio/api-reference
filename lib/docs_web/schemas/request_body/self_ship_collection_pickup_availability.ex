defmodule DocsWeb.Schemas.RequestBody.SelfShipCollectionPickupAvailability do
  alias OpenApiSpex.Schema

  require OpenApiSpex

  OpenApiSpex.schema(%Schema{
    title: "SelfShipCollectionPickupAvailability",
    type: :object,
    required: [
      "address_line_1",
      "city",
      "region",
      "postal_code",
      "country",
      "collection_date",
      "customer_close_time",
      "country_relationships",
      "service_level"
    ],
    properties: %{
      address_line_1: %Schema{
        type: :string,
        description: "The primary address for the pickup location",
        example: "11 W 53rd St"
      },
      address_line_2: %Schema{
        type: :string,
        description: "A secondary address for the pickup location",
        nullable: true,
        example: "Suite 100"
      },
      city: %Schema{
        type: :string,
        description: "The city of the pickup address",
        example: "New York"
      },
      region: %Schema{
        type: :string,
        description: "The state or region of the pickup address",
        example: "NY"
      },
      postal_code: %Schema{
        type: :string,
        description: "The postal code of the pickup address",
        example: "10019"
      },
      country: %Schema{
        type: :string,
        description: "The country code. Supported countries: US and GB",
        example: "US"
      },
      collection_date: %Schema{
        type: :string,
        format: :date,
        description: "The desired collection date in YYYY-MM-DD format",
        example: "2024-03-15"
      },
      customer_close_time: %Schema{
        type: :string,
        description: "The cutoff time in HH:MM:SS format",
        example: "17:00:00"
      },
      country_relationships: %Schema{
        type: :string,
        description: "The country relationship for the collection",
        enum: ["domestic", "international"],
        example: "domestic"
      },
      service_level: %Schema{
        type: :string,
        description: "The service level for the collection",
        enum: ["ground", "express"],
        example: "express"
      }
    }
  })
end
