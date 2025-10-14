defmodule DocsWeb.Schemas.Response.ShippingProtectionPolicy do
  alias DocsWeb.Schemas.Fields

  require OpenApiSpex

  OpenApiSpex.schema(%{
    title: "ShippingProtectionPolicy",
    type: :object,
    properties: Fields.shipping_protection_policy_response_fields(),
    example: %{
      "created_at" => "2025-09-18T14:38:32.124915",
      "destination" => %{
        "address_line_1" => "456 Oak Ave",
        "address_line_2" => nil,
        "address_line_3" => nil,
        "city" => "Los Angeles",
        "contacts" => [
          %{
            "email_address" => "jane@example.com",
            "name" => "Jane Smith",
            "phone_number" => "+1 555-987-6543"
          }
        ],
        "country" => "US",
        "postal_code" => "90210",
        "region" => "CA"
      },
      "exceptions" => [
        %{
          "created_at" => "2025-10-14T18:41:05.561394",
          "exception_type_label" => nil,
          "hold_until" => nil,
          "id" => "8ca7d58b-469e-4aaf-9305-f25532f391e7",
          "object_id" => nil,
          "package_id" => nil,
          "resolution" => nil,
          "source" => "automatic",
          "status" => "new",
          "type" => "prepayment_required",
          "updated_at" => "2025-10-14T18:41:05.561394"
        }
      ],
      "id" => "4da6d140-d33b-43c4-abe1-b04389fe6782",
      "insurance_policy" => %{
        "coverage_type" => "client_shipping",
        "created_by" => nil,
        "insurance_cost" => "61.25",
        "insurance_cost_currency" => "USD",
        "insured_value" => "3500.00",
        "insured_value_currency" => "USD",
        "status" => "new",
        "status_changed_at" => "2025-09-18T14:38:32.267335"
      },
      "internal_reference" => "INTERNAL_REF_456",
      "origin" => %{
        "address_line_1" => "123 Main St",
        "address_line_2" => nil,
        "address_line_3" => nil,
        "city" => "New York",
        "contacts" => [
          %{
            "email_address" => "john@example.com",
            "name" => "John Doe",
            "phone_number" => "+1 555-123-4567"
          }
        ],
        "country" => "US",
        "postal_code" => "10001",
        "region" => "NY"
      },
      "packages" => [
        %{
          "id" => 2028,
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
                      "min_value" => "0.00",
                      "min_value_currency" => "USD",
                      "max_value" => "10000.00",
                      "max_value_currency" => "USD",
                      "service_level" => "fedex_express_saver"
                    },
                    %{
                      "min_value" => "0.00",
                      "min_value_currency" => "USD",
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
                      "min_value" => "0.00",
                      "min_value_currency" => "USD",
                      "max_value" => "200000.00",
                      "max_value_currency" => "USD",
                      "service_level" => "ups_next_day_air"
                    },
                    %{
                      "min_value" => "0.00",
                      "min_value_currency" => "USD",
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
                      "min_value" => "0.00",
                      "min_value_currency" => "USD",
                      "max_value" => "1000.00",
                      "max_value_currency" => "USD",
                      "service_level" => "usps_ground_advantage"
                    },
                    %{
                      "min_value" => "0.00",
                      "min_value_currency" => "USD",
                      "max_value" => "50000.00",
                      "max_value_currency" => "USD",
                      "service_level" => "usps_priority_mail_express"
                    }
                  ]
                }
              ],
              "international" => []
            }
          },
          "objects" => [
            %{
              "creation_date" => "1985",
              "creator" => "Artist A",
              "id" => 409,
              "images" => [
                "https://example.com/painting1.jpg",
                "https://example.com/painting2.jpg"
              ],
              "internal_reference" => "INT-PAINT-001",
              "notes" => "Delicate watercolor, requires climate control",
              "public_reference" => "PUB-PAINT-001",
              "subtype" => "painting_unframed",
              "title" => "Test Painting",
              "type" => "art",
              "value" => "1000.00",
              "value_currency" => "USD"
            }
          ],
          "package_trackings" => [%{"tracking_number" => "TRACK001"}],
          "status" => "pending"
        },
        %{
          "id" => 2029,
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
                      "min_value" => "0.00",
                      "min_value_currency" => "USD",
                      "max_value" => "10000.00",
                      "max_value_currency" => "USD",
                      "service_level" => "fedex_express_saver"
                    },
                    %{
                      "min_value" => "0.00",
                      "min_value_currency" => "USD",
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
                      "min_value" => "0.00",
                      "min_value_currency" => "USD",
                      "max_value" => "200000.00",
                      "max_value_currency" => "USD",
                      "service_level" => "ups_next_day_air"
                    },
                    %{
                      "min_value" => "0.00",
                      "min_value_currency" => "USD",
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
                      "min_value" => "0.00",
                      "min_value_currency" => "USD",
                      "max_value" => "50000.00",
                      "max_value_currency" => "USD",
                      "service_level" => "usps_priority_mail_express"
                    }
                  ]
                }
              ],
              "international" => []
            }
          },
          "objects" => [
            %{
              "creation_date" => "1992-12-03",
              "creator" => "Sculptor B",
              "id" => 410,
              "images" => ["https://example.com/sculpture1.jpg"],
              "internal_reference" => "INT-SCUL-002",
              "notes" => "Bronze sculpture, handle with care",
              "public_reference" => "PUB-SCUL-002",
              "subtype" => "sculpture",
              "title" => "Test Sculpture",
              "type" => "art",
              "value" => "2500.00",
              "value_currency" => "USD"
            }
          ],
          "package_trackings" => [%{"tracking_number" => "TRACK002"}],
          "status" => "pending"
        }
      ],
      "public_reference" => "PUBLIC_REF_123",
      "shipment" => nil,
      "shortcode" => "ARTA-SPA7SX029",
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
        },
        %{
          "color" => "ff00ff",
          "created_at" => "2025-07-30T10:12:15.384730",
          "created_by" => 381,
          "description" => "urgent",
          "id" => "5f91d724-ec25-41d9-b5d5-453ef95c6604",
          "is_active" => true,
          "name" => "urgent",
          "updated_at" => "2025-07-30T10:12:15.384730",
          "updated_by" => nil
        }
      ]
    }
  })
end
