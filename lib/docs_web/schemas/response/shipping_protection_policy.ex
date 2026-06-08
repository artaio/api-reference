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
      "id" => "4da6d140-d33b-43c4-abe1-b04389fe6782",
      "insurance_policy" => %{
        "coverage_type" => "client_shipping",
        "created_by" => nil,
        "insurance_cost" => "61.25",
        "insurance_cost_currency" => "USD",
        "insured_value" => "3500.00",
        "insured_value_currency" => "USD",
        "status" => "new",
        "status_changed_at" => "2025-09-18T14:38:32.267335",
        "disqualifications" => []
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
            "packaging" => ["cardboard_box", "foam_lined_box", "portfolio"],
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
                    }
                  ]
                }
              ],
              "international" => []
            }
          },
          "objects" => [
            %{
              "id" => 409,
              "type" => "art",
              "subtype" => "painting_unframed",
              "value" => "1000.00",
              "value_currency" => "USD",
              "images" => [
                "https://example.com/painting1.jpg",
                "https://example.com/painting2.jpg"
              ],
              "internal_reference" => "INT-PAINT-001",
              "public_reference" => "PUB-PAINT-001",
              "details" => %{
                "title" => "Test Painting",
                "creator" => "Artist A",
                "creation_date" => "1985",
                "notes" => "Delicate watercolor, requires climate control",
                "is_cites" => false,
                "is_fragile" => true
              }
            }
          ],
          "package_trackings" => [
            %{
              "tracking_number" => "TRACK001",
              "url" => nil
            }
          ],
          "status" => "pending"
        }
      ],
      "public_reference" => "PUBLIC_REF_123",
      "shipment_id" => nil,
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
        }
      ]
    }
  })
end
