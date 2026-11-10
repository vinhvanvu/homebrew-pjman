# The Homebrew formula for pjman, written by the release (scripts/release.mjs) into the tap vinhvanvu/homebrew-pjman as
# Formula/pjman.rb after each publish, from the package the release put on npm. Never edited by hand: the next release
# overwrites it. 0.3.1 and e454a60cd1fc2b7df981c3c7bc82f15adfd8cf95002120e60c6d43359afc7b55 are filled in by the release.
class Pjman < Formula
  desc "Context graph for product development: changes, decisions, the product tree and agent sessions in git"
  homepage "https://github.com/vinhvanvu/pjman"
  url "https://registry.npmjs.org/@vinhvanvu/pjman/-/pjman-0.3.1.tgz"
  sha256 "e454a60cd1fc2b7df981c3c7bc82f15adfd8cf95002120e60c6d43359afc7b55"
  license "Apache-2.0"

  depends_on "node"

  def install
    system "npm", "install", *std_npm_args
    bin.install_symlink Dir["#{libexec}/bin/*"]
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/pjman --version")
  end
end
