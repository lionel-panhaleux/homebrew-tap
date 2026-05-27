# Homebrew formula for pst. Build-from-source (pst is tiny and compiles in seconds),
# so there are no prebuilt binaries or SHA256 hashes to bump. Users install with:
#   brew install lionel-panhaleux/tap/pst
class Pst < Formula
  desc "plain-simple-tickets: git-friendly, one-line-per-ticket work tracker for AI agents"
  homepage "https://github.com/lionel-panhaleux/pst"
  url "https://github.com/lionel-panhaleux/pst.git", branch: "main"
  version "0.1.0"
  head "https://github.com/lionel-panhaleux/pst.git", branch: "main"

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    assert_match "plain-simple-tickets", shell_output("#{bin}/pst --help")
  end
end
