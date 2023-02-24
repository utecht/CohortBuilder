class CohortBuilderApiController < ApplicationController
  before_action :set_field, only: %i[ api_query api_query_calc api_query_date ]

	def ret_collection(collection)
		{
			name: collection.name,
			link: collection.nbia_link,
			desc: "Forgot to add this",
			count: collection.patients.count,
			features: []
		}
	end

	def collections
		ret = {
			total: Patient.count,
			features: [],
			collections: Collection.all.map { |collection| ret_collection(collection) }
		}
		render json: ret
	end

	def ret_choice(option)
		{
			value: option.id,
			label: option.value
		}
	end

	def ret_field(field)
		{
			choices: field.options.map { |option| ret_choice(option) },
			type: "radio",
			api: "api_query/#{field.id}",
			name: field.description,
			label: field.name
		}
	end

	def ret_float_field(field)
		{
			type: "calc",
			api: "api_query_calc/#{field.id}",
			name: field.description,
			label: field.name
		}
	end

	def ret_date_field(field)
		{
			type: "date",
			api: "api_query_date/#{field.id}",
			name: field.description,
			label: field.name
		}
	end

	def config_api
		ret = []
		option_fields = Field.where(ctype: 'option')
		ret += option_fields.map { |field| ret_field(field) }
		float_fields = Field.where(ctype: ['float', 'int'])
		ret += float_fields.map { |field| ret_float_field(field) }
		date_fields = Field.where(ctype: 'date')
		ret += date_fields.map { |field| ret_date_field(field) }
		render json: ret
	end

	def api_query
		ret = Hash.new
		params[:uris].split(',').each do |uri|
			records = OptionRecord.where(field: @field, option_id: uri)
			ret[uri] = records.map { |optr| optr.patient.patient_id }
		end
		render json: ret
	end

	def api_query_calc
		ret = Hash.new { |hash, key| hash[key] = [] }
		min = params[:min]
		max = params[:max]
		min = Float::INFINITY * -1 if min.nil?
		max = Float::INFINITY if max.nil?
		records = Record.where(field: @field)
		records.each do |record|
			if record.value > min.to_f and record.value < max.to_f then
				ret[record.value] << record.patient.patient_id
			end
		end
		render json: ret
	end

	def api_query_date
		ret = Hash.new { |hash, key| hash[key] = [] }
		min = params[:after]
		max = params[:before]
		min = '1/1/0001' if min.nil?
		max = '1/1/9999' if max.nil?
		records = DateRecord.where(field: @field)
		records.each do |record|
			if record.value > min.to_date and record.value < max.to_date then
				ret[record.value] << record.patient.patient_id
			end
		end
		render json: ret
	end

	def api_data
		ret = Hash.new
		render json: ret
	end

	private
	def set_field
		@field = Field.find(params[:id])
	end
end
