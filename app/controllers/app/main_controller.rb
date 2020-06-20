# frozen_string_literal: true

class App::MainController < AppController
  def index
    @expertises = Expertise.all
    @plans = HealthPlan.all
  end
end
