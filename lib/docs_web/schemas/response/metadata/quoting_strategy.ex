defmodule DocsWeb.Schemas.Response.Metadata.QuotingStrategy do
  alias OpenApiSpex.Schema

  require OpenApiSpex

  OpenApiSpex.schema(%{
    title: "MetadataQuotingStrategy",
    type: :array,
    items: %Schema{
      type: :object,
      properties: %{
        description: %Schema{
          type: :string,
          description: "A long form description",
          example:
            "Returns the lowest-cost option per transport service. This strategy is ideal when cost efficiency is the priority and carrier choice is not a concern."
        },
        id: %Schema{
          type: :string,
          description: "The ID representing the resource",
          example: "best_rate"
        },
        name: %Schema{
          type: :string,
          description: "A brief title for the resource",
          example: "Best Rate"
        }
      }
    }
  })
end
