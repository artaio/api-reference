defmodule DocsWeb.Schemas.Response.Shipment do
  alias OpenApiSpex.Schema

  alias DocsWeb.Schemas.Response.{
    Package,
    Service,
    ShipmentException
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
        enum: ["not_required", "required", "submitted", "approved", "rejected"]
      },
      eei_form_url: %Schema{
        type: :string,
        description:
          "The URL for an associated electronic export information form required for customs clearance. Returns null if the shipment does not have an associated EEI Form"
      },
      emissions: %Schema{
        type: :string,
        description: "The estimated CO2 emissions for the shipment",
        example: "0.5"
      },
      emissions_unit: %Schema{
        type: :string,
        description:
          "The unit of measurement for emissions for this shipment. Typically measured in \"kg_co2e\" or \"kilograms of carbon dioxide equivalent\"",
        example: "kg_co2e"
      },
      exceptions: %Schema{
        type: :array,
        description:
          "Shipment exceptions provide context about holds, delays, and other circumstances that may interrupt a shipment's fulfillment",
        items: ShipmentException
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
        }
      },
      internal_reference: %Schema{
        type: :string,
        description:
          "This field can be used to pass through any character data that you may want returned unaltered for your own later usage",
        maxLength: 255
      },
      log_request_id: %Schema{
        type: :string,
        description:
          "A string identifying the API request that created the shipment. This `log_request_id` may be used to find the Log associated with the source API request",
        example: "F-uX-m3bUWEb2vwAECSB"
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
        maxLength: 255
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
            format: :date
          },
          delivery_start: %Schema{
            type: :string,
            format: :date
          },
          delivery_window_modifier: %Schema{
            type: :string,
            description:
              "A qualifying word indicating how delivery_start and delivery_end together shape the delivery window. When present, values may be \"after\", \"by\", \"on\", or \"between\"",
            example: "on"
          },
          pickup_end: %Schema{
            type: :string,
            format: :date
          },
          pickup_start: %Schema{
            type: :string,
            format: :date
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
        maxLength: 255
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
        items: %Schema{
          type: :string
        }
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
                "A URL at which parcel package shipping labels may be downladed and printed"
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
    }
  })
end
