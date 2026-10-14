defmodule DocsWeb.Schemas.Response.TestModeTransformation do
  alias OpenApiSpex.Schema

  require OpenApiSpex

  OpenApiSpex.schema(%{
    title: "TestModeTransformation",
    type: :object,
    properties: %{
      id: %Schema{
        type: "string",
        description: "The unique identifier for the test mode transformation",
        example: "a1b2c3d4-e5f6-7890-abcd-ef1234567890"
      },
      type: %Schema{
        type: "string",
        description:
          "The type of transformation to apply. Available types include: confirm, collect, transit, complete, cancel, expire",
        enum: ["confirm", "collect", "transit", "complete", "cancel", "expire"],
        example: "confirm"
      },
      resource_type: %Schema{
        type: "string",
        description: "The type of resource being transformed (e.g., shipment or request)",
        enum: ["shipment", "request"],
        example: "shipment"
      },
      resource_id: %Schema{
        type: "string",
        description: "The ID of the resource (shipment or request) being transformed",
        example: "506d79b6-1e5e-4e8c-a266-74658fdaf4ee"
      },
      created_at: %Schema{
        type: "string",
        description:
          "A NaiveDatetime-formatted timestamp describing when the test mode transformation was created with microsecond precision",
        example: "2021-01-21T21:00:58.403150"
      },
      status: %Schema{
        type: "string",
        description: "The current status of the test mode transformation",
        enum: ["pending", "completed", "failed"],
        example: "completed"
      },
      error_message: %Schema{
        type: "string",
        description: "Error message if the test mode transformation failed",
        nullable: true,
        example: nil
      }
    }
  })
end
