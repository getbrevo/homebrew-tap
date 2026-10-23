require "language/node"

class Brevo < Formula
  desc "Developer CLI — create, manage apps and OAuth integrations"
  homepage "https://developers.brevo.com/docs/cli-reference"
  url "https://registry.npmjs.org/@getbrevo/cli/-/cli-2.6.0.tgz"
  sha256 "70a4abf644da74677db169744cd82abb674707d93fb52bf4487175a337a38e5d"
  license "MIT"

  depends_on "node"

  def install
    system "npm", "install", *std_npm_args
    bin.install_symlink Dir["#{libexec}/bin/*"]
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/brevo --version")
  end
end
