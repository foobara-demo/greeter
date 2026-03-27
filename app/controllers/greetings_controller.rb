class GreetingsController < ApplicationController
  def create
    outcome = ConstructGreeting.run(salutation: params[:salutation],
                                    greetee: params[:greetee])

    if outcome.success?
      render json: outcome.result
    else
      render json: outcome.errors_hash, status: :unprocessable_entity
    end
  end
end
