require "language/node"

class Brevo < Formula
  desc "Developer CLI — create, manage apps and OAuth integrations"
  homepage "https://developers.brevo.com/docs/cli-reference"
  url "https://registry.npmjs.org/@getbrevo/cli/-/cli-2.2.0.tgz"
  sha256 "8fb681e5226f61808379ca245175fa4c0a5145423b0a9aa45710466c6b2ffafc"
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
