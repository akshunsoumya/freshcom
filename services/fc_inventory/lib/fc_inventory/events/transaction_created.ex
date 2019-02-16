defmodule FCInventory.TransactionCreated do
  use TypedStruct
  alias Decimal, as: D

  @derive Jason.Encoder
  @version 1

  typedstruct do
    field :__version__, integer(), default: @version

    field :request_id, String.t()
    field :requester_id, String.t()
    field :requester_type, String.t()
    field :requester_role, String.t()
    field :client_id, String.t()
    field :client_type, String.t()
    field :account_id, String.t()

    field :transaction_id, String.t()

    field :line_item_id, String.t()
    field :source_stockable_id, String.t()
    field :source_id, String.t()
    field :source_type, String.t()
    field :destination_stockable_id, String.t()
    field :destination_id, String.t()
    field :destination_type, String.t()

    field :status, String.t()
    field :number, String.t()
    field :label, String.t()
    field :quantity, Decimal.t()
    field :expected_completion_date, DateTime.t()

    field :caption, String.t()
    field :description, String.t()
    field :custom_data, map(), default: %{}
    field :translations, map(), default: %{}
  end

  def deserialize(event) do
    event
    |> Map.put(:quantity, D.new(event.quantity))
  end
end
