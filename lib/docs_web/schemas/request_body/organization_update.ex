defmodule DocsWeb.Schemas.RequestBody.OrganizationUpdate do
  alias OpenApiSpex.Schema

  require OpenApiSpex

  OpenApiSpex.schema(%Schema{
    title: "OrganizationUpdate",
    type: :object,
    properties: %{
      organization: %Schema{
        type: :object,
        properties: %{
          api_version: %Schema{
            type: :string,
            description:
              "The fallback API Version to be used as a default when API calls associated with this Organization do not include an `Arta-Version` header",
            example: "2020-10-22"
          },
          company_name: %Schema{
            type: :string,
            description: "The legal name for this organization; used as part of Arta's billing and invoicing processes."
          },
          display_name: %Schema{
            type: :string,
            description:
              "The display name for this organization. Presented on public pages for this organizations' shipments."
          },
          name: %Schema{
            type: :string,
            description: "The name for this Organization.",
            example: "Arta"
          }
        }
      }
    },
    required: ["organization"],
    additionalProperties: false,
    example: %{
      "organization" => %{
        "api_version" => "2021-01-01",
        "company_name" => "Hudson Street Collective LLC",
        "display_name" => "Hudson Street",
        "name" => "Hudson Street Gallery"
      }
    }
  })
end
