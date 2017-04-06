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
      Enum.member?(~w(UGU UGC), codon) -> {:ok, "Cysteine"}
      Enum.member?(~w(UUA UUG), codon) -> {:ok, "Leucine"}
      Enum.member?(~w(UUU UUC), codon) -> {:ok, "Phenylalanine"}
      Enum.member?(~w(UCU UCC UCA UCG), codon) -> {:ok, "Serine"}
      Enum.member?(~w(UAU UAC), codon) -> {:ok, "Tyrosine"}
      Enum.member?(~w(UAA UAG UGA), codon) -> {:ok, "STOP"}
      true -> {:error, "invalid codon"}
    end
  end
end

