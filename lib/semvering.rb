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
    case @major <=> another.major
    when 1
      return 1
    when -1
      return -1
    when 0
      case @minor <=> another.minor
      when 1
        return 1
      when -1
        return -1
      when 0
        return @patch <=> another.patch
      end
    end
    #if @major > another.major
      #return 1
    #elsif @major < another.major
      #return -1
    #else
      #if @minor > another.minor
        #return 1
      #end
    #end
  end
end
