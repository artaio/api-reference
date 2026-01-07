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
                      "max_value" => "10000.00",
                      "max_value_currency" => "USD",
                      "service_level" => "ups_ground"
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
              "id" => 411,
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
      "shipment" => %{
        "id" => "fa61548d-5a26-4983-8f16-1bcccdb5c4f8",
        "shortcode" => "ARTA-486257",
        "status" => "pending"
      },
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
