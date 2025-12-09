defmodule DocsWeb.Schemas.Response.Metadata.ShipmentExceptionType do
  alias OpenApiSpex.Schema

  require OpenApiSpex

  OpenApiSpex.schema(%{
    title: "MetadataShipmentExceptionType",
    type: :array,
    items: %Schema{
      type: :object,
      properties: %{
        can_create: %Schema{
          type: :boolean,
          description: "Defines whether or not shipment exceptions of this type may be created by API clients"
        },
        category: %Schema{
          type: :string,
          description: "The category this shipment exception type belongs to"
        },
        id: %Schema{
          type: :string,
          description: "The ID of the shipment exception type"
        },
        name: %Schema{
          type: :string,
          description: "The name of the shipment exception type"
        },
        resolutions: %Schema{
          type: :array,
          description: "A list of strings representing accepted resolutions for shipment exceptions of this type",
          items: %Schema{
            type: :string
          }
        }
      }
    },
    example: [
      %{
        "can_create" => false,
        "category" => "Alert",
        "id" => "change_of_address_request",
        "name" => "Change of Address Request",
        "resolutions" => [
          "Updated without cost changes",
          "Updated with additional costs",
          "Address could not be changed",
          "Returned to Sender"
        ]
      },
      %{
        "can_create" => false,
        "category" => "Action Required",
        "id" => "customs_information_required",
        "name" => "Customs Information Required",
        "resolutions" => ["EEI Form Submitted"]
      },
      %{
        "can_create" => false,
        "category" => "Alert",
        "id" => "damaged_items",
        "name" => "Damaged Items",
        "resolutions" => ["Repair", "Total Loss", "Partial Loss"]
      },
      %{
        "can_create" => false,
        "category" => "Action Required",
        "id" => "direct_payment_required",
        "name" => "Direct Payment Required",
        "resolutions" => ["Balance Cleared"]
      },
      %{
        "can_create" => false,
        "category" => "Action Required",
        "id" => "held_at_customs",
        "name" => "Held at Customs",
        "resolutions" => ["Cleared Customs", "Returned to Sender"]
      },
      %{
        "can_create" => false,
        "category" => "Action Required",
        "id" => "inaccurate_object_details",
        "name" => "Inaccurate Object Details",
        "resolutions" => [
          "Updated without cost changes",
          "Updated with additional costs"
        ]
      },
      %{
        "can_create" => false,
        "category" => "Action Required",
        "id" => "incorrect_address",
        "name" => "Incorrect Address",
        "resolutions" => [
          "Origin Location Updated w/o Cost Changes",
          "Origin Location Updated w/ Additional Costs",
          "Destination Location Updated w/o Cost Changes",
          "Destination Location Updated w/ Additional Costs"
        ]
      },
      %{
        "can_create" => false,
        "category" => "Alert",
        "id" => "lost_in_transit",
        "name" => "Lost in Transit",
        "resolutions" => ["Found", "Permanently Lost"]
      },
      %{
        "can_create" => false,
        "category" => "Action Required",
        "id" => "not_ready_for_delivery",
        "name" => "Not Ready for Delivery",
        "resolutions" => [
          "Delivery Rescheduled",
          "Returned to Sender"
        ]
      },
      %{
        "can_create" => false,
        "category" => "Action Required",
        "id" => "not_ready_for_release",
        "name" => "Not Ready for Release",
        "resolutions" => ["Collection Rescheduled"]
      },
      %{
        "can_create" => false,
        "category" => "Alert",
        "id" => "other",
        "name" => "Other",
        "resolutions" => []
      },
      %{
        "can_create" => false,
        "category" => "Action Required",
        "id" => "prepayment_required",
        "name" => "Prepayment Required",
        "resolutions" => ["Balance Cleared"]
      },
      %{
        "can_create" => true,
        "category" => "Shipment Hold",
        "id" => "requested_hold_to_collect",
        "name" => "Requested Hold to Collect",
        "resolutions" => ["Collection Rescheduled"]
      },
      %{
        "can_create" => false,
        "category" => "Shipment Hold",
        "id" => "requested_hold_to_deliver",
        "name" => "Requested Hold to Deliver",
        "resolutions" => [
          "Delivery Rescheduled",
          "Returned to Sender"
        ]
      },
      %{
        "can_create" => false,
        "category" => "Alert",
        "id" => "wrong_item",
        "name" => "Wrong Item",
        "resolutions" => ["Correct Items Delivered"]
      }
    ]
  })
end
