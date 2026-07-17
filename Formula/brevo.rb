require "language/node"

class Brevo < Formula
  desc "Developer CLI — create, manage apps and OAuth integrations"
  homepage "https://developers.brevo.com/docs/cli-reference"
  url "https://registry.npmjs.org/@getbrevo/cli/-/cli-2.0.1.tgz"
  sha256 "b6adc813e8ef793ebfee32ed737bda56b7ceaa58958b83cf3c169b45db3ff4ec"
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
