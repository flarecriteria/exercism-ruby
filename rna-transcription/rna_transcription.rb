##
# This class transcribes RNA strands
class Complement
  # Problem Version
  VERSION = 3

  # Hash of DNA complements: keys are expected to be a single char string
  COMPLEMENTS = { 'G' => 'C', 'C' => 'G', 'T' => 'A', 'A' => 'U' }.freeze

  # DNA strand, returns its RNA complement (per RNA transcription).
  #
  # Raises a ComplementDoesNotExistError if a nucleotide given in the DNA
  # strand does not have a complement in Complement.COMPLEMENTS
  #
  # ==== Attributes
  #
  # * +strand+ The dna strand to be transcribed
  def self.of_dna(strand)
    validation_regex = /^[#{COMPLEMENTS.keys.join}]*$/
    raise ComplementDoesNotExistError unless validation_regex =~ strand
    strand.chars.map { |e| COMPLEMENTS[e] }.join
  end
end

# Raised when a RNA complement does not exist for a nucleotide.
class ComplementDoesNotExistError < ArgumentError
  def message
    'Strand contains a nucleotide for which a valid complement is unknown.'\
      "Known nucleotides are '#{COMPLEMENTS.keys.join('\', \'')}'."
  end
end
