Rails.application.routes.draw do

  mount ChangeLogger::Engine => "/change_logger"
end
