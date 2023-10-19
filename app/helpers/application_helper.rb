module ApplicationHelper
    def locale
        I18n.locale == :en ? "Estados Unidos": "Português do Brasil" #ternaria invés de if else end quando são apenas duas respostas
    end        
    
    def ambiente_rails
        if Rails.env.development?
            "Desenvolvimento"
        elsif Rails.env.production?
            "Produção"
        else
            "Teste"
        end
    end
end
