defmodule DocsWeb.Schemas.RequestBody.ImportCostEstimateCreate do
  alias OpenApiSpex.Schema
  alias DocsWeb.Schemas.Currency

  require OpenApiSpex

  OpenApiSpex.schema(%{
    title: "ImportCostEstimateCreate",
    description: "Request body for creating an import cost estimate",
    type: :object,
    properties: %{
      import_cost_estimate: %Schema{
        type: :object,
        properties: %{
          currency: Currency.schema(),
          destination: %Schema{
            type: :object,
            description: "Details about the destination where it will be imported to",
            properties: %{
              city: %Schema{
                type: :string,
                nullable: true
              },
              country: %Schema{
                type: :string,
                description: "ISO 3166-1 alpha-2 country code of the destination"
              },
              postal_code: %Schema{
                type: :string,
                nullable: true
              },
              region: %Schema{
                type: :string,
                nullable: true,
                description: "State, province, or region of the destination"
              }
            }
          },
          end_use: %Schema{
            type: :string,
            nullable: true,
            description:
              "Optional field specifying the end use of the goods (e.g., resale, personal use)"
          },
          objects: %Schema{
            type: :array,
            description: "List of objects/items being imported",
            items: %Schema{
              type: :object,
              properties: %{
                reference: %Schema{
                  type: :string,
                  nullable: true
                },
                value_currency: %Schema{
                  type: :string,
                  nullable: true,
                  description: "Currency code (ISO 4217) used for the object's declared value"
                },
                value: %Schema{
                  type: :string,
                  description: "Declared value of the object"
                },
                hs_code: %Schema{
                  type: :string,
                  description: "Harmonized System (HS) tariff code for the object"
                },
                country_of_origin: %Schema{
                  type: :string,
                  nullable: true
                }
              }
            }
          },
          origin: %Schema{
            type: :object,
            properties: %{
              country: %Schema{
                type: :string,
                description: "ISO 3166-1 alpha-2 country code of the origin"
              }
            }
          },
          reference: %Schema{
            type: :string,
            nullable: true,
            description: "Optional reference string for tracking the estimate or related process"
          },
          transport: %Schema{
            type: :object,
            description: "Information about the transport method and cost",
            properties: %{
              service_level: %Schema{
                type: :string,
                description:
                  "Service level for transport (e.g., ups_expedited, fedex_international_first etc)"
              },
              amount_currency: %Schema{
                type: :string,
                nullable: true,
                description: "Currency code (ISO 4217) for the transport amount (optional)"
              },
              amount: %Schema{
                type: :string,
                description: "Total transport cost"
              }
            }
          }
        },
        required: [
          "destination",
          "origin",
          "objects",
          "transport"
        ]
      }
    },
    required_properties: [:import_cost_estimate],
    example: %{
      import_cost_estimate: %{
        currency: "USD",
        objects: [
          %{
            reference: "ceramic-vase-maria-lundqvist",
            value: "10869.45",
            hs_code: "691390"
          }
        ],
        destination: %{
          country: "CA",
          region: "ON"
        },
        origin: %{
          country: "US"
        },
        transport: %{
          amount: "20000",
          service_level: "ups_expedited"
        }
      }
    }
  })
end
