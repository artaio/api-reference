defmodule DocsWeb.Schemas.Response.WebhookDelivery do
  alias OpenApiSpex.Schema

  require OpenApiSpex

  OpenApiSpex.schema(%Schema{
    type: :object,
    properties: %{
      created_at: %Schema{
        type: :string,
        example: "2021-10-27T16:48:38.657228",
        readOnly: true
      },
      next_retry: %Schema{
        type: :string,
        example: nil,
        description:
          "The UTC timestamp describing when a follow up webhook delivery event will be attempted if this one has failed",
        nullable: true,
        readOnly: true
      },
      id: %Schema{
        type: :string,
        example: "5b6e1621-454f-4f18-aecf-87192406effe",
        description: "The string ID for this webhook delivery resource",
        readOnly: true
      },
      request_body: %Schema{
        type: :string,
        example: "{\"data\":{\"id\":432672},\"object\":\"webhook\",\"type\":\"ping\"}",
        description: "A stringified JSON representation of the data Arta sent to your endpoint",
        readOnly: true
      },
      resource_id: %Schema{
        type: :string,
        example: "9c67b26c-6b5d-4e19-a703-f7356f82d7e0",
        description: "The ID of the resource that triggered the webhook event",
        readOnly: true
      },
      resource_type: %Schema{
        type: :string,
        example: "request",
        enum: ["ping", "request", "shipment"],
        description: "The type of resource that triggered the webhook event",
        readOnly: true
      },
      response_body: %Schema{
        type: :string,
        example: "{\"received\": true}",
        description:
          "A string representation of the response body Arta received from your endpoint",
        readOnly: true
      },
      response_status_code: %Schema{
        type: :number,
        example: 202,
        description: "The numerical HTTP status code Arta received from your endpoint",
        readOnly: true
      },
      status: %Schema{
        type: :string,
        example: "delivered",
        enum: ["delivered", "failed"],
        description: "The status of the webhook delivery event",
        readOnly: true
      },
      type: %Schema{
        type: :string,
        enum: [
          "ping",
          "request.created",
          "request.shared",
          "request.status.updated",
          "request.updated",
          "shipment.created",
          "shipment.eei_form_status.updated",
          "shipment.exceptions.updated",
          "shipment.schedule.updated",
          "shipment.status.updated",
          "shipment.tracking.updated",
          "shipment.updated",
          "shipment_exception.created",
          "shipment_exception.status.updated"
        ],
        example: "ping",
        description: "The type of webhook delivery sent to your endpoint",
        readOnly: true
      },
      webhook_id: %Schema{
        type: :integer,
        example: 432_672,
        description: "The ID belonging to your webhook endpoint in Arta's system",
        readOnly: true
      },
      webhook_url: %Schema{
        type: :string,
        example: "https://hooks.mydomain.xyz/arta",
        description:
          "The URL belonging to your webhook endpoint in Arta's system at the time Arta attempted delivery of the webhook event",
        readOnly: true
      }
    }
  })
end
