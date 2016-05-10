##
# This moddule transcribes RNA strands
module Complement
  # Problem Version
  VERSION = 3

  # Hash of DNA complements: keys are expected to be a single char string
  COMPLEMENTS = { 'G' => 'C', 'C' => 'G', 'T' => 'A', 'A' => 'U' }.freeze
  VALIDATION_REGEX = /^[#{COMPLEMENTS.keys.join}]*$/

  # Given a DNA strand, returns its RNA complement (per RNA transcription).
  #
  # Raises a UnknownComplementError if a nucleotide given in the DNA
  # strand does not have a complement in Complement.COMPLEMENTS
  #
  # ==== Attributes
  #
  # * +strand+ The dna strand to be transcribed
  def of_dna(strand)
    raise UnknownComplementError unless VALIDATION_REGEX =~ strand
    strand.tr(COMPLEMENTS.keys.join, COMPLEMENTS.values.join)
  end

  # Raised when a RNA complement does not exist for a nucleotide.
  class UnknownComplementError < ArgumentError
    def message
      'Strand contains a nucleotide for which a valid complement is unknown.'\
        "Known nucleotides are '#{COMPLEMENTS.keys.join('\', \'')}'."
    end
  end

  module_function :of_dna
end
