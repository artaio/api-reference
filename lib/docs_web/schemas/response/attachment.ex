defmodule DocsWeb.Schemas.Response.Attachment do
  alias OpenApiSpex.Schema

  require OpenApiSpex

  OpenApiSpex.schema(%{
    title: "Attachment",
    type: :object,
    properties: %{
      created_at: %Schema{
        type: :string,
        example: "2021-10-27T16:48:38.657228",
        readOnly: true
      },
      request_id: %Schema{
        type: :string,
        example: "506d79b6-1e5e-4e8c-a266-74658fdaf4ee",
        description:
          "The string ID of the request resource associated to an upload via this attachment. Null if this attachment associate a shipment",
        nullable: true
      },
      shipment_id: %Schema{
        type: :string,
        example: nil,
        description:
          "The string ID of the shipment resource associated to an upload via this attachment. Null if this attachment associate a request",
        nullable: true
      },
      id: %Schema{
        type: :integer,
        example: 1942,
        readOnly: true
      },
      upload_id: %Schema{
        type: :integer,
        example: 4791,
        description:
          "The integer ID of the Upload resource associated with either a shipment or request via this attachment"
      },
      updated_at: %Schema{
        type: :string,
        example: "2021-10-27T16:48:38.657228",
        readOnly: true
      }
    },
    required: ["upload_id"]
  })
end
