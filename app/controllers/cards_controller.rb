class CardsController < ApplicationController

  def index
    @cards = Card.all
  end

  def show
    @card = Card.find(params[:id])
  end

  def new
    @card = Card.new
  end

  def create
    @card = Card.new(cards_params)

    if @card.save
      redirect_to @card, notice: "Card was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def cards_params
    params.require(:card).permit(:title, :description, :image)
  end

end
