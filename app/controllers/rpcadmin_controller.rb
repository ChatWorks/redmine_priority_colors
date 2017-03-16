require "rubygems"
require "json"

require File.dirname(__FILE__) + '/../helpers/rpcadmin_helper.rb'

class RpcadminController < ApplicationController
	unloadable

	def settings
		@settingsDisplay = RpcadminHelper.getSettingsDisplay
		@is_enabled = RpcadminHelper.isPluginEnabled

		@priority_list = IssuePriority.all
		@isUserAdmin   = (User.current.admin?)
	end

	def update_settings
		if (User.current.admin?)
			@parameters = request.request_parameters

			@enabled = "0"
			@css = []

			if (!@parameters['enabled'].nil?)
				@enabled = @parameters['enabled'].to_s
			end

			if (!@parameters['css'].nil?)
				@css = @parameters['css']
			end

			@storedData = ['enabled' => @enabled, 'css' => @css]

			@configuration_file = RpcadminHelper.getConfigurationFile
			File.open(@configuration_file, 'w') { |file| file.write(JSON.pretty_generate(@storedData)) }
		end
		
		redirect_to('/priority-colors/settings')
	end
end
