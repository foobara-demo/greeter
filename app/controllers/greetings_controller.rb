class GreetingsController < ApplicationController
  def create
    salutation = (params[:salutation] || "hello").strip.capitalize

    if salutation =~ /\s*h*i*ss+\s*/i
      render json: {
        threatening_to_capybaras: {
          path: [ :salutation ],
          context: { threatening_salutation: salutation },
          message: "Do not hiss around our capybaras!"
        }
      }, status: :unprocessable_entity
      return
    end

    greetee = (params[:greetee] || "world").strip.capitalize

    if salutation != "Hello" && greetee == "Universe"
      render json: {
        greeting_overreach: {
          context: { greetee: },
          message: "Can we keep custom salutations within this galaxy, please?"
        }
      }, status: :unprocessable_entity
      return
    end

    render json: "#{salutation}, #{greetee}!"
  end
end
