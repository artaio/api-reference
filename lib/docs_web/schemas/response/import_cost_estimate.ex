defmodule DocsWeb.Schemas.Response.ImportCostEstimate do
  require OpenApiSpex
  alias OpenApiSpex.Schema
  alias DocsWeb.Schemas.Currency

  OpenApiSpex.schema(%{
    title: "ImportCostEstimate",
    type: :object,
    properties: %{
      id: %Schema{
        type: :string,
        format: :uuid,
        description: "Unique identifier for the import cost estimate"
      },
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
            description: "State, province, or region of the destination."
          }
        }
      },
      end_use: %Schema{
        type: :string,
        nullable: true,
        description: "The end use of the goods",
        enum: [
          "for_resale",
          "not_for_resale"
        ]
      },
      origin: %Schema{
        type: :object,
        description: "Details about the origin location",
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
        description: "Reference string for identifying the estimate in your systems"
      },
      shortcode: %Schema{
        type: :string,
        description:
          "Short automatically generated reference code for the identifying import cost estimate in Arta's system"
      },
      status: %Schema{
        type: :string,
        description: "Status of the import cost estimate calculation",
        enum: ["failed", "success"]
      },
      transport: %Schema{
        type: :object,
        description: "Information about the transport method and cost",
        properties: %{
          service_level: %Schema{
            type: :string,
            description:
              "Service level for transport (e.g., ups_expedited, fedex_international_first etc). Options are listed in the reference rate service levels metadata endpoint"
          },
          amount: %Schema{
            type: :string,
            description: "Total transport cost"
          },
          amount_currency: %Schema{
            type: :string,
            nullable: true,
            description: "Currency code (ISO 4217) for the transport amount"
          }
        }
      },
      objects: %Schema{
        type: :array,
        description: "List of objects/items being imported",
        items: %Schema{
          type: :object,
          properties: %{
            value: %Schema{
              type: :string,
              description: "Declared value of the object"
            },
            quantity: %Schema{
              type: :number,
              nullable: true,
              description: "Quantity of the object"
            },
            value_currency: %Schema{
              type: :string,
              nullable: true,
              description: "Currency code (ISO 4217) used for the object's declared value"
            },
            hs_code: %Schema{
              type: :string,
              description: "Harmonized System (HS) tariff code for the object"
            },
            reference: %Schema{
              type: :string,
              nullable: true,
              description: "Reference identifier for the object"
            },
            country_of_origin: %Schema{
              type: :string,
              nullable: true,
              description: "ISO 3166-1 alpha-2 country code where the object originated"
            }
          }
        }
      },
      estimate: %Schema{
        type: :object,
        description: "Breakdown of the estimated import costs",
        properties: %{
          line_items: %Schema{
            type: :array,
            description: "Detailed breakdown of individual charges",
            items: %Schema{
              type: :object,
              properties: %{
                description: %Schema{
                  type: :string,
                  description: "Description of the charge"
                },
                subtype: %Schema{
                  type: :string,
                  description: "Subtype classification of the charge"
                },
                type: %Schema{
                  type: :string,
                  description: "Type of charge (e.g., duty, tax, fee)"
                },
                amount: %Schema{
                  type: :string,
                  description: "Amount of the charge in the estimate currency"
                }
              }
            }
          },
          summary: %Schema{
            type: :object,
            description: "Summary totals of the import cost estimate",
            properties: %{
              fees: %Schema{
                type: :string,
                description: "Total fees amount"
              },
              duties: %Schema{
                type: :string,
                description: "Total duties amount"
              },
              taxes: %Schema{
                type: :string,
                description: "Total taxes amount"
              }
            }
          }
        }
      }
    },
    example: %{
      id: "30e1d8e7-f175-46c7-afee-8aa16c9d988b",
      currency: "USD",
      destination: %{
        city: nil,
        country: "CA",
        postal_code: nil,
        region: "ON"
      },
      end_use: "for_resale",
      estimate: %{
        line_items: [
          %{
            amount: "706.51",
            description: "duty",
            subtype: "item",
            type: "duty"
          }
        ],
        summary: %{
          fees: "147.13",
          duties: "2119.53",
          taxes: "1754.97"
        }
      },
      objects: [
        %{
          country_of_origin: nil,
          hs_code: "691390",
          quantity: 1,
          reference: "ceramic-vase-maria-lundqvist",
          value: "10869.45",
          value_currency: "USD"
        }
      ],
      origin: %{
        country: "BR"
      },
      reference: nil,
      shortcode: "JANANI-I5Y6SR",
      status: "success",
      transport: %{
        amount: "20000.00",
        amount_currency: "USD",
        service_level: "ups_expedited"
      }
    }
  })
end
