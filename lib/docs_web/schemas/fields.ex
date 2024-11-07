defmodule DocsWeb.Schemas.Fields do
  alias OpenApiSpex.Schema

  alias DocsWeb.Schemas.{Currency, MonetaryAmount, Payload, Response}

  def object_fields() do
    %{
      internal_reference: %Schema{
        description:
          "This field can be used to pass through any data that you may want returned unaltered for your own later usage",
        maxLength: 255,
        type: "string",
        example: "Accession ID: 823"
      },
      current_packing: %Schema{
        type: "array",
        description: "A list of packing subtype IDs describing how the item is currently packed",
        items: %Schema{
          type: "string",
          example: "no_packing"
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
          materials: %Schema{
            type: "array",
            deprecated: true,
            description: "A list of IDs describing the types of materials used",
            items: %Schema{
              type: "string",
              example: "canvas"
            }
          },
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
      width: %Schema{
        description: "The width of the object",
        type: "string",
        example: "15"
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
      value_currency: Currency,
      value: MonetaryAmount
    }
  end

  def object_fields_with_id() do
    object_fields()
    |> Map.put(:id, %Schema{
      type: :integer,
      format: :int64
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
end
