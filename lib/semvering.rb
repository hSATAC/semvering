require "semvering/version"

class Semvering
  include Comparable

  attr :major, :minor, :patch, :pre_release
  def initialize(major, minor, patch, pre_release: nil)
    raise ArgumentError, "version number should not be non-negative integers" unless check_version_format major, minor, patch
    raise ArgumentError, "pre_release verson should only contain alphanumerics" unless check_pre_release_format pre_release

    @major = major
    @minor = minor
    @patch = patch
    @pre_release = pre_release
  end

  def <=>(another)
    # compare X, Y, Z in following order
    [:major, :minor, :patch].each do |segment|
      compare = self.send(segment) <=> another.send(segment)
      return compare if compare != 0
    end

    # compare pre_release
    return 0 if @pre_release == another.pre_release
    return 1 if @pre_release == nil && another.pre_release != nil
    return -1 if @pre_release != nil && another.pre_release == nil
    # TODO: Compare between different pre_release

  end

  private
  def check_version_format(major, minor, patch)
    major >= 0 && minor >= 0 && patch >= 0
  end

  def check_pre_release_format(pre_release)
    return true if pre_release.nil?
    return false if (pre_release =~ /^[0-9A-Za-z\-.]+$/).nil?
    return false if pre_release.scan(/\d+/).any?{ |n| n.to_i.to_s != n }

    return true
  end
end
