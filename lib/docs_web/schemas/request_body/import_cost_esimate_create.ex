defmodule DocsWeb.Schemas.RequestBody.ImportCostEstimateCreate do
  alias OpenApiSpex.Schema
  alias DocsWeb.Schemas.Currency

  require OpenApiSpex

  OpenApiSpex.schema(%Schema{
    title: "ImportCostEstimateCreate",
    oneOf: [
      %Schema{
        title: "DirectImportCostEstimatePayload",
        description:
          "Create an import cost estimate by providing origin, destination, objects, and transport details directly",
        type: :object,
        properties: %{
          import_cost_estimate: %Schema{
            type: :object,
            properties: %{
              currency: Currency.schema(),
              destination: %Schema{
                type: :object,
                description: "Details about the destination where it will be imported to",
                required: [
                  "country"
                ],
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
                    description:
                      "State, province, or region of the destination. May be required depending on the destination country."
                  }
                }
              },
              end_use: %Schema{
                type: :string,
                nullable: true,
                description: "Optional field specifying the end use of the goods",
                enum: [
                  "for_resale",
                  "not_for_resale"
                ]
              },
              objects: %Schema{
                type: :array,
                description: "List of objects/items being imported",
                items: %Schema{
                  type: :object,
                  required: [
                    "hs_code",
                    "value",
                    "value_currency"
                  ],
                  properties: %{
                    quantity: %Schema{
                      type: :number,
                      nullable: true,
                      description: "Quantity of the object"
                    },
                    reference: %Schema{
                      type: :string,
                      nullable: true,
                      description: "Reference identifier for the object"
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
                required: [
                  "country"
                ],
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
                description: "Optional reference string for identifying the estimate in your systems"
              },
              transport: %Schema{
                type: :object,
                description: "Information about the transport method and cost",
                required: [
                  "amount",
                  "amount_currency",
                  "service_level"
                ],
                properties: %{
                  service_level: %Schema{
                    type: :string,
                    description:
                      "Service level for transport (e.g., ups_expedited, fedex_international_first etc). Options are listed in the reference rate service levels metadata endpoint"
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
        required: ["import_cost_estimate"],
        additionalProperties: false,
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
      },
      %Schema{
        title: "ImportCostEstimateFromQuotePayload",
        description:
          "Create an import cost estimate from an existing quote. The quote provides transport, origin/destination, and object data. Objects on the quote's request must include hs_code for the estimate to be created.",
        type: :object,
        properties: %{
          import_cost_estimate: %Schema{
            type: :object,
            properties: %{
              quote_id: %Schema{
                type: :integer,
                format: :int64,
                description: "The ID of an existing quote to derive the import cost estimate from"
              },
              currency: Currency.schema(),
              end_use: %Schema{
                type: :string,
                nullable: true,
                description: "Optional field specifying the end use of the goods",
                enum: [
                  "for_resale",
                  "not_for_resale"
                ]
              },
              reference: %Schema{
                type: :string,
                nullable: true,
                description: "Optional reference string for identifying the estimate in your systems"
              }
            },
            required: [
              "quote_id"
            ]
          }
        },
        required: ["import_cost_estimate"],
        additionalProperties: false,
        example: %{
          import_cost_estimate: %{
            quote_id: 1234
          }
        }
      }
    ]
  })
end
