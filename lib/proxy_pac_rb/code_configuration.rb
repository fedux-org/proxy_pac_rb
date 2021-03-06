# frozen_string_literal: true
module ProxyPacRb
  # Configure ProxyPacRb
  class CodeConfiguration < BasicConfiguration
    option :use_proxy, contract: { Bool => Bool }, default: false
  end
end
