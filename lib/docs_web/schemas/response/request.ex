defmodule DocsWeb.Schemas.Response.Request do
  alias DocsWeb.Schemas.Response.{Location, Object}
  alias DocsWeb.Schemas.{Currency, MonetaryAmount}

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
      destination: Location.schema(),
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
        description: "A list of objects to be shipped",
        items: Object
      },
      origin: Location.schema(),
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
                  metadata: %Schema{
                    type: "object",
                    description:
                      "Additional data about the service. For services with a `type` value of `\"transport\"` generated through instant quoting, `metadata` may include `reference_rate.provider` and `reference_rate.service_level` fields that indicate the carrier and mode of transport used to price this service",
                    example: %{}
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
            tags: %Schema{
              type: :array,
              description: "A list of tags associated with this request",
              items: DocsWeb.Schemas.Response.Tag
            },
            total: MonetaryAmount.schema(),
            total_currency: Currency.schema()
          }
        }
      },
      shipping_notes: %Schema{
        type: "string",
        description:
          "This field can be used to pass through any notes to Arta that a customer might want to provide about the request",
        nullable: true
      },
      shortcode: %Schema{
        type: "string",
        description: "A brief and unique string identifier for the request resource",
        example: "DEMO-B8FIRV"
      },
      status: %Schema{
        type: "string",
        example: "quoted",
        enum: [
          "quoted",
          "in_progress",
          "cancelled",
          "closed",
          "disqualified",
          "expired",
          "pending"
        ]
      },
      updated_at: %Schema{
        type: "string",
        example: "2021-01-21T21:00:58.403150",
        description:
          "A NaiveDatetime-formatted timestamp describing when the resource was last updated with microsecond precision"
      }
    },
    example: %{
      "additional_services" => [],
      "bookable" => %{
        "missing" => [],
        "ready" => true
      },
      "created_at" => "2021-01-21T17:22:08.818747",
      "currency" => "USD",
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
      "disqualifications" => [],
      "hosted_session_id" => 723,
      "id" => "9d8892bc-f4c6-4b45-88e2-0ccd28eb73cc",
      "insurance" => nil,
      "internal_reference" => nil,
      "log_request_id" => "FpL53jSpPbCUXRAAKPRS",
      "object_count" => 1,
      "objects" => [
        %{
          "components" => [
            %{
              "customs" => %{
                "country_of_origin" => "US",
                "hs_code" => "123456",
                "medium" => "oil on canvas",
                "temporary_admission" => true
              },
              "details" => %{
                "creation_date" => "1980",
                "creator" => "Bob Smithson",
                "title" => "Black Rectangle",
                "notes" => "Artist signature in the lower left corner"
              },
              "id" => "1f26b6e1-ce25-43a9-b4ea-2ceaac24ec3a",
              "internal_reference" => "Accession ID: 823",
              "public_reference" => "Round Smithson work",
              "type" => "painting_framed"
            }
          ],
          "current_packing" => ["cardboard_box"],
          "depth" => "2",
          "details" => %{
            "creation_date" => nil,
            "creator" => nil,
            "is_cites" => false,
            "is_fragile" => false,
            "materials" => [],
            "notes" => nil,
            "title" => nil
          },
          "height" => "10.5",
          "id" => 1644,
          "images" => [],
          "internal_reference" => nil,
          "public_reference" => nil,
          "subtype" => "prepacked_box",
          "type" => "client_package",
          "unit_of_measurement" => "in",
          "value" => "15000",
          "value_currency" => "USD",
          "weight" => "3.5",
          "weight_unit" => "lb",
          "width" => "10"
        },
        %{
          "components" => [],
          "current_packing" => [],
          "customs" => %{
            "country_of_origin" => "US",
            "hs_code" => "123456",
            "medium" => "oil on canvas",
            "temporary_admission" => true
          },
          "depth" => "2",
          "details" => %{
            "creation_date" => nil,
            "creator" => "Robert Irwin",
            "is_cites" => false,
            "is_fragile" => false,
            "materials" => [],
            "notes" => "Artist signature in the lower left corner",
            "title" => "All That Jazz"
          },
          "height" => "10.5",
          "id" => 1644,
          "images" => [],
          "internal_reference" => nil,
          "public_reference" => nil,
          "subtype" => "painting_unframed",
          "type" => "art",
          "unit_of_measurement" => "in",
          "value" => "15000",
          "value_currency" => "USD",
          "weight" => "3.5",
          "weight_unit" => "lb",
          "width" => "10"
        }
      ],
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
      "payment_process" => "invoicing",
      "preferred_quote_types" => [],
      "public_reference" => nil,
      "quote_types" => ["premium", "select", "parcel"],
      "quotes" => [
        %{
          "id" => 61,
          "included_services" => [
            %{
              "amount" => "1",
              "amount_currency" => "USD",
              "included_services" => [],
              "is_requested" => false,
              "is_required" => true,
              "metadata" => %{
                "reference_rate" => %{
                  "provider" => "arta",
                  "service_level" => "arta"
                }
              },
              "name" => "Specialized Shuttle",
              "sub_subtype" => "specialized_shuttle",
              "subtype" => "specialized",
              "type" => "transport"
            },
            %{
              "amount" => "1",
              "amount_currency" => "USD",
              "included_services" => [],
              "is_requested" => false,
              "is_required" => true,
              "metadata" => %{},
              "name" => "Shadowbox",
              "sub_subtype" => "shadow_box",
              "subtype" => "packing_materials",
              "type" => "packing"
            }
          ],
          "included_insurance_policy" => nil,
          "optional_services" => [
            %{
              "amount" => "1",
              "amount_currency" => "USD",
              "included_services" => [
                %{
                  "name" => "Soft Packed Disposal",
                  "sub_subtype" => "soft_packed_disposal",
                  "subtype" => "debris_disposal",
                  "type" => "handling"
                }
              ],
              "name" => "Debris Disposal",
              "sub_subtype" => "debris_disposal",
              "subtype" => "debris_disposal",
              "type" => "handling"
            },
            %{
              "amount" => "1",
              "amount_currency" => "USD",
              "included_services" => [],
              "name" => "Assembly",
              "sub_subtype" => "assembly",
              "subtype" => "installation",
              "type" => "handling"
            },
            %{
              "amount" => "1",
              "amount_currency" => "USD",
              "included_services" => [],
              "name" => "Placement",
              "sub_subtype" => "placement",
              "subtype" => "installation",
              "type" => "handling"
            },
            %{
              "amount" => "1",
              "amount_currency" => "USD",
              "included_services" => [],
              "name" => "Installation",
              "sub_subtype" => "installation",
              "subtype" => "installation",
              "type" => "handling"
            },
            %{
              "amount" => "1",
              "amount_currency" => "USD",
              "included_services" => [],
              "name" => "Condition Check (destination)",
              "sub_subtype" => "destination_condition_check",
              "subtype" => "condition",
              "type" => "handling"
            },
            %{
              "amount" => "1",
              "amount_currency" => "USD",
              "included_services" => [],
              "name" => "Condition Check (origin)",
              "sub_subtype" => "origin_condition_check",
              "subtype" => "condition",
              "type" => "handling"
            },
            %{
              "amount" => "1",
              "amount_currency" => "USD",
              "included_services" => [],
              "name" => "Condition Report (destination)",
              "sub_subtype" => "destination_full_condition_report",
              "subtype" => "condition",
              "type" => "handling"
            },
            %{
              "amount" => "1",
              "amount_currency" => "USD",
              "included_services" => [],
              "name" => "Condition Report (origin)",
              "sub_subtype" => "origin_full_condition_report",
              "subtype" => "condition",
              "type" => "handling"
            },
            %{
              "amount" => "1",
              "amount_currency" => "USD",
              "included_services" => [
                %{
                  "name" => "Unpacking Soft Materials (destination)",
                  "sub_subtype" => "destination_unpacking_soft",
                  "subtype" => "unpacking",
                  "type" => "handling"
                }
              ],
              "name" => "Unpacking (destination)",
              "sub_subtype" => "destination_unpacking",
              "subtype" => "unpacking",
              "type" => "handling"
            }
          ],
          "quote_type" => "premium",
          "status" => "published",
          "total" => "2",
          "total_currency" => "USD"
        },
        %{
          "id" => 62,
          "included_services" => [
            %{
              "amount" => "1",
              "amount_currency" => "USD",
              "included_services" => [
                %{
                  "name" => "Soft Packed Disposal",
                  "sub_subtype" => "soft_packed_disposal",
                  "subtype" => "debris_disposal",
                  "type" => "handling"
                }
              ],
              "is_requested" => false,
              "is_required" => true,
              "metadata" => %{},
              "name" => "Debris Disposal",
              "sub_subtype" => "debris_disposal",
              "subtype" => "debris_disposal",
              "type" => "handling"
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
              "metadata" => %{
                "reference_rate" => %{
                  "provider" => "arta",
                  "service_level" => nil
                }
              },
              "name" => "Consolidated Trucking",
              "sub_subtype" => "road_groupage",
              "subtype" => "consolidated",
              "type" => "transport"
            }
          ],
          "included_insurance_policy" => nil,
          "optional_services" => [
            %{
              "amount" => "1",
              "amount_currency" => "USD",
              "included_services" => [
                %{
                  "name" => "Unpacking Soft Materials (destination)",
                  "sub_subtype" => "destination_unpacking_soft",
                  "subtype" => "unpacking",
                  "type" => "handling"
                }
              ],
              "name" => "Unpacking (destination)",
              "sub_subtype" => "destination_unpacking",
              "subtype" => "unpacking",
              "type" => "handling"
            },
            %{
              "amount" => "1",
              "amount_currency" => "USD",
              "included_services" => [],
              "name" => "Condition Check (destination)",
              "sub_subtype" => "destination_condition_check",
              "subtype" => "condition",
              "type" => "handling"
            },
            %{
              "amount" => "1",
              "amount_currency" => "USD",
              "included_services" => [],
              "name" => "Condition Check (origin)",
              "sub_subtype" => "origin_condition_check",
              "subtype" => "condition",
              "type" => "handling"
            }
          ],
          "quote_type" => "select",
          "status" => "published",
          "total" => "4",
          "total_currency" => "USD"
        },
        %{
          "id" => 63,
          "included_services" => [
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
              "name" => "Ply Box",
              "sub_subtype" => "ply_box",
              "subtype" => "packing_materials",
              "type" => "packing"
            },
            %{
              "amount" => "1",
              "amount_currency" => "USD",
              "included_services" => [],
              "is_requested" => false,
              "is_required" => true,
              "metadata" => %{
                "reference_rate" => %{
                  "provider" => "fedex",
                  "service_level" => "fedex_ground"
                }
              },
              "name" => "UPS Ground",
              "sub_subtype" => "parcel",
              "subtype" => "parcel",
              "type" => "transport"
            }
          ],
          "included_insurance_policy" => nil,
          "optional_services" => [],
          "quote_type" => "parcel",
          "status" => "published",
          "total" => "4",
          "total_currency" => "USD"
        },
        %{
          "id" => 64,
          "included_services" => [
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
              "name" => "Ply Box",
              "sub_subtype" => "ply_box",
              "subtype" => "packing_materials",
              "type" => "packing"
            },
            %{
              "amount" => "1",
              "amount_currency" => "USD",
              "included_services" => [],
              "is_requested" => false,
              "is_required" => true,
              "metadata" => %{
                "reference_rate" => %{
                  "provider" => "fedex",
                  "service_level" => "fedex_2_day"
                }
              },
              "name" => "UPS Second Day Air",
              "sub_subtype" => "parcel",
              "subtype" => "parcel",
              "type" => "transport"
            }
          ],
          "included_insurance_policy" => nil,
          "optional_services" => [],
          "quote_type" => "parcel",
          "status" => "published",
          "total" => "4",
          "total_currency" => "USD"
        },
        %{
          "id" => 65,
          "included_services" => [
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
              "name" => "Ply Box",
              "sub_subtype" => "ply_box",
              "subtype" => "packing_materials",
              "type" => "packing"
            },
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
            }
          ],
          "included_insurance_policy" => nil,
          "optional_services" => [],
          "quote_type" => "parcel",
          "status" => "published",
          "total" => "4",
          "total_currency" => "USD"
        }
      ],
      "shipping_notes" => nil,
      "shortcode" => "DEMO-R29NAW",
      "status" => "quoted",
      "tags" => [],
      "updated_at" => "2021-01-21T17:22:10.129653"
    }
  })
end
