class PagesController < ApplicationController
  def home
    @computers = Computer.all
    if params[:query].present?
      sql_query = "brand ILIKE :query OR model ILIKE :query OR category ILIKE :query"
      @computers = Computer.where(sql_query, query: "%#{params[:query]}%")
    else
      @computers = Computer.all
    end
  end
end
