defmodule DocsWeb.Schemas.RequestBody.UploadCreate do
  alias OpenApiSpex.Schema

  require OpenApiSpex

  OpenApiSpex.schema(%Schema{
    title: "UploadCreate",
    type: :object,
    properties: %{
      upload: %Schema{
        type: :object,
        required: ["document_type", "file_name", "mime_type", "size"],
        properties: %{
          document_type: %Schema{
            type: :string,
            description: "The document type of the file being uploaded",
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
            ]
          },
          document_type_label: %Schema{
            type: :string,
            description:
              "A brief label providing additional context about the document_type. Required when \"other\" is the \"document_type\"",
            nullable: true
          },
          file_name: %Schema{
            type: :string,
            description: "The name of the file being uploaded",
            example: "my-file.csv"
          },
          mime_type: %Schema{
            type: :string,
            description: "The mime-type for the file being uploaded",
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
            example: "text/csv"
          },
          size: %Schema{
            type: :integer,
            description: "The size of the file being uploaded in bytes",
            example: 22
          }
        }
      }
    },
    required: ["upload"],
    additionalProperties: false
  })
end
