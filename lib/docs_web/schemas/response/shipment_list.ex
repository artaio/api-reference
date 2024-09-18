defmodule DocsWeb.Schemas.Response.ShipmentList do
  alias OpenApiSpex.Schema

  alias DocsWeb.Schemas.{Currency, MinimalLocation, MonetaryAmount}

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
      destination: MinimalLocation,
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
      internal_reference: %Schema{
        type: :string,
        description:
          "This field can be used to pass through any character data that you may want returned unaltered for your own later usage",
        maxLength: 255,
        example: "cart #425123; user #871",
        nullable: true
      },
      object_count: %Schema{
        type: :integer,
        format: :int64,
        description: "The count of objects in this shipment",
        example: 1
      },
      origin: MinimalLocation,
      package_count: %Schema{
        type: :integer,
        format: :int64,
        description: "The number of packages in this shipment",
        example: 1
      },
      public_reference: %Schema{
        type: :string,
        description:
          "A client defined name for the resource. The value provided for the public_reference field may appear in notification emails and public web pages",
        maxLength: 255,
        example: "Order #5681",
        nullable: true
      },
      quote_type: %Schema{
        type: :string,
        description: "The ID of the quote type associated with this shipment",
        example: "premium",
        enum: ["premium", "select", "parcel", "self_ship"]
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
      updated_at: %Schema{
        type: :string,
        format: "date-time",
        description:
          "A NaiveDatetime-formatted timestamp describing when the resource was last updated with microsecond precision",
        example: "2024-08-13T22:44:39.593704"
      }
    }
  })
end
