defmodule DocsWeb.Schemas.Response.UploadWithPresignedURL do
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
      document_type: %Schema{
        type: :string,
        enum: [
          "bill_of_lading",
          "certificate_of_insurance",
          "certificate_of_insurance_template",
          "condition_report",
          "condition_check",
          "image",
          "instructions",
          "airway_bill",
          "commercial_invoice",
          "power_of_attorney",
          "proof_of_export",
          "proof_of_delivery",
          "quote",
          "shipping_label",
          "other"
        ],
        example: "other",
        description: "The document type of the uploaded file"
      },
      document_type_label: %Schema{
        type: :string,
        example: "Inventory List",
        description:
          "A brief label providing additional context about the `document_type`. Required when \"other\" is the `document_type`",
        nullable: true
      },
      download_url: %Schema{
        type: :string,
        example: "https://api.arta.io/downloads/kikhAFZ565BzbGooRqLZl",
        nullable: true,
        readOnly: true
      },
      file_name: %Schema{
        type: :string,
        example: "inventory_list_27148_16.pdf",
        description: "The name of the uploaded file"
      },
      id: %Schema{
        type: :integer,
        example: 1942,
        readOnly: true
      },
      mime_type: %Schema{
        type: :string,
        enum: [
          "application/pdf",
          "application/vnd.ms-excel",
          "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet",
          "application/vnd.openxmlformats-officedocument.wordprocessingml.document",
          "image/jpeg",
          "image/png",
          "text/csv",
          "video/mp4",
          "video/quicktime",
          "application/msword"
        ],
        example: "application/pdf",
        description: "The mime-type of the uploaded file"
      },
      size: %Schema{
        type: :integer,
        example: 58550,
        description: "The size of the uploaded file in bytes"
      },
      status: %Schema{
        type: :string,
        enum: ["pending", "processed", "failed"],
        example: "processed",
        readOnly: true
      },
      presigned_url: %Schema{
        type: :string,
        example: "https://api.arta.io/downloads/35fc1956-71fc-4b1c-846b-6ea963182a8c",
        description:
          "A pre-signed and secure URL to use to send the file to Arta via a PUT HTTP request within 20 seconds of the upload resource being created",
        readOnly: true
      }
    },
    required: ["document_type", "file_name", "mime_type", "size"]
  })
end
