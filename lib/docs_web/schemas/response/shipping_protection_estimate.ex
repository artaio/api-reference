defmodule DocsWeb.Schemas.Response.ShippingProtectionEstimate do
  alias DocsWeb.Schemas.Fields

  require OpenApiSpex

  OpenApiSpex.schema(%{
    title: "ShippingProtectionEstimate",
    type: :object,
    properties: Fields.shipping_protection_estimate_response_fields(),
    example: %{
      "created_at" => "2025-09-18T14:03:18.571418",
      "id" => "e7a928f6-109c-40d5-90b3-821ea263fe21",
      "insurance_policy" => %{
        "coverage_type" => "client_shipping",
        "id" => 35,
        "insurance_cost" => "64.54",
        "insurance_cost_currency" => "USD",
        "insured_value" => "3688.17",
        "insured_value_currency" => "USD",
        "shortcode" => "ARTA-IP02D8PCK"
      },
      "objects" => [
        %{
          "id" => 407,
          "insurance_policy_requirements" => %{
            "packaging" => [
              "cardboard_box",
              "double_box",
              "foam_lined_box",
              "portfolio",
              "shipping_tube_large",
              "shipping_tube_small",
              "strongbox"
            ],
            "services" => ["signature_delivery"],
            "transports" => %{
              "domestic" => [
                %{
                  "carrier" => "fedex",
                  "data" => [
                    %{
                      "max_value" => "10000.00",
                      "max_value_currency" => "USD",
                      "service_level" => "fedex_ground"
                    },
                    %{
                      "max_value" => "200000.00",
                      "max_value_currency" => "USD",
                      "service_level" => "fedex_fedex_same_day"
                    }
                  ]
                },
                %{
                  "carrier" => "ups",
                  "data" => [
                    %{
                      "max_value" => "10000.00",
                      "max_value_currency" => "USD",
                      "service_level" => "ups_ground"
                    },
                    %{
                      "max_value" => "200000.00",
                      "max_value_currency" => "USD",
                      "service_level" => "ups_next_day_air_saver"
                    }
                  ]
                },
                %{
                  "carrier" => "usps",
                  "data" => [
                    %{
                      "max_value" => "1000.00",
                      "max_value_currency" => "USD",
                      "service_level" => "usps_ground_advantage"
                    },
                    %{
                      "max_value" => "50000.00",
                      "max_value_currency" => "USD",
                      "service_level" => "usps_priority_mail_express"
                    }
                  ]
                }
              ],
              "international" => [
                %{
                  "carrier" => "dhl_express",
                  "data" => [
                    %{
                      "max_value" => "200000.00",
                      "max_value_currency" => "USD",
                      "service_level" => "dhl_express_worldwide"
                    }
                  ]
                },
                %{
                  "carrier" => "fedex",
                  "data" => [
                    %{
                      "max_value" => "10000.00",
                      "max_value_currency" => "USD",
                      "service_level" => "fedex_economy_service"
                    },
                    %{
                      "max_value" => "200000.00",
                      "max_value_currency" => "USD",
                      "service_level" => "fedex_priority_express"
                    }
                  ]
                },
                %{
                  "carrier" => "ups",
                  "data" => [
                    %{
                      "max_value" => "10000.00",
                      "max_value_currency" => "USD",
                      "service_level" => "ups_3_day_select"
                    },
                    %{
                      "max_value" => "200000.00",
                      "max_value_currency" => "USD",
                      "service_level" => "ups_worldwide_express_plus"
                    }
                  ]
                }
              ]
            }
          },
          "subtype" => "painting_unframed",
          "title" => "Test Painting",
          "type" => "art",
          "value" => "1000.00",
          "value_currency" => "USD"
        },
        %{
          "id" => 408,
          "insurance_policy_requirements" => %{
            "packaging" => [
              "double_box",
              "econo_crate",
              "foam_lined_box",
              "museum_crate",
              "parcel_crate",
              "strongbox"
            ],
            "services" => ["signature_delivery"],
            "transports" => %{
              "domestic" => [
                %{
                  "carrier" => "fedex",
                  "data" => [
                    %{
                      "max_value" => "10000.00",
                      "max_value_currency" => "USD",
                      "service_level" => "fedex_express_saver"
                    },
                    %{
                      "max_value" => "200000.00",
                      "max_value_currency" => "USD",
                      "service_level" => "fedex_standard_overnight"
                    }
                  ]
                },
                %{
                  "carrier" => "ups",
                  "data" => [
                    %{
                      "max_value" => "10000.00",
                      "max_value_currency" => "USD",
                      "service_level" => "ups_ground"
                    },
                    %{
                      "max_value" => "200000.00",
                      "max_value_currency" => "USD",
                      "service_level" => "ups_next_day_air_saver"
                    }
                  ]
                },
                %{
                  "carrier" => "usps",
                  "data" => [
                    %{
                      "max_value" => "50000.00",
                      "max_value_currency" => "USD",
                      "service_level" => "usps_priority_mail_express"
                    }
                  ]
                }
              ],
              "international" => [
                %{
                  "carrier" => "dhl_express",
                  "data" => [
                    %{
                      "max_value" => "200000.00",
                      "max_value_currency" => "USD",
                      "service_level" => "dhl_express_worldwide"
                    }
                  ]
                },
                %{
                  "carrier" => "fedex",
                  "data" => [
                    %{
                      "max_value" => "10000.00",
                      "max_value_currency" => "USD",
                      "service_level" => "fedex_economy_service"
                    },
                    %{
                      "max_value" => "200000.00",
                      "max_value_currency" => "USD",
                      "service_level" => "fedex_priority_express"
                    }
                  ]
                },
                %{
                  "carrier" => "ups",
                  "data" => [
                    %{
                      "max_value" => "10000.00",
                      "max_value_currency" => "USD",
                      "service_level" => "ups_3_day_select"
                    },
                    %{
                      "max_value" => "50000.00",
                      "max_value_currency" => "USD",
                      "service_level" => "ups_expedited"
                    }
                  ]
                }
              ]
            }
          },
          "subtype" => "sculpture",
          "title" => "Test Sculpture",
          "type" => "art",
          "value" => "2500.00",
          "value_currency" => "EUR"
        }
      ],
      "shortcode" => "ARTA-EST9I9K7JY",
      "tags" => [
        %{
          "color" => "ffffff",
          "created_at" => "2025-07-30T10:09:31.897922",
          "created_by" => 381,
          "description" => "premium",
          "id" => "710e3c48-d83a-4337-b055-394884cfcfba",
          "is_active" => true,
          "name" => "premium",
          "updated_at" => "2025-07-30T10:09:31.897922",
          "updated_by" => nil
        }
      ]
    }
  })
end
