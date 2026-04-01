defmodule DocsWeb.Schemas.Response.ShippingProtectionPolicyPurchased do
  alias DocsWeb.Schemas.Fields

  require OpenApiSpex

  OpenApiSpex.schema(%{
    title: "ShippingProtectionPolicyPurchased",
    type: :object,
    properties: Fields.shipping_protection_policy_response_fields(),
    example: %{
      "created_at" => "2025-09-18T14:53:54.318077",
      "destination" => %{
        "address_line_1" => "123 Oak Ave",
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
      "id" => "9f231559-a457-44b7-868f-d2554e147fda",
      "insurance_policy" => %{
        "coverage_type" => "client_shipping",
        "created_by" => nil,
        "insurance_cost" => "17.50",
        "insurance_cost_currency" => "USD",
        "insured_value" => "1000.00",
        "insured_value_currency" => "USD",
        "status" => "confirmed",
        "status_changed_at" => "2025-09-18T14:54:23.704119",
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
          "id" => 2030,
          "insurance_policy_requirements" => %{
            "packaging" => ["cardboard_box", "foam_lined_box", "portfolio"],
            "services" => ["signature_delivery"],
            "transports" => %{
              "domestic" => [
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
              "id" => 411,
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
              "url" => "https://tools.usps.com/go/TrackConfirmAction?tLabels=TRACK001"
            }
          ],
          "status" => "pending"
        }
      ],
      "public_reference" => "PUBLIC_REF_123",
      "shipment_id" => "fa61548d-5a26-4983-8f16-1bcccdb5c4f8",
      "shortcode" => "ARTA-SPMBVCLK6",
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
