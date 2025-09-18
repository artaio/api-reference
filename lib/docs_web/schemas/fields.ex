defmodule DocsWeb.Schemas.Fields do
  alias OpenApiSpex.Schema

  alias DocsWeb.Schemas.{Currency, MonetaryAmount, Payload, Response}

  def object_fields() do
    %{
      components: %Schema{
        type: "array",
        description:
          "A list of components in the object. Should be used only with a `prepacked_box` object subtype.\n\nWhen components are present, the object value must equal the sum of component values.",
        items: %Schema{
          type: :object,
          properties: object_component_fields(),
          required: ["type", "value"]
        }
      },
      current_packing: %Schema{
        type: "array",
        description: "A list of packing subtype IDs describing how the item is currently packed",
        items: %Schema{
          type: "string",
          example: "no_packing"
        }
      },
      customs: %Schema{
        type: "object",
        properties: %{
          country_of_origin: %Schema{
            description:
              "The ISO 3166-1 alpha-2 country code where the object was made or manufactured",
            type: "string",
            maxLength: 2,
            minLength: 2,
            example: "US"
          },
          hs_code: %Schema{
            description:
              "The Harmonized System code for the object. This is a 6-10 digit code used to classify traded products",
            type: "string",
            example: "123456"
          },
          medium: %Schema{
            description:
              "The medium of the object. This is a description of the material or materials used to create the object",
            type: "string",
            example: "oil on canvas"
          },
          temporary_admission: %Schema{
            description:
              "Select true if the goods are currently in the country under a temporary admission declaration",
            type: "boolean",
            example: true
          }
        }
      },
      depth: %Schema{
        description: "The depth of the object",
        type: "string",
        example: "3"
      },
      details: %Schema{
        type: "object",
        properties: %{
          creation_date: %Schema{
            description: "Details about the timing in which an object was created",
            type: "string",
            example: "1980"
          },
          creator: %Schema{
            description: "The creator of the object",
            type: "string",
            example: "Bob Smithson"
          },
          is_fragile: %Schema{
            type: "boolean",
            description:
              "Set this flag to true is the item is fragile. This may effect packing and handling costs",
            default: false
          },
          is_cites: %Schema{
            type: "boolean",
            description:
              "Set to true if the object is governed by the Convention on International Trade in Endangered Species of Wild Fauna and Flora",
            default: false
          },
          materials: %Schema{
            type: "array",
            deprecated: true,
            description: "A list of IDs describing the types of materials used",
            items: %Schema{
              type: "string",
              example: "canvas"
            }
          },
          notes: %Schema{
            type: "string",
            description: "Any notes about the item",
            example: "Artist signature in the lower left corner"
          },
          title: %Schema{
            type: "string",
            description: "The object title",
            example: "Black Rectangle"
          }
        }
      },
      height: %Schema{
        description: "The height of the object",
        type: "string",
        example: "32"
      },
      images: %Schema{
        type: "array",
        description: "A list image urls of the object",
        items: %Schema{
          type: "string",
          format: "uri",
          example: "http://example.com/image.jpg"
        }
      },
      internal_reference: %Schema{
        description:
          "This field can be used to pass through any data that you may want returned unaltered for your own later usage",
        maxLength: 255,
        type: "string",
        example: "Accession ID: 823"
      },
      public_reference: %Schema{
        description:
          "A client defined name for the object. The value provided for public_reference may be presented in notification emails and on shipment detail pages",
        type: "string",
        maxLength: 255,
        example: "Round Smithson work"
      },
      subtype: %Schema{
        description:
          "The object subtype ID. Options are defined in the Object types metadata endpoint",
        type: "string",
        pattern: "^[0-9a-z_]{1,56}$",
        example: "painting_unframed"
      },
      unit_of_measurement: %Schema{
        type: "string",
        enum: [
          "in",
          "cm"
        ],
        example: "in"
      },
      value: MonetaryAmount,
      value_currency: Currency,
      weight: %Schema{
        description: "The weight of the object",
        type: "string",
        example: "3.0"
      },
      weight_unit: %Schema{
        description: "The unit of the object",
        type: "string",
        enum: [
          "lb",
          "kg"
        ],
        example: "lb"
      },
      width: %Schema{
        description: "The width of the object",
        type: "string",
        example: "15"
      }
    }
  end

  def object_fields_with_response_fields() do
    object_fields()
    |> Map.put(:id, %Schema{
      type: :integer,
      format: :int64
    })
    |> Map.put(:type, %Schema{
      type: "string",
      description: "The object type id",
      pattern: "^[0-9a-z_]{1,56}$"
    })
    |> Map.update!(:components, fn component_schema ->
      %{
        component_schema
        | items: %Schema{
            type: :object,
            properties: object_component_fields_with_id()
          }
      }
    end)
  end

  def object_component_fields() do
    %{
      customs: %Schema{
        type: "object",
        properties: %{
          country_of_origin: %Schema{
            description:
              "The ISO 3166-1 alpha-2 country code where the object was made or manufactured",
            type: "string",
            maxLength: 2,
            minLength: 2,
            example: "US"
          },
          hs_code: %Schema{
            description:
              "The Harmonized System code for the object. This is a 6-10 digit code used to classify traded products",
            type: "string",
            example: "123456"
          },
          medium: %Schema{
            description:
              "The medium of the object. This is a description of the material or materials used to create the object",
            type: "string",
            example: "oil on canvas"
          },
          temporary_admission: %Schema{
            description:
              "Select true if the goods are currently in the country under a temporary admission declaration",
            type: "boolean",
            example: true
          }
        }
      },
      details: %Schema{
        type: "object",
        properties: %{
          creation_date: %Schema{
            description: "Details about the timing in which an object was created",
            type: "string",
            example: "1980"
          },
          creator: %Schema{
            description: "The creator of the object",
            type: "string",
            example: "Bob Smithson"
          },
          notes: %Schema{
            type: "string",
            description: "Any notes about the item",
            example: "Artist signature in the lower left corner"
          },
          title: %Schema{
            type: "string",
            description: "The object title",
            example: "Black Rectangle"
          }
        }
      },
      internal_reference: %Schema{
        description:
          "This field can be used to pass through any data that you may want returned unaltered for your own later usage",
        maxLength: 255,
        type: "string",
        example: "Accession ID: 823"
      },
      public_reference: %Schema{
        description:
          "A client defined name for the object. The value provided for public_reference may be presented in notification emails and on shipment detail pages",
        type: "string",
        maxLength: 255,
        example: "Round Smithson work"
      },
      type: %Schema{
        description:
          "The object component type ID. Options are defined in the Object Component types metadata endpoint",
        type: "string",
        pattern: "^[0-9a-z_]{1,56}$",
        example: "painting_framed"
      },
      value: MonetaryAmount,
      value_currency: Currency
    }
  end

  def object_component_fields_with_id() do
    object_component_fields()
    |> Map.put(:id, %Schema{
      type: :string,
      description: "The id of the component in UUID format",
      format: :uuid
    })
  end

  def package_fields() do
    %{
      depth: %Schema{
        description: "The depth of the object",
        type: "string",
        example: "3"
      },
      height: %Schema{
        description: "The height of the object",
        type: "string",
        example: "32"
      },
      objects: %Schema{
        type: "array",
        description: "A list of objects in the package",
        items: Payload.Object.call(:track)
      },
      packing_materials: %Schema{
        type: "array",
        description: "The id of a material.",
        items: %Schema{
          type: "string",
          example: "cardboard"
        }
      },
      unit_of_measurement: %Schema{
        type: "string",
        enum: [
          "in",
          "cm"
        ],
        example: "in"
      },
      weight: %Schema{
        description: "The weight of the object",
        type: "string",
        example: "3.0"
      },
      weight_unit: %Schema{
        description: "The unit of the object",
        type: "string",
        enum: [
          "lb",
          "kg"
        ],
        example: "lb"
      },
      width: %Schema{
        description: "The width of the object",
        type: "string",
        example: "15"
      }
    }
  end

  def package_fields_for_track_shipments() do
    package_fields()
    |> Map.merge(%{
      objects: %Schema{
        type: "array",
        description: "A list of objects in the package",
        items: Payload.Object.call(:track)
      }
    })
  end

  def package_fields_for_response() do
    package_fields()
    |> Map.merge(%{
      id: %Schema{
        type: :integer,
        format: :int64,
        description: "The id of the package"
      },
      eta: %Schema{
        type: "string",
        description: "The expected delivery date for this package in the `MM/DD/YYYY` format",
        example: "01/01/2021",
        nullable: true
      },
      handle_with_care: %Schema{
        type: "boolean",
        description: "Set this flag to true if the package should be handled with care"
      },
      is_sufficiently_packed: %Schema{
        type: "boolean",
        description: "Set this flag to true if the package is sufficiently packed"
      },
      objects: %Schema{
        type: "array",
        description: "A list of objects in the package",
        items: Response.Object
      },
      status: %Schema{
        type: "string",
        description: "The status of the package",
        example: "pending",
        nullable: true
      }
    })
  end

  def location_fields() do
    %{
      access_restrictions: %Schema{
        type: :array,
        deprecated: true,
        items: %Schema{
          type: :string,
          description: "Id of location restriction type"
        }
      },
      address_line_1: %Schema{
        type: :string,
        description: "First line of address",
        example: "87 Richardson St"
      },
      address_line_2: %Schema{
        type: :string,
        description: "Second line of address",
        nullable: true
      },
      address_line_3: %Schema{
        type: :string,
        description: "Third line of address",
        nullable: true
      },
      city: %Schema{
        type: :string,
        description: "City",
        example: "Brooklyn"
      },
      country: %Schema{
        type: :string,
        maxLength: 2,
        minLength: 2,
        description:
          "The ISO 3166-1 alpha-2 country code of the current or last known location if available",
        required: true,
        example: "US"
      },
      postal_code: %Schema{
        type: :string,
        description: "The postal code",
        example: "11211"
      },
      region: %Schema{
        type: :string,
        description:
          "Political region name, for US states and Canada provinces, use 2 letter abbreviations",
        example: "NY"
      },
      title: %Schema{
        type: :string,
        description: "The title or name of the location",
        example: "Gallery"
      },
      contacts: %Schema{
        type: :array,
        description: "A list of contacts at the location",
        items: %Schema{
          type: :object,
          properties: %{
            name: %Schema{
              type: :string,
              example: "Contact Name"
            },
            email_address: %Schema{
              type: :string,
              example: "docs@arta.io"
            },
            phone_number: %Schema{
              type: :string,
              example: "646 828 7333"
            }
          },
          required: ["name"]
        }
      }
    }
  end

  def shipment_exception_base_fields do
    %{
      created_at: %Schema{
        type: :string,
        format: "date-time",
        example: "2024-08-13T22:44:39.593704",
        description:
          "A NaiveDatetime-formatted timestamp describing when the exception was created with microsecond precision"
      },
      exception_type_label: %Schema{
        type: :string,
        description: "An additional label providing context about the exception type (optional)",
        nullable: true
      },
      hold_until: %Schema{
        type: :string,
        description: "The date the shipment will be held until",
        nullable: true
      },
      id: %Schema{
        type: :string,
        description: "The id of the exception in UUID format",
        format: :uuid
      },
      package_id: %Schema{
        type: :integer,
        format: :int64,
        description: "The package associated with this exception (optional)",
        example: "12345",
        nullable: true
      },
      resolution: %Schema{
        type: :string,
        description: "A brief description of the method by which this exception was resolved",
        example: "Balance Cleared",
        nullable: true
      },
      source: %Schema{
        type: :string,
        description: "The source of the exception",
        example: "arta_team"
      },
      status: %Schema{
        type: :string,
        description: "The current status for this exception",
        example: "resolved",
        enum: ["new", "in_progress", "resolved"]
      },
      type: %Schema{
        type: :string,
        description: "The type of exception",
        example: "prepayment_required"
      },
      updated_at: %Schema{
        type: :string,
        format: "date-time",
        example: "2024-08-13T22:44:39.593704",
        description:
          "A NaiveDatetime-formatted timestamp describing when the exception was last updated with microsecond precision"
      }
    }
  end

  # Shipping Protection Estimate fields
  def shipping_protection_estimate_request_fields() do
    %{
      currency: Currency,
      objects: %Schema{
        type: "array",
        description:
          "One or more items to insure. All objects must be valid - request fails if any object is invalid.",
        items: %Schema{
          type: :object,
          properties: shipping_protection_object_fields(),
          required: ["subtype", "value", "value_currency"]
        }
      },
      tags: %Schema{
        type: "array",
        description:
          "Tag names to associate with this estimate. Example: `[ \"artwork\", \"fragile\" ]`.",
        items: %Schema{type: "string"},
        example: ["premium"]
      }
    }
  end

  def shipping_protection_estimate_response_fields() do
    %{
      id: %Schema{
        type: "string",
        format: :uuid,
        example: "4da6d140-d33b-43c4-abe1-b04389fe6782",
        description: "The id of the shipping protection estimate in UUID format"
      },
      shortcode: %Schema{
        type: "string",
        description:
          "Human-readable unique identifier code containing `ORG-EST` prefix for tracking this estimate",
        example: "ORG-ESTABCDEFG"
      },
      created_at: %Schema{
        type: "string",
        format: "date-time",
        example: "2024-08-13T22:44:39.593704",
        description:
          "A NaiveDatetime-formatted timestamp describing when the estimate was created with microsecond precision"
      },
      objects: %Schema{
        type: "array",
        description: "Accepted objects with requirements.",
        items: %Schema{
          type: :object,
          properties: shipping_protection_estimate_object_response_fields()
        }
      },
      insurance_policy: %Schema{
        type: "object",
        description: "Calculated coverage and premium.",
        properties: insurance_policy_fields()
      },
      tags: %Schema{
        type: "array",
        description: "A list of tags associated with this estimate",
        items: DocsWeb.Schemas.Response.Tag
      }
    }
  end

  # Shipping Protection Policy fields
  def shipping_protection_policy_request_fields() do
    %{
      public_reference: %Schema{
        type: "string",
        description:
          "External reference identifier visible to customers and used in public-facing communications about this policy",
        example: "PUBLIC_REF_123"
      },
      internal_reference: %Schema{
        type: "string",
        description:
          "Internal reference that can be used to pass through any data that you may want returned unaltered for your own later usage",
        example: "INTERNAL_REF_456"
      },
      currency: Currency,
      origin: %Schema{
        type: "object",
        description: "Shipment origin.",
        properties: location_fields(),
        required: ["country", "address_line_1", "city"]
      },
      destination: %Schema{
        type: "object",
        description: "Shipment destination.",
        properties: location_fields(),
        required: ["country", "address_line_1", "city"]
      },
      packages: %Schema{
        type: "array",
        description:
          "One or more packages. All objects must be valid - request fails if any object is invalid.",
        items: %Schema{
          type: :object,
          properties: shipping_protection_package_fields(),
          required: ["objects"]
        }
      },
      tags: %Schema{
        type: "array",
        description: "Tag names to apply (e.g., `[ \"premium\", \"fragile\" ]`).",
        items: %Schema{type: "string"},
        example: ["premium", "urgent"]
      }
    }
  end

  def shipping_protection_policy_response_fields() do
    %{
      id: %Schema{
        type: "string",
        format: :uuid,
        example: "9f231559-a457-44b7-868f-d2554e147fda",
        description: "The id of the shipping protection policy in UUID format"
      },
      shortcode: %Schema{
        type: "string",
        description:
          "Human-readable unique identifier code containing `ORG-SP` prefix for tracking this policy",
        example: "ORG-SPABCDEFG"
      },
      created_at: %Schema{
        type: "string",
        format: "date-time",
        example: "2024-08-13T22:44:39.593704",
        description:
          "A NaiveDatetime-formatted timestamp describing when the policy was created with microsecond precision"
      },
      public_reference: %Schema{
        type: "string",
        description:
          "External reference identifier visible to customers and used in public-facing communications about this policy",
        example: "PUBLIC_REF_123",
        nullable: true
      },
      internal_reference: %Schema{
        type: "string",
        description:
          "This field can be used to pass through any data that you may want returned unaltered for your own later usage",
        example: "INTERNAL_REF_456",
        nullable: true
      },
      currency: Currency,
      origin: %Schema{
        type: "object",
        description: "Normalized `Location` with contact details.",
        properties: location_response_fields()
      },
      destination: %Schema{
        type: "object",
        description: "Normalized `Location` with contact details.",
        properties: location_response_fields()
      },
      tags: %Schema{
        type: "array",
        description: "A list of tags associated with this policy",
        items: DocsWeb.Schemas.Response.Tag
      },
      insurance_policy: %Schema{
        type: "object",
        description: "Calculated coverage and premium with status.",
        properties: insurance_policy_response_fields()
      },
      packages: %Schema{
        type: "array",
        description: "Items with `objects` and `insurance_policy_requirements`.",
        items: %Schema{
          type: :object,
          properties: shipping_protection_package_response_fields()
        }
      },
      shipment: %Schema{
        type: "object",
        description:
          "Associated shipment information (id, shortcode, status) or null if no shipment.",
        properties: shipment_reference_fields(),
        nullable: true
      }
    }
  end

  # Supporting field definitions
  def shipping_protection_object_fields() do
    %{
      subtype: %Schema{
        type: "string",
        description: "Item subtype slug. Examples: `painting_unframed`, `sculpture`, `ring`, ...",
        example: "painting_unframed"
      },
      value: MonetaryAmount,
      value_currency: Currency,
      title: %Schema{
        type: "string",
        description: "The object title",
        example: "Black Rectangle"
      },
      creator: %Schema{
        type: "string",
        description: "The creator of the object",
        example: "Artist A"
      },
      creation_date: %Schema{
        type: "string",
        description: "Details about the timing in which an object was created",
        example: "1985"
      },
      images: %Schema{
        type: "array",
        description: "A list image urls of the object",
        items: %Schema{
          type: "string",
          format: "uri",
          example: "http://example.com/image.jpg"
        }
      },
      internal_reference: %Schema{
        type: "string",
        description: "Internal reference for the object.",
        example: "INT-PAINT-001"
      },
      notes: %Schema{
        type: "string",
        description: "Additional notes about the object.",
        example: "Delicate watercolor, requires climate control"
      },
      public_reference: %Schema{
        type: "string",
        description: "Public-facing reference for the object.",
        example: "PUB-PAINT-001"
      }
    }
  end

  def shipping_protection_package_fields() do
    %{
      tracking_number: %Schema{
        type: "string",
        description: "Carrier tracking number",
        example: "TRACK001"
      },
      objects: %Schema{
        type: "array",
        description: "Items shipped in the package.",
        items: %Schema{
          type: :object,
          properties: shipping_protection_object_fields(),
          required: ["subtype", "value", "value_currency"]
        }
      }
    }
  end

  def shipping_protection_estimate_object_response_fields() do
    %{
      id: %Schema{
        type: :integer,
        description:
          "The internal object ID assigned by the system for tracking this specific item within the estimate",
        example: 409
      },
      type: %Schema{
        type: "string",
        description: "Object type (e.g. `\"art\"`).",
        example: "art"
      },
      subtype: %Schema{
        type: "string",
        description: "Object subtype slug (e.g. `\"painting_unframed\"`, `\"sculpture\"`).",
        example: "painting_unframed"
      },
      title: %Schema{
        type: "string",
        description: "The object title",
        example: "Black Rectangle",
        nullable: true
      },
      value: MonetaryAmount,
      value_currency: Currency,
      insurance_policy_requirements: %Schema{
        type: "object",
        description: "Requirements for packaging, services, and transports.",
        properties: insurance_policy_requirements_fields()
      }
    }
  end

  def shipping_protection_package_response_fields() do
    %{
      id: %Schema{
        type: :integer,
        description: "Internal package ID.",
        example: 2030
      },
      status: %Schema{
        type: "string",
        description: "Package status (e.g., `pending`).",
        example: "pending"
      },
      package_trackings: %Schema{
        type: "array",
        description: "Tracking information with `tracking_number` field.",
        items: %Schema{
          type: :object,
          properties: %{
            tracking_number: %Schema{
              type: "string",
              description: "Package tracking number provided by commercial carrier",
              example: "1ZXXXXXXXXXXXXXXXX"
            }
          }
        }
      },
      objects: %Schema{
        type: "array",
        description: "Objects contained in this package.",
        items: %Schema{
          type: :object,
          properties: shipping_protection_policy_object_response_fields()
        }
      },
      insurance_policy_requirements: %Schema{
        type: "object",
        description:
          "Package-level `services` and `transports`, plus aggregated object `packaging`.",
        properties: insurance_policy_requirements_fields()
      }
    }
  end

  def shipping_protection_policy_object_response_fields() do
    shipping_protection_object_fields()
    |> Map.put(:id, %Schema{
      type: :integer,
      description: "Internal object ID."
    })
    |> Map.put(:type, %Schema{
      type: "string",
      description: "Object type slug (e.g., `art`).",
      example: "art"
    })
  end

  def insurance_policy_requirements_fields() do
    %{
      services: %Schema{
        type: "array",
        description: "Required delivery services that must be used for this insurance policy",
        items: %Schema{type: "string"},
        example: ["signature_delivery"]
      },
      packaging: %Schema{
        type: "array",
        description: "Allowed packaging types. Examples: `\"box\"`, `\"foam_lined_box\"`, ...",
        items: %Schema{type: "string"},
        example: ["box", "foam_lined_box"]
      },
      transports: %Schema{
        type: "object",
        description:
          "Eligible shipping carriers and service levels organized by route type, with separate requirements for domestic and international shipments",
        properties: %{
          domestic: %Schema{
            type: "array",
            description: "List of allowed domestic carriers and their service levels",
            items: %Schema{
              type: :object,
              properties: transport_carrier_fields()
            }
          },
          international: %Schema{
            type: "array",
            description: "List of allowed international carriers and their service levels",
            items: %Schema{
              type: :object,
              properties: transport_carrier_fields()
            }
          }
        }
      }
    }
  end

  def transport_carrier_fields() do
    %{
      carrier: %Schema{
        type: "string",
        description:
          "The id of a supported commercial carrier. These can be obtained via the GET /metadata/commercial_carriers endpoint",
        example: "ups"
      },
      data: %Schema{
        type: "array",
        description: "List of methods.",
        items: %Schema{
          type: :object,
          properties: %{
            service_level: %Schema{
              type: "string",
              description:
                "Service level for transport (e.g., fedex_express_saver, etc). Options are listed in the reference rate service levels metadata endpoint",
              example: "fedex_express_saver"
            },
            max_value: MonetaryAmount,
            max_value_currency: Currency
          }
        }
      }
    }
  end

  def insurance_policy_fields() do
    %{
      id: %Schema{
        type: :integer,
        description: "Unique internal identifier for the insurance policy",
        example: 37
      },
      shortcode: %Schema{
        type: "string",
        description:
          "Human-readable insurance policy identifier with ORG-IP prefix for easy reference",
        example: "ORG-IPABCDEFG"
      },
      coverage_type: %Schema{
        type: "string",
        description:
          "Type of insurance coverage indicating whether shipping is handled by Arta or the client",
        example: "client_shipping"
      },
      insured_value: MonetaryAmount,
      insured_value_currency: Currency,
      insurance_cost: MonetaryAmount,
      insurance_cost_currency: Currency
    }
  end

  def insurance_policy_response_fields() do
    insurance_policy_fields()
    |> Map.put(:status, %Schema{
      type: "string",
      description: "e.g., `New`, `Confirmed`.",
      example: "new"
    })
    |> Map.put(:status_changed_at, %Schema{
      type: "string",
      format: "date-time",
      example: "2024-08-13T22:44:39.593704",
      description:
        "A NaiveDatetime-formatted timestamp describing when the insurance policy status was last changed with microsecond precision"
    })
  end

  def location_response_fields() do
    %{
      address_line_1: %Schema{
        type: "string",
        description: "First line of address",
        example: "123 Main St"
      },
      address_line_2: %Schema{
        type: "string",
        description: "Second line of address",
        example: "Suite 100",
        nullable: true
      },
      city: %Schema{
        type: "string",
        description: "City name",
        example: "New York"
      },
      country: %Schema{type: "string", description: "ISO-3166-1 alpha-2."},
      postal_code: %Schema{
        type: "string",
        description: "Postal/ZIP code",
        example: "10001"
      },
      region: %Schema{
        type: "string",
        description: "State or region code",
        example: "NY"
      },
      contacts: %Schema{
        type: "array",
        description: "Contact details.",
        items: %Schema{
          type: :object,
          properties: %{
            name: %Schema{
              type: "string",
              description: "Contact person name",
              example: "John Doe"
            },
            email_address: %Schema{
              type: "string",
              description: "Contact email address",
              example: "john@example.com"
            },
            phone_number: %Schema{
              type: "string",
              description: "Contact phone number",
              example: "+1 555-123-4567"
            }
          }
        }
      }
    }
  end

  def shipment_reference_fields() do
    %{
      arta_id: %Schema{
        type: "string",
        format: :uuid,
        description: "ARTA shipment identifier (UUID format).",
        example: "fa61548d-5a26-4983-8f16-1bcccdb5c4f8"
      },
      shortcode: %Schema{
        type: "string",
        description: "Human-readable shipment code.",
        example: "ARTA-486257"
      },
      status: %Schema{
        type: "string",
        description: "Current shipment status (e.g., `pending`, `completed`).",
        example: "pending"
      }
    }
  end

  def purchase_coverage_request_fields() do
    %{
      insurance_policy_id: %Schema{
        type: :integer,
        description:
          "ID of the insurance policy to confirm for this shipping protection policy. Must belong to the same policy.",
        example: 37
      }
    }
  end
end
