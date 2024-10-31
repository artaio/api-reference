defmodule DocsWeb.Schemas.Response.Tracking do
  alias OpenApiSpex.Schema

  require OpenApiSpex

  OpenApiSpex.schema(%Schema{
    type: :object,
    properties: %{
      carrier: %Schema{
        type: :object,
        properties: %{
          code: %Schema{type: :string},
          name: %Schema{type: :string},
          phone_number: %Schema{type: :string},
          url: %Schema{type: :string}
        }
      },
      events: %Schema{
        type: :array,
        items: %Schema{
          type: :object,
          properties: %{
            code: %Schema{type: :string},
            name: %Schema{type: :string},
            phone_number: %Schema{type: :string},
            url: %Schema{type: :string}
          }
        }
      },
      status: %Schema{type: :string},
      tracking_number: %Schema{type: :string}
    },
    example: %{
      "carrier" => %{
        "code" => "ups",
        "name" => "UPS",
        "phone_number" => "+1 800-742-5877",
        "url" => "https://www.ups.com/us/en/Home.page"
      },
      "events" => [
        %{
          "date" => "2020-10-20 13:53",
          "location" => "BROOKLYN,NY,11249,US",
          "summary" => "DELIVERED"
        },
        %{
          "date" => "2020-10-20 08:58",
          "location" => "Maspeth,NY,US",
          "summary" => "Out For Delivery Today"
        },
        %{
          "date" => "2020-10-20 05:23",
          "location" => "Maspeth,NY,US",
          "summary" => "Loaded on Delivery Vehicle"
        },
        %{
          "date" => "2020-10-20 05:02",
          "location" => "Maspeth,NY,US",
          "summary" => "Destination Scan"
        },
        %{
          "date" => "2020-10-20 04:08",
          "location" => "Maspeth,NY,US",
          "summary" => "Arrived at Facility"
        },
        %{
          "date" => "2020-10-20 03:11",
          "location" => "Saddle Brook,NJ,US",
          "summary" => "Departed from Facility"
        },
        %{
          "date" => "2020-10-20 00:42",
          "location" => "Saddle Brook,NJ,US",
          "summary" => "Arrived at Facility"
        },
        %{
          "date" => "2020-10-19 21:17",
          "location" => "Carlisle,PA,US",
          "summary" => "Departed from Facility"
        },
        %{
          "date" => "2020-10-19 18:04",
          "location" => "Carlisle,PA,US",
          "summary" => "Origin Scan"
        },
        %{
          "date" => "2020-10-19 10:34",
          "location" => "US",
          "summary" => "Order Processed: Ready for UPS"
        }
      ],
      "status" => "DELIVERED",
      "tracking_number" => "1Z06************"
    }
  })
end
