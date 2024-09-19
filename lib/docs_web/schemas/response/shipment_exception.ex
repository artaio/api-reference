defmodule DocsWeb.Schemas.Response.ShipmentException do
  alias OpenApiSpex.Schema

  require OpenApiSpex

  OpenApiSpex.schema(%{
    title: "ShipmentException",
    type: :object,
    properties: %{
      created_at: %Schema{
        type: :string,
        format: "date-time",
        example: "2024-08-13T22:44:39.593704",
        description:
          "A NaiveDatetime-formatted timestamp describing when the exception was created with microsecond precision"
      },
      exception_type_label: %Schema{
        type: :string,
        description: "An additional label providing context about the exception type (optional)"
      },
      hold_until: %Schema{
        type: :string,
        description: "The date the shipment will be held until",
        format: "date"
      },
      id: %Schema{
        type: :string,
        description: "The id of the exception in UUID format",
        format: :uuid,
      },
      package_id: %Schema{
        type: :integer,
        format: :int64,
        description: "The package associated with this exception (optional)",
        example: "12345"
      },
      resolution: %Schema{
        type: :string,
        description: "A brief description of the method by which this exception was resolved",
        example: "Balance Cleared"
      },
      shipment_id: %Schema{
        type: :string,
        description: "The arta id of the shipment in UUID format",
        format: :uuid
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
  })
end
