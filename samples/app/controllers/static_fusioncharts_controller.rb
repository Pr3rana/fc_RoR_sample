class StaticFusionchartsController < ApplicationController
	# Example to create a column 2D chart with the chart data passed in JSON string format
	# Filename: `app/controllers/static_fusioncharts_controller.rb`

	# The `index` action is defined to create the column 2D chart.
	def index

	# **Step 1:** Create the FusionCharts object in the controller action
		@chart = Fusioncharts::Chart.new({
	    	:height => 400,
	    	:width => 600,
	    	:id => 'chart',
	    	:type => 'MSColumn2D',
	    	:renderAt => 'chart-container',
	    	:dataSource => '{
		        "chart": {
		            "caption": "Distribution of Facebook users worldwide as of January 2017",
		            "subcaption": "By age and gender",
		            "paletteColors": "#2876DD,#0F283E",
		            "decimals": "0",
		            "numbersuffix": "%",
		            "placevaluesinside": "0",
		            "rotatevalues": "0",
		            "divlinealpha": "50",
		            "plotfillalpha": "80",
		            "drawCrossLine": "1",
		            "crossLineColor": "#F3F5F6",
		            "crossLineAlpha": "80",
		            "toolTipBgColor":"#ffffff",
		            "toolTipColor":"#000000",
		            "theme": "fint"
		        },
		        "categories": [{
		            "category": [{
		                    "label": "13-17"
		                },
		                {
		                    "label": "18-24"
		                },
		                {
		                    "label": "25-34"
		                },
		                {
		                    "label": "35-44"
		                },
		                {
		                    "label": "45-54"
		                },
		                {
		                    "label": "55-64"
		                },
		                {
		                    "label": "65+"
		                }
		            ]
		        }],
		        "dataset": [{
		                "seriesname": "female",
		                "data": [{
		                        "value": "4"
		                    },
		                    {
		                        "value": "12"
		                    },
		                    {
		                        "value": "12"
		                    },
		                    {
		                        "value": "7"
		                    },
		                    {
		                        "value": "4"
		                    },
		                    {
		                        "value": "3"
		                    },
		                    {
		                        "value": "2"
		                    }
		                ]
		            },
		            {
		                "seriesname": "male",
		                "data": [{
		                        "value": "5"
		                    },
		                    {
		                        "value": "18"
		                    },
		                    {
		                        "value": "17"
		                    },
		                    {
		                        "value": "8"
		                    },
		                    {
		                        "value": "4"
		                    },
		                     {
		                        "value": "2"
		                    },
		                    {
		                        "value": "2"
		                    }
		                ]
		            }
		        ]
		    }'
		})
  end
end
