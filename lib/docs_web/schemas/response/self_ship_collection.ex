defmodule DocsWeb.Schemas.Response.SelfShipCollection do
  alias OpenApiSpex.Schema

  require OpenApiSpex

  OpenApiSpex.schema(%{
    title: "SelfShipCollection",
    type: :object,
    properties: %{
      id: %Schema{
        type: :string,
        format: :uuid,
        description: "The ID of the self-ship collection in UUID format"
      },
      status: %Schema{
        type: :string,
        description: "The current status of the collection",
        example: "scheduled",
        enum: ["scheduled", "closed", "cancelled", "incomplete"]
      },
      shortcode: %Schema{
        type: :string,
        description: "A human-readable identifier for the collection",
        example: "SSC123"
      },
      created_at: %Schema{
        type: :string,
        description:
          "A NaiveDatetime-formatted timestamp describing when the resource was created with microsecond precision",
        example: "2026-03-01T12:00:00.000000"
      },
      updated_at: %Schema{
        type: :string,
        description:
          "A NaiveDatetime-formatted timestamp describing when the resource was last updated with microsecond precision",
        example: "2026-03-01T12:00:00.000000"
      },
      closed_at: %Schema{
        type: :string,
        description: "A NaiveDatetime-formatted timestamp describing when the collection was closed",
        nullable: true,
        example: nil
      },
      collection_date: %Schema{
        type: :string,
        format: :date,
        description: "The pickup date in ISO 8601 format (`YYYY-MM-DD`).",
        example: "2026-03-06"
      },
      collection_time: %Schema{
        type: :string,
        description: "The pickup time in ISO 8601 format (`HH:MM:SS`).",
        example: "10:00:00"
      },
      location: %Schema{
        type: :object,
        description: "The pickup location details",
        properties: %{
          address_line_1: %Schema{
            type: :string,
            description: "Street address"
          },
          address_line_2: %Schema{
            type: :string,
            description: "Additional address info",
            nullable: true
          },
          city: %Schema{
            type: :string,
            description: "City"
          },
          country: %Schema{
            type: :string,
            description: "Two-letter country code",
            example: "US"
          },
          region: %Schema{
            type: :string,
            description: "State or province code",
            example: "NY"
          },
          postal_code: %Schema{
            type: :string,
            description: "Postal code"
          },
          close_time: %Schema{
            type: :string,
            description: "Location closing time in ISO 8601 format (`HH:MM:SS`)",
            example: "17:00:00"
          },
          package_location: %Schema{
            type: :string,
            description: "Where packages are located at the pickup location",
            enum: ["front", "none", "rear", "side"]
          },
          contact: %Schema{
            type: :object,
            description: "Contact at the pickup location",
            properties: %{
              email_address: %Schema{
                type: :string,
                description: "Contact email address"
              },
              name: %Schema{
                type: :string,
                description: "Contact name"
              },
              phone_number: %Schema{
                type: :string,
                description: "Contact phone number"
              }
            }
          }
        }
      },
      service: %Schema{
        type: :object,
        description: "Carrier service details",
        properties: %{
          carrier: %Schema{
            type: :string,
            description: "Carrier identifier",
            enum: ["fedex"]
          },
          code: %Schema{
            type: :string,
            description: "Service level code",
            enum: ["express", "ground"]
          },
          route: %Schema{
            type: :string,
            description: "Route type",
            enum: ["domestic", "international"]
          }
        }
      }
    },
    example: %{
      "id" => "550e8400-e29b-41d4-a716-446655440000",
      "status" => "scheduled",
      "shortcode" => "SSC123",
      "created_at" => "2026-03-01T12:00:00.000000",
      "updated_at" => "2026-03-01T12:00:00.000000",
      "closed_at" => nil,
      "collection_date" => "2026-03-06",
      "collection_time" => "10:00:00",
      "location" => %{
        "address_line_1" => "123 Main St",
        "address_line_2" => nil,
        "city" => "New York",
        "country" => "US",
        "region" => "NY",
        "postal_code" => "10001",
        "close_time" => "17:00:00",
        "package_location" => "front",
        "contact" => %{
          "email_address" => "john@example.com",
          "name" => "John Doe",
          "phone_number" => "+1-555-123-4567"
        }
      },
      "service" => %{
        "carrier" => "fedex",
        "code" => "express",
        "route" => "domestic"
      }
    }
  })
end
