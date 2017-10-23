class FusionchartsController < ApplicationController
   def index
	    @country = Country.select(:name, :population, :code).order(population: :desc).limit(10)
	    top = []
	   
	    @country.each do |city|	
			top.push({
		    	:label => city.name,
		    	:value => city.population,
		    	:link =>"drilldown?code=#{city.code}"
			})
	    end
	    # Create a new FusionCharts instance that initializes the chart height, width, type, container div
		# id, data source, and the data format
		@chart = Fusioncharts::Chart.new({
		    :height => 400,
		    :width => 600,
		    :type => 'column2d',
		    :renderAt => 'chart-container',
		    # Chart data is passed to the `dataSource` parameter,as hashes, in the form of key - value pairs.
		    :dataSource => {
		        :chart => {
		            :caption => 'Top 10 Most Populous Countries',
		            :xAxisname => 'Country',
		            :yAxisName => 'population',
		            :showValues=>'0',
		            :theme => 'fint',
		        },
		        # The data in the array of hashes is now stored in the `top_ten_populous_countries`
		        # variable in the FusionCharts consumable format.
		        :data => top
		    },

		})

	end

	def drilldown

		code = params[:code]
		cities = City.select(:name, :population, :countrycode).where(countrycode: params[:code]).order(population: :desc).limit(10)
		top_ten_populous_cities = []
		# Iterate through the list of cities in the database and create an array of hashes that
		# stores the label for each city data plot and the its population value.
		cities.each do |city|
			top_ten_populous_cities.push({
    			:label => city.name,
    			:value => city.population
			})
		end
			puts top_ten_populous_cities

			@chart = Fusioncharts::Chart.new({
			    :height => 400,
			    :width => 600,
			    :type => 'column2d',
			    :renderAt => 'chart-container',
			    :dataSource => {
			        :chart => {
			            :caption => 'Top 10 Most Populous City in selected Country',
			            :xAxisname => 'City',
			            :yAxisName => 'Population',
			            :showValues=>'0',
			            :theme => 'fint',
			        },
			        :data => top_ten_populous_cities
    			}
			})
		end
end