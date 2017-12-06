require "semvering/version"

class Semvering
  include Comparable

  attr :major, :minor, :patch
  def initialize(major, minor, patch)
    raise ArgumentError, "version number should not be non-negative integers" if major < 0 || minor < 0 || patch < 0

    @major = major
    @minor = minor
    @patch = patch
  end

  def <=>(another)
    case res = @major <=> another.major
    when 1, -1
      return res
    when 0
      case res = @minor <=> another.minor
      when 1, -1
        return res
      when 0
        return @patch <=> another.patch
      end
    end
  end
end
