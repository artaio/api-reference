defmodule DocsWeb.Schemas.RequestBody.SelfShipCollectionCreateFedex do
  alias OpenApiSpex.Schema

  require OpenApiSpex

  OpenApiSpex.schema(%Schema{
    title: "FedexSelfShipCollectionPayload",
    description: "Schedule a FedEx collection",
    type: :object,
    required: ["self_ship_collection"],
    additionalProperties: false,
    properties: %{
      self_ship_collection: %Schema{
        type: :object,
        required: ["location", "service", "collection_date", "collection_time"],
        properties: %{
          location: %Schema{
            type: :object,
            description: "Pickup location details",
            required: [
              "address_line_1",
              "city",
              "country",
              "region",
              "postal_code",
              "close_time",
              "contact"
            ],
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
                example: "US"
              },
              region: %Schema{
                type: :string,
                description:
                  "State or territory code. Required for `US` addresses and must be a valid US state or territory code; may be an empty string for `GB` addresses.",
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
                description: "Location closing time in ISO 8601 format (`HH:MM:SS`). Must be after `collection_time`.",
                example: "17:00:00"
              },
              package_location: %Schema{
                type: :string,
                description: "Where packages are located at the pickup location",
                enum: ["front", "none", "rear", "side"],
                default: "none"
              },
              contact: %Schema{
                type: :object,
                description: "Contact at the pickup location",
                required: ["name", "phone_number"],
                properties: %{
                  name: %Schema{
                    type: :string,
                    description: "Contact name",
                    example: "John Doe"
                  },
                  phone_number: %Schema{
                    type: :string,
                    description: "Contact phone number",
                    example: "+1-555-123-4567"
                  },
                  email_address: %Schema{
                    type: :string,
                    description: "Contact email address",
                    nullable: true,
                    example: "john@example.com"
                  }
                }
              }
            }
          },
          service: %Schema{
            type: :object,
            description: "Carrier service details",
            required: ["carrier", "code", "route"],
            properties: %{
              carrier: %Schema{
                type: :string,
                description: "Carrier identifier",
                enum: ["fedex"]
              },
              code: %Schema{
                type: :string,
                description:
                  "Service level code. `ground` schedules a FedEx Ground collection; `express` schedules a FedEx Express collection.",
                enum: ["express", "ground"]
              },
              route: %Schema{
                type: :string,
                description: "Route type. `international` for cross-border collections, `domestic` otherwise.",
                enum: ["domestic", "international"]
              },
              package_details: %Schema{
                title: "FedexPackageDetails",
                type: :object,
                description:
                  "An optional summary of the packages to be collected, used for `express` collections. Provide `package_count`, `total_weight`, and `total_weight_unit` together; a partial summary, or one whose values cannot be parsed, is ignored rather than rejected.",
                properties: %{
                  package_count: %Schema{
                    type: :integer,
                    minimum: 0,
                    description: "Total number of packages in the collection",
                    example: 3
                  },
                  total_weight: %Schema{
                    type: :string,
                    description: "Combined weight of all packages",
                    example: "15.5"
                  },
                  total_weight_unit: %Schema{
                    type: :string,
                    description: "Unit for `total_weight`",
                    enum: ["lb", "kg"],
                    example: "lb"
                  }
                },
                example: %{
                  "package_count" => 3,
                  "total_weight" => "15.5",
                  "total_weight_unit" => "lb"
                }
              }
            }
          },
          collection_date: %Schema{
            type: :string,
            format: :date,
            description: "Pickup date in ISO 8601 format (`YYYY-MM-DD`). Must be in the future.",
            example: "2026-03-06"
          },
          collection_time: %Schema{
            type: :string,
            description: "Pickup time in ISO 8601 format (`HH:MM:SS`). Must be before `location.close_time`.",
            example: "10:00:00"
          }
        }
      }
    }
  })
end
