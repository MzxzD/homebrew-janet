# frozen_string_literal: true

class JanetAwakening < Formula
  desc "Janet IDE integration - Continue.dev, API server, deepseek-coder:6.7b default"
  homepage "https://github.com/MzxzD/Janet-Projects"
  url "https://github.com/MzxzD/Janet-Projects/archive/refs/heads/main.tar.gz"
  version "0.1.0"
  sha256 "188a70aa81a31cb5b20625bb5a6ae7bba1f61cb04d15480753335ea7ffdaef84"
  license "GPL-3.0-or-later"

  depends_on "MzxzD/janet/janet-seed"
  depends_on "ollama" => :recommended

  DEFAULT_MODEL = "deepseek-coder:6.7b"

  def install
    (bin/"janet-awakening").write <<~EOS
      #!/bin/bash
      # Start Janet API server with default model for IDE integration
      export JANET_DEFAULT_MODEL="#{DEFAULT_MODEL}"
      exec janet-api-server "$@"
    EOS

    (bin/"janet-awakening-setup").write <<~EOS
      #!/bin/bash
      # Create Continue.dev config for Janet (deepseek-coder:6.7b)
      CONTINUE_CONFIG="$HOME/.continue/config.json"
      mkdir -p "$(dirname "$CONTINUE_CONFIG")"
      if [ -f "$CONTINUE_CONFIG" ]; then
        echo "Continue config exists: $CONTINUE_CONFIG"
        echo "Add Janet model manually or backup and run again."
        exit 0
      fi
      cat > "$CONTINUE_CONFIG" << 'CONFIG'
      {
        "models": [{
          "title": "Janet (DeepSeek Coder)",
          "provider": "openai",
          "model": "#{DEFAULT_MODEL}",
          "apiBase": "http://localhost:8080/v1",
          "apiKey": "janet-local-dev"
        }]
      }
      CONFIG
      echo "Created $CONTINUE_CONFIG with Janet (#{DEFAULT_MODEL})"
      echo "Pull model: ollama pull #{DEFAULT_MODEL}"
      echo "Start server: janet-awakening"
      echo "Reload Cursor: Cmd+Shift+P → Developer: Reload Window"
    EOS

    chmod 0755, [bin/"janet-awakening", bin/"janet-awakening-setup"]
  end

  def caveats
    <<~EOS
      Janet Awakening - IDE integration for Janet

      Default LLM: #{DEFAULT_MODEL}

      First-time setup:
        1. Pull the model:  ollama pull #{DEFAULT_MODEL}
        2. Run setup:       janet-awakening-setup   # creates ~/.continue/config.json
        3. Install Continue.dev in Cursor: Extensions → search "Continue" → Install

      Start Janet for IDE:
        janet-awakening   # starts API server with #{DEFAULT_MODEL}, keep running

      Then reload Cursor (Cmd+Shift+P → "Developer: Reload Window") and chat with Janet!
    EOS
  end

  test do
    assert_match DEFAULT_MODEL, (bin/"janet-awakening-setup").read
    assert_match DEFAULT_MODEL, (bin/"janet-awakening").read
  end
end
