defmodule DocsWeb.Schemas.RequestBody.SelfShipCollectionCreateDhl do
  alias DocsWeb.Schemas.{Currency, MonetaryAmount}
  alias OpenApiSpex.Schema

  require OpenApiSpex

  OpenApiSpex.schema(%Schema{
    title: "DhlSelfShipCollectionPayload",
    description: "Schedule a DHL collection",
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
                  "State or territory code. Required and validated for `US` (must be a valid US state/territory code). May be an empty string for `GB`.",
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
                description:
                  "Location closing time in ISO 8601 format (`HH:MM:SS`). Must be at least 3 hours after `collection_time`.",
                example: "17:00:00"
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
            required: ["carrier", "code", "route", "package_details"],
            properties: %{
              carrier: %Schema{
                type: :string,
                description: "Carrier identifier",
                enum: ["dhl"]
              },
              code: %Schema{
                type: :string,
                description: "Service level code. Has no effect on DHL collections.",
                enum: ["express", "ground"]
              },
              route: %Schema{
                type: :string,
                description:
                  "Route type. `international` for cross-border collections, `domestic` otherwise. An `international` collection is subject to customs and requires `declared_value` and `declared_value_currency`.",
                enum: ["domestic", "international"]
              },
              declared_value: %Schema{
                MonetaryAmount.schema()
                | description:
                    "Declared value of the collected packages, as a decimal string in major currency units. Required when `route` is `international`; optional for `domestic` collections. Must be provided together with `declared_value_currency`.",
                  example: "500.00"
              },
              declared_value_currency: %Schema{
                Currency.schema()
                | description:
                    "ISO 4217 three-letter currency code for `declared_value`. Options are defined in the Currencies metadata endpoint. Required whenever `declared_value` is provided.",
                  default: nil
              },
              package_details: %Schema{
                title: "DhlPackageDetails",
                type: :object,
                description:
                  "The packages to be collected, one entry per package. All packages must share the same units, and the unit pair must be either `in` + `lb` or `cm` + `kg`.",
                required: ["packages"],
                properties: %{
                  packages: %Schema{
                    type: :array,
                    minItems: 1,
                    description:
                      "The packages included in the collection. Must contain at least one package. Dimensions and weight are numeric strings (for example `\"12\"` or `\"12.5\"`), following the same convention as `request.objects`; a value that cannot be parsed as a number is rejected with a `422`.",
                    items: %Schema{
                      title: "DhlPackage",
                      type: :object,
                      required: ["depth", "height", "width", "unit_of_measurement", "weight", "weight_unit"],
                      properties: %{
                        depth: %Schema{type: :string, description: "Package depth", example: "12"},
                        height: %Schema{type: :string, description: "Package height", example: "8"},
                        width: %Schema{type: :string, description: "Package width", example: "10"},
                        unit_of_measurement: %Schema{
                          type: :string,
                          description:
                            "Unit for `depth`, `height`, and `width`. Must be `in` when `weight_unit` is `lb`, or `cm` when `weight_unit` is `kg`.",
                          enum: ["in", "cm"],
                          example: "in"
                        },
                        weight: %Schema{type: :string, description: "Package weight", example: "5.5"},
                        weight_unit: %Schema{
                          type: :string,
                          description:
                            "Unit for `weight`. Must be `lb` when `unit_of_measurement` is `in`, or `kg` when it is `cm`.",
                          enum: ["lb", "kg"],
                          example: "lb"
                        }
                      }
                    }
                  }
                },
                example: %{
                  "packages" => [
                    %{
                      "depth" => "12",
                      "height" => "8",
                      "width" => "10",
                      "unit_of_measurement" => "in",
                      "weight" => "5.5",
                      "weight_unit" => "lb"
                    }
                  ]
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
