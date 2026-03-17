defmodule DocsWeb.Schemas.Response.SelfShipCollectionAvailabilityCheck do
  alias OpenApiSpex.Schema

  require OpenApiSpex

  OpenApiSpex.schema(%{
    title: "SelfShipCollectionAvailabilityCheck",
    type: :object,
    properties: %{
      location: %Schema{
        type: :object,
        description: "The pickup location that was checked",
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
          region: %Schema{
            type: :string,
            description: "State or province code",
            example: "NY"
          },
          postal_code: %Schema{
            type: :string,
            description: "Postal code"
          },
          country: %Schema{
            type: :string,
            description: "Two-letter country code",
            example: "US"
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
        description: "The carrier service that was checked",
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
        description: "The date that was checked for availability (`YYYY-MM-DD`)",
        example: "2026-03-06"
      },
      availabilities: %Schema{
        type: :array,
        description: "Available pickup slots. May be empty if no slots are available.",
        items: %Schema{
          type: :object,
          properties: %{
            collection_date: %Schema{
              type: :string,
              format: :date,
              description: "Available pickup date (`YYYY-MM-DD`)",
              example: "2026-03-06"
            },
            collection_times: %Schema{
              type: :array,
              description: "Available pickup times in ISO 8601 format (`HH:MM:SS`)",
              items: %Schema{
                type: :string,
                example: "07:00:00"
              }
            },
            residential_available: %Schema{
              type: :boolean,
              description: "Whether residential pickup is available"
            }
          }
        }
      }
    },
    example: %{
      "location" => %{
        "address_line_1" => "123 Main St",
        "city" => "New York",
        "region" => "NY",
        "postal_code" => "10001",
        "country" => "US",
        "close_time" => "17:00:00"
      },
      "service" => %{
        "carrier" => "fedex",
        "code" => "ground",
        "route" => "domestic"
      },
      "collection_date" => "2026-03-06",
      "availabilities" => [
        %{
          "collection_date" => "2026-03-06",
          "collection_times" => ["07:00:00", "07:30:00", "08:00:00"],
          "residential_available" => true
        }
      ]
    }
  })
end
