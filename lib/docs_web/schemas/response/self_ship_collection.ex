defmodule DocsWeb.Schemas.Response.SelfShipCollection do
  alias OpenApiSpex.Schema

  require OpenApiSpex

  OpenApiSpex.schema(%{
    type: :object,
    properties: %{
      id: %Schema{
        type: :string,
        description: "The id of the self ship collection in UUID format",
        format: :uuid
      },
      shortcode: %Schema{
        type: :string,
        description: "A brief identifier for this collection",
        example: "ORG-S1AB2C"
      },
      address_line_1: %Schema{
        type: :string,
        description: "The primary address for the collection pickup",
        example: "11 W 53rd St"
      },
      address_line_2: %Schema{
        type: :string,
        description: "A secondary address for the collection pickup",
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
          "The state or province of the collection pickup address. For US addresses, this is the 2-letter state code",
        nullable: true,
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
        description: "The carrier for the collection. Support carrier: FedEx.",
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
        description: "The cutoff time for the collection in HH:MM:SS format",
        example: "17:00:00"
      },
      status: %Schema{
        type: :string,
        description: "The status of the collection",
        enum: ["scheduled", "closed"],
        example: "scheduled"
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
      product_type: %Schema{
        type: :string,
        description: "The product type for the collection",
        enum: ["fedex_collection", "fedex_collection_saturday"],
        nullable: true,
        example: "fedex_collection"
      },
      package_location: %Schema{
        type: :string,
        description: "The location of the packages at the pickup address",
        enum: ["front", "none", "rear", "side"],
        example: "front"
      },
      closed_at: %Schema{
        type: :string,
        format: "date-time",
        description: "The timestamp when the collection was closed",
        nullable: true
      },
      created_by: %Schema{
        type: :integer,
        format: :int64,
        description: "The ID of the user who created the collection",
        nullable: true,
        example: 1234
      },
      error: %Schema{
        type: :object,
        description: "Error details from the carrier, if any",
        nullable: true
      },
      created_at: %Schema{
        type: :string,
        format: "date-time",
        description:
          "A NaiveDatetime-formatted timestamp describing when the resource was created with microsecond precision",
        example: "2024-03-15T08:00:00.000000"
      },
      updated_at: %Schema{
        type: :string,
        format: "date-time",
        description:
          "A NaiveDatetime-formatted timestamp describing when the resource was last updated with microsecond precision",
        example: "2024-03-15T08:00:00.000000"
      }
    },
    example: %{
      "id" => "b4a1e2c3-d4e5-6f7a-8b9c-0d1e2f3a4b5c",
      "shortcode" => "ORG-S1AB2C",
      "address_line_1" => "11 W 53rd St",
      "address_line_2" => nil,
      "city" => "New York",
      "region" => "NY",
      "postal_code" => "10019",
      "country" => "US",
      "carrier" => "fedex",
      "contact_name" => "Jane Doe",
      "contact_email" => "jane@example.com",
      "contact_phone" => "2125551234",
      "collection_date" => "2024-03-15",
      "collection_time" => "10:00:00",
      "customer_close_time" => "17:00:00",
      "status" => "scheduled",
      "service_level" => "express",
      "country_relationships" => "domestic",
      "product_type" => "fedex_collection",
      "package_location" => "front",
      "closed_at" => nil,
      "created_by" => 1234,
      "error" => nil,
      "created_at" => "2024-03-15T08:00:00.000000",
      "updated_at" => "2024-03-15T08:00:00.000000"
    }
  })
end
