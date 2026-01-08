defmodule DocsWeb.Schemas.RequestBody.HostedSessionCreate do
  alias OpenApiSpex.Schema
  alias DocsWeb.Schemas.Payload.{Location, Object}

  require OpenApiSpex

  @public_instructions_object_details_description "A client defined multi-line block of text presented to users on the object form in inbound booking hosted sessions.

- Only visible if `can_user_confirm_object_dimensions` is true

- Supports multiple lines and markdown-inspired anchor link syntax `[view more](https://moma.org/)`

- Rendered text supports a maximum of 400 characters not including links and markup"

  @public_instructions_location_quotes_description "A client defined multi-line block of text presented to users on the location and quote selection view for booking, shared request, and inbound booking hosted sessions.

- Supports multiple lines and markdown-inspired anchor link syntax `[view more](https://moma.org/)`

- Rendered text supports a maximum of 400 characters not including links and markup"

  @public_instructions_payment_description "A client defined multi-line block of text presented to users on the post-shipment booking payment view when required for booking, shared request, and inbound booking hosted sessions.

- Supports multiple lines and markdown-inspired anchor link syntax `[view more](https://moma.org/)`

- Rendered text supports a maximum of 400 characters not including links and markup"

  @public_instructions_booking_review_description "A client defined multi-line block of text presented to users in the quote review modal window prior to booking a shipment for booking, shared request, and inbound booking sessions.

- Supports multiple lines and markdown-inspired anchor link syntax `[view more](https://moma.org/)`

- Rendered text supports a maximum of 400 characters not including links and markup"

  @public_instructions_confirmation_description "A client defined multi-line block of text presented to users on the post-shipment booking confirmation view for booking, shared request, and inbound booking hosted sessions.

- Supports multiple lines and markdown-inspired anchor link syntax `[view more](https://moma.org/)`

- Rendered text supports a maximum of 400 characters not including links and markup"

  @hosted_session_properties %{
    additional_services: %Schema{
      type: "array",
      description:
        "Any desired services, such as unpacking, installation, etc. can be sent through in the request and will be treated as if that requested service is required, meaning this may disqualify certain segments of shipping services we offer.",
      items: %Schema{
        type: "string",
        description: "The id of a service.",
        example: "signature_delivery"
      }
    },
    cancel_url: %Schema{
      type: "string",
      description: "The URL the user will be redirected to after a Arta Booking session is cancelled",
      example: "http://example.com/cancelled"
    },
    destination: Location.call(),
    insurance: %Schema{
      type: "string",
      description:
        "The ID of the requested Arta insurance type. Options are defined in the Insurances metadata endpoint",
      example: "arta_transit_insurance"
    },
    internal_reference: %Schema{
      type: "string",
      description:
        "This field can be used to pass through any data that you may want returned unaltered for your own later usage",
      maxLength: 255,
      example: "Purchase Order: 2801"
    },
    objects: %Schema{
      type: "array",
      items: Object.call()
    },
    origin: Location.call(),
    preferred_parcel_transport_services: %Schema{
      type: "array",
      description:
        "Optionally instruct the Arta API to filter Parcel and Self Ship quotes for specific transport services. For example, if you would prefer to only return `ground` quotes, you can set this field to `[\"ground\"]` The list of valid transport service IDs is available at the /metadata/parcel_transport_services endpoint.",
      example: [
        "ground"
      ],
      nullable: true,
      items: %Schema{
        type: "string"
      }
    },
    preferred_quote_types: %Schema{
      type: "array",
      description:
        "Optionally instruct the Arta API to return a subset of quote types for the requests generated through this hosted session. For example if you would prefer to only return Select quotes, you can set this field to `[\"select\"]` The list valid quote type IDs are available at the /metadata/quotes endpoint.",
      example: [
        "parcel"
      ],
      nullable: true,
      items: %Schema{
        type: "string"
      }
    },
    public_instructions_location_quotes: %Schema{
      type: "string",
      description: @public_instructions_location_quotes_description
    },
    public_instructions_payment: %Schema{
      type: "string",
      description: @public_instructions_payment_description
    },
    public_instructions_booking_review: %Schema{
      type: "string",
      description: @public_instructions_booking_review_description
    },
    public_instructions_confirmation: %Schema{
      type: "string",
      description: @public_instructions_confirmation_description
    },
    public_reference: %Schema{
      description:
        "A client defined name for the request. The value provided for the public_reference field may appear in notification emails and shipment detail pages",
      type: "string",
      maxLength: 255,
      example: "Order #1437"
    },
    quoting_strategy: %Schema{
      description:
        "The quoting strategy used when creating quote requests for this booking session. Determines whether the API returns a single best-rate option per transport speed or multiple carrier options for comparison",
      type: "string",
      maxLength: 255,
      example: "best_rate",
      enum: [
        "best_rate",
        "compare_carriers"
      ],
      default: "best_rate"
    },
    shipping_notes: %Schema{
      type: "string",
      description:
        "This field can be used to pass through any notes to Arta that a customer might want to provide about the request",
      example: "New customer"
    },
    success_url: %Schema{
      type: "string",
      description: "The URL the user will be redirected to after a Arta Booking session is completed",
      example: "http://example.com/success"
    },
    type: %Schema{
      type: "string",
      description: "The type of the hosted session",
      enum: ["booking"],
      default: "booking"
    },
    tags: %Schema{
      type: :array,
      description: "A list of tags to associate with this hosted session",
      items: %Schema{
        type: :string,
        description: "The name of an active tag belonging to your organization.",
        example: "spring-jewelry-sale"
      }
    }
  }

  @inbound_session_properties Map.merge(@hosted_session_properties, %{
                                can_user_confirm_object_dimensions: %Schema{
                                  type: "boolean",
                                  description:
                                    "Determines whether your customer can verify and update object dimension information when completing an inbound booking session.",
                                  default: false
                                },
                                objects: %Schema{
                                  type: "array",
                                  items: Object.call(:inbound_booking_session)
                                },
                                public_instructions_object_details: %Schema{
                                  type: "string",
                                  description: @public_instructions_object_details_description,
                                  example: "Please confirm the dimensions of the objects you are shipping."
                                },
                                type: %Schema{
                                  type: "string",
                                  description: "The type of the hosted session",
                                  enum: ["inbound_booking"],
                                  default: "inbound_booking"
                                }
                              })
  OpenApiSpex.schema(%Schema{
    title: "HostedSessionCreate",
    oneOf: [
      %Schema{
        title: "BookingSession",
        description: "Create hosted booking session",
        type: :object,
        properties: %{
          hosted_session: %Schema{
            type: :object,
            properties: @hosted_session_properties,
            required: ["objects", "origin"]
          }
        },
        required: ["hosted_session"],
        additionalProperties: false
      },
      %Schema{
        title: "ShareRequest",
        type: :object,
        description: "Create hosted booking session from an existing quote request",
        properties: %{
          hosted_session: %Schema{
            type: :object,
            properties: %{
              request_id: %Schema{
                type: :string,
                description: "The ID of an existing Request to be shared.",
                required: true
              }
            }
          }
        },
        required: ["hosted_session"],
        additionalProperties: false
      },
      %Schema{
        title: "InboundBookingSession",
        description: "Create hosted inbound booking session",
        type: :object,
        properties: %{
          hosted_session: %Schema{
            type: :object,
            properties: @inbound_session_properties,
            required: ["destination", "type"]
          }
        },
        required: ["hosted_session"],
        additionalProperties: false
      }
    ]
  })
end
