class AdminController < ApplicationController
  before_action :require_admin
  def index
    @registrations = Registration.order(:student_name)
    @counts = Registration.group(:club).count
  end
  def export
    require "csv"
    csv = CSV.generate(headers: true) do |out|
      out << ["Student Name", "Class", "Section", "Email", "Selected Club"]
      Registration.order(:student_name).each do |r|
        out << [r.student_name, r.student_class, r.section, r.email, r.club]
      end
    end
    send_data csv, filename: "club-registrations.csv", type: "text/csv"
  end
  private
  def require_admin
    expected = ENV["CLUB_ADMIN_PASSWORD"].to_s
    authenticate_or_request_with_http_basic("Club coordinator") do |username, password|
      username == "admin" && expected.present? && ActiveSupport::SecurityUtils.secure_compare(password, expected)
    end
  end
end
