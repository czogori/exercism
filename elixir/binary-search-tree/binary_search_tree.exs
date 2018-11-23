defmodule BinarySearchTree do
  @type bst_node :: %{data: any, left: bst_node | nil, right: bst_node | nil}

  @doc """
  Create a new Binary Search Tree with root's value as the given 'data'
  """
  @spec new(any) :: bst_node
  def new(data) do
    %{data: data}
  end

  @doc """
  Creates and inserts a node with its value as 'data' into the tree.
  """
  @spec insert(bst_node, any) :: bst_node
  def insert(%{data: d} = tree, data) when data <= d do
    if Map.has_key?(tree, :left) do
      e = insert(Map.get(tree, :left), data)
      Map.put(tree, :left, e)
    else
      Map.put(tree, :left, %{data: data})
    end
  end

  def insert(%{data: d} = tree, data) when data > d do
    if Map.has_key?(tree, :right) do
      e = insert(Map.get(tree, :right), data)
      Map.put(tree, :right, e)
    else
      Map.put(tree, :right, %{data: data})
    end
  end

  @doc """
  Traverses the Binary Search Tree in order and returns a list of each node's data.
  """
  @spec in_order(bst_node) :: [any]
  def in_order(tree) do
    traverse(tree)
    |> Enum.sort()
  end

  defp traverse(%{data: data, left: left, right: right}), do: [data] ++ traverse(left) ++ traverse(right)
  defp traverse(%{data: data, left: left}), do: [data] ++ traverse(left)
  defp traverse(%{data: data, right: right}), do: [data] ++ traverse(right)
  defp traverse(%{data: data}), do: [data]
  defp traverse(_), do: []
end
