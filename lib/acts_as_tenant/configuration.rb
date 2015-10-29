module ActsAsTenant
  @@configuration = nil

  def self.configure
    @@configuration = Configuration.new

    if block_given?
      yield configuration
    end

    configuration
  end

  def self.configuration
    @@configuration || configure
  end

  class Configuration
    attr_writer :require_tenant
    attr_writer :require_tenant_except

    def require_tenant_except
      @require_tenant_except || []
    end
  
    def require_tenant
      @require_tenant ||= false
    end
  end
end
