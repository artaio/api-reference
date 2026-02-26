defmodule DocsWeb.Schemas.Response.SelfShipCollectionPickupAvailabilityResponse do
  alias OpenApiSpex.Schema

  require OpenApiSpex

  OpenApiSpex.schema(%{
    type: :object,
    properties: %{
      availabilities: %Schema{
        type: :array,
        description: "A list of pickup availability options",
        items: %Schema{
          type: :object,
          properties: %{
            access_time: %Schema{
              type: :string,
              description: "The access time for the pickup location",
              example: "08:00:00"
            },
            available: %Schema{
              type: :boolean,
              description: "Whether this time slot is available for pickup",
              example: true
            },
            carrier: %Schema{
              type: :string,
              description: "The carrier name",
              example: "FedEx"
            },
            carrier_code: %Schema{
              type: :string,
              description: "The carrier code",
              example: "FDXE"
            },
            cutoff_time: %Schema{
              type: :string,
              description: "The cutoff time for scheduling a pickup",
              example: "16:00:00"
            },
            default_latest_time_options: %Schema{
              type: :array,
              description: "Default latest time options for the pickup",
              items: %Schema{type: :string},
              example: ["17:00:00", "18:00:00"]
            },
            default_ready_time: %Schema{
              type: :string,
              description: "The default ready time for the pickup",
              example: "10:00:00"
            },
            latest_time_options: %Schema{
              type: :array,
              description: "Available latest time options for the pickup",
              items: %Schema{type: :string},
              example: ["17:00:00", "18:00:00", "19:00:00"]
            },
            pickup_date: %Schema{
              type: :string,
              format: :date,
              description: "The pickup date in YYYY-MM-DD format",
              example: "2024-03-15"
            },
            ready_time_options: %Schema{
              type: :array,
              description: "Available ready time options for the pickup",
              items: %Schema{type: :string},
              example: ["08:00:00", "09:00:00", "10:00:00"]
            },
            residential_available: %Schema{
              type: :boolean,
              description: "Whether residential pickup is available",
              example: true
            },
            residential_pickup_flag: %Schema{
              type: :boolean,
              description: "The residential pickup flag",
              example: false
            },
            schedule_day: %Schema{
              type: :string,
              description: "The day of the week for the pickup",
              example: "Friday"
            }
          }
        }
      }
    },
    example: %{
      "availabilities" => [
        %{
          "access_time" => "08:00:00",
          "available" => true,
          "carrier" => "FedEx",
          "carrier_code" => "FDXE",
          "cutoff_time" => "16:00:00",
          "default_latest_time_options" => ["17:00:00", "18:00:00"],
          "default_ready_time" => "10:00:00",
          "latest_time_options" => ["17:00:00", "18:00:00", "19:00:00"],
          "pickup_date" => "2024-03-15",
          "ready_time_options" => ["08:00:00", "09:00:00", "10:00:00"],
          "residential_available" => true,
          "residential_pickup_flag" => false,
          "schedule_day" => "Friday"
        }
      ]
    }
  })
end
