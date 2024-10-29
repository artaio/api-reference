defmodule DocsWeb.Schemas.Response.Request do
  alias DocsWeb.Schemas.Payload.Location
  alias DocsWeb.Schemas.Currency
  alias DocsWeb.Schemas.MonetaryAmount
  alias OpenApiSpex.Schema

  require OpenApiSpex

  OpenApiSpex.schema(%{
    title: "Request",
    type: :object,
    properties: %{
      additional_services: %Schema{
        type: "array",
        description:
          "Any desired services, such as unpacking, installation, etc. can be sent through in the request and will be treated as if that requested service is required. Requested services may disqualify certain segments of shipping services offered by Arta depending on location and object details.",
        items: %Schema{
          type: "string",
          description: "The id of a service."
        }
      },
      bookable: %Schema{
        type: "object",
        properties: %{
          ready: %Schema{
            description: "Returns true if the quotes in this request may be booked",
            type: "boolean"
          },
          missing: %Schema{
            type: "array",
            description: "A list of fields required for the request to be bookable",
            items: %Schema{
              type: "string"
            }
          }
        }
      },
      created_at: %Schema{
        type: "string",
        description:
          "A NaiveDatetime-formatted timestamp describing when the resource was created with microsecond precision",
        example: "2021-01-21T21:00:58.403150"
      },
      currency: Currency.schema(),
      destination: Location.call(),
      disqualifications: %Schema{
        type: "array",
        description: "The list of reasons for which particular quote types were disqulified",
        items: %Schema{
          type: "object",
          description: "The disqualifcation reason",
          properties: %{
            quote_types: %Schema{
              type: "array",
              description: "The list of quote types disqualified with this reason",
              items: %Schema{
                type: "string",
                description: "The id of a quote type"
              }
            },
            reason: %Schema{
              type: "string",
              description: "A brief explanation of the disqualification"
            },
            reason_code: %Schema{
              type: "string",
              description: "An ID for the disqualification"
            }
          }
        }
      },
      hosted_session_id: %Schema{
        type: "integer",
        description: "The ID of the HostedSession through which this shipment was created",
        example: 723,
        nullable: true
      },
      id: %Schema{
        type: "string"
      },
      insurance: %Schema{
        type: "string",
        description:
          "The id of an insurance type. If requesting Arta insurance, object values must be provided.",
        example: "arta_transit_insurance",
        nullable: true
      },
      internal_reference: %Schema{
        type: "string",
        description:
          "This field can be used to pass through any data about the request you may want returned unaltered for your own later usage",
        maxLength: 255,
        nullable: true
      },
      log_request_id: %Schema{
        type: "string",
        description:
          "The request ID for the API call that created the resource. This request ID maps to the Log resource's \"request_id\" field",
        example: "FoaokYpj364TxY8AR_qR"
      },
      object_count: %Schema{
        type: "number",
        description: "The count of objects included in the initial request payload",
        example: 1
      },
      objects: %Schema{
        type: "array",
        items: %Schema{
          type: "object",
          properties: %{
            current_packing: %Schema{
              type: "array",
              description:
                "A list of packing subtype IDs describing how the item is currently packed. Options are defined in the Packing Types metadata endpoint",
              items: %Schema{
                type: "string"
              }
            },
            depth: %Schema{
              description: "The depth of the object",
              type: "string"
            },
            details: %Schema{
              type: "object",
              properties: %{
                creation_date: %Schema{
                  description: "Details about the timing in which an object was created",
                  type: "string",
                  nullable: true
                },
                creator: %Schema{
                  description: "The creator of the object",
                  type: "string"
                },
                is_cites: %Schema{
                  type: "boolean",
                  description:
                    "Set to true if the object is governed by the Convention on International Trade in Endangered Species of Wild Fauna and Flora",
                  default: false
                },
                is_fragile: %Schema{
                  type: "boolean",
                  description:
                    "Set this flag to true is the item is fragile. This may effect packing and handling costs",
                  default: false
                },
                materials: %Schema{
                  type: "array",
                  deprecated: true,
                  description:
                    "A list of IDs describing the types of materials used. Options are defined in the Object Materials metadata endpoint ",
                  items: %Schema{
                    type: "string"
                  }
                },
                notes: %Schema{
                  description: "Any notes about the object",
                  type: "string"
                },
                title: %Schema{
                  type: "string",
                  description: "The object title"
                }
              }
            },
            height: %Schema{
              description: "The height of the object",
              type: "string"
            },
            id: %Schema{
              type: "integer",
              description: "The system-generated ID for this object",
              example: 644,
              readOnly: true
            },
            images: %Schema{
              type: "array",
              description: "A list image urls of the object",
              items: %Schema{
                type: "string",
                format: "uri"
              }
            },
            internal_reference: %Schema{
              description:
                "This field can be used to pass through any data about the object you may want returned unaltered for your own later usage",
              maxLength: 255,
              type: "string",
              nullable: true
            },
            public_reference: %Schema{
              description: "A user defined name of the object",
              type: "string",
              maxLength: 255,
              nullable: true
            },
            subtype: %Schema{
              description: "The object subtype id",
              type: "string",
              pattern: "^[0-9a-z_]{1,56}$"
            },
            type: %Schema{
              type: "string",
              description: "The object type id",
              pattern: "^[0-9a-z_]{1,56}$"
            },
            width: %Schema{
              description: "The width of the object",
              type: "string"
            },
            weight: %Schema{
              description: "The height of the object",
              type: "string"
            },
            unit_of_measurement: %Schema{
              type: "string",
              enum: ["in", "cm"]
            },
            value: MonetaryAmount.schema(),
            value_currency: Currency.schema()
          }
        }
      },
      origin: Location.call(),
      payment_process: %Schema{
        type: "string",
        description:
          "The primary method by which payment to Arta will be handled for any shipment booked from this request",
        maxLength: 255,
        example: "invoicing",
        enum: ["checkout", "invoicing"]
      },
      preferred_quote_types: %Schema{
        type: "array",
        description:
          "An optional field presenting the list of quote types the caller instructed Arta to return as part of the quote request",
        items: %Schema{
          type: "string"
        }
      },
      public_reference: %Schema{
        description:
          "A client defined name for the resource. The value provided for the public_reference field may appear in notification emails and public web pages",
        type: "string",
        maxLength: 255,
        nullable: true
      },
      quote_types: %Schema{
        type: "array",
        description:
          "The list of quote types returned as part of the quotes in this quote request",
        items: %Schema{
          type: "string",
          description: "The id of a quote type",
          example: "[\"select\"]"
        }
      },
      quotes: %Schema{
        type: "array",
        description: "The list of quotes returned for the request",
        items: %Schema{
          type: "object",
          properties: %{
            id: %Schema{
              type: "integer"
            },
            included_insurance_policy: %Schema{
              type: "object",
              nullable: true,
              properties: %{
                amount: MonetaryAmount.schema(),
                amount_currency: Currency.schema(),
                id: %Schema{
                  type: "string",
                  example: "arta_transit_insurance"
                },
                insured_value: MonetaryAmount.schema(),
                insured_value_currency: Currency.schema()
              }
            },
            included_services: %Schema{
              type: "array",
              items: %Schema{
                type: "object",
                properties: %{
                  amount: MonetaryAmount.schema(),
                  amount_currency: Currency.schema(),
                  included_services: %Schema{
                    type: "array",
                    items: %Schema{
                      type: "object",
                      properties: %{
                        name: %Schema{
                          type: "string",
                          example: "Unpacking Soft Materials"
                        },
                        sub_subtype: %Schema{
                          type: "string",
                          example: "destination_unpacking_soft"
                        },
                        subtype: %Schema{
                          type: "string",
                          example: "unpacking"
                        },
                        type: %Schema{
                          type: "string",
                          example: "handling"
                        }
                      }
                    }
                  },
                  is_requested: %Schema{
                    type: "boolean"
                  },
                  is_required: %Schema{
                    type: "boolean"
                  },
                  name: %Schema{
                    type: "string",
                    example: "Unpacking (destination)"
                  },
                  sub_subtype: %Schema{
                    type: "string",
                    example: "destination_unpacking"
                  },
                  subtype: %Schema{
                    type: "string",
                    example: "unpacking"
                  },
                  type: %Schema{
                    type: "string",
                    example: "handling"
                  }
                }
              }
            },
            optional_services: %Schema{
              type: "array",
              items: %Schema{
                type: "object",
                properties: %{
                  amount: MonetaryAmount.schema(),
                  amount_currency: Currency.schema(),
                  included_services: %Schema{
                    type: "array",
                    items: %Schema{
                      type: "object",
                      properties: %{
                        name: %Schema{
                          type: "string",
                          example: "Unpacking Soft Materials"
                        },
                        sub_subtype: %Schema{
                          type: "string",
                          example: "destination_unpacking_soft"
                        },
                        subtype: %Schema{
                          type: "string",
                          example: "unpacking"
                        },
                        type: %Schema{
                          type: "string",
                          example: "handling"
                        }
                      }
                    }
                  },
                  name: %Schema{
                    type: "string",
                    example: "Unpacking (destination)"
                  },
                  sub_subtype: %Schema{
                    type: "string",
                    example: "destination_unpacking"
                  },
                  subtype: %Schema{
                    type: "string",
                    example: "unpacking"
                  },
                  type: %Schema{
                    type: "string",
                    example: "handling"
                  }
                }
              }
            },
            quote_type: %Schema{
              type: "string",
              example: "select"
            },
            status: %Schema{
              type: "string",
              example: "published"
            },
            total: MonetaryAmount.schema(),
            total_currency: Currency.schema()
          }
        }
      }
    }
  })
end
