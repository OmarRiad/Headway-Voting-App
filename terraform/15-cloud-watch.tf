
# # variable "instance_ids" {
# #   default = ["i-02863d1979bf4d0e2", "i-0ed241b8bfbfd8151"]
# # }

# resource "aws_cloudwatch_dashboard" "example_dashboard" {
#   dashboard_name = "MyCloudWatchDashboard"
#   dashboard_body = <<-EOF
#     {
#       "widgets": [
#         {
#           "type": "text",
#           "x": 0,
#           "y": 0,
#           "width": 24,
#           "height": 1,
#           "properties": {
#             "markdown": "# My Dashboard"
#           }
#         },
#         {
#           "type": "metric",
#           "x": 0,
#           "y": 1,
#           "width": 12,
#           "height": 6,
#           "properties": {
#             "metrics": [
#               [ "AWS/EC2", "CPUUtilization", "InstanceId", "i-0d30fbd8bdb15cc55" ]
#             ],
#             "view": "timeSeries",
#             "region": "eu-west-1",
#             "title": "EC2 CPU Utilization - Instance 1"
#           }
#         },
#         {
#           "type": "metric",
#           "x": 12,
#           "y": 1,
#           "width": 12,
#           "height": 6,
#           "properties": {
#             "metrics": [
#               [ "AWS/EC2", "CPUUtilization", "InstanceId", "i-02863d1979bf4d0e2" ]
#             ],
#             "view": "timeSeries",
#             "region": "eu-west-1",
#             "title": "EC2 CPU Utilization - Instance 2"
#           }
#         }
#       ]
#     }
#   EOF
# }
