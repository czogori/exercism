defmodule ProteinTranslation do
  @doc """
  Given an RNA string, return a list of proteins specified by codons, in order.
  """
  @spec of_rna(String.t()) :: { atom,  list(String.t()) }
  def of_rna(rna) do
     case rna |> String.codepoints |> get_list do
       {:error, "invalid RNA"} -> {:error, "invalid RNA"}
       result -> {:ok, result}
     end
  end
  
  defp get_list([a,b,c | t]) do
    case of_codon(a <> b <> c) do
      {:ok, "STOP"} -> []
      {:ok, result} -> [result | get_list(t)]
      {:error, "invalid codon"} -> {:error, "invalid RNA"}
    end
  end

  defp get_list([]), do: []

  @doc """
  Given a codon, return the corresponding protein

  UGU -> Cysteine
  UGC -> Cysteine
  UUA -> Leucine
  UUG -> Leucine
  AUG -> Methionine
  UUU -> Phenylalanine
  UUC -> Phenylalanine
  UCU -> Serine
  UCC -> Serine
  UCA -> Serine
  UCG -> Serine
  UGG -> Tryptophan
  UAU -> Tyrosine
  UAC -> Tyrosine
  UAA -> STOP
  UAG -> STOP
  UGA -> STOP
  """
  @spec of_codon(String.t()) :: { atom, String.t() }
  def of_codon(codon) do
    cond do
      codon == "AUG" -> {:ok, "Methionine"}
      codon == "UGG" -> {:ok, "Tryptophan"}
      codon in ~w(UGU UGC) -> {:ok, "Cysteine"}
      codon in ~w(UUA UUG) -> {:ok, "Leucine"}
      codon in ~w(UUU UUC) -> {:ok, "Phenylalanine"}
      codon in ~w(UCU UCC UCA UCG) -> {:ok, "Serine"}
      codon in ~w(UAU UAC) -> {:ok, "Tyrosine"}
      codon in ~w(UAA UAG UGA) -> {:ok, "STOP"}
      true -> {:error, "invalid codon"}
    end
  end
end

