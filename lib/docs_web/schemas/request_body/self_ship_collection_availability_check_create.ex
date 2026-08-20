defmodule DocsWeb.Schemas.RequestBody.SelfShipCollectionAvailabilityCheckCreate do
  alias OpenApiSpex.Schema

  require OpenApiSpex

  OpenApiSpex.schema(%Schema{
    title: "SelfShipCollectionAvailabilityCheckCreate",
    type: :object,
    properties: %{
      self_ship_collection_availability_check: %Schema{
        type: :object,
        required: ["location", "service", "collection_date"],
        properties: %{
          location: %Schema{
            type: :object,
            description: "Pickup location to check availability for",
            required: ["address_line_1", "city", "country", "postal_code", "close_time"],
            properties: %{
              address_line_1: %Schema{
                type: :string,
                description: "Street address",
                minLength: 1,
                example: "123 Main St"
              },
              address_line_2: %Schema{
                type: :string,
                description: "Additional address info",
                nullable: true
              },
              city: %Schema{
                type: :string,
                description: "City",
                minLength: 1,
                example: "New York"
              },
              country: %Schema{
                type: :string,
                description: "Two-letter country code. Currently `US` and `GB` are supported.",
                maxLength: 2,
                minLength: 2,
                example: "US"
              },
              region: %Schema{
                type: :string,
                description: "State or province code",
                nullable: true,
                example: "NY"
              },
              postal_code: %Schema{
                type: :string,
                description: "Postal code",
                minLength: 1,
                example: "10001"
              },
              close_time: %Schema{
                type: :string,
                description: "Location closing time in ISO 8601 format (`HH:MM:SS`)",
                example: "17:00:00"
              }
            }
          },
          service: %Schema{
            type: :object,
            description: "Carrier service to check availability for",
            required: ["carrier", "code", "route"],
            properties: %{
              carrier: %Schema{
                type: :string,
                description: "Carrier identifier",
                enum: ["fedex"]
              },
              code: %Schema{
                type: :string,
                description: "Service level code",
                enum: ["ground", "express"]
              },
              route: %Schema{
                type: :string,
                description: "Route type",
                enum: ["domestic", "international"]
              }
            }
          },
          collection_date: %Schema{
            type: :string,
            format: :date,
            description: "Date to check availability for in ISO 8601 format (`YYYY-MM-DD`)",
            example: "2026-03-06"
          }
        }
      }
    },
    required: ["self_ship_collection_availability_check"],
    additionalProperties: false
  })
end
