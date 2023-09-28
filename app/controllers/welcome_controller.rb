class WelcomeController < ApplicationController
  def index
    @meu_nome = "Kike"
    #@meu_nome = params[:nome]
    @curso = "Rails"
    #@curso = params[:curso]
  end
end
