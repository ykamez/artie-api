module Concerns
  module ErrorHandling
    extend ActiveSupport::Concern

    included do
      rescue_from Exception do |e|
        if Rails.env.production?
          render status: 500, json: { errors: [{ message: 'Internal server error' }] }
        else
          Rails.logger.fatal(e.backtrace[0..5].join("\n"))
          render status: 500, json: { errors: [{ message: "#{e.message}: #{e.backtrace}" }] }
        end
      end

      rescue_from ActionController::BadRequest do |e|
        render status: 400, json: { errors: [{ message: e.message }] }
      end

      rescue_from ActiveRecord::RecordNotFound do |e|
        render status: 404, json: { errors: [{ message: e.message }] }
      end
    end
  end
end
