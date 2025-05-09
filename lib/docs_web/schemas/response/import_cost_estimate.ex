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
        format: :uuid
      },
      currency: Currency.schema(),
      destination: %Schema{
        type: :object,
        properties: %{
          city: %Schema{
            type: :string,
            nullable: true
          },
          country: %Schema{
            type: :string
          },
          postal_code: %Schema{
            type: :string,
            nullable: true
          },
          region: %Schema{
            type: :string,
            nullable: true
          }
        }
      },
      end_use: %Schema{
        type: :string,
        nullable: true
      },
      origin: %Schema{
        type: :object,
        properties: %{
          country: %Schema{
            type: :string
          }
        }
      },
      reference: %Schema{
        type: :string,
        nullable: true
      },
      shortcode: %Schema{
        type: :string
      },
      status: %Schema{
        type: :string,
        enum: ["failed", "success"]
      },
      transport: %Schema{
        type: :object,
        properties: %{
          service_level: %Schema{
            type: :string
          },
          amount: %Schema{
            type: :string
          },
          amount_currency: %Schema{
            type: :string,
            nullable: true
          }
        }
      },
      objects: %Schema{
        type: :array,
        items: %Schema{
          type: :object,
          properties: %{
            value: %Schema{
              type: :string
            },
            quantity: %Schema{
              type: :number,
              nullable: true
            },
            value_currency: %Schema{
              type: :string,
              nullable: true
            },
            hs_code: %Schema{
              type: :string
            },
            reference: %Schema{
              type: :string,
              nullable: true
            },
            country_of_origin: %Schema{
              type: :string,
              nullable: true
            }
          }
        }
      },
      estimate: %Schema{
        type: :object,
        properties: %{
          line_items: %Schema{
            type: :array,
            items: %Schema{
              type: :object,
              properties: %{
                description: %Schema{
                  type: :string
                },
                subtype: %Schema{
                  type: :string
                },
                type: %Schema{
                  type: :string
                },
                amount: %Schema{
                  type: :string
                }
              }
            }
          },
          summary: %Schema{
            type: :object,
            properties: %{
              fees: %Schema{
                type: :string
              },
              duties: %Schema{
                type: :string
              },
              taxes: %Schema{
                type: :string
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
