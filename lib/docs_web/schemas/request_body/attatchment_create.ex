defmodule DocsWeb.Schemas.RequestBody.AttachmentCreate do
  alias OpenApiSpex.Schema

  require OpenApiSpex

  OpenApiSpex.schema(%Schema{
    title: "AttachmentCreate",
    type: :object,
    properties: %{
      attachment: %Schema{
        type: :object,
        required: ["upload_id"],
        properties: %{
          upload_id: %Schema{
            type: :integer,
            description: "The integer ID of the upload resource being attached",
            example: 4791
          },
          request_id: %Schema{
            type: :string,
            example: "506d79b6-1e5e-4e8c-a266-74658fdaf4ee",
            description:
              "The string ID of the request resource being associated to an upload. Do not include a request_id in the attachment parameters if you are associating a shipment"
          },
          shipment_id: %Schema{
            type: :string,
            description:
              "The string ID of the shipment resource being associated to an upload. Do not include a shipment_id in the attachment parameters if you are associating a shipment"
          }
        }
      }
    },
    required: ["attachment"],
    example: %{
      attachment: %{
        upload_id: 4791,
        request_id: "506d79b6-1e5e-4e8c-a266-74658fdaf4ee"
      }
    }
  })
end
