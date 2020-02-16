class ApplicationController < ActionController::Base
	include DeviseWhitelist
	include PageSets
end
