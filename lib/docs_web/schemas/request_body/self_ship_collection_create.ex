defmodule DocsWeb.Schemas.RequestBody.SelfShipCollectionCreate do
  alias OpenApiSpex.Schema

  require OpenApiSpex

  OpenApiSpex.schema(%Schema{
    title: "SelfShipCollectionCreate",
    type: :object,
    properties: %{
      self_ship_collection: %Schema{
        type: :object,
        required: [
          "address_line_1",
          "carrier",
          "city",
          "contact_name",
          "contact_phone",
          "country",
          "country_relationships",
          "customer_close_time",
          "package_location",
          "postal_code",
          "collection_date",
          "collection_time",
          "region",
          "service_level"
        ],
        properties: %{
          address_line_1: %Schema{
            type: :string,
            description: "The primary address for the collection pickup",
            example: "11 W 53rd St"
          },
          address_line_2: %Schema{
            type: :string,
            description: "The address complements",
            nullable: true,
            example: "Suite 100"
          },
          city: %Schema{
            type: :string,
            description: "The city of the collection pickup address",
            example: "New York"
          },
          region: %Schema{
            type: :string,
            description:
              "The state or province of the collection pickup address. Required for US addresses. Must be a valid 2-letter US state/territory code",
            example: "NY"
          },
          postal_code: %Schema{
            type: :string,
            description: "The postal code of the collection pickup address",
            example: "10019"
          },
          country: %Schema{
            type: :string,
            description: "The country code of the collection pickup address. Supported countries: US and GB",
            example: "US"
          },
          carrier: %Schema{
            type: :string,
            description: "The carrier for the collection. Supported carriers: FedEx",
            enum: ["fedex"],
            example: "fedex"
          },
          contact_name: %Schema{
            type: :string,
            description: "The name of the contact at the pickup address",
            example: "Jane Doe"
          },
          contact_email: %Schema{
            type: :string,
            description: "The email of the contact at the pickup address",
            nullable: true,
            example: "jane@example.com"
          },
          contact_phone: %Schema{
            type: :string,
            description: "The phone number of the contact at the pickup address",
            nullable: true,
            example: "2125551234"
          },
          collection_date: %Schema{
            type: :string,
            format: :date,
            description: "The calendar date of the collection pickup in YYYY-MM-DD format",
            example: "2024-03-15"
          },
          collection_time: %Schema{
            type: :string,
            description: "The start of the collection pickup window in HH:MM:SS format",
            example: "10:00:00"
          },
          customer_close_time: %Schema{
            type: :string,
            description: "The cutoff time for the collection in HH:MM:SS format. Must be after the collection_time",
            example: "17:00:00"
          },
          service_level: %Schema{
            type: :string,
            description: "The service level for the collection",
            enum: ["express", "ground"],
            example: "express"
          },
          country_relationships: %Schema{
            type: :string,
            description: "The country relationship for the collection",
            enum: ["domestic", "international"],
            example: "domestic"
          },
          package_location: %Schema{
            type: :string,
            description: "The location of the packages at the pickup address. Defaults to \"none\"",
            enum: ["front", "none", "rear", "side"],
            example: "front"
          },
          metadata: %Schema{
            type: :object,
            description: "Arbitrary key-value metadata to associate with the collection",
            example: %{"key" => "value"}
          }
        }
      }
    },
    required: ["self_ship_collection"],
    additionalProperties: false
  })
end
