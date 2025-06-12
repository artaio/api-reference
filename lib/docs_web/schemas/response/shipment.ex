defmodule DocsWeb.Schemas.Response.Shipment do
  alias DocsWeb.Schemas.Fields
  alias OpenApiSpex.Schema

  alias DocsWeb.Schemas.Response.{
    Package,
    Service,
    Tag
  }

  alias DocsWeb.Schemas.{Currency, MonetaryAmount, Response}

  require OpenApiSpex

  OpenApiSpex.schema(%{
    type: :object,
    properties: %{
      created_at: %Schema{
        type: :string,
        format: "date-time",
        example: "2024-08-13T22:44:39.593704",
        description:
          "A NaiveDatetime-formatted timestamp describing when the resource was created with microsecond precision"
      },
      destination: Response.Location,
      eei_form_status: %Schema{
        type: :string,
        description:
          "The status of an associated electronic export information document required for customs clearance. Returns null if the shipment does not have an associated EEI Form",
        example: "not_required",
        enum: ["not_required", "required", "submitted", "approved", "rejected"],
        nullable: true
      },
      eei_form_url: %Schema{
        type: :string,
        nullable: true,
        description:
          "The URL for an associated electronic export information form required for customs clearance. Returns null if the shipment does not have an associated EEI Form"
      },
      emissions: %Schema{
        type: :string,
        description: "The estimated CO2 emissions for the shipment",
        example: "0.5",
        nullable: true
      },
      emissions_unit: %Schema{
        type: :string,
        description:
          "The unit of measurement for emissions for this shipment. Typically measured in \"kg_co2e\" or \"kilograms of carbon dioxide equivalent\"",
        example: "kg_co2e",
        nullable: true
      },
      exceptions: %Schema{
        type: :array,
        description:
          "Shipment exceptions provide context about holds, delays, and other circumstances that may interrupt a shipment's fulfillment",
        items: %Schema{
          type: :object,
          properties: Fields.shipment_exception_base_fields()
        }
      },
      hosted_session_id: %Schema{
        type: :integer,
        description: "The ID of the HostedSession through which this shipment was created",
        nullable: true,
        example: 4215
      },
      id: %Schema{
        type: :string,
        description: "The id of the shipment in UUID format",
        format: :uuid
      },
      insurance_policy: %Schema{
        type: :object,
        properties: %{
          amount: MonetaryAmount,
          amount_currency: Currency,
          id: %Schema{type: :string, example: "arta_transit_insurance"},
          insured_value: MonetaryAmount,
          insured_value_currency: Currency
        },
        nullable: true
      },
      internal_reference: %Schema{
        type: :string,
        description:
          "This field can be used to pass through any character data that you may want returned unaltered for your own later usage",
        maxLength: 255,
        nullable: true
      },
      log_request_id: %Schema{
        type: :string,
        description:
          "A string identifying the API request that created the shipment. This `log_request_id` may be used to find the Log associated with the source API request",
        example: "F-uX-m3bUWEb2vwAECSB",
        nullable: true
      },
      object_count: %Schema{
        type: :integer,
        format: :int64,
        description: "The count of objects included in the shipment",
        example: 1
      },
      origin: Response.Location,
      package_count: %Schema{
        type: :integer,
        format: :int64,
        description: "The count of packages included in the shipment",
        example: 1
      },
      packages: %Schema{
        type: :array,
        items: Package
      },
      payment_process: %Schema{
        type: :string,
        description:
          "The primary method by which payment to Arta will be handled for any shipment booked through this hosted session",
        example: "checkout",
        enum: ["checkout", "invoicing"]
      },
      public_reference: %Schema{
        type: :string,
        description:
          "A client defined name for the resource. The value provided for the public_reference field may appear in notification emails and public web pages",
        maxLength: 255,
        nullable: true
      },
      quote_type: %Schema{
        type: :string,
        description: "The ID of the quote type associated with this shipment",
        example: "premium",
        enum: ["premium", "select", "parcel", "self_ship"]
      },
      schedule: %Schema{
        type: :object,
        properties: %{
          delivery_end: %Schema{
            type: :string,
            format: :date,
            nullable: true
          },
          delivery_start: %Schema{
            type: :string,
            format: :date,
            nullable: true
          },
          delivery_window_modifier: %Schema{
            type: :string,
            description:
              "A qualifying word indicating how delivery_start and delivery_end together shape the delivery window. When present, values may be \"after\", \"by\", \"on\", or \"between\"",
            example: "on"
          },
          pickup_end: %Schema{
            type: :string,
            format: :date,
            nullable: true
          },
          pickup_start: %Schema{
            type: :string,
            format: :date,
            nullable: true
          },
          pickup_window_modifier: %Schema{
            type: :string,
            description:
              "A qualifying word indicating how delivery_start and delivery_end together shape the delivery window. When present, values may be \"after\", \"by\", \"on\", or \"between\"",
            example: "on"
          }
        },
        description: "The schedule for the shipment"
      },
      services: %Schema{
        type: :array,
        description: "A list of services included in the shipment",
        items: Service
      },
      shipping_notes: %Schema{
        type: :string,
        description: "Any additional unstructured notes to Arta about the shipment",
        maxLength: 255,
        nullable: true
      },
      shortcode: %Schema{
        type: :string,
        description: "A brief identifier for this shipment",
        example: "DEMO-B8FIRV"
      },
      status: %Schema{
        type: :string,
        description: "The status for this shipment",
        example: "pending",
        maxLength: 255,
        enum: ["pending", "confirmed", "collected", "in_transit", "completed", "cancelled"]
      },
      tags: %Schema{
        type: :array,
        description: "A list of tags associated with the shipment",
        items: Tag
      },
      total: MonetaryAmount,
      total_currency: Currency,
      tracking: %Schema{
        type: :array,
        description: "A list of tracking details for the packages in a shipment",
        items: %Schema{
          type: "object",
          properties: %{
            carrier_name: %Schema{
              type: "string",
              description:
                "The name of the carrier providing transport services for a specific package",
              example: "UPS"
            },
            label_url: %Schema{
              type: :string,
              description:
                "A URL at which parcel package shipping labels may be downladed and printed",
              nullable: true
            },
            label_format_urls: %Schema{
              type: :object,
              description:
                "A map of shipping label format types to their respective download URLs. Returns null if no shipping label exists",
              nullable: true,
              properties: %{
                png_4_x_6: %Schema{
                  type: :string,
                  description: "PNG 4x6 inches - Centers the 4x6 label on the page, scales it up to full size",
                  nullable: true,
                  example: "https://labels.example.com/labels/456/token123?format=png_4_x_6"
                },
                pdf_4_x_6: %Schema{
                  type: :string,
                  description: "PDF 4x6 inches - Centers the 4x6 label on the page, scales it up to full size",
                  nullable: true,
                  example: "https://labels.example.com/labels/456/token123?format=pdf_4_x_6"
                },
                pdf_letter: %Schema{
                  type: :string,
                  description: "PDF US Letter (8.5x11 inches) - Centers the label on the page, scales it up to full size",
                  nullable: true,
                  example: "https://labels.example.com/labels/456/token123?format=pdf_letter"
                },
                pdf_letter_half_page: %Schema{
                  type: :string,
                  description: "PDF US Letter landscape, half page (8.5x11 inches) - 4x6 label positioned on left side",
                  nullable: true,
                  example: "https://labels.example.com/labels/456/token123?format=pdf_letter_half_page"
                },
                pdf_a4: %Schema{
                  type: :string,
                  description: "PDF A4 paper (8.3x11.7 inches) - Centers the label on the page, scales it up to full size",
                  nullable: true,
                  example: "https://labels.example.com/labels/456/token123?format=pdf_a4"
                },
                pdf_a4_half_page: %Schema{
                  type: :string,
                  description: "PDF A4 landscape, half page (8.3x11.7 inches) - 4x6 label positioned on left side",
                  nullable: true,
                  example: "https://labels.example.com/labels/456/token123?format=pdf_a4_half_page"
                },
                zpl_8dpmm: %Schema{
                  type: :string,
                  description: "ZPL for 8 dots/mm printers (203 DPI) - Centers the 4x6 label on the page, scales it up to full size",
                  nullable: true,
                  example: "https://labels.example.com/labels/456/token123?format=zpl_8dpmm"
                },
                zpl_12dpmm: %Schema{
                  type: :string,
                  description: "ZPL for 12 dots/mm printers (300 DPI) - Centers the 4x6 label on the page, scales it up to full size",
                  nullable: true,
                  example: "https://labels.example.com/labels/456/token123?format=zpl_12dpmm"
                }
              },
              example: %{
                "png_4_x_6" => "https://labels.example.com/labels/456/token123?format=png_4_x_6",
                "pdf_4_x_6" => "https://labels.example.com/labels/456/token123?format=pdf_4_x_6",
                "pdf_letter" => "https://labels.example.com/labels/456/token123?format=pdf_letter",
                "pdf_letter_half_page" => "https://labels.example.com/labels/456/token123?format=pdf_letter_half_page",
                "pdf_a4" => "https://labels.example.com/labels/456/token123?format=pdf_a4",
                "pdf_a4_half_page" => "https://labels.example.com/labels/456/token123?format=pdf_a4_half_page",
                "zpl_8dpmm" => "https://labels.example.com/labels/456/token123?format=zpl_8dpmm",
                "zpl_12dpmm" => "https://labels.example.com/labels/456/token123?format=zpl_12dpmm"
              }
            },
            package_id: %Schema{
              type: :integer,
              format: :int64,
              description: "The ID associated with the tracking detail's corresponding package",
              example: "12345"
            },
            tracking_number: %Schema{
              type: "string",
              description: "The carrier-providing tracking number for this package",
              example: "1ZXXXXXXXXXXXXXXXX"
            },
            url: %Schema{
              type: :string,
              description:
                "A carrier-provided URL for fetching delivery events related to this package's transport",
              example:
                "https://www.ups.com/track?loc=en_us&tracknum=1ZXXXXXXXXXXXXXXXX&Requester=NS/"
            }
          }
        }
      },
      updated_at: %Schema{
        type: :string,
        format: "date-time",
        description:
          "A NaiveDatetime-formatted timestamp describing when the resource was last updated with microsecond precision",
        example: "2024-08-13T22:44:39.593704"
      },
      url: %Schema{
        type: :string,
        description: "The track URL for this shipment on the Arta web platform",
        example:
          "https://connect.shiparta.com/shipments/6b12c76a-5217-4cd6-82d8-7aa5265egood/5xTRnCvYkdMFdcFFMWUZaCmXz"
      }
    },
    example: %{
      "created_at" => "2021-01-21T21:00:58.403150",
      "destination" => %{
        "access_restrictions" => [],
        "address_line_1" => "87 Richardson St",
        "address_line_2" => nil,
        "address_line_3" => nil,
        "city" => "New York",
        "contacts" => [
          %{
            "email_address" => "al@example.com",
            "name" => "Alfred Barr",
            "phone_number" => "(222) 222-2222"
          }
        ],
        "country" => "US",
        "postal_code" => "11249",
        "region" => "NY",
        "title" => "Home"
      },
      "eei_form_status" => nil,
      "eei_form_url" => nil,
      "emissions" => "0.03",
      "emissions_unit" => "kg_co2e",
      "exceptions" => [],
      "id" => "6b12c76a-5217-4cd6-82d8-7aa5265ebaad",
      "insurance_policy" => nil,
      "internal_reference" => nil,
      "object_count" => 1,
      "origin" => %{
        "access_restrictions" => [],
        "address_line_1" => "11 W 53rd St",
        "address_line_2" => nil,
        "address_line_3" => nil,
        "city" => "New York",
        "contacts" => [
          %{
            "email_address" => "mary@example.com",
            "name" => "Mary Quinn Sullivan",
            "phone_number" => "(333) 333-3333"
          }
        ],
        "country" => "US",
        "postal_code" => "10019",
        "region" => "NY",
        "title" => "Warehouse"
      },
      "package_count" => 1,
      "packages" => [
        %{
          "depth" => "6.0",
          "eta" => "05/09/2022",
          "handle_with_care" => false,
          "height" => "14.5",
          "id" => 131,
          "is_sufficiently_packed" => false,
          "objects" => [
            %{
              "current_packing" => [],
              "depth" => "2",
              "details" => %{
                "creation_date" => nil,
                "creator" => "Robert Irwin",
                "is_cites" => false,
                "is_fragile" => false,
                "materials" => [],
                "title" => "All That Jazz"
              },
              "height" => "10.5",
              "id" => 620,
              "images" => [],
              "internal_reference" => nil,
              "public_reference" => nil,
              "subtype" => "painting_unframed",
              "type" => "art",
              "unit_of_measurement" => "in",
              "value" => "1500",
              "value_currency" => "USD",
              "weight" => "3.5",
              "weight_unit" => "lb",
              "width" => "10"
            }
          ],
          "packing_materials" => ["strongbox"],
          "status" => "pending",
          "weight" => "3.5",
          "weight_unit" => "lb",
          "width" => "14.0"
        }
      ],
      "payment_process" => "invoicing",
      "public_reference" => nil,
      "quote_type" => "parcel",
      "schedule" => %{
        "delivery_end" => nil,
        "delivery_start" => nil,
        "delivery_window_modifier" => "",
        "pickup_end" => nil,
        "pickup_start" => nil,
        "pickup_window_modifier" => ""
      },
      "services" => [
        %{
          "amount" => "1",
          "amount_currency" => "USD",
          "included_services" => [],
          "is_requested" => false,
          "is_required" => true,
          "metadata" => %{
            "reference_rate" => %{
              "provider" => "fedex",
              "service_level" => "fedex_standard_overnight"
            }
          },
          "name" => "UPS Next Day Air",
          "sub_subtype" => "parcel",
          "subtype" => "parcel",
          "type" => "transport"
        },
        %{
          "amount" => "1",
          "amount_currency" => "USD",
          "included_services" => [],
          "is_requested" => false,
          "is_required" => true,
          "metadata" => %{},
          "name" => "Strongbox",
          "sub_subtype" => "strongbox",
          "subtype" => "packing_materials",
          "type" => "packing"
        },
        %{
          "amount" => "1",
          "amount_currency" => "USD",
          "included_services" => [],
          "is_requested" => false,
          "is_required" => true,
          "metadata" => %{},
          "name" => "Collection",
          "sub_subtype" => "collection",
          "subtype" => "collection",
          "type" => "location"
        },
        %{
          "amount" => "1",
          "amount_currency" => "USD",
          "included_services" => [],
          "is_requested" => false,
          "is_required" => true,
          "metadata" => %{},
          "name" => "Fuel Surcharge",
          "sub_subtype" => "fuel_surcharge",
          "subtype" => "fees",
          "type" => "taxes_duties_fees"
        }
      ],
      "shipping_notes" => nil,
      "shortcode" => "MA-452144",
      "status" => "pending",
      "total" => "4",
      "total_currency" => "USD",
      "tags" => [],
      "tracking" => [],
      "updated_at" => "2021-01-21T21:00:58.579870",
      "url" =>
        "https://connect.shiparta.com/shipments/6b12c76a-5217-4cd6-82d8-7aa5265egood/5xTRnCvYkdMFdcFFMWUZaCmXz"
    }
  })
end
