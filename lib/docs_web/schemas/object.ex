defmodule DocsWeb.Schemas.Object do
  alias OpenApiSpex.Schema

  alias DocsWeb.Schemas.{Currency, MonetaryAmount}

  require OpenApiSpex

  OpenApiSpex.schema(%{
    title: "object",
    type: :object,
    properties: %{
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
    },
    required: [
      :depth,
      :height,
      :subtype,
      :width,
      :unit_of_measurement,
      :weight_unit,
      :value,
      :value_currency
    ]
  })
end
