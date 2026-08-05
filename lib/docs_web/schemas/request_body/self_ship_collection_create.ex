defmodule DocsWeb.Schemas.RequestBody.SelfShipCollectionCreate do
  alias OpenApiSpex.Schema

  require OpenApiSpex

  OpenApiSpex.schema(%Schema{
    title: "SelfShipCollectionCreate",
    type: :object,
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
                  "State or territory code. Required and validated for `US` (must be a valid US state/territory code). Stripped to empty string for `GB`.",
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
                description:
                  "Where packages are located at the pickup location. Optional. This is a FedEx-only dispatch hint and is ignored for DHL collections.",
                enum: ["front", "none", "rear", "side"]
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
            required: ["carrier", "code"],
            properties: %{
              carrier: %Schema{
                type: :string,
                description: "Carrier identifier. `fedex` and `dhl` are supported.",
                enum: ["fedex", "dhl"]
              },
              code: %Schema{
                type: :string,
                description: "Service level code",
                enum: ["express", "ground"]
              },
              route: %Schema{
                type: :string,
                description:
                  "Route type. For DHL collections this drives customs handling: `international` marks the pickup as customs-declarable, while `domestic` does not (the resulting `is_customs_declarable` value is derived server-side and is not a request field). Ignored for FedEx.",
                enum: ["domestic", "international"],
                nullable: true
              },
              package_details: %Schema{
                title: "SelfShipCollectionPackageDetails",
                description:
                  "Package information for the collection. **Required for `dhl`** and provided as per-package dimensions and weight. **Optional for `fedex`** and provided as a package-count and total-weight summary; when omitted, existing FedEx behavior is unchanged.",
                oneOf: [
                  %Schema{
                    title: "DhlPackageDetails",
                    type: :object,
                    description:
                      "DHL package details. Provide one entry per package. All packages must share the same units, and the unit pair must be either `in` + `lb` or `cm` + `kg`.",
                    required: ["packages"],
                    properties: %{
                      packages: %Schema{
                        type: :array,
                        description: "The packages included in the collection. Must contain at least one package.",
                        minItems: 1,
                        items: %Schema{
                          type: :object,
                          required: ["depth", "height", "width", "unit_of_measurement", "weight", "weight_unit"],
                          properties: %{
                            depth: %Schema{type: :number, description: "Package depth", example: 12},
                            height: %Schema{type: :number, description: "Package height", example: 8},
                            width: %Schema{type: :number, description: "Package width", example: 10},
                            unit_of_measurement: %Schema{
                              type: :string,
                              description:
                                "Unit for `depth`, `height`, and `width`. Must be `in` when `weight_unit` is `lb`, or `cm` when `weight_unit` is `kg`.",
                              enum: ["in", "cm"],
                              example: "in"
                            },
                            weight: %Schema{type: :number, description: "Package weight", example: 5},
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
                          "depth" => 12,
                          "height" => 8,
                          "width" => 10,
                          "unit_of_measurement" => "in",
                          "weight" => 5,
                          "weight_unit" => "lb"
                        }
                      ]
                    }
                  },
                  %Schema{
                    title: "FedexPackageDetails",
                    type: :object,
                    description:
                      "FedEx package details: a summary of the total package count and weight for the pickup. Optional; when provided, the values are forwarded to FedEx as `packageCount` and `totalWeight`.",
                    required: ["package_count", "total_weight", "total_weight_unit"],
                    properties: %{
                      package_count: %Schema{
                        type: :integer,
                        description: "Total number of packages in the pickup",
                        example: 3
                      },
                      total_weight: %Schema{
                        type: :number,
                        description: "Combined weight of all packages",
                        example: 15
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
                      "total_weight" => 15,
                      "total_weight_unit" => "lb"
                    }
                  }
                ]
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
    },
    required: ["self_ship_collection"],
    additionalProperties: false
  })
end
